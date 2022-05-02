//
//  ScheduleViewController.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/27/22.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    var scheduleArray: [Schedule] = []
    
    // @IBOutlet weak var pointsLabel: UILabel!
    //@IBOutlet weak var positionLabel: UILabel!
    //@IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleArray.append(Schedule(location: "Italy", date: "1/11/1111"))
        scheduleArray.append(Schedule(location: "England", date: "2/21/1111"))
        scheduleArray.append(Schedule(location: "USA", date: "4/5/1111"))

        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSchedule", for: indexPath)
        cell.textLabel?.text = scheduleArray[indexPath.row].location
        cell.detailTextLabel?.text = scheduleArray[indexPath.row].date
        return cell
    }
    
    
}
