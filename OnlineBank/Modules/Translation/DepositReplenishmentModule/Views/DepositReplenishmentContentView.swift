//
//  DepositReplenishmentContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol DepositReplenishmentContentViewProtocol: AnyObject {}

final class DepositReplenishmentContentView: UIView {

    var presenter: DepositReplenishmentPresenterProtocol!
    var assambly: DepositReplenishmentAssamblyProtocol = DepositReplenishmentAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemPink
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension DepositReplenishmentContentView {
}

// MARK: - DepositReplenishmentContentViewProtocol
extension DepositReplenishmentContentView: DepositReplenishmentContentViewProtocol {
}
