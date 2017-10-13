//
//  DetailViewController.swift
//  Test
//
//  Created by Mitch Praag on 10/12/17.
//  Copyright © 2017 Ryan Moulton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var notification: Message?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textBox.text = notification?.body
    }
    @IBOutlet weak var textBox: UITextView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
