//
//  ViewController.swift
//  Testing
//
//  Created by Jelle Vandebeeck on 02/04/2018.
//  Copyright © 2018 Jelle Vandebeeck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Subviews
    
    private lazy var greetingLabel:UILabel = {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var titleLabel:UILabel = {
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var firstButton:UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.setTitle(viewModel.firstButtonText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didPressFirstButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondButton:UIButton = {
        let button = UIButton(type: UIButtonType.roundedRect)
        button.setTitle(viewModel.secondButtonText, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didPressSecondButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [greetingLabel, firstButton, secondButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 20
        
        return stackView
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1.0),
            titleLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            stackView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            ])
        
        reloadUI()
    }
    
    private func reloadUI() {
        titleLabel.text = viewModel.titleLabebl
        greetingLabel.text = viewModel.greetingLabel
    }
    
    // MARK: Actions
    
    @objc private func didPressFirstButton() {
        viewModel.doSomethingAsync {
            print("🍩")
        }
    }
    
    @objc private func didPressSecondButton() {
        viewModel.changeSomething()
    }
    
}

extension ViewController:ViewModelDelegate {
    
    func didChangeSomething(_ sender: ViewModel) {
        print("🍫")
    }
    
}
