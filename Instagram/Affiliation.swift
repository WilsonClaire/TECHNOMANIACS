//
//  Affiliation.swift
//  Instagram
//
//  Created by Claire Wilson on 2/21/17.
//  Copyright © 2017 Technomaniacs. All rights reserved.
//

import UIKit
import Parse

class Affiliation: UIViewController {
    let user = PFUser()
    @IBAction func Donor(_ sender: Any) {
       user["school"] = "false"
    }
    
    @IBAction func School(_ sender: Any) {
       user["school"] = "true"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
