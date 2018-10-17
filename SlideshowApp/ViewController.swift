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
    
    @IBOutlet var imageview: UIImageView!
    var imageArray = ["slide01", "slide02", "slide03", "slide04"]
    var index = 0
    
    var flg = false
    var isplay = false
    @IBAction func onTapImage(_ sender: Any) {
        
        // segueを使用して画面遷移
        performSegue(withIdentifier: "result", sender: nil)
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
        imageview.image = UIImage(named: imageArray[index])
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
    
    @IBAction func tapped(sender: Any) {
        if flg {
            imageview.image = UIImage(named: imageArray[index])
            flg = false
        }
        else {
            imageview.image = UIImage(named: imageArray[index])
            flg = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

