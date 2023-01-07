//
//  EntryPointViewController.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit
import SnapKit
import modularized_module_a
import modularized_module_b

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
        moduleAButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.centerY).offset(-20)
            make.left.equalTo(view.snp.left).inset(40)
            make.right.equalTo(view.snp.right).inset(40)
        }
    }
    
    func configureModuleBButton() {
        moduleBButton.setTitle("Module B", for: .normal)
        moduleBButton.backgroundColor = .systemGreen
        moduleBButton.addTarget(self, action: #selector(moduleBTap), for: .touchUpInside)
        
        view.addSubview(moduleBButton)
        moduleBButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.centerY).offset(20)
            make.left.equalTo(view.snp.left).inset(40)
            make.right.equalTo(view.snp.right).inset(40)
        }
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
