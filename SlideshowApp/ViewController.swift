//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yuchelle on 2018/10/12.
//  Copyright © 2018年 yutaka.tanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var susumuButton: UIButton!
    @IBOutlet weak var modoruButton: UIButton!
    @IBOutlet weak var imageview: UIButton! //10/22追加
    

    var imageArray = ["slide01.jpg", "slide02.jpg", "slide03.jpg", "slide04.jpg"]
    var index = 0
    
    var flg = false
    var isplay = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExpandViewControllerを取得
        let expandViewController:ExpandViewController = segue.destination as! ExpandViewController
        expandViewController.ExpandImage = UIImage(named: imageArray[index])
        if isplay {
            self.timer.invalidate()
            self.timer = nil
            isplay = !isplay //10/23追加
        }//; isplay = !isplay //10/22追加
        
        playbutton.setTitle("再生", for: .normal) //10/23追加
        //ボタンの有効化 10/23追加
        susumuButton.isEnabled = true
        modoruButton.isEnabled = true
    }
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    
    }
    
    // すすむボタンの動作を設定
    @IBAction func susumu(_ sender: UIButton) {
        index += 1
        displayImage()
    }
    func displayImage() {
        if index >= imageArray.count {
            index = 0
        }
        if index < 0 {
            index = 3
        }
        imageview.setImage(UIImage(named: imageArray[index]), for: .normal)
    }
    
    
    // もどるボタンの動作を設定
    @IBAction func modoru(_ sender: UIButton) {
        index += -1
        displayImage()
    }
    
    // スライドショー
    var timer: Timer!
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayImage()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //タイマーを2秒ごとに進める
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 2.0
        index += 1
        displayImage()
    }
    
    //再生ボタンを押すとスライドショースタート
    @IBAction func startSlide(_ sender: UIButton) {
        
        if isplay {
            self.timer.invalidate()
            self.timer = nil
            playbutton.setTitle("再生", for: .normal)
            //ボタンの有効化
            susumuButton.isEnabled = true
            modoruButton.isEnabled = true
        } else {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            playbutton.setTitle("停止", for: .normal)
            //ボタンの無効化
            susumuButton.isEnabled = false
            modoruButton.isEnabled = false
        }
        isplay = !isplay
        
    }
    
    @IBOutlet weak var playbutton: UIButton!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

