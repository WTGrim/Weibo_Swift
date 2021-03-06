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
    
    private lazy var popoverAnimator:PopoverAnimator = PopoverAnimator()
    
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

//MARK:- 事件监听
extension HomeViewController{
    
    @objc private func titleBtnClick(btn:TitleButton){
        
        //弹窗
        let popoverVc = PopoverControllerViewController()
        popoverVc.modalPresentationStyle = .Custom
        //设置转场代理
        popoverVc.transitioningDelegate = popoverAnimator
        popoverAnimator.presentedFrame = CGRectMake((UIScreen.mainScreen().bounds.size.width - 180) * 0.5, 55, 180, 250)
        
//        popoverAnimator.callBack = { (presented)-> () in
//            btn.selected = presented
//        }
        
        //另一种写法：知识点
        /*
            两个地方需要添加self 1.在函数中出现歧义  2.在闭包中使用当前对象的属性和方法时需要添加self
        */
        popoverAnimator.callBack = { [weak self](presented)-> () in
            
            self?.titleBtn.selected = presented
        }
        presentViewController(popoverVc, animated: true, completion: nil)
    }
}

