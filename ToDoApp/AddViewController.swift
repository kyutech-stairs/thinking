//
//  AddViewController.swift
//  ToDoApp
//
//  Created by 山之内一隆 on 2019/05/14.
//  Copyright © 2019 山之内一隆. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func pressedButton(_ sender: Any) {
        if textField.text != ""{
            let newItem = Item(title: textField.text!)
            newItem.date = datePicker.date
            itemArray.append(newItem)
            //sort
            itemArray = itemArray.sorted(by: { (a, b) -> Bool in
                return a.date < b.date
            })
            textField.text = ""
            // 保存
            let realm = try! Realm()
            try! realm.write {
                realm.add(itemArray)
            }
            self.navigationController?.popViewController(animated: true)
        } else{
            let alert = UIAlertController(title: "入力エラー！", message: "アイテムを入力して下さい", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
