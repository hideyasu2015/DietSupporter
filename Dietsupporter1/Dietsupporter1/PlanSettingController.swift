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
        plan.days = PlanSettingController.dateFromString(string: planDays.text ?? "プラン名なし", format: "yyyy/MM/dd")
        plan.name = planName.text
        do {
            try context.save()
        }catch{
            print(error)
        }
    }
    
    class func dateFromString(string: String, format: String) -> Date{
        let formatter:DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string) ?? Date()
    }
    
    
    
}
