//
//  TimerListController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TimerListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func unwindToTimerListController(segue: UIStoryboardSegue){
    }
    
    @IBOutlet weak var tableView_timer: UITableView!
    
    var timers: [Timers]?
    var timer: Timers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        // エラー処理
        let fetchRequest = NSFetchRequest<Timers>(entityName: "Timers")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "id" , ascending: true)]
        
        do{
            //fetchした結果は配列
            try timers = context.fetch(fetchRequest)
        }catch{
            print("fetch error")
        }
        tableView_timer.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath)
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        // セルに表示する値を設定する
        cell.textLabel!.text = timers?[indexPath.row].name
        
        return cell
    }
    
    // セルが選択された時に呼ばれる
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath){
        timer = timers?[indexPath.row]
        performSegue(withIdentifier: "toTimer", sender: nil)
    }
    
    @IBAction func btn_edit(_ sender: Any) {
    }
    
    @IBAction func btn_add_timer(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimer" {
            let subview = (segue.destination as? TimerExecuteController)!
            subview.myTimer = self.timer
        }
    }
}
