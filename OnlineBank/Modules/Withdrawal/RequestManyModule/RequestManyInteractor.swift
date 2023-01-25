//
//  RequestManyInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import Foundation

protocol RequestManyInteractorProtocol: AnyObject {

    init(_ presenter: RequestManyPresenterProtocol)
}

final class RequestManyInteractor {

    weak var presenter: RequestManyPresenterProtocol?
    let entity: RequestManyEntityProtocol = RequestManyEntity()

    required init(_ presenter: RequestManyPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - RequestManyInteractorProtocol
extension RequestManyInteractor: RequestManyInteractorProtocol {

}
