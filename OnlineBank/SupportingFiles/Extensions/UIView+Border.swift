//
//  UIView+Border.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 30.12.2022.
//

import UIKit

extension UIView {

    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
}
