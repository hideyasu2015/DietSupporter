//
//  TimerExecuteController.swift
//  Dietsupporter1
//
//  Created by 佐藤翼 on 2019/01/10.
//  Copyright © 2019 Tsubasa_Sato. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import AVFoundation

class TimerExecuteController: UIViewController,AVAudioPlayerDelegate {
//2019.5.6 add
    var myTimer: Timers?
    var setCount: Int?
    
    // タイマーの変数を制作
    var timer : Timer?
    // カウント（経過時間）の変数を制作
    var count = 0
    // 設定値を扱うキーを設定
    let settingKey = "Timer Value"
    
    //2019.5.6 add 音を鳴らす
    let zeroPath = Bundle.main.bundleURL.appendingPathComponent("zero.mp3")
    var zeroPlayer: AVAudioPlayer!
    
    @IBOutlet weak var topTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // UserDefaultsのインスタンスを生成
        let settings = UserDefaults.standard
        
        // UserDefaultsに初期値を登録
        settings.register(defaults: [settingKey:10])
        
      
      
        
    }
    //add 2019.5.6
    override func viewWillAppear(_ animated: Bool) {
        topTitle.title = myTimer?.name
        textLabel_set.text = String(myTimer!.set_count)
        setCount = Int(myTimer!.set_count)
        //use coredata
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
    }
    
    @IBOutlet weak var textLabel_time: UILabel!
    
    @IBOutlet weak var textLabel_set: UILabel!
    
    @IBAction func btn_back(_ sender: Any) {
        
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
        // 画面遷移を行う
        performSegue(withIdentifier: "backTimerList", sender: nil)
        
    }
    
    @IBAction func btn_start(_ sender: Any) {
        
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったらスタートしない
            if nowTimer.isValid == true {
                // 何も処理しない
                return
            }
        }
        
        // タイマーをスタート
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    @IBAction func btn_stop(_ sender: Any) {
        
        // timerをアンラップしてnowTimerに代入
        if let nowTimer = timer {
            // もしタイマーが、実行中だったら停止
            if nowTimer.isValid == true {
                // タイマー停止
                nowTimer.invalidate()
            }
        }
        
    }
    
    // 画面の更新をする（戻り値:remainCount:残り時間)
    func displayUpdate() -> Int {
        
        // UserDefaultsのインスタンスを生成
//        let settings = UserDefaults.standard
        // 取得した秒数をtimerValueに渡す
//        let timerValue = settings.integer(forKey: settingKey)
  
        //2019.5.6 add
        let timerValue = Int(myTimer!.exercise_time)
        //残り時間(remainCount)を生成
        let remainCount = timerValue - count
        //remainCount（残りの時間）をラベルに表示
        textLabel_time.text = "残り\(remainCount)秒"
        // 残り時間を戻り値に設定
        return remainCount
    }
    
    // 経過時間の処理
    @objc func timerInterrupt(_ timer:Timer) {
        // count（経過時間）に＋１していく
        count += 1
        // remainCount（残り時間）が０以下のとき、タイマーを止める
        if displayUpdate() <= 0 {
            // 初期値化処理
            count = 0
            // タイマー停止
            timer.invalidate()
            
            //2019.5.6 add 音を鳴らす
            do{
                let zeroPlayer = try AVAudioPlayer(contentsOf: zeroPath, fileTypeHint: nil)
                zeroPlayer.delegate = self
                zeroPlayer.play()
            }catch{
                print(error)
            }
            
            // カスタマイズ編：ダイアログを作成
            let alertController = UIAlertController(title: "終了", message: "お疲れ様でした", preferredStyle: .alert)
            // ダイアログに表示させるOKボタンを作成
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            // アクションを追加
            alertController.addAction(defaultAction)
            // ダイアログの表示
            present(alertController, animated: true, completion: nil)
            // add 2019.5.6
            setCount! -= 1
            textLabel_set.text = String(setCount!)
        }
    }
    
    // 画面切り替えのタイミングで処理を行う
    override func viewDidAppear(_ animated: Bool) {
        // カウント（経過時間）をゼロにする
        count = 0
        // タイマーの表示を更新する
        _ = displayUpdate()
        
        //let appDelegate = UIApplication.shared.delegate as? AppDelegate
        //let context = appDelegate!.persistentContainer.viewContext
        //let fetchRequest = NSFetchRequest<Timers>(entityName: "Timers")
        
        //let fetchSort = NSSortDescriptor(key: "name", ascending: true)
        //fetchRequest.sortDescriptors = [fetchSort]
        
        //do {
            //timers = try context.fetch(fetchRequest)
        //} catch {
            //print(error)
        //}
        
    }
    
}
