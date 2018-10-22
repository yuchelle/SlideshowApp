//
//  ExpandViewController.swift
//  SlideshowApp
//
//  Created by yuchelle on 2018/10/22.
//  Copyright © 2018年 yutaka.tanabe. All rights reserved.
//

import UIKit

class ExpandViewController: UIViewController {

    @IBOutlet weak var ExpandImageView: UIImageView! //遷移先の画像
    
    var ExpandImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExpandImageView.image = ExpandImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
