//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController{

    var signUpActive = true

    @IBOutlet weak var signUpLabel: UIButton!
    @IBOutlet weak var logInLabel: UIButton!
    @IBOutlet weak var registerText: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()




//MARK:Display alert
    func displayAlert(title: String, message: String)
    {
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)

        alert .addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }))

        self.presentViewController(alert, animated: true, completion: nil)
    }



//MARK:Sign Up
    @IBAction func signUp(sender: AnyObject)
    {
        if username.text == "" || password.text == ""
        {
            displayAlert("Error in form", message: "please enter something")
        }

        else{
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()


            var errorMessage = "Please try again later"
            if signUpActive == true
            {




                var user = PFUser()
                user.username = username.text
                user.password = password.text



                user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                    self.activityIndicator.stopAnimating()
                    UIApplication.sharedApplication().endIgnoringInteractionEvents() //user can use the app again

                    if error == nil
                    {
//                        print("Signup Success")

                        //succesful signup

                        self.performSegueWithIdentifier("login", sender: self)
                    }

                    else
                    {
                        if let errorString = error!.userInfo?["error"] as? NSString
                        {
                            errorMessage = errorString as String
                        }
                        self.displayAlert("Failed Signup", message: errorMessage)
                    }

                })
            }
            else
            {
                PFUser.logInWithUsernameInBackground(username.text, password: password.text, block:
                    { (user, error) -> Void in
                        self.activityIndicator.stopAnimating()
                        UIApplication.sharedApplication().endIgnoringInteractionEvents() //user can use the app again
                        if user != nil
                        {
                        //logged in!
                        } else{
                            if let errorString = error!.userInfo?["error"] as? NSString
                            {
                                errorMessage = errorString as String
                            }
                            self.displayAlert("Failed log in", message: errorMessage)
                        }
                })
            }
        }
    }



//MARK:Login
    @IBAction func logIn(sender: AnyObject)
    {
        if signUpActive == true
        {
            signUpLabel.setTitle("Log in", forState: UIControlState.Normal)
            registerText.text = "Not registered"


            //set log in thing
            logIn.setTitle("Sign up", forState: UIControlState.Normal)
            signUpActive = false
        }else
        {
            signUpLabel.setTitle("Sign up", forState: UIControlState.Normal)
            registerText.text = "Already registered"


            //set log in thing
            logIn.setTitle("Log in", forState: UIControlState.Normal)
            signUpActive = true
        }

    }


    
    @IBOutlet weak var logIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func viewDidAppear(animated: Bool) {
        if PFUser.currentUser() != nil
        {
            self.performSegueWithIdentifier("login", sender: self)
        }
    }


}

