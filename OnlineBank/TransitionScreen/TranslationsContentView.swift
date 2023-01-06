//
//  TranslationsContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

class TranslationsContentView: UIView, ContentViewProtocol {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemOrange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
