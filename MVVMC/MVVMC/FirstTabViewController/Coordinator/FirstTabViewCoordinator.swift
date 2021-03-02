//
//  FirstTabViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class FirstTabViewCoordinator {
    let navigationController: UINavigationController
    var childCoordinator: CoordinatorProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension FirstTabViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = FirstTabViewController()
        viewController.coordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension FirstTabViewCoordinator: FirstTabViewControllerCoordinatorDelegate {
    func pushView(withParameters parameters: [String: Any]?) {
        let coordinator = PushViewCoordinator(navigationController: navigationController, parameters: parameters)
        coordinator.coordinatorDelegate = self
        childCoordinator = coordinator
        coordinator.start()
    }
}

extension FirstTabViewCoordinator: PushViewCoordinatorDelegate {
    func requestDismissal() {
        navigationController.popViewController(animated: true)
        childCoordinator = nil
    }
}
