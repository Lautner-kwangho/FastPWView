//
//  FastPWCustomImage.swift
//  FastPWView
//
//  Created by 최광호 on 2022/04/08.
//

import UIKit

@available(iOS 13.0, *)
public class FastPWCustomImage: UIImageView {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init() {
        self.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        self.backgroundColor = .clear
        self.tintColor = .white
        self.image = UIImage(systemName: "circle")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
