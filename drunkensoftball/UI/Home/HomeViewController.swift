//
//  HomeViewController.swift
//  drunkensoftball
//
//  Created by Miles Ressler on 2/2/17.
//  Copyright © 2017 Miles Ressler. All rights reserved.
//

import Foundation

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var players: [Player]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        self.view = homeView
        homeView.rosterList.dataSource = self
        homeView.rosterList.delegate = self
        homeView.rosterList.register(RosterTableViewCell.self, forCellReuseIdentifier: "RosterTableViewCell")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(toggleEdit))
        navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showNewPlayerForm))]

        
        homeView.delegate = self
        
        players = [Player]()
        players?.append(Player(name: "Fran Hamlin"))
        players?.append(Player(name: "Uncle Billy"))
        players?.append(Player(name: "Kirk"))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = false
        self.homeView.rosterList.reloadData()
    }
    
    func showNewPlayerForm() {
        let newPlayer = Player(name: nil)
        let formVC = PlayerFormModalViewController(displayTitle: "New Player", player: newPlayer)
        formVC.present(presentingVC: self, successHandler: {
            self.players?.append(newPlayer)
            self.homeView.rosterList.reloadData()
        }, cancelHandler: {
            
        })
        self.present(formVC, animated: true, completion: nil)
    }
    
    func toggleEdit() {
        if homeView.rosterList.isEditing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(toggleEdit))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(toggleEdit))
        }
        self.homeView.rosterList.isEditing = !self.homeView.rosterList.isEditing
    }
    
    func addName(name: String) {
        
        players?.append(Player(name: name))
        homeView.rosterList.beginUpdates()
        homeView.rosterList.insertRows(at: [IndexPath(row: (players?.count ?? 1) - 1 , section: 0)], with: .automatic)
        homeView.rosterList.endUpdates()
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
        cell.config(name: players![indexPath.row].name ?? "no name")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players?.count ?? 0
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
            players?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let player = players![indexPath.row]
        let formVC = PlayerFormModalViewController(displayTitle: "Edit", player: player)
        formVC.present(presentingVC: self, successHandler: {
            self.homeView.rosterList.reloadData()
        }, cancelHandler: {
            
        })
        self.present(formVC, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
