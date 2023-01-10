//
//  RegistrationInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation

protocol RegistrationInteractorProtocol: AnyObject {

    init(_ presenter: RegistrationPresenterProtocol)
}

final class RegistrationInteractor {

    weak var presenter: RegistrationPresenterProtocol?
    let entity: RegistrationEntityProtocol = RegistrationEntity()

    required init(_ presenter: RegistrationPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - RegistrationInteractorProtocol
extension RegistrationInteractor: RegistrationInteractorProtocol {

}
