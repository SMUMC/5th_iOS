//
//  SceneDelegate.swift
//  Danggeun
//
//  Created by 이현호 on 2023/10/11.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        var tabBarController = UITabBarController()
        
        var vc1 = UINavigationController(rootViewController: ViewController())
        var vc2 = VC2()
        var vc3 = VC3()
        var vc4 = VC4()
        var vc5 = VC5()
        vc1.title = "홈"
        vc2.title = "동네 생활"
        vc3.title = "내 근처"
        vc4.title = "채팅"
        vc5.title = "나의 당근"
        
        tabBarController.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        tabBarController.tabBar.tintColor = .black
        
        guard let items = tabBarController.tabBar.items else {return}
        items[0].image = UIImage(systemName: "house")
        items[1].image = UIImage(systemName: "newspaper")
        items[2].image = UIImage(systemName: "antenna.radiowaves.left.and.right")
        items[3].image = UIImage(systemName: "message")
        items[4].image = UIImage(systemName: "person")
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

