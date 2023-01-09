//
//  HistoryAssambly.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol HistoryAssamblyProtocol: AnyObject {
    func initialView(view: HistoryContentView)
    func initialController(controller: HistoryViewController)
}

final class HistoryAssambly: HistoryAssamblyProtocol {

    func initialView(view: HistoryContentView) {
        let presenter = HistoryPresenter(view)
        let interactor = HistoryInteractor(presenter)

        view.presenter = presenter
        presenter.interactor = interactor

    }

    func initialController(controller: HistoryViewController) {
        let presenter = HistoryPresenter(controller)
        let router = HistoryRouter(controller)

        controller.presenter = presenter
        presenter.router = router

    }
}
