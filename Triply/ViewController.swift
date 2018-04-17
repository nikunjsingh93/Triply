//
//  ViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/16/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func loginBtn(_ sender: Any) {
        
        if emailTxt.text != "" && passwordTxt.text != "" {
            
            if segmentedControl.selectedSegmentIndex == 0 {
                
                
                Auth.auth().signIn(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
                    if user != nil {
                        
                         print("Success sign in")
                        
                        self.performSegue(withIdentifier: "home", sender: self)
                        
                    }else {
                        
                        if let myError = error?.localizedDescription{
                            
                            print(myError)
                            
                            let alertController = UIAlertController(title: "Warning!", message:
                                myError, preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                        } else {
                            
                            print("ERROR")
                        }
                        
                        
                    }
                }
                
            } else {
                
                Auth.auth().createUser(withEmail: emailTxt.text!, password: passwordTxt.text!) { (user, error) in
                    if user != nil {
                        
                        
                        print("Success sign Up")
                        
                         self.performSegue(withIdentifier: "home", sender: self)

                        
                    } else {
                        
                        if let myError = error?.localizedDescription{
                            
                            print(myError)
                            
                            let alertController = UIAlertController(title: "Warning!", message:
                                myError, preferredStyle: UIAlertControllerStyle.alert)
                            alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default,handler: nil))
                            
                            self.present(alertController, animated: true, completion: nil)
                            
                            
                        } else {
                            
                            print("ERROR")
                        }
                        
                        
                        
                    }
                }
                
                
            }
            
        }
        
        
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

