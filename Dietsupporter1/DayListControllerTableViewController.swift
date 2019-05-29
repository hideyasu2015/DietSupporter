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

class DayListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UseSegueDelegate{
    
    func moveView(_ index: IndexPath) {
        //self.index= 21行目
        self.index = index
        performSegue(withIdentifier: "toFoodList", sender: nil)
    }
    
    //delegate
    var index:IndexPath?
    
    // PlanListControllerからの画面遷移時にデータを持ってくる
    var plan: Plans?
    //日付表示用
    var planDays: [Days]?
    
    @IBOutlet weak var tableView_day: UITableView!
    //change
    var planlists: [PlanList] = [PlanList]()
    
    var days: [Days]?

    //    var day: Days?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         tableView_day.register(UINib(nibName: "DayListCell", bundle: nil), forCellReuseIdentifier: "DayCell")
  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sortDescriptor = NSSortDescriptor(key: "day", ascending: true)
        planDays = plan?.days_re?.sortedArray(using: [sortDescriptor]) as! [Days]
        
        tableView_day.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //2019.4 エルビス演算子 左辺のオプショナルのアンラップ結果がｎilのとき 右辺
        return planDays?.count ?? 0
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: DayListCell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayListCell
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateStyle = .medium
        // セルに表示する値を設定する

        let date = planDays![indexPath.row].day
        cell.count.text = "\(String(planDays![indexPath.row].day + 1)) 日目"
        let dateComponents = DateComponents(day: Int(date))
        //datecomponents でday を指定しているのでその分増えていく 1-足す時間 2-開始時間
        let showDay = Calendar.current.date(byAdding: dateComponents, to: plan!.start_date!)
        cell.dayLabel.text = formatter.string(from: showDay!)
        //このコントロラーを渡す
        cell.delegate = self
        cell.index = indexPath
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
            // modify
            subView.day_int = self.plan?.days
            subView.day = self.planDays![index!.row]
        }
    }
    
    
    
    
}

struct PlanList{
    let days:Int
    let date:Date
    
    init(days:Int ,date:Date){
        self.days = days
        self.date = date
    }
}
