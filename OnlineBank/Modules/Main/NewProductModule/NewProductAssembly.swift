//
//  NewProductAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol NewProductAssemblyProtocol: AnyObject {
    func initialView(view: NewProductContentView)
    func initialController(controller: NewProductViewController)
}

final class NewProductAssembly: NewProductAssemblyProtocol {

    func initialView(view: NewProductContentView) {
        let presenter = NewProductPresenter(view)
        let interactor = NewProductInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: NewProductViewController) {
        let presenter = NewProductPresenter(controller)
        let router = NewProductRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
