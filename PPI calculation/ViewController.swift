//
//  ViewController.swift
//  Display calculation
//
//  Created by Юрий  Парфенов on 08/04/2019.
//  Copyright © 2019 Юрий  Парфенов. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var DiagonalFloat: Float = 1
    var WidghtResolutionFloat: Float = 1
    var HightResolutionFloat: Float  = 1
    var dp: Float = 1
    var PPI: Float = 1
    var PPIInt: Int = 1
    
    
    func ErrorCheck(){
        if HightResolution.text!.isEmpty && WidthResolution.text!.isEmpty && Diagonal.text!.isEmpty{
            MainLabel.text = "fields are not filled"
        }else{
            if Int(HightResolution.text!) != nil && Int(WidthResolution.text!) != nil && Float(Diagonal.text!) != nil{
                DiagonalFloat = Float(Diagonal.text!)!
                WidghtResolutionFloat = Float(WidthResolution.text!)!
                HightResolutionFloat = Float(HightResolution.text!)!
            }else{
                MainLabel.text = "error"
            }
        }
        
    }
    
    func calculation(){
        if DiagonalFloat >= 0 && WidghtResolutionFloat >= 0 && HightResolutionFloat >= 0{
            
            dp = Float(sqrt(Double((WidghtResolutionFloat*WidghtResolutionFloat) + (HightResolutionFloat*HightResolutionFloat))))
            PPI = dp / DiagonalFloat
            PPIInt = Int(PPI)
            MainLabel.text = String(PPIInt)
            
        }else{
            MainLabel.text = "value less than 0"
        }
        
    }
    
    
    func clear(){
        
        MainLabel.text = ""
        HightResolution.text = ""
        WidthResolution.text = ""
        Diagonal.text = ""
        DiagonalFloat = 1
        WidghtResolutionFloat = 1
        HightResolutionFloat = 1
        
        
    }
    
    
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var HightResolution: UITextField!
    @IBOutlet weak var WidthResolution: UITextField!
    @IBOutlet weak var Diagonal: UITextField!
    
    
    @IBAction func ClearAll(_ sender: Any) {
        
        clear()
        
    }
    
    @IBAction func Calculate(_ sender: Any) {
        ErrorCheck()
        calculation()
        ErrorCheck()
        
        
    }
    
    override func viewDidLoad() {
        
        Diagonal.delegate = self
        HightResolution.delegate = self
        WidthResolution.delegate = self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Diagonal.resignFirstResponder()
        HightResolution.resignFirstResponder()
        WidthResolution.resignFirstResponder()
        return true
        
    }
    
    
}

