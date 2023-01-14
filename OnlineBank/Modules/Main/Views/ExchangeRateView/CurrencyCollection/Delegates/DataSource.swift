//
//  DataSource.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

final class CurrencyCollectionDataSource: NSObject, UICollectionViewDataSource {

    var currensies: [String: Currency]?
    var title: [String]?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let currencies = currensies else { return 5}
        return currencies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CurrencyCollectionCell.identifier, for: indexPath)
                as? CurrencyCollectionCell else { fatalError("No cell") }

        guard let currensies = currensies else { return cell}
//        guard let title = title else { return cell }





        var keys = [String]()
        for (key, _) in currensies {
            keys.append(key)
        }

        print(keys)
        
        if var valueCurrency = currensies[keys[indexPath.row]]?.value {
            var roandedCurrencyValue = Double(round(100 * valueCurrency)/100)

            cell.currencyLabel.text = "\(keys[indexPath.row]): \(roandedCurrencyValue)"
        }

        return cell
    }
}
