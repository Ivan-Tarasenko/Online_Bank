//
//  MainContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class MainContentView: UIView, ContentViewProtocol {

    let card = Card()

    let titleBalance: UILabel = {
        let label = UILabel()
        label.tintColor = .darkText
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = R.Titles.MainScreen.titileBalance
        return label
    }()
    
    let depositBalance: UILabel = {
        let label = UILabel()
        label.tintColor = .darkText
        label.font = UIFont.systemFont(ofSize: 37, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "347293472.34 ₽"
        return label
    }()

    let addProduct: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setShadow(for: button)
        button.backgroundColor = .systemBlue
        button.setTitle(R.Titles.MainScreen.addProductTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setContent()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTargets() {
        addProduct.addTarget(self, action: #selector(addProductPressed), for: .touchUpInside)
    }

   func setContent() {
       addSubview(titleBalance)
       addSubview(depositBalance)
       addSubview(card)
       addSubview(addProduct)
       makeConstraints()
   }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleBalance.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            depositBalance.topAnchor.constraint(equalTo: titleBalance.topAnchor, constant: 50),
            depositBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            depositBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            card.widthAnchor.constraint(equalToConstant: 321),
            card.heightAnchor.constraint(equalToConstant: 204),
            card.topAnchor.constraint(equalTo: depositBalance.topAnchor, constant: 80),
            card.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            addProduct.widthAnchor.constraint(equalToConstant: 200),
            addProduct.heightAnchor.constraint(equalToConstant: 50),
            addProduct.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addProduct.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120)
        ])
    }

    @objc func addProductPressed() {
        print("Добавить продукт")
    }
}
