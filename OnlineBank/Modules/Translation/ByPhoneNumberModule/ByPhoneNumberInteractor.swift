//
//  ByPhoneNumberInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol ByPhoneNumberInteractorProtocol: AnyObject {

    init(_ presenter: ByPhoneNumberPresenterProtocol)
}

final class ByPhoneNumberInteractor {

    weak var presenter: ByPhoneNumberPresenterProtocol?
    let entity: ByPhoneNumberEntityProtocol = ByPhoneNumberEntity()

    required init(_ presenter: ByPhoneNumberPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - ByPhoneNumberInteractorProtocol
extension ByPhoneNumberInteractor: ByPhoneNumberInteractorProtocol {

}
