//
//  WelcomeScreen.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 15.01.2023.
//

import UIKit

protocol WelcomeViewProtocol: AnyObject {
    func setWelcomeLabel(text: String)
}

final class WelcomeView: UIView {

    var presenter: RegistrationPresenterProtocol!
    var assembly: RegistrationAssemblyProtocol = RegistrationAssembly()

    var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = R.Fonts.sfProDisplayBolt(with: 30)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setWelcomeView()
        makeConstraints()
        presenter.setWelcomeView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private extension
private extension WelcomeView {

    func setWelcomeView() {
        assembly.initialWelcomeView(view: self)
        backgroundColor = .systemBlue
        addSubview(welcomeLabel)
    }

    func makeConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}

// MARK: - WelcomeViewProtocol
extension WelcomeView: WelcomeViewProtocol {
    func setWelcomeLabel(text: String) {
        welcomeLabel.txt = "\(R.Titles.RegisterScreen.Welcome.welcome) \(text)"
    }
}
