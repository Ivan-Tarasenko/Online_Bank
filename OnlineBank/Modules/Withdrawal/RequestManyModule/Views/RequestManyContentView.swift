//
//  RequestManyContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol RequestManyContentViewProtocol: AnyObject {}

final class RequestManyContentView: UIView {

    var presenter: RequestManyPresenterProtocol!
    var assambly: RequestManyAssamblyProtocol = RequestManyAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        backgroundColor = .systemYellow
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension RequestManyContentView {
}

// MARK: - RequestManyContentViewProtocol
extension RequestManyContentView: RequestManyContentViewProtocol {
}
