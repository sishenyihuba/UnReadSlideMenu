//
//  ThreeSpringExpandController.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/16.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class ThreeSpringExpandController: UIViewController {
    
    fileprivate lazy var threeSpringExpandView  : ThreeSpringExpandView = {
       let threeSpringExpandView  =  ThreeSpringExpandView()
        return threeSpringExpandView
    }()
    
    fileprivate lazy var slider  : UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(sliderChange(_:)), for: .valueChanged)
        return slider
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        
        setupUI()
    }
}

extension ThreeSpringExpandController {
    fileprivate func setupUI() {
        self.view.addSubview(self.threeSpringExpandView)
        self.threeSpringExpandView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(30)
            make.height.equalTo(70)
        }
        
        self.view.addSubview(self.slider)
        self.slider.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.threeSpringExpandView.snp.bottom).offset(100)
            make.width.equalTo(200)
        }
    }
    
    @objc fileprivate func sliderChange(_ sender : UISlider) {
        self.threeSpringExpandView.progress = CGFloat(sender.value)
    }
}
