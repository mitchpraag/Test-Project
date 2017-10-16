//
//  MainTableViewController.swift
//  Test
//
//  Created by Mitch Praag on 10/11/17.
//  Copyright © 2017 Ryan Moulton. All rights reserved.
//

import UIKit
import Alamofire

class MainTableViewController: UITableViewController {
    
    let url = NetworkManager.defaultManager.baseURL
    let alamofireManager = NetworkManager.defaultManager.alamofireManager
    var messages: [Message] = []


    @IBAction func sortValueChanged(_ sender: Any) {
        switch segementedController.selectedSegmentIndex
        {
        case 0:
            messages.sort(by: { $0.title.compare($1.title) == ComparisonResult.orderedAscending})
            tableView.reloadData()
        case 1:
            messages.sort(by: { $0.date.compare($1.date) == ComparisonResult.orderedDescending})
            tableView.reloadData()
        default:
            print("default")
            
        }
    }
    
    @IBOutlet weak var segementedController: UISegmentedControl!




    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //segementedController.addTarget(self, action: "date", for: .valueChanged)
        

    }
    @IBAction func loadButtonTapped(_ sender: Any) {
        NetworkManager.defaultManager.loadNotifications(success: { (notifications) in
            for notificationDictionary in notifications {
                print("Got It")
                print(notificationDictionary)
                if let notification = Message.init(notificationDict: notificationDictionary) {
                    self.messages.append(notification)
                }
            }
            self.tableView.reloadData()
            print("reloaded")
        }, failure:  { (errorMessage) in
            print(errorMessage)
            //handle error
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        let notification = messages[indexPath.row]
        cell.textLabel?.text = notification.title
        cell.detailTextLabel?.text = notification.date
        return cell
        
    }
    var notifications: Message?
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDetail" {
                if let detailViewController = segue.destination as? DetailViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                    let notification = messages[selectedIndex]
                    detailViewController.notification = notification
                    
                }
            }
        }
}
