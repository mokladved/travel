//
//  ThreeSixNineGameViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import UIKit

final class ThreeSixNineGameViewController: UIViewController {

    @IBOutlet private var numberTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setNumberTextFieldUI()

    }
    
    private func setNumberTextFieldUI() {
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.lightGray,
        ]
        let text = "최대 숫자를 입력해주세요."
        numberTextField.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        
        numberTextField.textAlignment = .center
    }
    
    private func resultTextViewUI() {
        resultTextView.isScrollEnabled = false
        resultTextView.isEditable = false
        resultTextView.textAlignment = .center
        
        let input = numberTextField.text
        guard isValidNumber(from: input) else {
            resultTextView.text = "유효하지 않은 숫자입니다."
            return
        }
        
        let number = Int(input!)!
        let numbers = getStringNumbers(from: number)
        
        resultTextView.text = "\(numbers)"
    }
    
    private func getStringNumbers(from number: Int) -> String {
        let rangeOfNumbers = 1...number
        let stringNumbers = rangeOfNumbers.map {number in
            replaceNumberToClap(from: number)
        }
        return stringNumbers.joined(separator: ", ")
    }
    
    private func replaceNumberToClap(from number: Int) -> String {
        let stringNumber = String(number)
        var resultString = ""
        
        for digit in stringNumber {
            if "369".contains(digit) {
                resultString.append("👏")
            } else {
                resultString.append(digit)
            }
        }
        return resultString
    }
    
    
    private func isValidNumber(from text: String?) -> Bool {
        guard let text = text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard let number = Int(text), number >= 1 && number <= 100 else {
            return false
        }
        return true
    }
    
    
    @IBAction private func textFieldDidOnExit(_ sender: UITextField) {
        resultTextViewUI()
        numberTextField.text = ""
    }
    
    
}
