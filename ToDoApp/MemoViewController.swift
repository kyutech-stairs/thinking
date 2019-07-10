//
//  MemoViewController.swift
//  ToDoApp
//
//  Created by kai nakata on 2019/07/08.
//  Copyright © 2019 山之内一隆. All rights reserved.
//

import Foundation
import UIKit

class MemoViewController: UIViewController{
    
    @IBOutlet weak var textview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let gotoimage = UIImage(named: "GoToimage.png")
        //gotoImageView.image = gotoimage
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
