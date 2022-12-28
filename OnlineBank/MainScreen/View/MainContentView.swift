//
//  MainContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

protocol MainContentViewProtocol: AnyObject {}

final class MainContentView: UIView, MainContentViewProtocol {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
