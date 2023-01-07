//
//  MethodOfReplenishment.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class MethodOfReplenishment: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadow(for: self)
        backgroundColor = .systemBlue
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
