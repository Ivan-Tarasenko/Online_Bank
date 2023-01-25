//
//  FromCardToCardInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol FromCardToCardInteractorProtocol: AnyObject {

    init(_ presenter: FromCardToCardPresenterProtocol)
}

final class FromCardToCardInteractor {

    weak var presenter: FromCardToCardPresenterProtocol?
    let entity: FromCardToCardEntityProtocol = FromCardToCardEntity()

    required init(_ presenter: FromCardToCardPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - FromCardToCardInteractorProtocol
extension FromCardToCardInteractor: FromCardToCardInteractorProtocol {

}
