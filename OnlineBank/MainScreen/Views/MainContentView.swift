//
//  MainContentView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class MainContentView: UIView, ContentViewProtocol {

    let depositBalance: UILabel = {
        let label = UILabel()
        label.tintColor = .darkText
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "₽ 347293472.34"
        return label
    }()

    let card: UIView = {
        let view = UIView()
        view.setShadow(for: view)
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let addProduct: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.setShadow(for: button)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle(R.Titles.MainScreen.addProductTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = R.Colors.background
        setContent()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   func setContent() {
       addSubview(depositBalance)
       addSubview(card)
       addSubview(addProduct)
       makeConstraints()
   }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            depositBalance.heightAnchor.constraint(equalToConstant: 35),
            depositBalance.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            depositBalance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            depositBalance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),

            card.widthAnchor.constraint(equalToConstant: 321),
            card.heightAnchor.constraint(equalToConstant: 204),
            card.topAnchor.constraint(equalTo: depositBalance.topAnchor, constant: 80),
            card.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            addProduct.widthAnchor.constraint(equalToConstant: 250),
            addProduct.heightAnchor.constraint(equalToConstant: 70),
            addProduct.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            addProduct.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100)
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
