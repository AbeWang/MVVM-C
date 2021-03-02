//
//  PushViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/3/2.
//

import UIKit

protocol PushViewCoordinatorDelegate: class {
    func requestDismissal()
}

class PushViewCoordinator {
    let navigationController: UINavigationController
    let parameters: [String: Any]?
    
    weak var coordinatorDelegate: PushViewCoordinatorDelegate?
    
    init(navigationController: UINavigationController, parameters: [String: Any]?) {
        self.navigationController = navigationController
        self.parameters = parameters
    }
}

extension PushViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = PushViewController()
        #warning("TODO: Handle dismiss")
//        viewController.coordinatorDelegate = self
        viewController.viewModel.parameters = parameters
        navigationController.pushViewController(viewController, animated: true)
    }
}
