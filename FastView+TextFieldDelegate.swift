//
//  FastView+TextFieldDelegate.swift
//  FastPWView
//
//  Created by 최광호 on 2022/04/11.
//

import UIKit

@available(iOS 13.0, *)
extension FastView: UITextFieldDelegate {
    private func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        print(text)
    }
    
}
