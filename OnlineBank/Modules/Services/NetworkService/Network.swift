//
//  Network.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 09.01.2023.
//

import Foundation

final class NetworkManager {

    let saveData = SaveData()

    var urlString = "https://www.cbr-xml-daily.ru/daily_json.js"

    var onUpDataCurrency: (([String: Currency]) -> Void)?

    var currencies: [String: Currency]? {
        didSet {
            if let currency = currencies {
                onUpDataCurrency?(currency)
            }
        }
    }

    var sortCurrency: [Dictionary<String, Currency>.Element] {
        var sort = [Dictionary<String, Currency>.Element]()
        if let currencies = currencies {
            sort = currencies.sorted(by: {$0.key < $1.key})
        }
        return sort
    }

    // MARK: - Fetch data
    func fetchData(completion: @escaping (Bool) -> Void) {
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
                    DispatchQueue.main.async {

                        self.currencies = currencyEntity.currency

                        completion(true)
                    }
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

    func currencyKeys() -> [String] {
        var keys = [String]()
            for (key, _) in sortCurrency {
                keys.append(key)
            }
        return keys
    }

    func currencyName() -> [String] {
        var names = [String]()
            for (_, value) in sortCurrency {
                names.append(value.name)
            }
        return names
    }
}
