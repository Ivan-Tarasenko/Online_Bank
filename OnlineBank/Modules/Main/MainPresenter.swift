//
//  MainPresenter.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {

    func configereCard()
    func pressedAddProduct()

    func getTitle(from array: [String])

    init(_ view: MainContentViewProtocol)
    init(_ controller: MainViewControllerProtocol)

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
            name: fullName,
            image: interactor.imageCard
        )
    }

    func pressedAddProduct() {
        router.transitionOnNewProduct()
    }

    func getTitle(from array: [String]) {
        view?.setCurrencyRate(from: array)
    }
}
