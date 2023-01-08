//
//  MainInteractor.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainInteractorProtocol: AnyObject {
    
    init(_ presenter: MainPresenterProtocol)
}

final class MainInteractor {

    weak var presenter: MainPresenterProtocol?
    let entity: MainEntityProtocol = MainEntity()

    required init(_ presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - MainInteractorProtocol
extension MainInteractor: MainInteractorProtocol {

}
