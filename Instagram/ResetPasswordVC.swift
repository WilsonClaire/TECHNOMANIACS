//
//  ResetPasswordVC.swift
//  Instagram
//
//  Created by Claire Wilson on 1/29/17.
//  Copyright © 2017 Technomaniacs. All rights reserved.
//

import UIKit
import Parse
class ResetPasswordVC: UIViewController {
    
    //buttons
    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    //textfield
    @IBOutlet weak var emailTxt: UITextField!
    //reset clicked
    @IBAction func resetBtn_click(_ sender: Any) {
        //hide editing
        self.view.endEditing(true)
        
        //if email textfield is empty
        if emailTxt.text!.isEmpty{
            //show alert message
            let alert = UIAlertController(title: "Email field", message: "is empty'", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
        }
        PFUser.requestPasswordResetForEmail(inBackground: emailTxt.text!) { (success: Bool, NSError) in
            if success {
                //show alert message
                let alert = UIAlertController(title: "Email for resetting password", message: "has been sent to texted email", preferredStyle: UIAlertControllerStyle.alert)
                
                //if pressed ok, call self dismiss
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                })
                
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                
            } else {
                print(NSError?.localizedDescription)
            }
            
        }
        
        
        
        
    }
    
    
    //cancel clicked
    @IBAction func cancelBtn_click(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
