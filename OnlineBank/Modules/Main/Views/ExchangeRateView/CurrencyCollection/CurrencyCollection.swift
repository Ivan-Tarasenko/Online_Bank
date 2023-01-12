//
//  CurrencyCollection.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

final class CurrencyCollection: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: CollectionLayout())
        registerCell()
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func registerCell() {
        register(CurrencyCollectionCell.self, forCellWithReuseIdentifier: CurrencyCollectionCell.identifier)
    }
    
}
