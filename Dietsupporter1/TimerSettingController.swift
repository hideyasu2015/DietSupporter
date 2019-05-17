//
//  TimerSettingController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
class TimerSettingController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var menu_name: UITextField!
    
    @IBOutlet weak var exercise_time: UITextField!
    
    @IBOutlet weak var rest_time: UITextField!
    
    @IBOutlet weak var set_count: UITextField!
    
    @IBAction func btn_registration(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let timer = Timers(context: context)
        timer.name = menu_name.text
        timer.exercise_time = Int64(exercise_time!.text!) ?? 0
        timer.rest_time = Int64(rest_time!.text!) ?? 0
        timer.set_count = Int64(set_count!.text!) ?? 0
        
        do {
            try context.save()
        }catch{
            print(error)
        }
        performSegue(withIdentifier: "backToTimerList", sender: nil)
        
    }
    
    class func dateFromString(string: String, format: String) -> Date{
        let formatter:DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string) ?? Date()
    }
    }
