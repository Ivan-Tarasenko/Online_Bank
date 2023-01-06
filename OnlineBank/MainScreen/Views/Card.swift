//
//  Card.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 01.01.2023.
//

import UIKit

final class Card: UIView {

    let numderOnCard: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.ocrARegular(with: 20)
        label.textColor = .systemGray6
        label.textAlignment = .center
        label.text = "1234 3445 4654 5656"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let nameOnCard: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.ocrBRegular(with: 16)
        label.textColor = .systemGray6
        label.text = "IVAN TARASENKO"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "card")
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCard()
        addSubview(imageView)
        addSubview(nameOnCard)
        addSubview(numderOnCard)
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    func setCard() {
        setShadow(for: self)
        layer.cornerRadius = 15
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            nameOnCard.widthAnchor.constraint(equalToConstant: 200),
            nameOnCard.heightAnchor.constraint(equalToConstant: 30),
            nameOnCard.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            nameOnCard.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),

            numderOnCard.widthAnchor.constraint(equalToConstant: 300),
            numderOnCard.heightAnchor.constraint(equalToConstant: 30),
            numderOnCard.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numderOnCard.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
