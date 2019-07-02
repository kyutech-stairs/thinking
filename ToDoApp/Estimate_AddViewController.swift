//
//  Estimate_AddViewController.swift
//  ToDoApp
//
//  Created by kai nakata on 2019/07/01.
//  Copyright © 2019 山之内一隆. All rights reserved.
//
import UIKit
import Foundation

class Estimate_AddViewController: UIViewController{
    
    
    @IBOutlet weak var planField: UITextField!
    @IBOutlet weak var date_Estimate: UIDatePicker!
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        if planField.text != ""{
            let newItem = Item(initTitle: planField.text!)
            newItem.date = date_Estimate.date
            itemArray_Estimate.append(newItem)
            //sort
            itemArray_Estimate = itemArray_Estimate.sorted(by: { (a, b) -> Bool in
                return a.date < b.date
            })
            planField.text = ""
            self.navigationController?.popViewController(animated: true)
        } else{
            let alert = UIAlertController(title: "入力エラー！", message: "アイテムを入力して下さい", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
}
