//
//  DepositReplenishmentContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit
import RealmSwift

protocol DepositReplenishmentContentViewProtocol: AnyObject {
    var onEnterButtonAction: (() -> Void)? { get set }
}

final class DepositReplenishmentContentView: UIView {
    
    var onEnterButtonAction: (() -> Void)?

    var presenter: DepositReplenishmentPresenterProtocol!
    var assembly: DepositReplenishmentAssemblyProtocol = DepositReplenishmentAssembly()
    
    private let titleLabel: UILabel = {
        let label = CustomLabel()
        label.txt = R.Titles.TranslationScreen.DepositReplinshment.depositReplinshmentTitle
        label.textAlignment = .center
        return label
    }()
    
    private let inputSumTextField: UITextField = {
        let field = CustomTextField()
        field.becomeFirstResponder()
        field.placeholder = R.Titles.TranslationScreen.DepositReplinshment.placeholderFieldSum
        return field
    }()
    
    private let enterButton: UIButton = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.DepositReplinshment.enterButton, for: .normal)
        return button
    }()
    
    private let stackView = StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        inputSumTextField.delegate = self
        setView()
        setStackView()
        makeConstraints()
        addTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension DepositReplenishmentContentView {
    
    func setView() {
        assembly.initialView(view: self)
        backgroundColor = .white
        addSubview(stackView)
    }
    
    func setStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(inputSumTextField)
        stackView.addArrangedSubview(enterButton)
    }
    
    func makeConstraints() {
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 210),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -120)
        ])
    }
    
    func addTarget() {
        enterButton.addTarget(self, action: #selector(enterButtonPressed), for: .touchUpInside)
    }
    
    @objc func enterButtonPressed() {
        presenter.topUpBalanceDepasite(value: inputSumTextField.txt)
        onEnterButtonAction?()
        
    }
}

// MARK: - DepositReplenishmentContentViewProtocol
extension DepositReplenishmentContentView: DepositReplenishmentContentViewProtocol {
}

// MARK: - Extension textField delegate
extension DepositReplenishmentContentView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == inputSumTextField {
            return GlobalFunc.onlyDigit(for: string)
        }
        return true
    }
}
