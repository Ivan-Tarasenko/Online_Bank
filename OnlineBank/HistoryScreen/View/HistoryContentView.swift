//
//  HistoryContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class HistoryContentView: UIView, ContentViewProtocol {

    let tableView = UITableView()
    weak var delegate: TableViewDelegate!
    private var dataSource = TableViewDataSource()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        bind()
        makeConstraints()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func bind() {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }

    private func registerCell() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    private func makeConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
