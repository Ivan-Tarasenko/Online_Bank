//
//  DepositReplenishmentPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol DepositReplenishmentPresenterProtocol: AnyObject {
    init(_ view: DepositReplenishmentContentViewProtocol)
    init(_ controller: DepositReplenishmentViewControllerProtocol)

    func inputOnlyDigit(for string: String) 
}

final class DepositReplenishmentPresenter {

    weak var viewController: DepositReplenishmentViewControllerProtocol?
    weak var view: DepositReplenishmentContentViewProtocol?
    var interactor: DepositReplenishmentInteractorProtocol!
    var router: DepositReplenishmentRouterProtocol!

    required init(_ view: DepositReplenishmentContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: DepositReplenishmentViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - DepositReplenishmentPresenterProtocol
extension DepositReplenishmentPresenter: DepositReplenishmentPresenterProtocol {

    func inputOnlyDigit(for string: String) {
        interactor.onlyDigit(for: string)
    }
}
