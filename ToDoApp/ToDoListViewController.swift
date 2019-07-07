//
//  ViewController.swift
//  ToDoApp
//
//  Created by 山之内一隆 on 2019/05/13.
//  Copyright © 2019 山之内一隆. All rights reserved.
//

import UIKit

//MARK:- Itemクラス
class Item{
    var title: String
    var done: Bool = false
    var date: Date = Date()
    //変数の初期化
    init(initTitle: String){
        self.title = initTitle
    }
}

//MARK: - item配列
var itemArray:[Item] = []

class ToDoListViewController: UITableViewController {
    
    //MARK: - viewを読み込む時に実行
    override func viewDidLoad() {
        super.viewDidLoad()
        //let item1 = Item(initTitle: "予定を追加していきましょう！")

        //itemArray.append(item1)
    }
    
    //MARK: - viewが表示される前に実行
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    //MARK: - セルの個数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    //MARK: - 表示するセルをカスタマイズ
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        let formatter = DateFormatter()
        cell.textLabel?.text = item.title
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        cell.detailTextLabel?.text = formatter.string(from: item.date)
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    //MARK: - 追加機能
//    @IBAction func pressedAddButton(_ sender: Any) {
//        var textField = UITextField()
//        let alert = UIAlertController(title: "新しいアイテム", message: "新しいアイテムを入力して下さい", preferredStyle: .alert)
//        let action = UIAlertAction(title: "追加", style: .default) { (action) in
//            let newItem = Item(initTitle: textField.text!)
//            itemArray.append(newItem)
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
        itemArray.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        self.tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    //MARK: - チェックする機能
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        item.done = !item.done
        self.tableView.reloadData()
    }
}
