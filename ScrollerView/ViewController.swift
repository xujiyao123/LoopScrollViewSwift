//
//  ViewController.swift
//  ScrollerView
//
//  Created by sunnytu on 16/4/21.
//  Copyright © 2016年 sunnytu. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UIScrollViewDelegate{

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let imageArr = ["0.png" , "1.png" , "2.png" , "3.png" , "4.png"]
        self.view.backgroundColor = UIColor.blackColor()
        let scroll = LoopScrollView(frame: UIScreen.mainScreen().bounds, imageArray: imageArr, superView: self.view)
    
        self.view .addSubview(scroll)
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   }

