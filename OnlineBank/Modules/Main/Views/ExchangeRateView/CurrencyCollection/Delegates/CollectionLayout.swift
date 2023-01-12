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

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        setup()

    }

    func setup() {

        // setting up some inherited values

        let width = 170

        let height = 70

        self.itemSize = CGSize(width: width, height: width)

        self.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

        self.minimumInteritemSpacing = 15

        self.minimumLineSpacing = 15

        self.scrollDirection = .horizontal

    }

}
