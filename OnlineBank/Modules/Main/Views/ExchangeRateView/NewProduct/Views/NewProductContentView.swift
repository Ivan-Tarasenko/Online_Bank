//
//  NewProductContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol NewProductContentViewProtocol: AnyObject {}

final class NewProductContentView: UIView {

    let massageLabel: UILabel = {
        let label = UILabel()
        label.txt = R.Titles.MainScreen.NewProduct.massage
        label.font = R.Fonts.sfProDisplayMedium(with: 30)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var presenter: NewProductPresenterProtocol!
    var assambly: NewProductAssamblyProtocol = NewProductAssambly()

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        setNewProductView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension NewProductContentView {

    func setNewProductView() {
        backgroundColor = .white
        addSubview(massageLabel)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            massageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            massageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            massageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            massageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25)
        ])
}

// MARK: - NewProductContentViewProtocol
extension NewProductContentView: NewProductContentViewProtocol {
}
