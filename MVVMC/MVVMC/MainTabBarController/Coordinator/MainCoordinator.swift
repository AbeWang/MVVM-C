//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    let window: UIWindow
    var coordinators: [CoordinatorProtocol] = []
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension MainCoordinator {
    func start() {
        let firstTabNaviController = createTabBarItemNavigationController(withTitle: "First")
        let secondTabNaviController = createTabBarItemNavigationController(withTitle: "Second")
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstTabNaviController, secondTabNaviController], animated: false)
        
        #warning("TODO FirstViewCoordinator, SecondViewCoordinator")
        
        window.rootViewController = tabBarController
    }
}

extension MainCoordinator {
    private func createTabBarItemNavigationController(withTitle title: String) -> UINavigationController {
        let naviController = UINavigationController()
        naviController.navigationBar.prefersLargeTitles = true
        naviController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        return naviController
    }
}
