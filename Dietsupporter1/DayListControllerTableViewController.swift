//
//  DayListController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/05.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DayListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    // PlanListControllerからの画面遷移時にデータを持ってくる
    var plan: Plans?
    
    @IBOutlet weak var tableView_day: UITableView!
    
    //配列daysを設定
    let days = ["1日目", "2日目", "3日目"]
    
    var coredataPlans: [Plans]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        // エラー処理
        let fetchRequest = NSFetchRequest<Plans>(entityName: "Plans")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id" , ascending: true)]
        
        
        do{
            //fetchした結果は配列
            try coredataPlans = context.fetch(fetchRequest)
        }catch{
            print("fetch error")
        }
        tableView_day.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coredataPlans?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        // セルに表示する値を設定する
        cell.textLabel!.text = days[indexPath.row]
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        
    }
    
    
    @IBAction func unwindToDayListController(segue: UIStoryboardSegue){
    }
    
    @IBAction func btn_edit(_ sender: Any) {
    }
    
    @IBAction func btn_add_day(_ sender: Any) {
    }
    
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
        if (segue.identifier == "toFoodList") {
            let subView = (segue.destination as? FoodListControllerTableViewController)!
            subView.coredataPlan = self.coredataPlans
        }
    }
    
    
    
    
}
