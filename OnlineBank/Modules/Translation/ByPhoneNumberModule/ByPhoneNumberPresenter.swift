//
//  ByPhoneNumberPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol ByPhoneNumberPresenterProtocol: AnyObject {
    init(_ view: ByPhoneNumberContentViewProtocol)
    init(_ controller: ByPhoneNumberViewControllerProtocol)

}

final class ByPhoneNumberPresenter {

    weak var viewController: ByPhoneNumberViewControllerProtocol?
    weak var view: ByPhoneNumberContentViewProtocol?
    var interactor: ByPhoneNumberInteractorProtocol!
    var router: ByPhoneNumberRouterProtocol!

    required init(_ view: ByPhoneNumberContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: ByPhoneNumberViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - ByPhoneNumberPresenterProtocol
extension ByPhoneNumberPresenter: ByPhoneNumberPresenterProtocol {

}
