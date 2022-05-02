//
//  TeamViewController.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/27/22.
//

import UIKit

class TeamViewController: UIViewController {

    
    var team123 = TeamDataClass()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
                
        team123.getDataTeam{
            print("got it")
            DispatchQueue.main.async { [self] in
                self.navigationItem.title = "Formula 1 Rankings"
                self.tableView.reloadData()
            }
        }
        
    }
}

extension TeamViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team123.teamNameArrays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTeam", for: indexPath)
        cell.textLabel?.text = String(team123.teamPositionArray[indexPath.row])
        cell.detailTextLabel?.text = String(team123.teamNameArrays[indexPath.row])
        
        return cell
    }
    
    
}
