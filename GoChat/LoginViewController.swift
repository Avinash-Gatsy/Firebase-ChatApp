//
//  LoginViewController.swift
//  GoChat
//
//  Created by Avinash on 10/10/17.
//  Copyright © 2017 avinash. All rights reserved.
//

import UIKit
import GoogleSignIn
class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //anonymousButton properties: border color and width
        anonymousButton.layer.borderWidth = 1.5
        anonymousButton.layer.borderColor = UIColor.white.cgColor
        
        //get the client_id from the GoogleService-Info.plist file
        GIDSignIn.sharedInstance().clientID = "25611064755-crg3gg2agrkqtk7q8huedkfmhl46mhjn.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error != nil){
            print(error!.localizedDescription)
            return
        }
        print(user.authentication)
        Helper.helper.LoginWithGoogle(authentication: user.authentication)
    }
    @IBAction func LoginAnonymouslyDidTapped(_ sender: Any) {
        //call the singleton instance from the helper class
        Helper.helper.LoginAnonymously()
    }
    @IBAction func GoogleLoginDidTapped(_ sender: Any) {
        print("google login did tapped")
        
        //Add the REVERSED_CLIENT_ID from GoogleService-Info.plist, bundle identifier as URL Schemes under project->info tab
        GIDSignIn.sharedInstance().signIn()
    }
    @IBOutlet weak var anonymousButton: UIButton!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
