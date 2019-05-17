//
//  PlanSettingController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
class PlanSettingController: UIViewController {
    
    @IBOutlet weak var planName: UITextField!
    
    @IBOutlet weak var planDays: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btn_registration(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let plan = Plans(context: context)

        //??小テーブルを20個作る
        let num:Int! = Int(planDays!.text!)
//        var childTable = [Int64: String]()
        for _ in 0...num{
            let day = Days(context: context)
            plan.days_re?.adding(day)
        }
       
        
        plan.name = planName.text
        //開始日付を取得して保存
        let date = Date()
        plan.start_date = date
        do {
            try context.save()
        }catch{
            print(error)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    class func dateFromString(string: String, format: String) -> Date{
        let formatter:DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string) ?? Date()
    }
    
    
    
}
