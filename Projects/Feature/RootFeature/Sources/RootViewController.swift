//
//  RootViewController.swift
//  RootFeature
//
//  Created by  p2noo on 7/24/24.
//  Copyright © 2024 com.asd8169. All rights reserved.
//

import UIKit
import CommonUI

public class RootViewController: BaseViewController {
    
    private let welcomeLabel = UILabel()
    private let startButton = UIButton()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        setupViews()
    }
    
    private func setupViews() {
        rootFlexContainer.backgroundColor = .white
        
        welcomeLabel.text = "Welcome to the App"
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 24)
        rootFlexContainer.addSubview(welcomeLabel)
        
        startButton.setTitle("Get Started", for: .normal)
        startButton.backgroundColor = .systemBlue
        startButton.layer.cornerRadius = 8
        
        rootFlexContainer.flex.direction(.column).justifyContent(.center).alignItems(.center).define { (flex) in
            flex.addItem(welcomeLabel).marginBottom(20)
            flex.addItem(startButton).width(100).height(50)
        }
        
        view.addSubview(rootFlexContainer)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootFlexContainer.pin.all(view.pin.safeArea)
        rootFlexContainer.flex.layout()
    }
    
}
