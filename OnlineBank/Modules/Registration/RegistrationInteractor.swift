//
//  RegistrationInteractor.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import Foundation
import RealmSwift

protocol RegistrationInteractorProtocol: AnyObject {

    var client: Results<Client>! { get }
    var clientModel: Client { get }
    var cardModel: ClientCard { get }

    var generingData: (Int, String) { get }
    
    init(_ presenter: RegistrationPresenterProtocol)

    func generatingCVV() -> Int
    func generatingEndDate() -> String
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

    var generingData: (Int, String) {
        (generatingCVV(), generatingEndDate())
    }

    var client: Results<Client>! {
        entity.clientObject
    }

    var clientModel: Client {
        entity.clientModel
    }
    var cardModel: ClientCard {
        entity.cardModel
    }

    func generatingCVV() -> Int {
        return Int.random(in: 100...999)
    }

    func generatingEndDate() -> String {
        let int = Int.random(in: 1...12)
        return int < 10 ? "0\(int)/30" : "\(int)/30"
    }
}
