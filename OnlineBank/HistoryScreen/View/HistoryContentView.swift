//
//  HistoryContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class HistoryContentView: UIView, ContentViewProtocol {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemCyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
