//
//  TranslationInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import Foundation

protocol TranslationInteractorProtocol: AnyObject {

    init(_ presenter: TranslationPresenterProtocol)
}

final class TranslationInteractor {

    weak var presenter: TranslationPresenterProtocol?
    let entity: TranslationEntityProtocol = TranslationEntity()

    required init(_ presenter: TranslationPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - TranslationInteractorProtocol
extension TranslationInteractor: TranslationInteractorProtocol {

}
