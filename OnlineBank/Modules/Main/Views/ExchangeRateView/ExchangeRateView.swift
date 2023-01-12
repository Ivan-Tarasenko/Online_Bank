//
//  ExchangeRateView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

class ExchangeRateView: UIView {

    private let currencyCollection = CurrencyCollection()
    private let currencyCollectionDataSource = CurrencyCollectionDataSource()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.Titles.MainScreen.currencyTitle
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

private extension ExchangeRateView {

    func setup() {
        addSubview(currencyCollection)
        addSubview(titleLabel)
        makeConstraint()
    }

    func makeConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            currencyCollection.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            currencyCollection.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            currencyCollection.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            currencyCollection.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    }

    func bind() {
        currencyCollection.dataSource = currencyCollectionDataSource
    }
}
