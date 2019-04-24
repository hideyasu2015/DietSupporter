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
    var day_int: Int64?
    var day: Days?
    
    @IBOutlet weak var tableView_food: UITableView!
    
    var dailyFoods: [DailyFoods]?
    var dailyFood: DailyFoods?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        // エラー処理
        let fetchRequest = NSFetchRequest<DailyFoods>(entityName: "DailyFoods")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id" , ascending: true)]
        
        
        do{
            //fetchした結果は配列
            try dailyFoods = context.fetch(fetchRequest)
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
        //change
        return unsafeDowncast<T, Int>( day_int, Int)
//        return dailyFoods?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        // セルに表示する値を設定する
        let nilCheckDailyFood = dailyFoods?[indexPath.row].food ?? Int64(indexPath.row)
        cell.textLabel!.text = String(nilCheckDailyFood)
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        dailyFood = dailyFoods?[indexPath.row]
        performSegue(withIdentifier: "toFoodSetting", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toFoodSetting") {
            let subView = (segue.destination as? FoodListControllerTableViewController)!
            subView.dailyFood = self.dailyFood
        }
    }
    
}
