//
//  ChatViewController.swift
//  GoChat
//
//  Created by Avinash on 10/10/17.
//  Copyright © 2017 avinash. All rights reserved.
//

import UIKit
import JSQMessagesViewController
class ChatViewController: JSQMessagesViewController {
    var messages = [JSQMessage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.senderId = "1"
        self.senderDisplayName = "Avinash"
        // Do any additional setup after loading the view.
    }
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        print("\(text)")
        print("didPressSend")
        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text))
        collectionView.reloadData()
        print(messages)
    }
    override func didPressAccessoryButton(_ sender: UIButton!) {
        print("didPressAccessoryButton")
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        return bubbleFactory?.outgoingMessagesBubbleImage(with: UIColor.darkGray)
    }
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("number of messages:\(messages.count)")
        return messages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell
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
