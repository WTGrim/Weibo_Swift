//
//  HomeViewController.swift
//  Weibo
//
//  Created by dwt on 17/2/19.
//  Copyright © 2017年 Dwt. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    private lazy var titleBtn:TitleButton = TitleButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //访客视图
        visitorView.setRotationAnimation()
//        if !isLogin{
//            return
//        }
        
        //登录后的视图
        setNavigtionBar()
        
    }

}

//MARK:- UI相关
extension HomeViewController{
    
    private func setNavigtionBar (){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        titleBtn.setTitle("首页", forState: .Normal)
        navigationItem.titleView = titleBtn
        titleBtn.addTarget(self, action: "titleBtnClick:", forControlEvents: .TouchUpInside)
        
    }
    
    
}

//MARK:- 事件
extension HomeViewController{
    
    @objc private func titleBtnClick(btn:TitleButton){
        
        btn.selected = !btn.selected
        
        //弹窗
        let popoverVc = PopoverControllerViewController()
        popoverVc.modalPresentationStyle = .Custom
        //设置转场代理
        popoverVc.transitioningDelegate = self
        presentViewController(popoverVc, animated: true, completion: nil)
    }
}

//MARK:- 协议代理方法
extension HomeViewController:UIViewControllerTransitioningDelegate{
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presentingViewController: presenting)
    }
}
