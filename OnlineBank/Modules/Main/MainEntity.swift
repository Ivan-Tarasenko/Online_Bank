//
//  MainEntity.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import UIKit

protocol MainEntityProtocol {
    var image: UIImage { get }
}

struct MainEntity {
    var image: UIImage { return UIImage(imageLiteralResourceName: "card")}
}

// MARK: - MainEntityProtocol
extension MainEntity: MainEntityProtocol {
}
