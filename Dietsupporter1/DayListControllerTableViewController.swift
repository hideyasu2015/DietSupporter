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
    //change
    var planlists: [PlanList] = [PlanList]()
    
    var days: [Days]?

    //    var day: Days?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         tableView_day.register(UINib(nibName: "DayListCell", bundle: nil), forCellReuseIdentifier: "DayCell")
  
    }
    
    override func viewDidAppear(_ animated: Bool) {


//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        let context = appDelegate!.persistentContainer.viewContext
//        // エラー処理
//        let fetchRequest = NSFetchRequest<Days>(entityName: "Days")
//        fetchRequest.predicate = NSPredicate(format: "title == %@", plan?.name)
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "days" , ascending: true)]
//
//        do{
//            //fetchした結果は配列
//             plan = try context.fetch(fetchRequest)
//        }catch{
//            print("fetch error")
//        }
        tableView_day.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//
//        for num  in 0...Int(truncatingIfNeeded: plan!.days_re. ) {
//            //カレンダclass 調査 加算　減産
//            let planlist = PlanList(days: num, date: plan!.start_date!)
//
//            planlists.append(planlist)
        
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //2019.4
        return plan?.days_re?.count ?? 0
        //        return Int(truncatingIfNeeded: plan!.days )
        //        return days?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: DayListCell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayListCell
        
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        
        // セルに表示する値を設定する
        let show_days = plan?.days_re?.allObjects as! [Days]
        let date = show_days[indexPath.row].day
        cell.count.text = String(show_days[indexPath.row].day)
//        cell.dayLabel.text = String(from: date)
        
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
//        plan = plan[indexPath.row]
        performSegue(withIdentifier: "toDayList", sender: nil)
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
