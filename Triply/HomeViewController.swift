//
//  HomeViewController.swift
//  Triply
//
//  Created by Nikunj Singh on 4/17/18.
//  Copyright © 2018 Nikunj Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBAction func logoutbtn(_ sender: Any) {
        
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "logout", sender: self)
        
        
    }
    
    @IBOutlet weak var welcomelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Auth.auth().currentUser?.email!)
        
        let welcome = Auth.auth().currentUser?.email!
        
        welcomelabel.text = "Hi, \(welcome!)"

        // Do any additional setup after loading the view.
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
