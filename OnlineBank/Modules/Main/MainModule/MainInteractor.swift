//
//  MainInteractor.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import UIKit
import RealmSwift

protocol MainInteractorProtocol: AnyObject {

    var imageCard: UIImage { get }

    var client: Results<Client>! { get }
    var clientCard: Results<ClientCard>! { get }
    
    init(_ presenter: MainPresenterProtocol)
    
    func balanceDeposit() -> String
}

final class MainInteractor {

    weak var presenter: MainPresenterProtocol?
    var network: NetworkManagerProtocol = NetworkManager()
    var entity: MainEntityProtocol = MainEntity()

    required init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
        network.delegate = self
        network.fetchData()
    }

    private func getTitle(from dictionary: [String: Currency]) -> [String] {

        var titles = [String]()

        for (key, value) in dictionary {
            let valueCurrency = value.value
            let pricePerUnit = valueCurrency / value.nominal
            let roandeValue = Double(round(100 * pricePerUnit)/100)
            let title = "\(key):  \(roandeValue)"
            titles.append(title)
        }

        titles.sort(by: <)
        return titles
    }
}

// MARK: - MainInteractorProtocol
extension MainInteractor: MainInteractorProtocol {
    var imageCard: UIImage {return entity.image}

    var client: Results<Client>! {
        entity.clientObject
    }

    var clientCard: Results<ClientCard>! {
        entity.clientCardObject
    }
}

// MARK: - NetworkManagerDelegate
extension MainInteractor: NetworkManagerDelegate {
    func upDateCurrency(_: NetworkManager, with currentCurrency: CurrencyEntity) {
        let titles = getTitle(from: currentCurrency.currency)
        presenter?.getTitle(from: titles)
    }
    
    func balanceDeposit() -> String {
        if let balance = client.first?.deposit {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currencyAccounting
            let balance = formatter.string(from: balance as NSNumber)
            return balance!
        }
        return ""
    }
}
