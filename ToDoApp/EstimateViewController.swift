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
    var titleEst: String
    var money: String
    var done: Bool = false
    var dateEst: Date = Date()
    
    //変数の初期化
    init(titleEst: String,money: String){
        self.titleEst = "hoge"
        self.titleEst = titleEst
        self.money = money
    }
    
}

//MARK: - item配列
var itemArray_Estimate:[Item_Estimate] = []

class EstimateViewController: UITableViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    var total:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let item1 = Item_Estimate(titleEst: "",money: "0")
        
        //itemArray_Estimate.append(item1)
        
        
    }
    //MARK: - viewが表示される前に実行
    override func viewWillAppear(_ animated: Bool) {
        reloadTotal()
        
    }
    //MARK: - セルの個数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray_Estimate.count
        
    }
    //MARK: - 表示するセルをカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellEst = tableView.dequeueReusableCell(withIdentifier: "ItemEstimateCell", for: indexPath)
        let itemEst = itemArray_Estimate[indexPath.row]
        
        //合計計算
        total += Int(itemEst.money)!
        totalLabel.text = "Total : ¥" + String(total)
        
        cellEst.textLabel?.text = "￥" + itemEst.money
        cellEst.detailTextLabel?.text = itemEst.titleEst
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
        reloadTotal()
    }
    
    //MARK: - チェックする機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemEst = itemArray_Estimate[indexPath.row]
        itemEst.done = !itemEst.done
        reloadTotal()
    }
    
    //セクション分け
    
    private func reloadTotal(){
        self.total = 0
        self.tableView.reloadData()
    }
    
    
}
