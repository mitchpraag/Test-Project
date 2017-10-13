//
//  NetworkManager.swift
//  Reports
//
//  Created by Ryan Moulton on 3/17/17.
//  Copyright © 2017 Ryan Moulton. All rights reserved.
//

import UIKit
import Alamofire

class NetworkManager: NSObject {
    
	var headers: Dictionary = ["Content-Type" : "application/text"]
	var baseURL: String = "https://bsg.redmatmediabizapp.com/admin/push/"
	
	
	//Singleton instance of NetworkManager
	static let defaultManager = NetworkManager()
	
	lazy var alamofireManager: SessionManager = {
		let configuration = URLSessionConfiguration.default
		configuration.timeoutIntervalForResource = 240 // seconds
		configuration.timeoutIntervalForRequest = 240
		return Alamofire.SessionManager(configuration: configuration)
	}()
    
    func loadNotifications( success: @escaping (_ notifcations: [[String : AnyObject]]) -> Void, failure: @escaping (_ errorMessage: String) -> Void) {
		let parameters = ["AppVersion" : "BSG", "userID" : "2"]
		alamofireManager.request(String(format:"%@getPushNotifications.php", baseURL), method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]/*headers*/).responseJSON { response in
			debugPrint(response)
			//Check the response format
			if let responseJSON = response.result.value as? Dictionary<String, AnyObject> {
				success(responseJSON["results"]! as! [[String : AnyObject]])
			}else{
				failure("Unable to complete request")
			}
		}
    }
}
