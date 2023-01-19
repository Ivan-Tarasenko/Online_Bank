//
//  CashContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit

protocol CashContentViewProtocol: AnyObject {}

final class CashContentView: UIView {

    var presenter: CashPresenterProtocol!
    var assambly: CashAssamblyProtocol = CashAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemRed
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension CashContentView {
}

// MARK: - CashContentViewProtocol
extension CashContentView: CashContentViewProtocol {
}
