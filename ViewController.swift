//
//  ViewController.swift
//  calculator
//
//  Created by Yi Fan Zhang on 13/09/2017.
//  Copyright © 2017 Yi Fan Zhang. All rights reserved.
//

import UIKit
func isPurnInt(string: String) -> Bool {
    
    let scan: Scanner = Scanner(string: string)
    
    var val:Int = 0
    
    return scan.scanInt(&val) && scan.isAtEnd
    
}
class ViewController: UIViewController {
    var oldvalue:Double = 0
    var answer:Double = 0
    var op = 0
    @IBOutlet weak var display: UILabel!
    var typing = false
    
    @IBOutlet weak var operand: UILabel!
    @IBAction func touchdigit(_ sender: UIButton) {
        
        var  digit = sender.currentTitle!
        if digit == "π"
        {
            digit=String(Double.pi)
        }
        else if digit == "e"
        {
            digit = String(M_E)
        }
        if typing
        {
            if digit=="."
            {
                if isPurnInt(string: display.text!)==true
                {
                    let screen = display.text!
                    display.text = screen+digit
                }
                
            }
            else{
                let screen = display.text!
                display.text = screen+digit
            }
        }
        else
        {
            if digit=="."
            {
                if isPurnInt(string: display.text!)==true
                {
                    let screen = display.text!
                    display.text = screen+digit
                }
                
            }
                
                
            else {
                display.text = digit}
            if display.text != "0"
            {
                typing = true
                operand.text = " "
            }
        }
        answer = Double(display.text!)!
    }
    
    
    @IBAction func operate(_ sender: UIButton) {
        
        if typing == true{
            if op==1 {
                answer = oldvalue + Double(display.text!)!
                display.text =  String(oldvalue + Double(display.text!)!)
            }
            else if op==2
            {
                answer = oldvalue - Double(display.text!)!
                display.text =  String(oldvalue - Double(display.text!)!)
            }
            else if op==3
            {
                answer = oldvalue * Double(display.text!)!
                display.text =  String(oldvalue * Double(display.text!)!)
            }
            else if op==4
            {
                answer = oldvalue / Double(display.text!)!
                display.text =  String(oldvalue / Double(display.text!)!)
            }
        }
        op = 0
        typing = false
        
        if let ope = sender.currentTitle
        {
            switch ope
            {
            case "+":
                oldvalue = Double(display.text!)!
                if typing == false{
                    operand.text = "+"
                }
                op=1
                
            case "-":
                op=2
                oldvalue = Double(display.text!)!
                if typing == false{
                    operand.text = "-"
                }
            case "×":
                op=3
                oldvalue = Double(display.text!)!
                if typing == false{
                    operand.text = "×"}
            case "÷":
                op=4
                oldvalue = Double(display.text!)!
                if typing == false{
                    operand.text = "÷"}
            case "√":
                
                answer = sqrt(Double(display.text!)!)
                
                display.text =  String(answer)
                
            case "^2":
                answer = Double(display.text!)!*Double(display.text!)!
                
                display.text =  String(answer)
            case "C":
                answer = 0
                oldvalue = 0
                display.text =  "0"
                operand.text = "  "
            case "sin":
                answer = sin(Double(display.text!)!)
                if(answer<1e-4){
                    display.text =  String(format: "%.0f",answer)}
                else {display.text = String(answer)}
            case "cos":
                answer = cos(Double(display.text!)!)
                if(answer<1e-4){
                    display.text =  String(format: "%.0f",answer)}
                else {display.text = String(answer)}
            case "tan":
                answer = tan(Double(display.text!)!)
                if(answer<1e-4){
                    display.text =  String(format: "%.0f",answer)}
                else {display.text = String(answer)}
            case "ln":
                answer = log(Double(display.text!)!)
                if(answer<1e-4){
                    display.text =  String(format: "%.0f",answer)}
                else {display.text = String(answer)}
            case "!":
                oldvalue = Double(display.text!)!
                if (oldvalue>0){
                    answer = 1
                    for x in 1...Int(oldvalue) {
                        answer = answer*Double((Int(oldvalue)-x+1))
                    }
                    
                    display.text =  String(format: "%.0f",answer)}
                if (oldvalue==0){
                    display.text="1.0"
                }
            case "+/-":
                
                oldvalue = -Double(display.text!)!
                display.text = String(oldvalue)
            case "1/x":
                
                oldvalue = 1/Double(display.text!)!
                if(oldvalue<1e-4){
                    display.text =  String(format: "%.0f",oldvalue)}
                else {display.text = String(oldvalue)}
                
                
                
            case "=":
                display.text = String(answer)
                operand.text = "  "
            default:
                break
            }
            
        }
        
    }
    
}
