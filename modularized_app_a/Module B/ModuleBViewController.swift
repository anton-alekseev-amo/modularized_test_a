//
//  ModuleBViewController.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit

protocol ModuleBViewControllerDelegate: AnyObject {
    func moduleBDidSelectItem(with ID: UUID)
}

class ModuleBViewController: UIViewController {
    struct DisplayItem: Identifiable {
        var id = UUID()
        var title: String
        var subtitle: String
    }
    
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), style: .plain)
    
    var items: [DisplayItem]
    var selectedID: UUID?
    weak var delegate: ModuleBViewControllerDelegate?

    init(items: [DisplayItem], selectedID: UUID? = nil) {
        self.items = items
        self.selectedID = selectedID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ModuleBTableViewCell.self, forCellReuseIdentifier: ModuleBTableViewCell.reuseIdentifier)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ModuleBViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ModuleBTableViewCell.reuseIdentifier, for: indexPath) as? ModuleBTableViewCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.update(withTitle: item.title, subtitle: item.subtitle, selected: selectedID == item.id)
        return cell
    }
}

extension ModuleBViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        var indexPathesToReload = [indexPath]
        if let selectedID, let selectedIdx = items.firstIndex(where: { $0.id == selectedID }) {
            indexPathesToReload.append(IndexPath(row: selectedIdx, section: 0))
        }
        self.selectedID = item.id
        self.tableView.reloadRows(at: indexPathesToReload, with: .automatic)
        
        self.delegate?.moduleBDidSelectItem(with: item.id)
    }
}
