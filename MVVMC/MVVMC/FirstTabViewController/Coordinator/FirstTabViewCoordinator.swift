//
//  FirstTabViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class FirstTabViewCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension FirstTabViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = FirstTabViewController()
        navigationController.pushViewController(viewController, animated: false)
    }
}
