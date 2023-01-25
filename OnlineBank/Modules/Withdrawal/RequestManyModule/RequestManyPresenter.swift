//
//  RequestManyPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol RequestManyPresenterProtocol: AnyObject {
    init(_ view: RequestManyContentViewProtocol)
    init(_ controller: RequestManyViewControllerProtocol)

}

final class RequestManyPresenter {

    weak var viewController: RequestManyViewControllerProtocol?
    weak var view: RequestManyContentViewProtocol?
    var interactor: RequestManyInteractorProtocol!
    var router: RequestManyRouterProtocol!

    required init(_ view: RequestManyContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: RequestManyViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - RequestManyPresenterProtocol
extension RequestManyPresenter: RequestManyPresenterProtocol {

}
