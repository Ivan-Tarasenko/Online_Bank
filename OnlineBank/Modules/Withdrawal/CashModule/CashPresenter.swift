//
//  CashPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import Foundation

protocol CashPresenterProtocol: AnyObject {
    init(_ view: CashContentViewProtocol)
    init(_ controller: CashViewControllerProtocol)

}

final class CashPresenter {

    weak var viewController: CashViewControllerProtocol?
    weak var view: CashContentViewProtocol?
    var interactor: CashInteractorProtocol!
    var router: CashRouterProtocol!

    required init(_ view: CashContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: CashViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - CashPresenterProtocol
extension CashPresenter: CashPresenterProtocol {

}
