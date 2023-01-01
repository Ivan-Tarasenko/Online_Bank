//
//  UIView+Shadow.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 31.12.2022.
//

import UIKit

extension UIView {

   func setShadow(for view: UIView) {
       view.layer.shadowColor = UIColor.black.cgColor
       view.layer.shadowOpacity = 0.4
       view.layer.shadowRadius = 8
       view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
    }
}
