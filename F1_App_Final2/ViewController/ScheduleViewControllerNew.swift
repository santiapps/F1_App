//
//  ViewController.swift
//  Schedule_Test
//
//  Created by Santi Silvani on 4/30/22.
//

import UIKit


class ScheduleViewControllerNew: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var dateRace = Date()
    
    var scheduleData = ScheduleData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        scheduleData.getDataTeam {
            print("got data")
            DispatchQueue.main.async { [self] in
                self.navigationItem.title = "Formula 1 Rankings"
                self.tableView.reloadData()
            }
        }
        
    }
    
//    func getDate(date: String) -> Date{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let date = dateFormatter.date(from: date) ?? nil
//
//        return date ?? Date()
//    }
}

extension ScheduleViewControllerNew: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleData.scheduleArrays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSchedule", for: indexPath)
        cell.textLabel?.text = String(scheduleData.dateArray[indexPath.row])
        cell.detailTextLabel?.text = String(scheduleData.scheduleArrays[indexPath.row])
        
        return cell
    }
}
