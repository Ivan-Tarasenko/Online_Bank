//
//  RequestManyAssembly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol RequestManyAssemblyProtocol: AnyObject {
    func initialView(view: RequestManyContentView)
    func initialController(controller: RequestManyViewController)
}

final class RequestManyAssembly: RequestManyAssemblyProtocol {

    func initialView(view: RequestManyContentView) {
        let presenter = RequestManyPresenter(view)
        let interactor = RequestManyInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: RequestManyViewController) {
        let presenter = RequestManyPresenter(controller)
        let router = RequestManyRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
