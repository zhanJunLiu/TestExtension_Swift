//
//  ViewController.swift
//  TestExtension_Swift
//
//  Created by phantom_zj on 2017/4/21.
//  Copyright © 2017年 phantom_zj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 字符串类扩展
        "LIUZHANJUN".printSelf()
        
        // Int类型转化扩展
        let intValue: Int = 1
        intValue.FloatValue
        intValue.DoubleValue
        
        
        // 图片压缩扩展方法
//        testImageView.image = UIImage(named: "image")?.imageCompress(targetWith: 100)
        // 图片模糊扩展方法
        testImageView.image = UIImage(named: "image")?.blurImage(value: 1.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        // UIVIew类扩展
        testImageView.movetoXWithDuration(toX: 0, duration: 2)
    }
    
}

