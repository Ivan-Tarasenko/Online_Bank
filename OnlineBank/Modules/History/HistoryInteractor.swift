//
//  HistoryInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation
import RealmSwift

protocol HistoryInteractorProtocol: AnyObject {
    
    var history: Results<History>! { get }
    
    init(_ presenter: HistoryPresenterProtocol)
}

final class HistoryInteractor {
    let realm = RealmService.shared.realm
    let entity: HistoryEntityProtocol = HistoryEntity()
    weak var presenter: HistoryPresenterProtocol?
    
    var client: Results<Client>! {
        entity.clientObject
    }

    required init(_ presenter: HistoryPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - HistoryInteractorProtocol
extension HistoryInteractor: HistoryInteractorProtocol {
    var history: Results<History>! {
        entity.history
    }
}
