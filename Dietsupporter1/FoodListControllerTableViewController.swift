//
//  FoodListController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
import CoreData
class FoodListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // DayListControllerからの画面遷移時にデータを持ってくる
    var coredataPlan: Plans?
    
    var days: Days?
    
    @IBOutlet weak var tableView_food: UITableView!
    
    //配列foodsを設定
    let foods = ["リンゴ", "ヨーグルト", "いちご"]
    
    var coredataFoods: [Foods]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        // エラー処理
        let fetchRequest = NSFetchRequest<Foods>(entityName: "Foods")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id" , ascending: true)]
        
        
        do{
            //fetchした結果は配列
            try coredataFoods = context.fetch(fetchRequest)
        }catch{
            print("fetch error")
        }
        tableView_food.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coredataFoods?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        // セルに表示する値を設定する
        cell.textLabel!.text = foods[indexPath.row]
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        
    }
    
    @IBAction func unwindToFoodListController(segue: UIStoryboardSegue){
    }
    
    @IBAction func btn_edit(_ sender: Any) {
    }
    
    @IBAction func btn_add_food(_ sender: Any) {
    }
    
    @IBOutlet weak var label_cal: UILabel!
    
    @IBOutlet weak var label_carbo: UILabel!
    
    @IBOutlet weak var label_fat: UILabel!
    
    @IBOutlet weak var label_protain: UILabel!
    
    @IBOutlet weak var label_total_cal: UILabel!
    
    @IBAction func btn_top(_ sender: Any) {
    }
    
    @IBAction func btn_plan(_ sender: Any) {
    }
    
    @IBAction func btn_day(_ sender: Any) {
    }
    
    @IBAction func btn_food(_ sender: Any) {
    }
    
    
    
    
    
}
