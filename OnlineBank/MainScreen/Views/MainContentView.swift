//
//  MainContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class MainContentView: UIView, ContentViewProtocol {
    
    let cardView = Card()
    
    let titleBalanceLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = R.Titles.MainScreen.titileBalance
        return label
    }()
    
    let depositBalanceLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .darkText
        label.font = UIFont.systemFont(ofSize: 37, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "347293472.34 ₽"
        return label
    }()
    
    let addProductButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.MainScreen.addProductTitle, for: .normal)
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
    
    private func addTargets() {
        addProductButton.addTarget(self, action: #selector(addProductPressed), for: .touchUpInside)
    }
    
    private func setContent() {
        addSubview(titleBalanceLabel)
        addSubview(depositBalanceLabel)
        addSubview(cardView)
        addSubview(addProductButton)
        makeConstraints()
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titleBalanceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleBalanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleBalanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            depositBalanceLabel.topAnchor.constraint(equalTo: titleBalanceLabel.topAnchor, constant: 50),
            depositBalanceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            depositBalanceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            cardView.widthAnchor.constraint(equalToConstant: 321),
            cardView.heightAnchor.constraint(equalToConstant: 204),
            cardView.topAnchor.constraint(equalTo: depositBalanceLabel.topAnchor, constant: 80),
            cardView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            addProductButton.widthAnchor.constraint(equalToConstant: 200),
            addProductButton.heightAnchor.constraint(equalToConstant: 50),
            addProductButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addProductButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -120)
        ])
    }
    
    @objc func addProductPressed() {
        print("Добавить продукт")
    }
}
