//
//  ViewController.swift
//  ejercicio5
//
//  Created by user236987 on 12/1/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var decimalTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Por favor, ingresa un número"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        // Obtener el texto ingresado en el TextField
            guard let decimalText = decimalTextField.text, let decimalValue = Int(decimalText) else {
                
                return
            }
            
            // Llamar a la función para convertir el número decimal a romano
            let romanValue = convertDecimalToRoman(decimalValue)
            
            // Mostrar el resultado en el UILabel
            resultLabel.text = "Romano: \(romanValue)"
        }

        func convertDecimalToRoman(_ decimal: Int) -> String {
            // Arreglo de valores romanos y sus correspondientes símbolos
            let romanSymbols: [(value: Int, symbol: String)] = [
                (1000, "M"),
                (900, "CM"),
                (500, "D"),
                (400, "CD"),
                (100, "C"),
                (90, "XC"),
                (50, "L"),
                (40, "XL"),
                (10, "X"),
                (9, "IX"),
                (5, "V"),
                (4, "IV"),
                (1, "I")
            ]
            
            var decimal = decimal
            var roman = ""
            
            // Convertir el número decimal a romano sin restas
            for (value, symbol) in romanSymbols {
                while decimal >= value {
                    roman += symbol
                    decimal -= value
                }
            }
            
            // Asegúrate de que la salida se basa en la sumatoria (sin restas)
            roman = roman.replacingOccurrences(of: "IV", with: "IIII")
            roman = roman.replacingOccurrences(of: "IX", with: "VIIII")
            roman = roman.replacingOccurrences(of: "XL", with: "XXXX")
            roman = roman.replacingOccurrences(of: "XC", with: "LXXXX")
            roman = roman.replacingOccurrences(of: "CD", with: "CCCC")
            roman = roman.replacingOccurrences(of: "CM", with: "DCCCC")
            
            return roman
        }
    
}

