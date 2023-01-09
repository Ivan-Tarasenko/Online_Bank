//
//  MainAssambly.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainAssamblyProtocol: AnyObject {
    func initialView(view: MainContentView)
    func initialController(controller: MainViewController)
}

final class MainAssambly: MainAssamblyProtocol {

    func initialView(view: MainContentView) {
        let presenter = MainPresenter(view)
        let interactor = MainInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: MainViewController) {
        let presenter = MainPresenter(controller)
        let router = MainRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
