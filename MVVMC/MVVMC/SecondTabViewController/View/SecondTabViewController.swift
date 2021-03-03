//
//  SecondTabViewController.swift
//  MVVMC
//
//  Created by Abe Wang on 2021/2/26.
//

import UIKit

protocol SecondTabViewControllerCoordinatorDelegate: class {
    func presentView(withParameters: [String: Any]?)
}

class SecondTabViewController: UIViewController {
    let viewModel = SecondTabViewModel()
    weak var coordinatorDelegate: SecondTabViewControllerCoordinatorDelegate?
    
    private let text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.backgroundColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        handleDataBinding()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(text)
        view.addSubview(button)
        
        let views: [String: Any] = [
            "text": text,
            "button": button
        ]
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[text]|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[button]-10-|", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:[text]-10-[button]", options: [], metrics: nil, views: views))
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: text, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)
        ])
    }
}

// Action
extension SecondTabViewController {
    @objc func buttonPressed() {
        let parameters: [String: Any] = [
            "name": "abewang",
            "info": "cool"
        ]
        coordinatorDelegate?.presentView(withParameters: parameters)
    }
}

// Data binding
extension SecondTabViewController {
    private func handleDataBinding() {
        viewModel.titleDidChangedCallback = { [weak self] value in
            self?.text.text = "\(value ?? "") Tab"
            self?.title = value
        }
    }
}
