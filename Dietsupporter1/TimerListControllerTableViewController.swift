//
//  TimerListController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
class TimerListControllerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func unwindToTimerListController(segue: UIStoryboardSegue){
    }
    
    @IBOutlet weak var tableView_timer: UITableView!
    
    //配列timesを設定
    let times = ["タバタトレーニング", "ストレッチ", "サーキットトレーニング"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return times.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TimerCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = times[indexPath.row]
        
        return cell
    }
    
    @IBAction func btn_edit(_ sender: Any) {
    }
    
    @IBAction func btn_add_timer(_ sender: Any) {
    }
    
    
    
    
    
    
}
