//
//  AddHomeViewController.swift
//  ToDoApp
//
//  Created by kai nakata on 2019/07/06.
//  Copyright © 2019 山之内一隆. All rights reserved.
//

import UIKit
import Foundation

class AddHomeViewController: UIViewController{
    
    
    @IBOutlet weak var destinationField: UITextField!
    
    @IBOutlet weak var tappedButtonHome: UIButton!
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像表示
        //let gotoimage = UIImage(named: "GoToimage.png")
        //gotoImageView.image = gotoimage
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
