//
//  PresentViewController.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/3/3.
//

import UIKit

protocol PresentViewControllerCoordinatorDelegate: class {
    func dismissView()
}

class PresentViewController: UIViewController {
    let viewModel = PresentViewModel()
    weak var coordinatorDelegate: PresentViewControllerCoordinatorDelegate?
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dismiss View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(button)
        
        let views: [String: Any] = [
            "button": button
        ]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[button]-10-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: button, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
    }
}

// Action
extension PresentViewController {
    @objc func buttonPressed() {
        coordinatorDelegate?.dismissView()
    }
}
