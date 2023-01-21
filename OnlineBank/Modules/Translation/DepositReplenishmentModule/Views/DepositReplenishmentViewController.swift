//
//  DepositReplenishmentViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit
import RealmSwift

protocol DepositReplenishmentViewControllerProtocol: AnyObject {
}

final class DepositReplenishmentViewController: UIViewController {
    
    var presenter: DepositReplenishmentPresenterProtocol?
    var contentView: DepositReplenishmentContentViewProtocol?
    private let assambly: DepositReplenishmentAssamblyProtocol = DepositReplenishmentAssambly()

    // MARK: - Inition View
    init(contentView: DepositReplenishmentContentView) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Loading View
    override func loadView() {
        assambly.initialController(controller: self)
        view = contentView as? UIView
//        didEnterButtonPressed()
    }
}

// MARK: - Private functions
private extension DepositReplenishmentViewController {
}

// MARK: - DepositReplenishmentViewControllerProtocol
extension DepositReplenishmentViewController: DepositReplenishmentViewControllerProtocol {
//    func didEnterButtonPressed() {
//        contentView?.onEnterButtonAction = {
//            let realmService = RealmService()
//            let realm = RealmService.shared.realm
//            var clientObject: Results<Client>
//            clientObject = realm.objects(Client.self)
//
//            let dic = ["deposit": 33333]
//
//            realmService.update(clientObject.first!, dictionary: dic)
//
//
//            print(clientObject)
//        }
//    }
}
