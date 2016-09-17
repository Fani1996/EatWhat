//
//  AddDetailViewController.swift
//  Eat
//
//  Created by Fan on 16/9/6.
//  Copyright © 2016年 Fan. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController, UITextFieldDelegate {

   var detailAddButtonTouched = false
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let theSegue = segue.destinationViewController as! ViewController
        theSegue.isdetailAddButtonTouched = detailAddButtonTouched
        theSegue.textAdded = textField.text!
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Setting The Background
        let fileStillPath = NSBundle.mainBundle().pathForResource("Background", ofType: "jpg")
        let jpg = NSData(contentsOfFile: fileStillPath!)
        let webViewBG = UIWebView(frame: self.view.frame)
        webViewBG.scalesPageToFit = true
        webViewBG.loadData(jpg!, MIMEType: "image/jpg", textEncodingName: String(), baseURL: NSURL())
        webViewBG.userInteractionEnabled = false
        self.view.addSubview(webViewBG)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.3
        self.view.addSubview(filter)
        
        self.view.sendSubviewToBack(filter)
        self.view.sendSubviewToBack(webViewBG)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TextField Settings
        textField.delegate = self
        textField.textColor = UIColor.blackColor()
        textField.clearButtonMode = UITextFieldViewMode.WhileEditing
        textField.returnKeyType = UIReturnKeyType.Done
        textField.keyboardAppearance = UIKeyboardAppearance.Alert
        
    }
    
    
    @IBAction func detailAdd(sender: UIButton) {
        detailAddButtonTouched = true
    }
    
    @IBOutlet weak var textField: UITextField!
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //Return The Keyboard
        textField.resignFirstResponder()
        return true;
    }
    
    
}
