//
//  PostCell.swift
//  BitSchool
//
//  Created by Claire Wilson on 4/5/17.
//  Copyright © 2017 Technomaniacs. All rights reserved.
//

import UIKit

    class postCell: UITableViewCell {
        
        // header objects
        @IBOutlet weak var avaImg: UIImageView!
        @IBOutlet weak var usernameBtn: UIButton!
        @IBOutlet weak var dateLbl: UILabel!
        
        // main picture
        @IBOutlet weak var picImg: UIImageView!
        
        // buttons
        @IBOutlet weak var moreBtn: UIButton!
        
        // labels
        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var uuidLbl: UILabel!
        
        
        // default func
        override func awakeFromNib() {
            super.awakeFromNib()
            
                        // alignment
            let width = UIScreen.main.bounds.width
            
            // allow constraints
            avaImg.translatesAutoresizingMaskIntoConstraints = false
            usernameBtn.translatesAutoresizingMaskIntoConstraints = false
            dateLbl.translatesAutoresizingMaskIntoConstraints = false
            
            picImg.translatesAutoresizingMaskIntoConstraints = false
            

            moreBtn.translatesAutoresizingMaskIntoConstraints = false
            

            titleLbl.translatesAutoresizingMaskIntoConstraints = false
            uuidLbl.translatesAutoresizingMaskIntoConstraints = false
            
            let pictureWidth = width
            
            // constraints
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-10-[ava(30)]-10-[pic(\(pictureWidth))]-5-[like(30)]",
                options: [], metrics: nil, views: ["ava":avaImg, "pic":picImg]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-10-[username]",
                options: [], metrics: nil, views: ["username":usernameBtn]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[pic]-5-[comment(30)]",
                options: [], metrics: nil, views: ["pic":picImg]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-15-[date]",
                options: [], metrics: nil, views: ["date":dateLbl]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[like]-5-[title]-5-|",
                options: [], metrics: nil, views: ["title":titleLbl]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[pic]-5-[more(30)]",
                options: [], metrics: nil, views: ["pic":picImg, "more":moreBtn]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "V:[pic]-10-[likes]",
                options: [], metrics: nil, views: ["pic":picImg]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-10-[ava(30)]-10-[username]",
                options: [], metrics: nil, views: ["ava":avaImg, "username":usernameBtn]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-0-[pic]-0-|",
                options: [], metrics: nil, views: ["pic":picImg]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:[more(30)]-15-|",
                options: [], metrics: nil, views: ["more":moreBtn]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-15-[title]-15-|",
                options: [], metrics: nil, views: ["title":titleLbl]))
            
            self.contentView.addConstraints(NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[date]-10-|",
                options: [], metrics: nil, views: ["date":dateLbl]))
            
            // round ava
            avaImg.layer.cornerRadius = avaImg.frame.size.width / 2
            avaImg.clipsToBounds = true
            
        }
        
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


