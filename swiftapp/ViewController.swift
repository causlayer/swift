//
//  ViewController.swift
//  swiftapp
//
//  Created by slayer on 14-6-7.
//  Copyright (c) 2014年 slayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    var resultLable : UILabel!
    
    var operant1:String = ""
    var operant2:String = ""
    var operator:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLable = UILabel(frame: CGRectMake(70,30,182,25))
        resultLable.backgroundColor = UIColor.blackColor()
        resultLable.textAlignment = NSTextAlignment.Right
        resultLable.font = UIFont.systemFontOfSize(16)
        resultLable.textColor = UIColor.whiteColor()
        resultLable.text = "0"
        self.view.addSubview(resultLable)
        
        var arr :Array = ["1","2","3","4","5","6","7","8","9","0","+","-","×","÷","="]

        for i in 0..arr.count {
            var button:UIButton! = UIButton.buttonWithType(.System) as UIButton
            button.frame = CGRectMake(70.0+(Float(i)%5)*38, 60.0+38*Float(Int(i/5)), 30.0, 30.0)
            button.backgroundColor = UIColor.blackColor()
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitle(arr[i], forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            button.tag = i
            self.view.addSubview(button)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonAction(sender : UIButton) {
        let value = sender.currentTitle
        println(operant1.toInt())
        if value == "+" || value == "-" || value == "×" || value == "÷" {
            operator = value;
            return
        }else if value == "=" {
            var result :Float = 0.0
            switch operator {
               case "+":
                result = Float(operant1.bridgeToObjectiveC().floatValue) + Float(operant2.toInt()!)
               case "-":
                result = Float(operant1.bridgeToObjectiveC().floatValue) - Float(operant2.toInt()!)
               case "×":
                result = Float(operant1.bridgeToObjectiveC().floatValue) * Float(operant2.toInt()!)
               case "÷":
                result = Float(operant1.bridgeToObjectiveC().floatValue) / Float(operant2.toInt()!)
               default:
                result = 0.0
            }
            if result == roundf(result){
               resultLable.text = "\(Int(result))"
            }else{
               resultLable.text = "\(result)"
            }
            operant2 = ""
            operant1 = resultLable.text
            return
        }
        if operator == "" {
            operant1 = operant1 + value
            resultLable.text = operant1
        }else{
            operant2 = operant2 + value
            resultLable.text = operant2
        }
    }

}

