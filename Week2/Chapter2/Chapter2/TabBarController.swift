//
//  TabBarController.swift
//  Chapter2
//
//  Created by 김영준 on 2023/10/03.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    private lazy var firstController: UIViewController = {
        let viewController = ViewController()
        let tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var secondViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(systemName: "heart"), tag: 1)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var thirdController: UINavigationController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(systemName: "mappin"), tag: 2)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var fourthController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message"), tag: 3)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    private lazy var fifthController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "나의 당근", image: UIImage(systemName: "person"), tag: 4)
        viewController.tabBarItem = tabBarItem
        let navigationView = UINavigationController(rootViewController: viewController)
        return navigationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [firstController, secondViewController, thirdController,  fourthController, fifthController]
        selectedIndex = 0
        self.configureTabBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = 85
        tabFrame.origin.y = self.view.frame.size.height - 85
        self.tabBar.frame = tabFrame
    }
}

extension TabBarController {
    func configureTabBar() {
        self.tabBar.tintColor = .label
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        self.tabBar.layer.borderColor = UIColor.lightGray.cgColor
        self.tabBar.layer.borderWidth = 0.4
    }
}
