//
//  P2ViewController.swift
//  segue_dome
//
//  Created by 张志祥 on 2017/1/14.
//  Copyright © 2017年 zzx1688. All rights reserved.
//

import UIKit

class P2ViewController: UIViewController {
    @IBOutlet weak var p2Label: UILabel!
    var str:String?//segue传值过来字符串
    var backSting = "P2返回数据"//segue返回数据

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        p2Label.text = str
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //segue回调返回，把exit中的回调方法关联到控件：
    //关联方法：右击顶部左起第三个图标，选择其中的回调方法，拖到需要关联的按钮，然后点击action

}
