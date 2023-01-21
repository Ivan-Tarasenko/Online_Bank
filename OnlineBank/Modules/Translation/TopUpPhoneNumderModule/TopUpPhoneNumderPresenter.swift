//
//  TopUpPhoneNumderPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol TopUpPhoneNumderPresenterProtocol: AnyObject {
    init(_ view: TopUpPhoneNumderContentViewProtocol)
    init(_ controller: TopUpPhoneNumderViewControllerProtocol)
    
    func setTitleLabel()
    func topUpSelfPhone(string: String)
}

final class TopUpPhoneNumderPresenter {

    weak var viewController: TopUpPhoneNumderViewControllerProtocol?
    weak var view: TopUpPhoneNumderContentViewProtocol?
    var interactor: TopUpPhoneNumderInteractorProtocol!
    var router: TopUpPhoneNumderRouterProtocol!

    required init(_ view: TopUpPhoneNumderContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: TopUpPhoneNumderViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - TopUpPhoneNumderPresenterProtocol
extension TopUpPhoneNumderPresenter: TopUpPhoneNumderPresenterProtocol {
    func setTitleLabel() {
        guard let phoneNumber = interactor.client.first?.numberPhone else { return }
        let title = "\(R.Titles.TranslationScreen.TopUpPhoneNumber.topUpLabel) \(phoneNumber)?"
        view?.setTitle(string: title)
    }
    
    func topUpSelfPhone(string: String) {
        interactor.topUpSelfPhone(string: string)
    }
}
