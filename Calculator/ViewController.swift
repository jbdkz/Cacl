//
//  ViewController.swift
//  Calculator
//
//  Created by John Diczhazy on 11/4/17.
//  Copyright © 2017 JohnDiczhazy. All rights reserved.
//

import UIKit

// Initialize Empty Array
var arrayStr = [String]()


class ViewController: UIViewController {
    
    
    @IBOutlet weak var displayLbl: UILabel!
    
    
    @IBAction func acBtn(_ sender: Any) {
        // Clear array, set display to 0
        arrayStr.removeAll()
        displayLbl.text = "0"
    }
    
    
    @IBAction func equalBtn(_ sender: Any) {
        
        // Call validateEqual function.
        if ViewController.validateEqual() == true {
        
        // Function variables
        var topStr: String = ""
        var btmStr: String = ""
        var funcStr: String = ""
        var indexInt: Int = 0
        var endIndexInt: Int = 0
        var displayStr: String = ""
        var displayStr1: String = ""
        
        // Get position of add, subtract, multiply, or divide string in array if it exists in array.
        if (arrayStr.index(of: "add")) == nil {
           if (arrayStr.index(of: "subtract")) == nil {
              if (arrayStr.index(of: "multiply")) == nil {
                 if (arrayStr.index(of: "divide")) ==  nil {
                }else{(indexInt = arrayStr.index(of: "divide")!)}
              }else{(indexInt = arrayStr.index(of: "multiply")!)}
           }else{(indexInt = arrayStr.index(of: "subtract")!)}
        }else{(indexInt = arrayStr.index(of: "add")!)}
        
        // Get endIndex or one greater than the last subscript
        endIndexInt = arrayStr.endIndex
        
        // Add all strings in array to topStr variable BEFORE the add, subtract, multiply, or divide string in array.
        for i in 0...(indexInt-1) {
        topStr = topStr + arrayStr[i]
           }
        
        // Add all strings in array to btmStr variable AFTER the add, subtract, multiply, or divide string in array.
        for i in (indexInt + 1)...(endIndexInt-1){
        btmStr = btmStr + arrayStr[i]
        }
        
        // Get function string (add, subtract, multiply, or divide) in array.
        funcStr = arrayStr[indexInt]
        
        // Call calculate function in CalcUtils class, display results
        displayLbl.text = CalcUtils.calculate(top: topStr, bottom: btmStr, function: funcStr)
        
        // Clear array
        arrayStr.removeAll()
        
        // Assign displayed number to displayStr variable
        displayStr = displayLbl.text!
        
        // Use insert function to place comma seperator between characters in displayStr, assign output to displayStr1
        displayStr1 = insert(seperator: ",", afterEveryXChars: 1, intoString: displayStr)
    
        // Use comma to seperate each characater and place in seperate array element.
        arrayStr = displayStr1.components(separatedBy: ",")
            
        }
        
    }
    
    
    // insert function used to place comma seperator between characters in a string.
    func insert(seperator: String, afterEveryXChars: Int, intoString: String) -> String {
        var output = ""
        intoString.enumerated().forEach { index, c in
            if index % afterEveryXChars == 0 && index > 0 {
                output += seperator
            }
            output.append(c)
        }
        return output
    }
    
    // display function display results View Controller.
    class func display()->String{
        
        // Create function variables.
        var msg: String = ""
        var indexInt: Int = 0
        var endIndexInt: Int = 0
        
