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

protocol NetworkManagerProtocol: AnyObject {
    var delegate: (NetworkManagerDelegate)? { get set }
    func fetchData()
}

final class NetworkManager: NetworkManagerProtocol {

    weak var delegate: NetworkManagerDelegate?

    let saveData = SaveData()

    var urlString = "https://www.cbr-xml-daily.ru/daily_json.js"

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
}
