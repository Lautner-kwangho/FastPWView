//
//  FastPWCustomImageView.swift
//  FastPWView
//
//  Created by 최광호 on 2022/04/08.
//

import UIKit

@available(iOS 13.0, *)
public class FastView: UIView {
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
    
    public convenience init(_ pwLimitNumber: PasswordCount) {
        self.init()
        self.backgroundColor = .clear
        
        addSubview(pwTextField)
        addSubview(pwView)
        addSubview(pwTapView)
        
        pwTextField.delegate = self
        self.clipsToBounds = true
        
        clickedPwViewGesture()
        textFieldConstraints()
        pwConstraints()
        pwViewConstraints()
        
        if pwLimitNumber == .basic {
            [fivePW,sixPW].forEach { $0.isHidden = true }
        } else {
            [fivePW, sixPW].forEach { $0.isHidden = false }
        }
    }
    
    public static func sayHello(with name: String) {
        print("\(name)님 안녕하세요~\n 테스트 중입니다")
    }
    
    private func textFieldConstraints() {
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pwTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pwTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        pwTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        pwTextField.backgroundColor = .clear
        pwTextField.textColor = .clear
    }
    
    private func pwConstraints() {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { pwView.addArrangedSubview($0) }
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
    }
    
    private func clickedPwViewGesture() {
        let tap = UIGestureRecognizer(target: self, action: #selector(tapView(_:)))
        self.pwTapView.addGestureRecognizer(tap)
    }
    
    @objc func tapView(_ sender: UITapGestureRecognizer) {
        print("111")
    }
    
    /**
     비밀번호 사이 여백 설정 ( Sets the spacing between passwords )
     */
    public func spacing(_ size: CGFloat) {
        pwView.spacing = size
    }
    /**
     비밀번호 입력 전 이미지 ( Image before entering password )
     */
    public func beforeImage(_ image: UIImage) {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { $0.image = image }
    }
    /**
     비밀번호 입력 후 이미지 ( Image after entering password )
     */
    public func afterImage(_ image: UIImage) {
        let imageSet = [onePW, twoPW, threePW, fourPW, fivePW, sixPW]
        imageSet.forEach { $0.image = image }
    }
    /**
     FastView 배경 색상 ( FastView Background Color )
     */
    public func background(_ backgroundColor: UIColor) {
        pwView.backgroundColor = backgroundColor
    }
}
