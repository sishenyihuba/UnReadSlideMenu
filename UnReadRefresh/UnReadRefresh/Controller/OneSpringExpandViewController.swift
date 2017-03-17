//
//  OneSpringExpandViewController.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/16.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit
import SnapKit
class OneSpringExpandViewController: UIViewController {

    //MARK: - lazy loading
    fileprivate lazy var springExpandView : SpringExpandView = {
        let springExpandView = SpringExpandView()
        return springExpandView
    }()
    
    fileprivate lazy var button : UIButton = {
        let btn = UIButton()
        btn.setTitle("展开", for: .normal)
        btn.setTitle("收缩", for: .selected)
        btn.setTitleColor(UIColor(red: 0/255, green: 110/255, blue: 56/255, alpha: 1.0), for: .normal)
        btn.addTarget(self, action: #selector(btnDidTouch(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        
        setupUI()
    }


}

extension OneSpringExpandViewController {
    func setupUI() {
        self.view.addSubview(self.springExpandView)
        self.springExpandView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(5)
            make.height.equalTo(70)
        }
        
        self.view.addSubview(self.button)
        button.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.springExpandView.snp.bottom).offset(20)
        }
    }
}

extension OneSpringExpandViewController {
    @objc fileprivate func btnDidTouch(_ sender : UIButton) {
        sender.isSelected = !sender.isSelected
        self.springExpandView.setExpandState(sender.isSelected, animated: true)
        self.springExpandView.setColor(sender.isSelected ? UIColor.red : UIColor.lightGray)
    }
}
