//
//  RegistrationView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class RegistrarionView: UIView {

    let title: CustomLabel = {
        let label = CustomLabel()
        label.text = R.Titles.RegisterScreen.title
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    let nameTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderName
        return field
    }()

    let surNameTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderSurName
        return field
    }()

    let numberCardTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderNumberCard
        return field
    }()

    let registerButton: CustomButtom = {
        let button = CustomButtom()
        button.backgroundColor = .white
        button.setTitle(R.Titles.RegisterScreen.registerButton, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()

    let stackView = StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setRegisterView()
        addTargets()
        setStackView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setRegisterView() {
        backgroundColor = .systemBlue
        addSubview(title)
        addSubview(stackView)
    }

    func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }

    private func setStackView() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surNameTextField)
        stackView.addArrangedSubview(numberCardTextField)
        stackView.addArrangedSubview(registerButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 290),
            stackView.topAnchor.constraint(equalTo: title.topAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }

    private func makeConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }

    @objc func registerButtonPressed() {
        print("register")
        self.isHidden = true
    }
}
