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
    
    func getImage(if spent: Bool) -> UIImage
}

final class HistoryInteractor {
    let realm = RealmService.shared.realm
    let entity: HistoryEntityProtocol = HistoryEntity()
    weak var presenter: HistoryPresenterProtocol?

    required init(_ presenter: HistoryPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - HistoryInteractorProtocol
extension HistoryInteractor: HistoryInteractorProtocol {
    var history: Results<History>! {
        entity.history
    }
    
    func getImage(if spent: Bool) -> UIImage {
        if spent {
            return entity.arrowUp
        }
        return entity.arrowDown
    }
}
