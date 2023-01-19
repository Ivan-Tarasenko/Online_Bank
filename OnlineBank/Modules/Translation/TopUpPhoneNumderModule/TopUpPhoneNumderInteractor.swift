//
//  TopUpPhoneNumderInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol TopUpPhoneNumderInteractorProtocol: AnyObject {

    init(_ presenter: TopUpPhoneNumderPresenterProtocol)
}

final class TopUpPhoneNumderInteractor {

    weak var presenter: TopUpPhoneNumderPresenterProtocol?
    let entity: TopUpPhoneNumderEntityProtocol = TopUpPhoneNumderEntity()

    required init(_ presenter: TopUpPhoneNumderPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - TopUpPhoneNumderInteractorProtocol
extension TopUpPhoneNumderInteractor: TopUpPhoneNumderInteractorProtocol {

}
