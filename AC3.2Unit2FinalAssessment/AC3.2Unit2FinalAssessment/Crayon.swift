//
//  Crayon.swift
//  AC3.2Unit2FinalAssessment
//
//  Created by Erica Y Stevens on 10/6/16.
//  Copyright © 2016 Erica Stevens. All rights reserved.
//

import Foundation

class Crayon {
    var name: String
    var red: Double
    var green: Double
    var blue: Double
    
    init(name: String, red: Double, green: Double, blue: Double) {
        self.name = name
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    convenience init?(fromDict:[String:Any]) {
        if let name = fromDict["name"] as? String,
            let hex = fromDict["hex"] as? String {
            
            var hexComponents = [String]()
            
            // index(after:) will have us skip the initial hash character
            var start = hex.index(after: hex.startIndex)
            
            // go over the characters 3x (there are 6 total)
            for _ in 0..<3 {
                // pick off the first two by making this range
                let range = start..<hex.index(start, offsetBy: 2)
                
                // then substring copies out that range
                let hexComponent = hex.substring(with: range)
                
                // put the string in the array
                hexComponents.append(hexComponent)
                
                // move our start point past the copied characters
                start = hex.index(start, offsetBy: 2)
            }
            
            if let r = Double("0x"+hexComponents[0]), let g = Double("0x"+hexComponents[1]), let b = Double("0x"+hexComponents[2]) {
                self.init(name: name, red: r/255.0, green: g/255.0, blue: b/255.0)
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    //EXTRA CREDIT CONVENIENCE INIT
    convenience init?(dict:[String:Any]) {
        var rgbComponentsArr = [String]()
        if let rgb = dict["rgb"] as? String {
            
            
            
            //Isolate components & append values to rgbComponentsArr
            rgbComponentsArr = rgb.components(separatedBy: ",")
            
            //remove punctuation
            rgbComponentsArr[0].remove(at: rgbComponentsArr[0].startIndex)
            rgbComponentsArr[1].remove(at: rgbComponentsArr[1].startIndex)
            rgbComponentsArr[2].remove(at: rgbComponentsArr[2].startIndex)
            rgbComponentsArr[2].remove(at: rgbComponentsArr[2].index(before: rgbComponentsArr[2].endIndex))
            
            
            
        }
        //Convert string to doubles & assign components to constants
        if let red = Double(rgbComponentsArr[0]), let green = Double(rgbComponentsArr[1]), let blue = Double(rgbComponentsArr[2]), let name = dict["name"] as? String  {
            self.init(name: name, red: red/255.0, green: green/255.0, blue: blue/255.0)
        }
        else {
            return nil
        }
        
    }
}
