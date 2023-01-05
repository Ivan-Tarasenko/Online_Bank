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

struct MainEntity: MainEntityProtocol {

    var imageCard: UIImage { return UIImage(imageLiteralResourceName: "card")}

}
