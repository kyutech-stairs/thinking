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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
