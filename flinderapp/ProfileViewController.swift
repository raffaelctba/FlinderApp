//
//  ProfileViewController.swift
//  Flinder
//
//  Created by Mathias Garcia on 2016-06-17.
//  Copyright © 2016 Mathias Garcia. All rights reserved.
//


import UIKit
import FBSDKCoreKit
import FBSDKLoginKit


class ProfileViewController: UIViewController {

    @IBAction func logoutButtonTapped(sender: AnyObject) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        let loginPage = self.storyboard?.instantiateViewControllerWithIdentifier("LoginViewController") as! LoginViewController
        
        let loginPageNav = UINavigationController(rootViewController: loginPage)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window!.rootViewController = loginPageNav
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

