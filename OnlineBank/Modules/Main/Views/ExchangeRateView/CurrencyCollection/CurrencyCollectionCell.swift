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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadow(for: self)
//        backgroundColor = .systemBlue
        contentView.backgroundColor = .systemBlue
            contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        contentView.clipsToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
