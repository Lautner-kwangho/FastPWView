//
//  FastPWCustomImageView.swift
//  FastPWView
//
//  Created by 최광호 on 2022/04/08.
//

import UIKit

@available(iOS 13.0, *)
public class FastView: UIView, UIGestureRecognizerDelegate {
    private lazy var onePW = FastPWCustomImage()
    private lazy var twoPW = FastPWCustomImage()
    private lazy var threePW = FastPWCustomImage()
    private lazy var fourPW = FastPWCustomImage()
    private lazy var fivePW = FastPWCustomImage()
    private lazy var sixPW = FastPWCustomImage()
    private lazy var pwTapView = UIView()
    private lazy var pwTextField = UITextField()
    private lazy var pwView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    private lazy var tap = UIGestureRecognizer()
    private var pwBeforeUIImage: UIImage = UIImage(systemName: "circle")!
    private var pwFillUIImage: UIImage = UIImage(systemName: "circle.fill")!
    
    /// 비밀번호 입력 완료시 true ( Returns true when the password is complete )
    public var pwFlag: Bool?
    /// 입력한 비밀번호 ( Input Password )
    public var pwNumber: String?
    /// 4, 6자리 비밀번호 타입 ( Password Type )
    public var pwCountType: PasswordCount?
    
    public convenience init(_ pwLimitNumber: PasswordCount) {
        self.init()
        self.backgroundColor = .clear
        self.pwCountType = pwLimitNumber
        
        addSubview(pwTextField)
        addSubview(pwView)
        addSubview(pwTapView)
        
        self.clipsToBounds = true
        
        textFieldConstraints()
        pwConstraints()
        pwViewConstraints()
        
        tap.delegate = self
        pwTextField.delegate = self
        
        if pwLimitNumber == .basic {
            [fivePW,sixPW].forEach { $0.isHidden = true }
        } else {
            [fivePW, sixPW].forEach { $0.isHidden = false }
        }
    }
    
    private func textFieldConstraints() {
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pwTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pwTextField.backgroundColor = .clear
        pwTextField.textColor = .clear
        pwTextField.tintColor = .clear
        pwTextField.textAlignment = .center
        pwTextField.keyboardType = .numberPad
        pwTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    private func pwConstraints() {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach {
            pwView.addArrangedSubview($0)
            $0.tintColor = .orange
        }
        pwView.translatesAutoresizingMaskIntoConstraints = false
        pwView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pwView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pwView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pwView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    private func pwViewConstraints() {
        pwTapView.translatesAutoresizingMaskIntoConstraints = false
        pwTapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pwTapView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pwTapView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pwTapView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pwTapView.backgroundColor = .clear
        pwTapView.addGestureRecognizer(tap)
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        self.pwNumber = textField.text
        if pwCountType == .basic && text.count == 4 || pwCountType == .expansion && text.count == 6 {
            self.pwFlag = true
        } else {
            self.pwFlag = false
        }
        switch text.count {
        case 0:
            self.onePW.image = self.pwBeforeUIImage
        case 1:
            self.removeImageSet(0)
            self.appendImageSet(0)
        case 2:
            self.removeImageSet(1)
            self.appendImageSet(1)
        case 3:
            self.removeImageSet(2)
            self.appendImageSet(2)
        case 4:
            self.removeImageSet(3)
            self.appendImageSet(3)
        case 5:
            self.removeImageSet(4)
            self.appendImageSet(4)
        case 6:
            self.removeImageSet(5)
            self.appendImageSet(5)
        default: break
        }
    }
    
    private func appendImageSet(_ number: Int) {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        for checkImage in imageSet[0 ... number] {
            checkImage.image = self.pwFillUIImage
        }
    }
    
    private func removeImageSet(_ number: Int) {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        for checkImage in imageSet[number ... 5] {
            checkImage.image = self.pwBeforeUIImage
        }
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        pwTextField.becomeFirstResponder()
        return true
    }
    
    /**
     비밀번호 사이 여백 설정 ( Sets the spacing between passwords )
     */
    public func spacing(_ size: CGFloat) {
        pwView.spacing = size
    }
    /**
     비밀번호 입력 전 이미지 ( Image before entering password )
     Default system Image Name " circle "
     */
    public func beforeImage(_ image: UIImage) {
        self.pwBeforeUIImage = image
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { $0.image = image }
    }
    /**
     비밀번호 입력 후 이미지 ( Image after entering password )
     Default system Image Name " circle.fill "
     */
    public func afterImage(_ image: UIImage) {
        self.pwFillUIImage = image
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { $0.image = image }
    }
    /**
     비밀번호 Tint Color ( Password Tint Color )
     Default Color " Orange  "
     */
    public func pwTintColor(_ color: UIColor) {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { $0.tintColor = color }
    }
    /**
     FastView 배경 색상 ( FastView Background Color )
     */
    public func background(_ backgroundColor: UIColor) {
        pwView.backgroundColor = backgroundColor
    }
}
