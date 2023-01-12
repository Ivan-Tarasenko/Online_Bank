//
//  MainContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

protocol MainContentViewProtocol: AnyObject {
    var addProductAction: (() -> Void)? { get set }
}

final class MainContentView: UIView, MainContentViewProtocol {
    
    var addProductAction: (() -> Void)?

    var presenter: MainPresenterProtocol!
    var entity: MainEntityProtocol = MainEntity()
    var assambly: MainAssamblyProtocol = MainAssambly()

    var exchangeRateView: ExchangeRateView = {
        let view = ExchangeRateView(frame: CGRect(origin: .zero, size: CGSize(width: 400, height: 90)))
        return view
    }()

    var cardView = Card()

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
        assambly.initialView(view: self)
        setContent()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func addProductPressed() {
        addProductAction?()
    }
}

// MARK: - Private functions
private extension MainContentView {

    func addTargets() {
        addProductButton.addTarget(self, action: #selector(addProductPressed), for: .touchUpInside)
    }

    func setContent() {
        addSubview(exchangeRateView)
        addSubview(titleBalanceLabel)
        addSubview(depositBalanceLabel)
        addSubview(cardView)
        addSubview(addProductButton)
        backgroundColor = R.Colors.background
        makeConstraints()
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([

            exchangeRateView.heightAnchor.constraint(equalToConstant: exchangeRateView.frame.height),
            exchangeRateView.widthAnchor.constraint(equalToConstant: 390),
            exchangeRateView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            exchangeRateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            titleBalanceLabel.topAnchor.constraint(equalTo: exchangeRateView.topAnchor, constant: exchangeRateView.frame.height + 20),
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
        Representable(view: MainContentView(frame: .zero))

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

