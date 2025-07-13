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
    
    private func isValidNumber(from text: String?) -> Bool {
        guard let text = text, !text.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return Int(text) == nil ? false : true
    }
    
}
