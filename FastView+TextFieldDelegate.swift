//
//  FastView+TextFieldDelegate.swift
//  FastPWView
//
//  Created by 최광호 on 2022/04/11.
//

import UIKit

@available(iOS 13.0, *)
extension FastView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newLength = (textField.text?.count)! + string.count - range.length
        let type = self.pwCountType == .basic ? 4 : 6
        return !(newLength > type)
    }
}
