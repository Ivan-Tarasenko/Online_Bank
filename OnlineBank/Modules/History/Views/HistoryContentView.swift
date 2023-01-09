//
//  HistoryContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol HistoryContentViewProtocol: AnyObject {}

final class HistoryContentView: UIView {

    var presenter: HistoryPresenterProtocol!
    var entity: HistoryEntityProtocol = HistoryEntity()
    var assambly: HistoryAssamblyProtocol = HistoryAssambly()

    let tableView = UITableView()
    weak var delegate: TableViewDelegate?
    private var dataSource = TableViewDataSource()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        addSubview(tableView)
        bind()
        makeConstraints()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension HistoryContentView {
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
}
