//
//  TopUpPhoneNumderContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol TopUpPhoneNumderContentViewProtocol: AnyObject {}

final class TopUpPhoneNumderContentView: UIView {

    var presenter: TopUpPhoneNumderPresenterProtocol!
    var assambly: TopUpPhoneNumderAssamblyProtocol = TopUpPhoneNumderAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemGreen
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension TopUpPhoneNumderContentView {
}

// MARK: - TopUpPhoneNumderContentViewProtocol
extension TopUpPhoneNumderContentView: TopUpPhoneNumderContentViewProtocol {
}
