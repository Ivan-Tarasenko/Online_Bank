//
//  FromCardToCardPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol FromCardToCardPresenterProtocol: AnyObject {
    init(_ view: FromCardToCardContentViewProtocol)
    init(_ controller: FromCardToCardViewControllerProtocol)

}

final class FromCardToCardPresenter {

    weak var viewController: FromCardToCardViewControllerProtocol?
    weak var view: FromCardToCardContentViewProtocol?
    var interactor: FromCardToCardInteractorProtocol!
    var router: FromCardToCardRouterProtocol!

    required init(_ view: FromCardToCardContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: FromCardToCardViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - FromCardToCardPresenterProtocol
extension FromCardToCardPresenter: FromCardToCardPresenterProtocol {

}
