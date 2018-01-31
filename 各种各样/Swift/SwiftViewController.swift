//
//  SwiftViewController.swift
//  各种各样
//
//  Created by 董磊 on 2017/12/18.
//  Copyright © 2017年 董磊. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
     //var 声明的变量 如果stringA在后面没有修改 系统还会提示使用let声明
     //let生命的是常量
        
        //使用字符串字面量
        let stringA = "susan"
        print(stringA)
        
        //使用string实例化
        let stringB = String("li话")
        print(stringB!)
        
        
        var _:String = "董磊"
        
        let a:[String] = ["name","age"]
        
        var sex = "man"
        
        sex = "梨花"
        
        
        
        
        print(a)
        
        
        
        
        
        
        

        
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
