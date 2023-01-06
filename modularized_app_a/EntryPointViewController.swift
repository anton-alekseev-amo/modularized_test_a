//
//  EntryPointViewController.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit

class EntryPointViewController: UIViewController {
    
    let mainTitleLabel = UILabel()
    let moduleAButton = UIButton()
    let moduleBButton = UIButton()
    
    let moduleAItems: [ModuleAViewController.DisplayItem] = (1...7).map {
        ModuleAViewController.DisplayItem(title: "Item \($0)")
    }
    
    let moduleBItems: [ModuleBViewController.DisplayItem] = (1...10).map {
        ModuleBViewController.DisplayItem(title: "Item \($0)", subtitle: "Nice \($0)")
    }
    
    var selectedAItemID: UUID?
    var selectedBItemID: UUID?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Main App"
        configureModuleAButton()
        configureModuleBButton()
    }
    
    func configureModuleAButton() {
        moduleAButton.setTitle("Module A", for: .normal)
        moduleAButton.backgroundColor = .systemBlue
        moduleAButton.addTarget(self, action: #selector(moduleATap), for: .touchUpInside)
        
        view.addSubview(moduleAButton)
        moduleAButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moduleAButton.heightAnchor.constraint(equalToConstant: 80),
            moduleAButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moduleAButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            moduleAButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            moduleAButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
        ])
    }
    
    func configureModuleBButton() {
        moduleBButton.setTitle("Module B", for: .normal)
        moduleBButton.backgroundColor = .systemGreen
        moduleBButton.addTarget(self, action: #selector(moduleBTap), for: .touchUpInside)
        
        view.addSubview(moduleBButton)
        moduleBButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moduleBButton.heightAnchor.constraint(equalToConstant: 80),
            moduleBButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moduleBButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            moduleBButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            moduleBButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
        ])
    }
    
    @objc
    func moduleATap() {
        let avc = ModuleAViewController(items: moduleAItems, selectedID: selectedAItemID)
        avc.delegate = self
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    @objc
    func moduleBTap() {
        let bvc = ModuleBViewController(items: moduleBItems, selectedID: selectedBItemID)
        bvc.delegate = self
        self.navigationController?.pushViewController(bvc, animated: true)
    }
}

extension EntryPointViewController: ModuleAViewControllerDelegate {
    func moduleADidSelectItem(with ID: UUID) {
        self.selectedAItemID = ID
    }
}

extension EntryPointViewController: ModuleBViewControllerDelegate {
    func moduleBDidSelectItem(with ID: UUID) {
        self.selectedBItemID = ID
    }
}
