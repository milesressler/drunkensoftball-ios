//
//  HomeViewController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation
import SwiftyUserDefaults
import Stevia

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        self.view = homeView
        homeView.delegate = self
        homeView.rosterList.dataSource = self
        homeView.rosterList.delegate = self
        homeView.rosterList.register(RosterTableViewCell.self, forCellReuseIdentifier: "RosterTableViewCell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(toggleEdit))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showNewPlayerForm))]

        if let team =  Defaults[.team] {
            config(team: team)
        } else {
            let newTeam = Team()
            newTeam.roster = [RosterEntry]()
            config(team: newTeam)
            saveTeam()
        }
    }
    
    func config(team: Team) {
        self.team = team
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = false
        self.homeView.rosterList.reloadData()    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    fileprivate func saveTeam() {
        Defaults[.team] = self.team
    }
    
    func showNewPlayerForm() {
        let newRosterEntry = RosterEntry()
        newRosterEntry.user = User(displayName: nil)
        newRosterEntry.team = self.team
        // todo set team for roster entry
        let formVC = PlayerFormModalViewController(displayTitle: "New Player", player: newRosterEntry)
        formVC.present(presentingVC: self, successHandler: {
            self.team?.roster?.append(newRosterEntry)
            self.homeView.rosterList.beginUpdates()
            self.homeView.rosterList.insertRows(at: [IndexPath(row: (self.team?.roster?.count ?? 1) - 1 , section: 0)], with: .automatic)
            self.homeView.rosterList.endUpdates()
            self.saveTeam()
        }, cancelHandler: {
            
        })
    }
    
    func toggleEdit() {
        if homeView.rosterList.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(toggleEdit))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(toggleEdit))
        }
        self.homeView.rosterList.isEditing = !self.homeView.rosterList.isEditing
    }
    
}

extension HomeViewController: HomeViewDelegate {
    
    func didTapStart() {
        // TODO persist to defaults, nav to game
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RosterTableViewCell") as! RosterTableViewCell
        let rosterEntry = team?.roster![indexPath.row]
        
        cell.config(name: rosterEntry?.user?.displayName ?? "no name",
                    fieldPosition: indexPath.row < 10 ? rosterEntry?.getFieldPosition() : nil,
                    battingPosition: indexPath.row < 10 ? indexPath.row + 1 : nil)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team?.roster?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            team?.roster?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            saveTeam()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = team!.roster![indexPath.row]
        let formVC = PlayerFormModalViewController(displayTitle: "Edit", player: player)
        formVC.present(presentingVC: self, successHandler: {
            self.saveTeam()
            self.homeView.rosterList.reloadData()
        }, cancelHandler: {
            self.homeView.rosterList.reloadData()
        })
    }
}

extension HomeViewController:RosterTableViewCellDelegate {
    func didTapMoveUp(cell: UITableViewCell) {
        
        let index = self.homeView.rosterList.indexPath(for: cell)!
        if index.row > 0 {
            toggleEntries(lowerIndex: index.row - 1)
        }
    }
    
    func didTapMoveDown(cell: UITableViewCell) {
        
        let index = self.homeView.rosterList.indexPath(for: cell)!
        if index.row < team!.roster!.count-1 {
            toggleEntries(lowerIndex: index.row)
        }
    }
    
    fileprivate func toggleEntries(lowerIndex: Int) {
    
        let topPlayer = team!.roster![lowerIndex]
        team!.roster![lowerIndex] = team!.roster![lowerIndex + 1]
        team!.roster![lowerIndex + 1] = topPlayer
    
        saveTeam()
        homeView.rosterList.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
