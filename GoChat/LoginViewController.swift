//
//  LoginViewController.swift
//  GoChat
//
//  Created by Avinash on 10/10/17.
//  Copyright © 2017 avinash. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func LoginAnonymouslyDidTapped(_ sender: Any) {
        print("login anonymously did tapped")
        //anonymously log users in.
        //switch view by setting navigation controller as root view controller
        
        //Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //From main storyboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        
        //Get the App Delegate - which has the root view controller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //set navigation controller as root view controller
        appDelegate.window?.rootViewController = naviVC
    }
    @IBAction func GoogleLoginDidTapped(_ sender: Any) {
        print("google login did tapped")
    }
    @IBOutlet weak var anonymousButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //anonymousButton properties: border color and width
        anonymousButton.layer.borderWidth = 1.5
        anonymousButton.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
