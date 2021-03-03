//
//  SecondTabViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

class SecondTabViewCoordinator {
    let navigationController: UINavigationController
    var childCoordinator: CoordinatorProtocol?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension SecondTabViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = SecondTabViewController()
        viewController.coordinatorDelegate = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension SecondTabViewCoordinator: SecondTabViewControllerCoordinatorDelegate {
    func presentView(withParameters parameters: [String : Any]?) {
        guard let viewController = navigationController.topViewController else {
            return
        }
        let coordinator = PresentViewCoordinator(viewController: viewController, parameters: parameters)
        coordinator.coordinatorDelegate = self
        childCoordinator = coordinator
        coordinator.start()
    }
}

extension SecondTabViewCoordinator: PresentViewCoordinatorDelegate {
    func requestDismissal() {
        guard let viewController = navigationController.topViewController else {
            return
        }
        viewController.dismiss(animated: true, completion: nil)
        childCoordinator = nil
    }
}
