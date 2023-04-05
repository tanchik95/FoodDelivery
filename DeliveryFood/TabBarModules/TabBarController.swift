//
//  TabBarController.swift
//  DeliveryFood
//
//  Created by Татьяна Аникина on 04.04.2023.
//

import UIKit

final class OrdersTabBarController: UITabBarController {
    
    var deliveryFoodView = DeliveryFoodViewController()
    var contactView = ContactViewController()
    var profileView = ProfileViewController()
    var bindView = BinViewController()

    private func configureTabBar() {
        
        let tabBar = self.tabBar
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = UIBezierPath(rect: tabBar.bounds).cgPath

        backgroundLayer.fillColor = UIColor.white.cgColor
        tabBar.layer.insertSublayer(backgroundLayer, at: 0)
        
        let deliveryFoodViewController = deliveryFoodView
        let contactViewController = contactView
        let profileViewController = profileView
        let bindViewController = bindView
        
        UITabBar.appearance().tintColor = UIColor(named: "Pink")
        UITabBar.appearance().layer.backgroundColor = UIColor.red.cgColor
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        
        deliveryFoodViewController.tabBarItem =
        UITabBarItem.init(title: "Меню", image: UIImage(named: "menu"), tag: 1)
        contactViewController.tabBarItem =
        UITabBarItem.init(title: "Контакты", image: UIImage(named: "contact"), tag: 2)
        profileViewController.tabBarItem =
        UITabBarItem.init(title: "Профиль", image: UIImage(named: "profile"), tag: 3)
        bindViewController.tabBarItem =
        UITabBarItem.init(title: "Корзина", image: UIImage(named: "bin"), tag: 4)
    
        viewControllers = [deliveryFoodView, contactView, profileView, bindView]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureTabBar()
    }
}
