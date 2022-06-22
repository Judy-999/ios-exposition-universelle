//
//  Expo1900 - ViewController.swift
//  Created by Kiwi, Finnn. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    private let mainScrollView = MainUIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.addTargetKoreanEntryButton(target: self, action: #selector(didkoreanEntryButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.rotationBlock = true
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func loadView() {
        view = mainScrollView
    }
    
    @objc private func didkoreanEntryButtonTapped() {
        navigationController?.pushViewController(ItemTableViewController(), animated: true)
    }
}
