//
//  UnreadSpringExpandViewController.swift
//  UnReadRefresh
//
//  Created by daixianglong on 2017/3/16.
//  Copyright © 2017年 daixianglong. All rights reserved.
//

import UIKit

class UnreadSpringExpandViewController: UIViewController {

    //MARK: - lazy loading
    fileprivate lazy var UnReadScrollView  : UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.decelerationRate = UIScrollViewDecelerationRateFast
        scrollView.alwaysBounceHorizontal = true
        scrollView.alwaysBounceVertical = false
        scrollView.delegate = self
        return scrollView
    }()
    
    fileprivate lazy var textView : UITextView = {
        let textView = UITextView(frame: self.view.bounds, textContainer: nil)
        textView.textContainerInset = UIEdgeInsetsMake(40, 20, 20, 20)
        textView.font = UIFont(name: "AvenirNext-Regular", size: 14.0)
        let path = Bundle.main.path(forResource: "ArticleContent", ofType: "plist")!
        let dict = NSDictionary.init(contentsOfFile: path)
        textView.text = dict?.value(forKey: "body") as! String!
        return textView
    }()
    
    fileprivate lazy var springMenu : ThreeSpringExpandView = {
        let menu = ThreeSpringExpandView(frame: CGRect.zero)
//        menu.backgroundColor = UIColor(red: 0/255, green: 110/255, blue: 56/255, alpha: 1.0)
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        setupUI()
    }

}

//MARK: -  UI
extension UnreadSpringExpandViewController {
    fileprivate func setupUI() {
        self.view.addSubview(self.UnReadScrollView)
        self.UnReadScrollView.addSubview(self.textView)
        self.UnReadScrollView.addSubview(self.springMenu)
        
        self.springMenu.snp.makeConstraints { (make) in
            make.left.equalTo(self.UnReadScrollView.bounds.maxX + 10)
            make.top.equalTo(self.UnReadScrollView.bounds.midY - 25)
            make.width.height.equalTo(50)
        }
    }
}


//MARK: - scrollview delegate
extension UnreadSpringExpandViewController  : UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.isDragging {
            self.springMenu.progress = scrollView.contentOffset.x/self.springMenu.bounds.width
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.springMenu.progress >= 1.0 {
            let menuVc = MenuViewController()
            menuVc.modalPresentationStyle = .custom
            menuVc.transitioningDelegate = self
            self.present(menuVc, animated: true, completion: nil)
        } else {
            self.springMenu.progress = 0.0 
        }
    }
}

//MARK: -  Transation Delegate
extension UnreadSpringExpandViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return OverLayPresentTransation()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return OverLayDismissTransation()
    }
}
