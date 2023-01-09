//
//  MainEntity.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import UIKit

protocol MainEntityProtocol {
    var imageCard: UIImage { get }
}

struct MainEntity {

    var imageCard: UIImage { return UIImage(imageLiteralResourceName: "card")}

}

// MARK: - MainEntityProtocol
extension MainEntity: MainEntityProtocol {

}
