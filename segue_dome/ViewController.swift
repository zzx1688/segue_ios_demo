//
//  ViewController.swift
//  segue_dome
//
//  Created by 张志祥 on 2017/1/14.
//  Copyright © 2017年 zzx1688. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goP2(_ sender: Any) {
        //手动跳转到P2ViewController
        self.performSegue(withIdentifier: "goP2Segue", sender: self)
    }

    //segue传值
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //传值到P1
        if segue.identifier == "goP1Segue"{//判断是哪个segue被触发
            //设置目标控制器
            let controller = segue.destination as! P1ViewController
            controller.str = "这是segue传值过来的字符串"//直接设置目标控制器的变量
        }
        //传值到P2
        if segue.identifier == "goP2Segue"{
            let controller = segue.destination as! P2ViewController
            controller.str = "这是segue传值过来的字符串2"//直接设置目标控制器的变量
        }
    }
    
    //segue回调方法，获取返回参数
    @IBAction func backSegue(segue : UIStoryboardSegue){
        if segue.identifier == "backMainForP1"{
            //获取返回的控制器
            let backVC = segue.source as! P1ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
        if segue.identifier == "backMainForP2"{
            //获取返回的控制器
            let backVC = segue.source as! P2ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
    }
    
}

