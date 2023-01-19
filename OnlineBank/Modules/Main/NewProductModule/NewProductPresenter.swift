//
//  NewProductPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol NewProductPresenterProtocol: AnyObject {
    init(_ view: NewProductContentViewProtocol)
    init(_ controller: NewProductViewControllerProtocol)

}

final class NewProductPresenter {

    weak var viewController: NewProductViewControllerProtocol?
    weak var view: NewProductContentViewProtocol?
    var interactor: NewProductInteractorProtocol!
    var router: NewProductRouterProtocol!

    required init(_ view: NewProductContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: NewProductViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - NewProductPresenterProtocol
extension NewProductPresenter: NewProductPresenterProtocol {

}
