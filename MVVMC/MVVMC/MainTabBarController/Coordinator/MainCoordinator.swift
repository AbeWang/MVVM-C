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
        
        let firstCoordinator = FirstTabViewCoordinator(navigationController: firstTabNaviController)
        coordinators.append(firstCoordinator)
        firstCoordinator.start()
        
        let secondCoordinator = SecondTabViewCoordinator(navigationController: secondTabNaviController)
        coordinators.append(secondCoordinator)
        secondCoordinator.start()
        
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
