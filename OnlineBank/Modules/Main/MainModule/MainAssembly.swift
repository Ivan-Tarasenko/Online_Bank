//
//  MainAssembly.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainAssemblyProtocol: AnyObject {
    func initialView(view: MainContentView)
    func initialController(controller: MainViewController)
}

final class MainAssembly: MainAssemblyProtocol {

    func initialView(view: MainContentView) {
        let presenter = MainPresenter(view)
        let interactor = MainInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: MainViewController) {
        let presenter = MainPresenter(controller)
        let interactor = MainInteractor(presenter)
        let router = MainRouter(controller)

        controller.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

    }
}
