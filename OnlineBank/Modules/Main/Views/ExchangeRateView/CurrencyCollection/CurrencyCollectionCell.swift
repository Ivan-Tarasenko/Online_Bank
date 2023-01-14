//
//  CurrencyCollectionCell.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

final class CurrencyCollectionCell: UICollectionViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    var currencyLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "currency rate"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        makeConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension CurrencyCollectionCell {

    func setupCell() {
addSubview(currencyLabel)
        backgroundColor = .white
        layer.cornerRadius = 15
        layer.masksToBounds = false
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            currencyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            currencyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5),
            currencyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
