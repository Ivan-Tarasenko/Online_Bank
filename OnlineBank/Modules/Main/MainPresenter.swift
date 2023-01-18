//
//  MainPresenter.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {

    init(_ view: MainContentViewProtocol)
    init(_ controller: MainViewControllerProtocol)

    func configereCard()
    func pressedAddProduct()
    func getBalance()

    func getTitle(from array: [String])
}

final class MainPresenter {

    weak var viewController: MainViewControllerProtocol?
    weak var view: MainContentViewProtocol?
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!

    required init(_ view: MainContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: MainViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {

    func configereCard() {
        let numberCard = interactor.clientCard.first?.numberCard ?? ""
        let fullName = interactor.clientCard.first?.nameClient ?? ""
        
        view?.installingCardData(
            number: numberCard,
            name: fullName.uppercased(),
            image: interactor.imageCard
        )
    }

    func pressedAddProduct() {
        router.transitionOnNewProduct()
    }

    func getTitle(from array: [String]) {
        view?.setCurrencyRate(from: array)
    }

    func getBalance() {
        guard let balanceDeposit = interactor.client.first?.deposit else { return }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        let balance = formatter.string(from: balanceDeposit as NSNumber)
        view?.setBalanceDeposit(balance: balance!)
    }
}
