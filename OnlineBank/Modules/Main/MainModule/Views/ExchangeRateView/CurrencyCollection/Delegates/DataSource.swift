//
//  DataSource.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

final class CurrencyCollectionDataSource: NSObject, UICollectionViewDataSource {

    var currencyRates: [String]?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let currencyRates = currencyRates else {return 0}
        return currencyRates.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCollectionCell.identifier, for: indexPath)
                as? CurrencyCollectionCell else { fatalError("No cell") }

        guard let currencyRates = currencyRates else { return cell}

        cell.currencyLabel.txt = "\(currencyRates[indexPath.row])"

        return cell
    }
}
