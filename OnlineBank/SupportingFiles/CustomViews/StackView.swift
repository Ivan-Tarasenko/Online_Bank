//
//  StackView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class StackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        spacing = 30
        alignment = .fill
        distribution = .fillEqually
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
