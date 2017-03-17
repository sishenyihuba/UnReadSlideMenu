//
//  MenuViewController.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/17.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    //MARK: - lazy loading
    fileprivate lazy var menuLabel : UILabel = {
       let menuLabel = UILabel()
        menuLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        menuLabel.textColor = UIColor.black
        menuLabel.text = "Menu"
        menuLabel.sizeToFit()
        return menuLabel
    }()
    
    fileprivate lazy var tapLabel : UILabel = {
        let tapLabel = UILabel()
        tapLabel.font = UIFont.systemFont(ofSize: 14.0)
        tapLabel.textColor = UIColor.gray
        tapLabel.text = "Tap to close"
        tapLabel.sizeToFit()
        return tapLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.view.addSubview(self.menuLabel)
        self.view.addSubview(self.tapLabel)
        
        self.menuLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.bounds.midX - self.menuLabel.bounds.midX)
            make.top.equalTo(self.view.bounds.midY - self.menuLabel.bounds.midY)
            make.width.equalTo(self.menuLabel.bounds.width)
            make.height.equalTo(self.menuLabel.bounds.height)
        }
        self.tapLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.bounds.midX - self.tapLabel.bounds.midX)
            make.top.equalTo(self.view.bounds.midY + self.tapLabel.bounds.midY)
            make.width.equalTo(self.tapLabel.bounds.width)
            make.height.equalTo(self.tapLabel.bounds.height)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    
    @objc fileprivate func tap(_ recoginizer : UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
