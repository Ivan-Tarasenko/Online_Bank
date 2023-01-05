//
//  MainInteractor.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import UIKit

protocol MainInteractorProtocol: AnyObject {}

final class MainInteractor: MainInteractorProtocol {

    let entity: MainEntityProtocol = MainEntity()
}
