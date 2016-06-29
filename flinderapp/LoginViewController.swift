//
//  LoginViewController.swift
//  flinderapp
//
//  Created by Raffael on 2016-06-19.
//  Copyright © 2016 Microsoft. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate{
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if(FBSDKAccessToken.currentAccessToken()==nil){
            print("User is not logged in")
        }else{
            let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
            
            let ProtectedPageNav = UINavigationController.init(rootViewController: protectedPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = ProtectedPageNav
            print("User is logged in")
            
        }
        loginButton.delegate = self
        loginButton.readPermissions=["public_profile","email", "user_friends"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!){
        
        
        if(error != nil){
            print(error.localizedDescription)
            return
        }
        
        if let userToken = result.token
        {
            
            //Get user access token
            let token:FBSDKAccessToken = result.token
            print("Token = \(FBSDKAccessToken.currentAccessToken().tokenString)")
             print("UserId = \(FBSDKAccessToken.currentAccessToken().userID)")
          
            let req = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,birthday,gender"], tokenString: FBSDKAccessToken.currentAccessToken().tokenString, version: nil, HTTPMethod: "GET")
            req.startWithCompletionHandler({ (connection, result, error : NSError!) -> Void in
                if(error == nil)
                {
                    print("result \(result)")
                    print(result["gender"])
               
                }
                else
                {
                    print("error \(error)")
                }
            })
        
         let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
            
            let ProtectedPageNav = UINavigationController.init(rootViewController: protectedPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
        appDelegate.window?.rootViewController = ProtectedPageNav
        }
    }
    

    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        print("User is logged out")
    }
}