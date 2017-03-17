//
//  ThreeSpringExpandView.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/16.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class ThreeSpringExpandView: UIView {

    var exPandViews = [SpringExpandView]()
    let numberOfExpandView  = 3
    
    var progress : CGFloat = 0 {
        didSet {
            //        0~0.33   都关闭
            //        0.33～ 0.66 第一个开
            //        0.66～ 0.99 第二个开
            //        1.0  第三个开
            let progressPersence  : CGFloat = 1.0 / CGFloat(self.exPandViews.count)
            var  index = 0
            for exPandView in self.exPandViews {
                let  isExpand : Bool = progress >= CGFloat(index) * progressPersence + progressPersence
                
                if progress >= 1.0 {
                    exPandView.setColor(UIColor.red)
                } else {
                    if isExpand {
                        exPandView.setColor(UIColor.black)
                    } else {
                        exPandView.setColor(UIColor.lightGray)
                    }
                }
                
                exPandView.setExpandState(isExpand, animated: true)
                index = index + 1
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bulidExpandViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemW = self.bounds.width / CGFloat(numberOfExpandView)
        for index in 0...self.exPandViews.count-1 {
            let expandView = self.exPandViews[index]
            expandView.frame = CGRect(x: itemW * CGFloat(index), y: 0, width: 5, height: self.bounds.height)
        }
    }

}

extension ThreeSpringExpandView {
    fileprivate func bulidExpandViews() {
        let expandViews = NSMutableArray.init(capacity: 20)
        for _ in 0...numberOfExpandView - 1  {
            let springExpandView = SpringExpandView.init(frame: CGRect.zero)
            self.addSubview(springExpandView)
            expandViews.add(springExpandView)
        }
        
        self.exPandViews = expandViews.copy() as! [SpringExpandView]
    }
}
