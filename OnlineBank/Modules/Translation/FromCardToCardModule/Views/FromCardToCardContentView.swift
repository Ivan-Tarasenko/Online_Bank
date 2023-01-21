//
//  FromCardToCardContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol FromCardToCardContentViewProtocol: AnyObject {}

final class FromCardToCardContentView: UIView {

    var presenter: FromCardToCardPresenterProtocol!
    var assambly: FromCardToCardAssamblyProtocol = FromCardToCardAssambly()
    
    private let massageLabel: UILabel = {
        let label = CustomLabel()
        label.txt = R.Titles.TranslationScreen.FromCardToCard.massage
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension FromCardToCardContentView {
    
    func setView() {
        assambly.initialView(view: self)
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
}

// MARK: - FromCardToCardContentViewProtocol
extension FromCardToCardContentView: FromCardToCardContentViewProtocol {
}
