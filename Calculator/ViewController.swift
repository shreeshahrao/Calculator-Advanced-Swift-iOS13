

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
     var calcBrain = CalculatorBrain()
    
     var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot Covert number to double")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
        
    }
   
    
   
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTyping = true
        
        calcBrain.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            
          
            if let result = calcBrain.calculate(Symbol: calcMethod)  {
                displayValue = result
            }
           
            
            
        }
        
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping == true {
                displayLabel.text = numValue
                isFinishedTyping  = false
            }else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            
        }
    
    }

}

}
