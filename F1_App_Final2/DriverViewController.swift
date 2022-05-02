//
//  DriverViewController.swift
//  F1_App_Final2
//
//  Created by Santi Silvani on 4/27/22.
//

import UIKit

class DriverViewController: UIViewController {

  //  var driversArray: [Driver] = []
    
    var driverData = DriverDataClass()
    var hold = ""

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        driverData.getDataDriver {
            print("got it")
            DispatchQueue.main.async { [self] in
                self.navigationItem.title = "Formula 1 Rankings"
                self.tableView.reloadData()
            }
        }
        
    }
}

extension DriverViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverData.driverNameArrays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellDriver", for: indexPath)
        
    
        cell.textLabel?.text = String(driverData.driverPositionArray[indexPath.row])
        cell.detailTextLabel?.text = String(driverData.driverNameArrays[indexPath.row])

        return cell
    }
    
    
}
