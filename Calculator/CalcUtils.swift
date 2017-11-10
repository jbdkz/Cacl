//
//  CalcUtils.swift
//  Calculator
//
//  Created by John Diczhazy on 11/5/17.
//  Copyright © 2017 JohnDiczhazy. All rights reserved.
//

import UIKit

class CalcUtils {
    
    class func calculate (top: String, bottom: String, function: String) -> String{
        
        // Function variables
        var topFlt: Float = 0
        var botFlt: Float = 0
        var resultFlt: Float = 0
        
        topFlt = Float(top)!
        botFlt = Float(bottom)!
        
        // Perform mathmatical calculation bases on function string then return results.
        if function == "add" {
            resultFlt = topFlt + botFlt
        }
    
        if function == "subtract" {
             resultFlt = topFlt - botFlt
        }
       
        if function == "multiply" {
            resultFlt = topFlt * botFlt
        }
        
        if function == "divide" {
            resultFlt = topFlt/botFlt
        }
        
        
    return(String(resultFlt))
    }
    
}
    




