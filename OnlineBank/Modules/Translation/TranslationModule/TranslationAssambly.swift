//
//  TranslationAssambly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol TranslationAssamblyProtocol: AnyObject {
    func initialView(view: TranslationContentView)
    func initialController(controller: TranslationViewController)
}

final class TranslationAssambly: TranslationAssamblyProtocol {

    func initialView(view: TranslationContentView) {
        let presenter = TranslationPresenter(view)
        let interactor = TranslationInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: TranslationViewController) {
        let presenter = TranslationPresenter(controller)
        let router = TranslationRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
