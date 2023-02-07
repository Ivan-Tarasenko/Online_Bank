//
//  FromCardToCardAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol FromCardToCardAssemblyProtocol: AnyObject {
    func initialView(view: FromCardToCardContentView)
    func initialController(controller: FromCardToCardViewController)
}

final class FromCardToCardAssembly: FromCardToCardAssemblyProtocol {

    func initialView(view: FromCardToCardContentView) {
        let presenter = FromCardToCardPresenter(view)
        let interactor = FromCardToCardInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: FromCardToCardViewController) {
        let presenter = FromCardToCardPresenter(controller)
        let router = FromCardToCardRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
