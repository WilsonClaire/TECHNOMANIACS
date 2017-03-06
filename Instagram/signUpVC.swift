//
//  signUpVC.swift
//  Instagram
//
//  Created by Claire Wilson on 1/29/17.
//  Copyright © 2017 Technomaniacs. All rights reserved.
//

import UIKit
import Parse

class signUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var UsernameTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var RPasswordTxt: UITextField!
    @IBOutlet weak var EmailTxt: UITextField!
    @IBOutlet weak var BioTxt: UITextView!
    
    @IBOutlet weak var avaImg: UIImageView!
    @IBOutlet weak var NameTxt: UITextField!
  
    @IBOutlet weak var ScrollView: UIScrollView!
    
    var ScrollViewHeight : CGFloat = 0
    
    var keyboard = CGRect()
    
    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var CancelBtn: UIButton!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Scroll View
        ScrollView.frame = CGRect(x:0, y:0, width: self.view.frame.width, height: self.view.frame.height)
        ScrollView.contentSize.height = self.view.frame.height
        ScrollViewHeight = ScrollView.frame.size.height
        
        //keyboard
        // check notifications if keyboard is shown or not
        NotificationCenter.default.addObserver(self, selector: #selector(signUpVC.showKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(signUpVC.hideKeyboard(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        

        // declare hide kyboard tap
        let hideTap = UITapGestureRecognizer(target: self, action: #selector(signUpVC.hideKeyboardTap(_:)))
        hideTap.numberOfTapsRequired = 1
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(hideTap)
        
        // declare select image tap
        let avaTap = UITapGestureRecognizer(target: self, action: #selector(signUpVC.loadImg(_:)))
        avaTap.numberOfTapsRequired = 1
        avaImg.isUserInteractionEnabled = true
        avaImg.addGestureRecognizer(avaTap)
        //round Ava
        avaImg.layer.cornerRadius = avaImg.frame.size.width / 2
        avaImg.clipsToBounds = true
        
        //alignment
        avaImg.frame = CGRect(x: self.view.frame.width / 2 - 40, y: 40, width: 80, height: 80)
        UsernameTxt.frame = CGRect(x: 10, y: avaImg.frame.origin.y + 90, width: self.view.frame.width - 20, height: 30)
        PasswordTxt.frame = CGRect(x: 10, y: UsernameTxt.frame.origin.y + 40, width: self.view.frame.width - 20, height: 30)
        RPasswordTxt.frame = CGRect(x: 10, y: PasswordTxt.frame.origin.y + 40, width: self.view.frame.width - 20, height: 30)
       
        EmailTxt.frame = CGRect(x: 10, y: RPasswordTxt.frame.origin.y + 60, width: self.view.frame.width - 20, height: 30)
        NameTxt.frame = CGRect(x: 10, y: EmailTxt.frame.origin.y + 40, width: self.view.frame.width - 20, height: 30)
        BioTxt.frame = CGRect(x: 10, y: NameTxt.frame.origin.y + 40, width: self.view.frame.width - 20, height: 50)
        CancelBtn.frame = CGRect(x: 20, y: BioTxt.frame.origin.y + 50, width: self.view.frame.width / 4 , height: 30)
        
        SignUpBtn.frame = CGRect(x: self.view.frame.width - self.view.frame.width / 4 - 20, y: CancelBtn.frame.origin.y, width: self.view.frame.width / 4 , height: 30)
        
     

        
        
        }
    
    // call picker to select image
    func loadImg(_ recognizer:UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    // connect selected image to our ImageView
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        avaImg.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }

    
    
    //hide keyboard if tapped
    func hideKeyboardTap(_ recoginizer:UITapGestureRecognizer) {
       self.view.endEditing(true)
        
    }
    
    //show keyboard
    func showKeyboard(_ notification:Notification) {
        
        // define keyboard size
        keyboard = ((notification.userInfo?[UIKeyboardFrameEndUserInfoKey]! as AnyObject).cgRectValue)!
        
        // move up UI
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.ScrollView.frame.size.height = self.ScrollViewHeight - self.keyboard.height
        })
    }
    
    
    // hide keyboard func
    func hideKeyboard(_ notification:Notification) {
        
        // move down UI
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.ScrollView.frame.size.height = self.view.frame.height
        })
    }

    @IBAction func SignUpBtnClicked(_ sender: AnyObject) {
        print("SignUp Clicked")
        // dismiss keyboard
        self.view.endEditing(true)
        
        // if fields are empty
        if (UsernameTxt.text!.isEmpty || PasswordTxt.text!.isEmpty || RPasswordTxt.text!.isEmpty || EmailTxt.text!.isEmpty || NameTxt.text!.isEmpty || BioTxt.text!.isEmpty) {
            
            // alert message
            let alert = UIAlertController(title: "PLEASE", message: "fill all fields", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        // if different passwords
        if PasswordTxt.text != RPasswordTxt.text {
            
            // alert message
            let alert = UIAlertController(title: "PASSWORDS", message: "do not match", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(ok)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        
        
        // send data to server to related collumns
        let user = PFUser()
        user.username = UsernameTxt.text?.lowercased()
        user.email = EmailTxt.text?.lowercased()
        user.password = PasswordTxt.text
        user["fullname"] = NameTxt.text?.lowercased()
        user["bio"] = BioTxt.text
        
        // in Edit Profile it's gonna be assigned
        user["tel"] = ""
        user["gender"] = ""
        
        // convert our image for sending to server
        let avaData = UIImageJPEGRepresentation(avaImg.image!, 0.5)
        let avaFile = PFFile(name: "ava.jpg", data: avaData!)
        user["ava"] = avaFile
        
        // save data in server
        user.signUpInBackground { (success, error) -> Void in
            if success {
                print("registered")
//                // remember looged user
                UserDefaults.standard.set(user.username, forKey: "username")
                UserDefaults.standard.synchronize()
                
                // call login func from AppDelegate.swift class
//                let appDelegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.login()
            } else {
                
                // show alert message
                let alert = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        
    }

    @IBAction func cancelBtn_click(_ sender: Any) {
        print("Cancel Clicked")
        self.dismiss(animated: true, completion: nil)
        
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
