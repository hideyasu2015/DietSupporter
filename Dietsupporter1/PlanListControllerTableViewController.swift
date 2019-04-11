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
    
    var plans: [Plans]?
    var plan: Plans?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        // エラー処理
        let fetchRequest = NSFetchRequest<Plans>(entityName: "Plans")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id" , ascending: true)]
        
        
        do{
            //fetchした結果は配列
            try plans = context.fetch(fetchRequest)
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
        return plans?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "PlanCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        
        // セルに表示する値を設定する
        cell.textLabel!.text = plans?[indexPath.row].name
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        plan = plans?[indexPath.row]
        performSegue(withIdentifier: "toDayList", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDayList") {
            let subView = (segue.destination as? DayListControllerTableViewController)!
            // 左辺が遷移先
            subView.plan = self.plan
    }
}
    
}
