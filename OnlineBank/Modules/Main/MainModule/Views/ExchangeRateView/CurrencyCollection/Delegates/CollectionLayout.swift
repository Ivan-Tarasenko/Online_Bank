//
//  CollectionLayout.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 11.01.2023.
//

import UIKit

final class CollectionLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        self.itemSize = CGSize(width: 170, height: 50)
        self.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        self.scrollDirection = .horizontal

    }

}
