//
//  test.swift
//  ToDoApp
//
//  Created by kai nakata on 2019/07/01.
//  Copyright © 2019 山之内一隆. All rights reserved.
//
import UIKit

import Foundation

class Item_Estimate{
    var title: String
    var done: Bool = false
    var date: Date = Date()
    //変数の初期化
    init(initTitle: String){
        self.title = initTitle
    }
}
//MARK: - item配列
var itemArray_Estimate:[Item] = []

class EstimateViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Item(initTitle: "何にいくらかかるねん。")
        
        itemArray_Estimate.append(item1)
    }
    //MARK: - viewが表示される前に実行
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    //MARK: - セルの個数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray_Estimate.count
    }
    //MARK: - 表示するセルをカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellEst = tableView.dequeueReusableCell(withIdentifier: "ItemEstimateCell", for: indexPath)
        let itemEst = itemArray_Estimate[indexPath.row]
        let formatterEst = DateFormatter()
        cellEst.textLabel?.text = itemEst.title
        formatterEst.dateFormat = "yyyy/MM/dd HH:mm:ss"
        cellEst.detailTextLabel?.text = formatterEst.string(from: itemEst.date)
        cellEst.accessoryType = itemEst.done ? .checkmark : .none
        return cellEst
    }
    
    //MARK: - 追加機能
    //    @IBAction func pressedAddButton(_ sender: Any) {
    //        var textField = UITextField()
    //        let alert = UIAlertController(title: "新しいアイテム", message: "新しいアイテムを入力して下さい", preferredStyle: .alert)
    //        let action = UIAlertAction(title: "追加", style: .default) { (action) in
    //            let newItem = Item(initTitle: textField.text!)
    //            itemArray_Estimate.append(newItem)
    //            self.tableView.reloadData()
    //        }
    //        alert.addTextField { (alertTextField) in
    //            alertTextField.placeholder = "新しいアイテム"
    //            textField = alertTextField
    //        }
    //        alert.addAction(action)
    //        present(alert, animated: true, completion: nil)
    //    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemArray_Estimate.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        self.tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    //MARK: - チェックする機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray_Estimate[indexPath.row]
        item.done = !item.done
        self.tableView.reloadData()
    }
}
