//
//  TranslationsContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class TranslationsContentView: UIView, ContentViewProtocol {

    let titleMethodOfReplenishmentLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = R.Titles.TranslationScreen.titleMethodOfReplenishment
        return label
    }()

    let fromCardToCardButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.fromCardToCard, for: .normal)
        return button
    }()

    let betweenAccountsButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.betweenAccounts, for: .normal)
        return button
    }()

    let byPhoneNumberButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.byPhoneNumber, for: .normal)
        return button
    }()

    let topUpPhoneNumderButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.topUpPhoneNumder, for: .normal)
        return button
    }()

    let stackViewLeft = StackView()

    let stackViewRight = StackView()

    let mainStackView = StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleMethodOfReplenishmentLabel)
        addSubview(mainStackView)
        setStackView()
        makeConstraints()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addTargets() {
        fromCardToCardButton.addTarget(self, action: #selector(cardToCardPressed), for: .touchUpInside)
        betweenAccountsButton.addTarget(self, action: #selector(betweenAccountsPressed), for: .touchUpInside)
        byPhoneNumberButton.addTarget(self, action: #selector(byPhoneNumberPressed), for: .touchUpInside)
        topUpPhoneNumderButton.addTarget(self, action: #selector(topUpPhoneNumderPressed), for: .touchUpInside)
    }

    private func setStackView() {

        mainStackView.axis = .horizontal

        stackViewLeft.addArrangedSubview(fromCardToCardButton)
        stackViewLeft.addArrangedSubview(betweenAccountsButton)

        stackViewRight.addArrangedSubview(byPhoneNumberButton)
        stackViewRight.addArrangedSubview(topUpPhoneNumderButton)

        mainStackView.addArrangedSubview(stackViewLeft)
        mainStackView.addArrangedSubview(stackViewRight)

        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: 290),
            mainStackView.heightAnchor.constraint(equalToConstant: 290),
            stackViewLeft.topAnchor.constraint(equalTo: titleMethodOfReplenishmentLabel.topAnchor, constant: 120),
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    private func makeConstraints() {
        NSLayoutConstraint.activate([
            titleMethodOfReplenishmentLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleMethodOfReplenishmentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleMethodOfReplenishmentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
    }

    @objc func cardToCardPressed() {
        print("С карты на карту")
    }

    @objc func betweenAccountsPressed() {
        print("Между счетами")
    }

    @objc func byPhoneNumberPressed() {
        print("По номеру телефона")
    }

    @objc func topUpPhoneNumderPressed() {
        print("Пополнить номер телефона")
    }
}
