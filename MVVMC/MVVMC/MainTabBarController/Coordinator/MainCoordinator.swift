//
//  MainCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class MainCoordinator {
    let window: UIWindow
    var coordinators: [CoordinatorProtocol] = []
    
    init(window: UIWindow) {
        self.window = window
    }
}

extension MainCoordinator: CoordinatorProtocol {
    func start() {
        let firstTabNaviController = createTabBarItemNavigationController(withTitle: "First")
        let secondTabNaviController = createTabBarItemNavigationController(withTitle: "Second")
        
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstTabNaviController, secondTabNaviController], animated: false)
        
        let firstCoordinator = FirstTabViewCoordinator(navigationController: firstTabNaviController)
        let secondCoordinator = SecondTabViewCoordinator(navigationController: secondTabNaviController)
        firstCoordinator.start()
        secondCoordinator.start()
        
        coordinators.append(firstCoordinator)
        coordinators.append(secondCoordinator)
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
