//
//  ChatViewController.swift
//  GoChat
//
//  Created by Avinash on 10/10/17.
//  Copyright © 2017 avinash. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutDidTapped(_ sender: Any) {
        print("Log Out did tapped")
        //Create a main storyboard instance
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //From main storyboard instantiate LoginView controller
        let LogInVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        
        //Get the App Delegate - which has the root view controller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        //set LoginView controller as root view controller
        appDelegate.window?.rootViewController = LogInVC
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
