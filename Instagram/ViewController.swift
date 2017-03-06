//
//  ViewController.swift
//  Instagram
//
//  Created by Claire Wilson on 1/25/17.
//  Copyright © 2017 Technomaniacs. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let object = PFObject(className: "testObject")
//        object["name"] = "Bill"
//        object["lastname"] = "Alexander"
//        object.saveInBackground { (done:Bool, error:Error?) in
//            if done {
//                print("Saved in Server")
//            }else{
//                print(error ?? "AHHHH NOOOOO")
//            }
//        }
        
        //unwrap image file data from UIImageView
        let data = UIImageJPEGRepresentation(image.image!, 0.5)

        //convert taken image to file
        let file = PFFile(name: "image.jpg", data: data!)
        /*
        // Create a class / collection / table in Heroku 
        //PFObject - to create table or some data in table
        let table = PFObject(className: "message")
        table["sender"] = "Mark"
        table ["reciever"] = "Rob"
        table["image"] = file
        table.saveInBackground { ( success: Bool, error: Error?) in
            if success{
                print("YEAH WE FREAKING DID IT")
            }else {
                print(error)
            }
        }
        */
        
    }
 

}

