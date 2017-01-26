//
//  P1ViewController.swift
//  segue_dome
//
//  Created by 张志祥 on 2017/1/14.
//  Copyright © 2017年 zzx1688. All rights reserved.
//

import UIKit

class P1ViewController: UIViewController {

    @IBOutlet weak var p1Label: UILabel!
    var str: String?//segue传值过来字符串
    var backSting: String?//segue返回数据
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        p1Label.text = str
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //segue返回
    @IBAction func goBackSegue(_ sender: AnyObject) {
        //注意：不能在Navigation中使用！！！
        self.presentingViewController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func backMainVC(_ sender: Any) {
        //segue回调返回，把exit中的回调方法关联到自己的ViewController：
        //关联方法：右击顶部左起第三个图标，选择其中的回调方法，拖到左边第一个按钮，然后点击manual
        //如果直接把exit中的回调函数拖到返回按钮，则将立即执行返回，按钮函数中的执行结果有可能不能被回调
        backSting = "这是P1返回的字符串"
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "backMainForP1", sender: nil)

    }
    
}
