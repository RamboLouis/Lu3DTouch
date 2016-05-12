//
//  ViewController.swift
//  Lu3DTouch
//
//  Created by Louis on 16/5/12.
//  Copyright © 2016年 RamboLu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor ( red: 0.1373, green: 0.9291, blue: 0.9492, alpha: 1.0 )

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func OneViewController(){
        
        alertShow("You pressed Icon One")
    }
    
    func TwoViewController(){
        alertShow("You pressed Icon Two")
    }
    
    func ThreeViewController(){
        alertShow("You pressed Icon Three")
    }
    func FourthViewController(){
        alertShow("You pressed Icon Three")
    }

    func alertShow(text: String) {

        if #available(iOS 9.0, *) {
        
        let alert = UIAlertController(title: "标题", message: text, preferredStyle: .ActionSheet)
        let action = UIAlertAction.init(title: "确定", style: .Default, handler: nil)
        let action1 = UIAlertAction.init(title: "取消", style: .Destructive, handler: nil)
        
        alert.addAction(action)
        alert.addAction(action1)
        self.presentViewController(alert, animated: true, completion: nil)
        
        }else{
        
            let alert1 = UIAlertView(title: "标题", message: text, delegate: self, cancelButtonTitle: "确定")
        }
    }

}