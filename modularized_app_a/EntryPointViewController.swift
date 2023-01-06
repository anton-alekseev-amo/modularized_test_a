//
//  EntryPointViewController.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit

class EntryPointViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let titleLabel = UILabel()
        titleLabel.text = "Hello, World!"
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
