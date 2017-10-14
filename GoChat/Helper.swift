//
//  Helper.swift
//  GoChat
//
//  Created by Avinash on 14/10/17.
//  Copyright © 2017 avinash. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
class Helper{
    static let helper = Helper() //create a singleton, i.e only one instance of the class is allowed.
    
    func LoginAnonymously() {
        print("login anonymously did tapped")
        //anonymously log users in.
        //switch view by setting navigation controller as root view controller
        
        //enable anonymous auth in Sign-in providers section in firebase project
        Auth.auth().signInAnonymously { (anonymousUser: User?, error: Error?) in
            if error == nil {
                print("UserId: \(anonymousUser!.uid)")
                
                //Create a main storyboard instance
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //From main storyboard instantiate a navigation controller
                let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
                //Get the App Delegate - which has the root view controller
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                //set navigation controller as root view controller
                appDelegate.window?.rootViewController = naviVC
                
            } else {
                print(error!.localizedDescription)
                return
            }
        }
    }
    
}
