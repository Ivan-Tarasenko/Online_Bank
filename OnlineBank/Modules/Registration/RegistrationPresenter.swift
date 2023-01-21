//
//  RegistrationPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation
import UIKit

protocol RegistrationPresenterProtocol: AnyObject {
    init(_ controller: RegistrationViewControllerProtocol)
    init(_ view: RegistrationContentViewProtocol)
    init(_ welcomeView: WelcomeViewProtocol)

    func transition()
    func generatingClient()
    func setWelcomeView()
    func checkRegistration()
}

final class RegistrationPresenter {

    weak var viewController: RegistrationViewControllerProtocol?
    weak var view: RegistrationContentViewProtocol?
    weak var welcomeView: WelcomeViewProtocol?
    var interactor: RegistrationInteractorProtocol!
    var router: RegistrationRouterProtocol!

    required init(_ controller: RegistrationViewControllerProtocol) {
        self.viewController = controller
    }

    required init(_ view: RegistrationContentViewProtocol) {
        self.view = view
    }

    init(_ welcomeView: WelcomeViewProtocol) {
        self.welcomeView = welcomeView
    }
}

// MARK: - RegistrationPresenterProtocol
extension RegistrationPresenter: RegistrationPresenterProtocol {
    func transition() {
        router.transitionOnNewProduct()
    }

    func generatingClient() {
        view?.registrationClient(
            client: interactor.clientModel,
            clientCard: interactor.cardModel,
            generating: interactor.generingData
        )
    }

    func setWelcomeView() {
        let title = interactor.client.first?.name ?? ""
        welcomeView?.setWelcomeLabel(text: title)
    }

    func checkRegistration() {
        viewController?.checkRegistration(client: interactor.client.isEmpty, completion: {
            self.transition()
        })
    }
}
