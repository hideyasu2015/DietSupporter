//
//  PlanListControllerTableViewController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/05.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class PlanListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView_plan: UITableView!
    
    //配列plansを設定
    let plans = ["リンゴダイエット", "糖質制限ダイエット", "脂質制限ダイエット"]
    
    // coredataPlansの中にPlansの内容を全て格納
    var coredataPlans: Plans?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CoreDataを使う際に必須の２文（憶える）
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        
        // エラー処理（エラーが起きそうな処理にはdo-catch構文で対応）
        let fetchRequest = NSFetchRequest<Plans>(entityName: "Plans")
        do{
            //fetch
             coredataPlans = try context.fetch(fetchRequest)
        }catch{
            print("fetch error")
        }
        tableView_plan.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // セルに表示する値を設定する
        cell.textLabel!.text = plans[indexPath.row]
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    }
    
    @IBAction func unwindToPlanListController(segue: UIStoryboardSegue){
    }
    
    @IBAction func btn_edit(_ sender: Any) {
    }
    
    @IBAction func btn_top(_ sender: Any) {
    }
    
    @IBAction func btn_plan(_ sender: Any) {
    }
    
    @IBAction func btn_day(_ sender: Any) {
    }
    
    @IBAction func btn_food(_ sender: Any) {
    
}
    
    // セルをタップした時にDayListControllerTableViewControllerに遷移させる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toViewController2") {
            let subView = (segue.destination as? DayListControllerTableViewController)!
            subView.coredataPlan = self.coredataPlans
    }
}
    
}
