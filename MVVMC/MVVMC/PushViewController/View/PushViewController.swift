//
//  PushViewController.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/3/2.
//

import UIKit

protocol PushViewControllerCoordinatorDelegate: class {
    func popView()
}

class PushViewController: UIViewController {
    let viewModel = PushViewModel()
    weak var coordinatorDelegate: PushViewControllerCoordinatorDelegate?
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pop View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
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
extension PushViewController {
    @objc func buttonPressed() {
        coordinatorDelegate?.popView()
    }
}
