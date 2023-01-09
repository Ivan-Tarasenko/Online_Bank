//
//  HistoryInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol HistoryInteractorProtocol: AnyObject {

    init(_ presenter: HistoryPresenterProtocol)
}

final class HistoryInteractor {

    weak var presenter: HistoryPresenterProtocol?
    let entity: HistoryEntityProtocol = HistoryEntity()

    required init(_ presenter: HistoryPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - HistoryInteractorProtocol
extension HistoryInteractor: HistoryInteractorProtocol {

}
