//
//  CustomButtom.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class CustomButtom: UIButton {
    
    override public var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.1) {
                    self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }
            } else {
                UIView.animate(withDuration: 0.1) {
                    self.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setShadow(for: self)
        backgroundColor = .systemBlue
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = R.Fonts.sfProDisplayMedium(with: 20)
        titleLabel?.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
