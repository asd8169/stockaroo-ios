//
//  BaseViewController.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/25/24.
//
import UIKit
import PinLayout
import FlexLayout

open class BaseViewController: UIViewController {
    
    public let rootFlexContainer = UIView()

    open override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCommonViews()
        setupCommonLayout()
    }
    
    open func setupCommonViews() {
        rootFlexContainer.backgroundColor = .white
        view.addSubview(rootFlexContainer)
    }
    
    open func setupCommonLayout() {
        rootFlexContainer.flex.define { (flex) in
            // 공통 레이아웃 설정을 추가
        }
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rootFlexContainer.pin.all(view.pin.safeArea)
        rootFlexContainer.flex.layout()
    }
}