        // Display array contents only before or after the add, subtract, multiply, or divide string in the array.
          if (arrayStr.index(of: "add")) == nil {
            if (arrayStr.index(of: "subtract")) == nil {
                if (arrayStr.index(of: "multiply")) == nil {
                    if (arrayStr.index(of: "divide")) ==  nil {
                        for str in arrayStr {
                            if str != "add"{
                            if str != "subtract"{
                               if str != "multiply"{
                                 if str != "divide"{
                                     msg = msg + str
                                   }
                                 }
                               }
                             }
                         }
                    }else{(indexInt = arrayStr.index(of: "divide")!)
                        endIndexInt = arrayStr.endIndex
                        for i in (indexInt)...(endIndexInt-1){
                            if arrayStr[i] != "divide"{
                                msg = msg + arrayStr[i]
                            }
                        }
                    }
                }else{(indexInt = arrayStr.index(of: "multiply")!)
                endIndexInt = arrayStr.endIndex
                for i in (indexInt)...(endIndexInt-1){
                    if arrayStr[i] != "multiply"{
                        msg = msg + arrayStr[i]
                    }
                }
            }
            }else{(indexInt = arrayStr.index(of: "subtract")!)
            endIndexInt = arrayStr.endIndex
            for i in (indexInt)...(endIndexInt-1){
                if arrayStr[i] != "subtract"{
                    msg = msg + arrayStr[i]
                }
            }
        }
        }else{(indexInt = arrayStr.index(of: "add")!)
            endIndexInt = arrayStr.endIndex
            for i in (indexInt)...(endIndexInt-1){
                if arrayStr[i] != "add"{
                                msg = msg + arrayStr[i]
                            }
                   }
        }
        return msg
        
    }
    
    // Function appends numbers to array upon proper key press. It also adds  add, subtract, multiply, or divide string to array based on function.
       @IBAction func numBtn(_ sender: UIButton!) {
        let btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
           arrayStr.append("1")
           displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 2 {
            arrayStr.append("2")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 3 {
            arrayStr.append("3")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 4 {
            arrayStr.append("4")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 5 {
            arrayStr.append("5")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 6 {
            arrayStr.append("6")
            displayLbl.text = ViewController.display()
            
        }
        
        if btnsendtag.tag == 7 {
            arrayStr.append("7")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 8 {
            arrayStr.append("8")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 9 {
            arrayStr.append("9")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 0 {
            arrayStr.append("0")
            displayLbl.text = ViewController.display()
            
        }
        
        if btnsendtag.tag == 15 {
            arrayStr.append(".")
            displayLbl.text = ViewController.display()
        }
        
        if btnsendtag.tag == 10 {
            // Call validate function
            if ViewController.validate() == true {
            arrayStr.append("add")
            displayLbl.text = ViewController.display()
            }
        }
        
        if btnsendtag.tag == 11 {
            // Call validate function
            if ViewController.validate() == true {
            arrayStr.append("subtract")
            displayLbl.text = ViewController.display()
            }
        }
        
        if btnsendtag.tag == 12 {
            // Call validate function
            if ViewController.validate() == true {
            arrayStr.append("multiply")
            displayLbl.text = ViewController.display()
            }
        }
        
        if btnsendtag.tag == 13 {
            // Call validate function
            if ViewController.validate() == true {
            arrayStr.append("divide")
            displayLbl.text = ViewController.display()
            }
        }
    }
    
    //Ensures add, subtract, multiply, or divide string can only be added once to array.
    class func validate()->Bool{
        if arrayStr.contains(where: ["add","subtract","multiply","divide"].contains){
            return false
        }else{
            if arrayStr.contains(where: ["0","1","2","3","4","5","6","7","8","9","."].contains){
              return true
             }else{
            return false
          }
        }
    }
    
    class func validateEqual()->Bool{
        var indexInt: Int = 0
        
        // Get position of add, subtract, multiply, or divide string in array if it exists in array.
        if (arrayStr.index(of: "add")) == nil {
            if (arrayStr.index(of: "subtract")) == nil {
                if (arrayStr.index(of: "multiply")) == nil {
                    if (arrayStr.index(of: "divide")) ==  nil {
                    }else{(indexInt = arrayStr.index(of: "divide")!)}
                }else{(indexInt = arrayStr.index(of: "multiply")!)}
            }else{(indexInt = arrayStr.index(of: "subtract")!)}
        }else{(indexInt = arrayStr.index(of: "add")!)}
        
        
        // Validate that a top,function,and bottom number exist before making the equal fucntion active.
        if (arrayStr.contains(where: ["add","subtract","multiply","divide"].contains))&&(arrayStr.count>2)&&(indexInt != (arrayStr.endIndex-1)){
             return true
            }else{
             return false
          }
    }
    
    
    override func viewDidLoad() {
        // Display 0 at page load.
        displayLbl.text = "0"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

