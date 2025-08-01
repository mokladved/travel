//
//  ThreeSixNineGameViewController.swift
//  Travel
//
//  Created by Youngjun Kim on 7/13/25.
//

import UIKit

final class ThreeSixNineGameViewController: UIViewController {

    @IBOutlet private var numberTextField: UITextField!
    @IBOutlet private var resultTextView: UITextView!
    @IBOutlet private var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setNumberTextFieldUI()
        setResultLabelUI()
        setNavBarTitle()

    }
    
    private func setNumberTextFieldUI() {
        let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.lightGray,
        ]
        let text = "최대 숫자를 입력해주세요."
        numberTextField.attributedPlaceholder = NSAttributedString(string: text, attributes: attributes)
        
        numberTextField.textAlignment = .center
    }
    
    private func updateResultUI() {
        resultTextView.isScrollEnabled = false
        resultTextView.isEditable = false
        resultTextView.textAlignment = .center
        
        let input = numberTextField.text
        guard let number = isValidNumber(from: input) else {
            resultTextView.text = "유효하지 않은 숫자입니다."
            numberTextField.text = ""
            resultLabel.text = ""
            return
        }
        
        let numbers = getStringNumbers(from: number)
        
        let clapCount = numbers.filter { $0 == "👏"}.count
        resultLabel.text = "숫자 \(number)까지 총 박수는 \(clapCount)번 입니다."
        
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
    
    
    private func isValidNumber(from text: String?) -> Int? {
        guard let text = text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return nil
        }
        
        guard let number = Int(text), number >= 1 && number <= 100 else {
            return nil
        }
        return number
    }
    
    private func setResultLabelUI() {
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 18, weight: .bold)
        resultLabel.text = ""
    }
    
    private func setNavBarTitle() {
        navigationItem.title = "3 ! 6 ! 9"
    }

    
    @IBAction private func textFieldDidOnExit(_ sender: UITextField) {
        updateResultUI()
        numberTextField.text = ""
    }
    
    @IBAction private func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
