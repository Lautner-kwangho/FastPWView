//
//  ViewController.swift
//  FastPWView
//
//  Created by wooree2716@khcu.ac.kr on 04/08/2022.
//  Copyright (c) 2022 wooree2716@khcu.ac.kr. All rights reserved.
//

import UIKit
import FastPWView

class ViewController: UIViewController {
    
    let pwView = FastView(.basic)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        FastView.sayHello(with: "철수")
        
        testMaking()
    }
    
    func testMaking() {
        view.addSubview(pwView)
        pwView.translatesAutoresizingMaskIntoConstraints = false
        pwView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        pwView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true

        pwView.spacing(10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("메모리 경고남")
    }

}

