//
//  HistoryPresenter.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol HistoryPresenterProtocol: AnyObject {
    init(_ view: HistoryContentViewProtocol)
    init(_ controller: HistoryViewControllerProtocol)

}

final class HistoryPresenter {

    weak var viewController: HistoryViewControllerProtocol?
    weak var view: HistoryContentViewProtocol?
    var interactor: HistoryInteractorProtocol!
    var router: HistoryRouterProtocol!

    required init(_ view: HistoryContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: HistoryViewControllerProtocol) {
        self.viewController = controller
    }
}

// MARK: - HistoryPresenterProtocol
extension HistoryPresenter: HistoryPresenterProtocol {

}
