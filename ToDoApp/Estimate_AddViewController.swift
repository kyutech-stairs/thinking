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
    @IBOutlet weak var moneyField: UITextField!
    @IBOutlet weak var date_Estimate: UIDatePicker!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.moneyField.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func tappedButton(_ sender: Any) {
        if planField.text != "" && moneyField.text != ""{
            let newItemEst = Item_Estimate(titleEst: planField.text!, money: moneyField.text! )
            newItemEst.dateEst = date_Estimate.date
            
            itemArray_Estimate.append(newItemEst)
            //sort
            itemArray_Estimate = itemArray_Estimate.sorted(by: { (a, b) -> Bool in
                return a.dateEst < b.dateEst
            })
        
            planField.text = ""
            self.navigationController?.popViewController(animated: true)
        } else{
            let alert = UIAlertController(title: "入力せんと", message: "エライ目あわすで", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
