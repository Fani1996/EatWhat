//
//  ViewController.swift
//  Eat
//
//  Created by Fan on 16/9/4.
//  Copyright © 2016年 Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isButtonNotTouched = true
    var isdetailAddButtonTouched = false
    var textAdded = ""
    var timer:NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Button Shadow
        buttonGo.layer.shadowOpacity = 0.4
        buttonGo.layer.shadowColor = UIColor.blackColor().CGColor
        buttonGo.layer.shadowOffset = CGSize(width: 1, height: 3)
        buttonAdd.layer.shadowOpacity = 0.4
        buttonAdd.layer.shadowColor = UIColor.blackColor().CGColor
        buttonAdd.layer.shadowOffset = CGSize(width: 1, height: 3)
        
        buttonAdd.layer.cornerRadius = buttonAdd.frame.width / 2
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Applying GIF Background
        let filePath = NSBundle.mainBundle().pathForResource("1", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        let webViewBG = UIWebView(frame: self.view.frame)
        webViewBG.scalesPageToFit = true
        webViewBG.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        webViewBG.userInteractionEnabled = false
        self.view.addSubview(webViewBG)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.1
        self.view.addSubview(filter)
        
        self.view.sendSubviewToBack(filter)
        self.view.sendSubviewToBack(webViewBG)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //NSTimer 循环执行printStore
        timer = NSTimer.scheduledTimerWithTimeInterval (0.5,
            target:self,selector:#selector(ViewController.printStore),
            userInfo:nil,repeats:true)
        
        if isButtonNotTouched {
        
        //buutonAnimation
        self.buttonGo.center.y += 25
        self.buttonGo.alpha = 0
        self.display.alpha = 0
        
        UIView.animateWithDuration(3.0, delay: 0, options: .CurveEaseInOut, animations: {
            self.display.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.3, options: [.CurveEaseInOut, .AllowUserInteraction], animations: {
            self.buttonGo.center.y -= 25
            self.buttonGo.alpha = 1.0
            }, completion: nil)
        
        
        }
        
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
    
    }

    @IBOutlet weak var buttonAdd: UIButton!
    
    @IBOutlet weak var buttonGo: UIButton!
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func buttonPressed(sender: UIButton) {
        
        isButtonNotTouched = false
        let avc = AddDetailViewController()
        
        if isdetailAddButtonTouched {
            print("OK")
            if textAdded != "" {
                print("OK")
                let addCount = count! + 1
                storeList.updateValue(textAdded, forKey: addCount)
                textAdded = ""
                for key in storeList.keys
                {
                    print("key=:\(key)")
                }
            }
            avc.detailAddButtonTouched = false
        }
        timer.invalidate()
        printStore()
    }
    
    var storeList:Dictionary <Int,String> = [
        1: "华师卤饭",
        2: "黄焖鸡米饭",
        3: "华师盖浇饭",
        4: "西苑食堂",
        5: "三顾冒菜",
        6: "华师卤菜",
        7: "重庆小面",
        8: "东苑食堂",
        9: "沙县小吃",
        10:"💩💩💩",
    ]
    
    var count: Int? {
        return storeList.count
    }
    
    func getStore(num: Int) -> String{
        return storeList[num]!
    }
    
    func randomIn(min: Int, max: Int) -> Int {
        return Int(arc4random()) % (max - min + 1) + min
    }
    
    func printStore(){
        let temp = randomIn(1,max: count!)
        display.text = getStore(temp)
    }
    
    
    
    
    
    
    
}

