//
//  XPPMainTabBarViewController.swift
//  BeyondDemo
//
//  Created by 徐攀 on 2017/5/8.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

import UIKit

class XPPMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildNavgationController(childVC: "XPPHomeViewController", title: "人气", iconName: "tabbar_icon_popular")
        addChildNavgationController(childVC: "XPPDiscoveryViewController", title: "发现", iconName: "tabbar_icon_discovery")
        addChildNavgationController(childVC: "XPPMerchantViewController", title: "品牌", iconName: "tabbar_icon_brand")
        addChildNavgationController(childVC: "XPPMineViewController", title: "我的", iconName: "tabbar_icon_mine")
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.black], for: .selected)
        tabBar.isTranslucent = false
        view.backgroundColor = UIColor.red
    }
    
    func addChildNavgationController(childVC: String, title: String, iconName: String) {

        guard let clsName = Bundle.main.infoDictionary?["CFBundleExecutable"] else {
            print("命名空间不存在")
            return;
        }
        
        if let vcClass = NSClassFromString((clsName as! String) + "." + childVC) {
            let vc = vcClass.alloc() as! UIViewController
            let homeNav = XPPMainNavgationViewController(rootViewController: vc)
            let image = UIImage(named: iconName)?.withRenderingMode(.alwaysOriginal)
            let selectedImage = UIImage(named: iconName + "_active")?.withRenderingMode(.alwaysOriginal)
            homeNav.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
            addChildViewController(homeNav)
        }
    }
    

}
