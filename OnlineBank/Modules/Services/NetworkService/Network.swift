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

//    var onUpDataCurrency: (([String: Currency]) -> Void)?

    var currencies: [String: Currency]? //{
//        didSet {
//            if let currency = currencies {
//                onUpDataCurrency?(currency)
//            }
//        }
//    }

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
}
