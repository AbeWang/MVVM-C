//
//  SecondTabViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class SecondTabViewCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SecondTabViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = SecondTabViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
