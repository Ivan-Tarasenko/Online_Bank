//
//  Network.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 09.01.2023.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func upDateCurrency(_: NetworkManager, with currentCurrency: CurrencyEntity)
}

final class NetworkManager {

    weak var delegate: NetworkManagerDelegate?

    let saveData = SaveData()

    var urlString = "https://www.cbr-xml-daily.ru/daily_json.js"

//    var currencies: [String: Currency]?

//    var sortCurrency: [Dictionary<String, Currency>.Element] {
//        var sort = [Dictionary<String, Currency>.Element]()
//        if let currencies = currencies {
//            sort = currencies.sorted(by: {$0.key < $1.key})
//        }
//        return sort
//    }

    // MARK: - Fetch data
    func fetchData() {
        guard let URL = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL) { data, _, error in
            var data = data
            if error != nil {
                data = self.saveData.data
            }
            if let data = data {
                self.saveData.data = data
                if let currencyEntity =  self.parseJSON(withData: data) {
                    self.delegate?.upDateCurrency(self, with: currencyEntity)
                }
            }
        }
        task.resume()
    }

    func parseJSON(withData data: Data) -> CurrencyEntity? {
        let decoder = JSONDecoder()
        do {
            let currentDate = try decoder.decode(CurrentData.self, from: data)
            guard let currencyEntity = CurrencyEntity(currencyEntity: currentDate) else { return nil }
            return currencyEntity
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }

//    func currencyKeys() -> [String] {
//        var keys = [String]()
//        for (key, _) in sortCurrency {
//            keys.append(key)
//        }
//        return keys
//    }
}
