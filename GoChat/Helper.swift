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
import GoogleSignIn
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
                self.SwitchToNavigationController()
            } else {
                print(error!.localizedDescription)
                return
            }
        }
    }
    func LoginWithGoogle(authentication: GIDAuthentication){
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (user: User?, error: Error?) in
            if error != nil {
                print(error!.localizedDescription)
                return
            } else {
                print(user?.email)
                print(user?.displayName)
                self.SwitchToNavigationController()
            }
        }
    }
    private func SwitchToNavigationController(){
        //Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //From main storyboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        //Get the App Delegate - which has the root view controller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //set navigation controller as root view controller
        appDelegate.window?.rootViewController = naviVC
    }
}

