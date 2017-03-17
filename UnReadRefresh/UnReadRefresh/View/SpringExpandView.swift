//
//  SpringExpandView.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/16.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit
import CoreGraphics
class SpringExpandView: UIView {

    var strechView : UIView!
    var isExpand : Bool = false
    
    
    fileprivate lazy var collapseFrame : CGRect = {
        let rect = CGRect(x: 0, y: self.bounds.midY - self.bounds.width/2, width: self.bounds.width, height: self.bounds.width)
        return rect
    }()
    
    fileprivate lazy var exPandFrame : CGRect = {
        let rect = CGRect(x: self.bounds.width / 4, y: 0, width: self.bounds.width / 2, height: self.bounds.height)
        return rect
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildStrechView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureStrechView(forState: self.isExpand, animated: false)
        strechView.layer.cornerRadius = strechView.bounds.midX
    }
}

//MARK: - public interface
extension SpringExpandView {
    func setExpandState(_ isExpand : Bool, animated : Bool) {
        if (isExpand != self.isExpand) {
            configureStrechView(forState: isExpand, animated: animated)
        }
    }
    
    func setColor(_ color : UIColor) {
        self.strechView.backgroundColor = color
    }
}





//MARK: - UI
extension SpringExpandView {
    fileprivate func buildStrechView() {
        strechView = UIView.init(frame: CGRect.zero)
        strechView.backgroundColor = UIColor.lightGray
        self.addSubview(strechView)
    }
    
    fileprivate func configureStrechView(forState expandState : Bool,animated : Bool ) {
        if (expandState) {
            //展开
            expand(animated: animated)
        } else {
            //收缩
            collapse(animated: animated)
        }
    }
}

//MARK: - Expand or Collapse
extension SpringExpandView {
    fileprivate func collapse(animated anim : Bool) {
        let collapaseClosure : () -> ()  = {  () in
            self.strechView.frame = self.collapseFrame
            self.isExpand = false
        }
        if anim {
            collapseAnimation(collapaseClosure)
        } else {
            collapaseClosure()
        }
    }
    
    fileprivate func expand(animated anim : Bool) {
        let expandClosure : () -> ()  = {  () in
            self.strechView.frame = self.exPandFrame
            self.isExpand = true
        }
        if anim {
            exPandAnimation(expandClosure)
        } else {
            expandClosure()
        }
    }
    
    fileprivate func collapseAnimation(_ collapseClosure : @escaping ()->()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: .beginFromCurrentState, animations: { 
            collapseClosure()
        }, completion: nil)
    }
    
    fileprivate func exPandAnimation(_ exPandClosure : @escaping ()->()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: .beginFromCurrentState, animations: {
            exPandClosure()
        }, completion: nil)
    }
}


