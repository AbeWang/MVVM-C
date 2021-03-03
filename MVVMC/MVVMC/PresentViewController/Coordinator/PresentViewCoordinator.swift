//
//  PresentViewCoordinator.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/3/3.
//

import UIKit

protocol PresentViewCoordinatorDelegate: class {
    func requestDismissal()
}

class PresentViewCoordinator {
    let viewController: UIViewController
    let parameters: [String: Any]?
    
    weak var coordinatorDelegate: PresentViewCoordinatorDelegate?
    
    init(viewController: UIViewController, parameters: [String: Any]?) {
        self.viewController = viewController
        self.parameters = parameters
    }
}

extension PresentViewCoordinator: CoordinatorProtocol {
    func start() {
        let viewController = PresentViewController()
        viewController.coordinatorDelegate = self
        viewController.viewModel.parameters = parameters
        self.viewController.present(viewController, animated: true, completion: nil)
    }
}

extension PresentViewCoordinator: PresentViewControllerCoordinatorDelegate {
    func dismissView() {
        coordinatorDelegate?.requestDismissal()
    }
}
