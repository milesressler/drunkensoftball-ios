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
    var names: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        self.view = homeView
        homeView.rosterList.dataSource = self
        homeView.rosterList.delegate = self
        homeView.delegate = self
        
        names = [String]()
        names?.append("Fran Hamlin")
        names?.append("Uncle Billy")
        names?.append("Kirk")
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.isTranslucent = false
        self.homeView.rosterList.reloadData()
        
    }
}

extension HomeViewController: HomeViewDelegate {
    func didTapAdd(name: String) {
        names?.append(name)
        self.homeView.rosterList.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? RosterTableViewCell

        if cell == nil {
            cell = RosterTableViewCell()
        }
        
        cell?.config(name: names?[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
