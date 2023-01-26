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
    func registrationClient(client: Client, clientCard: ClientCard, generating: (Int, String))
    func checkTextField() -> Bool
}

final class RegistrationContentView: UIView {
    
    var registrationAction: (() -> Void)?
    
    var presenter: RegistrationPresenterProtocol!
    var assambly: RegistrationAssamblyProtocol = RegistrationAssambly()
    
    let title: UILabel = {
        let label = CustomLabel()
        label.text = R.Titles.RegisterScreen.title
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let nameTextField: UITextField = {
        let field = CustomTextField()
        field.tag = 0
        field.placeholder = R.Titles.RegisterScreen.placeholderName
        return field
    }()
    
    let surnameTextField: UITextField = {
        let field = CustomTextField()
        field.tag = 1
        field.placeholder = R.Titles.RegisterScreen.placeholderSurName
        return field
    }()
    
    let numberCardTextField: UITextField = {
        let field = CustomTextField()
        field.tag = 2
        field.placeholder = R.Titles.RegisterScreen.placeholderNumberCard
        return field
    }()
    
    let numberPhoneTextField: UITextField = {
        let field = CustomTextField()
        field.tag = 3
        field.placeholder = R.Titles.RegisterScreen.placeholderNumberPhone
        return field
    }()
    
    let registerButton: UIButton = {
        let button = CustomButtom()
        button.backgroundColor = .white
        button.setTitle(R.Titles.RegisterScreen.registerButton, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let stackView = StackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        assambly.initialView(view: self)
        setRegisterView()
        addTargets()
        setStackView()
        makeConstraints()
        assignDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension RegistrationContentView {
    
    func assignDelegate() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        numberCardTextField.delegate = self
        numberPhoneTextField.delegate = self
    }
    
    func setRegisterView() {
        backgroundColor = .systemBlue
        addSubview(title)
        addSubview(stackView)
    }
    
    func addTargets() {
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        numberCardTextField.addTarget(self, action: #selector(editingNumberCardField(_:)), for: .editingChanged)
    }
    
    func setStackView() {
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surnameTextField)
        stackView.addArrangedSubview(numberCardTextField)
        stackView.addArrangedSubview(numberPhoneTextField)
        stackView.addArrangedSubview(registerButton)
        
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
    
    @objc func editingNumberCardField(_ sender: UITextField) {
        if !sender.text!.isEmpty && sender.text!.count % 5 == 0 && sender.text!.last! != " " {
            sender.text!.insert(" ", at: sender.text!.index(sender.text!.startIndex, offsetBy: sender.text!.count-1) )
        }
    }
}

// MARK: - RegistrationContentViewProtocol
extension RegistrationContentView: RegistrationContentViewProtocol {
    
    func checkTextField() -> Bool {
        if nameTextField.txt.isEmpty ||
            surnameTextField.txt.isEmpty ||
            numberCardTextField.txt.isEmpty ||
            numberPhoneTextField.txt.isEmpty {
            return true
        }
        return false
    }
    
    func registrationClient(client: Client, clientCard: ClientCard, generating: (Int, String)) {
        
        guard !nameTextField.txt.isEmpty,
              !surnameTextField.txt.isEmpty,
              !numberCardTextField.txt.isEmpty,
              !numberPhoneTextField.txt.isEmpty
        else {return}
        
        let realm = RealmService()
        
        client.name = nameTextField.txt
        client.surname = surnameTextField.txt
        client.numberPhone = numberPhoneTextField.txt
        client.deposit = 1_000_000.00
        
        clientCard.cvv = generating.0
        clientCard.endDate = generating.1
        clientCard.numberCard = numberCardTextField.txt
        clientCard.nameClient = "\(nameTextField.txt) \(surnameTextField.txt)"
        
        client.cards.append(clientCard)
        realm.create(client)
    }
    
    @objc func registerButtonPressed() {
        presenter.generatingClient()
        registrationAction?()
    }
}

// MARK: - Extension textField delegate
extension RegistrationContentView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField.tag {
        case 0, 1:
            return GlobalFunc.noDigit(for: string)
        case 2, 3:
            return GlobalFunc.onlyDigit(for: string)
        default: break
        }
        return true
    }
}
