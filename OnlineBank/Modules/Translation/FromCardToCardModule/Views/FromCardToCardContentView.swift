//
//  FromCardToCardContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol FromCardToCardContentViewProtocol: AnyObject {}

final class FromCardToCardContentView: UIView {

    var presenter: FromCardToCardPresenterProtocol!
    var assambly: FromCardToCardAssamblyProtocol = FromCardToCardAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemOrange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension FromCardToCardContentView {
}

// MARK: - FromCardToCardContentViewProtocol
extension FromCardToCardContentView: FromCardToCardContentViewProtocol {
}
