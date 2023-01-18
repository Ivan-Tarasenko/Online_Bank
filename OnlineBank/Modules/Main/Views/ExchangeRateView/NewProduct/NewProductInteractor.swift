//
//  NewProductInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol NewProductInteractorProtocol: AnyObject {

    init(_ presenter: NewProductPresenterProtocol)
}

final class NewProductInteractor {

    weak var presenter: NewProductPresenterProtocol?
    let entity: NewProductEntityProtocol = NewProductEntity()

    required init(_ presenter: NewProductPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - NewProductInteractorProtocol
extension NewProductInteractor: NewProductInteractorProtocol {

}
