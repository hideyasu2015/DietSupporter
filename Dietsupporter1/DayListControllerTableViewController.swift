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

class DayListControllerTableViewController: UIViewController {
    
    // PlanListControllerからの画面遷移時にデータを持ってくる
    var coredataPlan: Plans?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var tableView_day: UITableView!
    
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
    
    
    
    
    
    
}
