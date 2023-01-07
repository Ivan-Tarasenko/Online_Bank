//
//  TranslationsContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class TranslationsContentView: UIView, ContentViewProtocol {

    let titleMethodOfReplenishment: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.tintColor = .darkText
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = R.Titles.TranslationScreen.titleMethodOfReplenishment
        return label
    }()

    let fromCardToCard: MethodOfReplenishment = {
        let button = MethodOfReplenishment()
        button.setTitle(R.Titles.TranslationScreen.fromCardToCard, for: .normal)
        return button
    }()

    let betweenAccounts: MethodOfReplenishment = {
        let button = MethodOfReplenishment()
        button.setTitle(R.Titles.TranslationScreen.betweenAccounts, for: .normal)
        return button
    }()

    let byPhoneNumber: MethodOfReplenishment = {
        let button = MethodOfReplenishment()
        button.setTitle(R.Titles.TranslationScreen.byPhoneNumber, for: .normal)
        return button
    }()

    let topUpPhoneNumder: MethodOfReplenishment = {
        let button = MethodOfReplenishment()
        button.setTitle(R.Titles.TranslationScreen.topUpPhoneNumder, for: .normal)
        return button
    }()

    let stackViewLeft = StackView()

    let stackViewRight = StackView()

    let mainStackView = StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleMethodOfReplenishment)
        addSubview(mainStackView)
        setStackView()
        makeConstraints()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addTargets() {
        fromCardToCard.addTarget(self, action: #selector(cardToCardPressed), for: .touchUpInside)
        betweenAccounts.addTarget(self, action: #selector(betweenAccountsPressed), for: .touchUpInside)
        byPhoneNumber.addTarget(self, action: #selector(byPhoneNumberPressed), for: .touchUpInside)
        topUpPhoneNumder.addTarget(self, action: #selector(topUpPhoneNumderPressed), for: .touchUpInside)
    }

    func setStackView() {

        mainStackView.axis = .horizontal

        stackViewLeft.addArrangedSubview(fromCardToCard)
        stackViewLeft.addArrangedSubview(betweenAccounts)

        stackViewRight.addArrangedSubview(byPhoneNumber)
        stackViewRight.addArrangedSubview(topUpPhoneNumder)

        mainStackView.addArrangedSubview(stackViewLeft)
        mainStackView.addArrangedSubview(stackViewRight)

        NSLayoutConstraint.activate([
            mainStackView.widthAnchor.constraint(equalToConstant: 290),
            mainStackView.heightAnchor.constraint(equalToConstant: 290),
            stackViewLeft.topAnchor.constraint(equalTo: titleMethodOfReplenishment.topAnchor, constant: 120),
            mainStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleMethodOfReplenishment.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleMethodOfReplenishment.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleMethodOfReplenishment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
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

// MARK: - PreviewProvider
#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct Representable: UIViewRepresentable {
    let view: UIView

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: TranslationsContentView(frame: .zero))

            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
}
#endif
#endif

