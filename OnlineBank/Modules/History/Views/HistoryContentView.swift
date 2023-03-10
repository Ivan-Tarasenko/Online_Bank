//
//  HistoryContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit
import RealmSwift

protocol HistoryContentViewProtocol: AnyObject {
    
    var tableView: UITableView { get }
    
    func sendHistory(data: Results<History>!)
}

final class HistoryContentView: UIView {

    var presenter: HistoryPresenterProtocol!
    var assembly: HistoryAssemblyProtocol = HistoryAssembly()

    weak var delegate: TableViewDelegate?
    private var dataSource = TableViewDataSource()
    var tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        bind()
        makeConstraints()
        registerCell()
        presenter.getHistory()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension HistoryContentView {
    
    func setView() {
        assembly.initialView(view: self)
        addSubview(tableView)
    }
    
    func bind() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

    func registerCell() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    func makeConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - HistoryContentViewProtocol
extension HistoryContentView: HistoryContentViewProtocol {
    func sendHistory(data: Results<History>!) {
        dataSource.historys = data
    }
}
