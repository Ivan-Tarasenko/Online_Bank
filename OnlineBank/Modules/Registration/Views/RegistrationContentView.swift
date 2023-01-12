//
//  RegistrationContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 09.01.2023
//

import UIKit
import RealmSwift

protocol RegistrationContentViewProtocol: AnyObject {
    var registrationAction: (() -> Void)? { get set }
}

final class RegistrationContentView: UIView {

    var registrationAction: (() -> Void)?

    var presenter: RegistrationPresenterProtocol!
    var entity: RegistrationEntityProtocol = RegistrationEntity()
    var assambly: RegistrationAssamblyProtocol = RegistrationAssambly()

    let realm = RealmService()
    var client = Client()
    var card = ClientCard()

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

    let surnameTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderSurName
        return field
    }()

    let numberCardTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderNumberCard
        return field
    }()

    let numberPhoneTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.RegisterScreen.placeholderNumberPhone
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

    var usefulConnections: Results<Client>!

    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        setRegisterView()
        addTargets()
        setStackView()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension RegistrationContentView {

    func setRegisterView() {
        backgroundColor = .systemBlue
        addSubview(title)
        addSubview(stackView)
    }

    func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }

    func setStackView() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(numberCardTextField)
        stackView.addArrangedSubview(numberPhoneTextField)
        stackView.addArrangedSubview(registerButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            stackView.topAnchor.constraint(equalTo: title.topAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)

        ])
    }

    func makeConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25)
        ])
    }
    
}

// MARK: - RegistrationContentViewProtocol
extension RegistrationContentView: RegistrationContentViewProtocol {

    @objc func registerButtonPressed() {
        print("register")


//        client.name = nameTextField.txt
//        client.surname = surnameTextField.txt
//        client.numberPhone = numberPhoneTextField.txt
//
//        card.numberCard = numberCardTextField.txt
//
//        realm.create(client)
//        realm.create(card)
//
//        let realm = RealmService.shared.realm
//            usefulConnections = realm.objects(Client.self)
//
//          print(Realm.Configuration.defaultConfiguration.fileURL)

        registrationAction?()
    }
}
