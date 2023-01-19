//
//  ByPhoneNumberContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol ByPhoneNumberContentViewProtocol: AnyObject {}

final class ByPhoneNumberContentView: UIView {

    var presenter: ByPhoneNumberPresenterProtocol!
    var assambly: ByPhoneNumberAssamblyProtocol = ByPhoneNumberAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemPurple
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension ByPhoneNumberContentView {
}

// MARK: - ByPhoneNumberContentViewProtocol
extension ByPhoneNumberContentView: ByPhoneNumberContentViewProtocol {
}
