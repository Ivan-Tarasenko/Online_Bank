//
//  CashContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit

protocol CashContentViewProtocol: AnyObject {
    var onWithdrawalButtonAction: (() -> Void)? { get set }
}

final class CashContentView: UIView {
    
    var onWithdrawalButtonAction: (() -> Void)?
    
    var presenter: CashPresenterProtocol!
    var assambly: CashAssamblyProtocol = CashAssambly()
    
    private let titleLabel: UILabel = {
        let label = CustomLabel()
        label.textAlignment = .center
        label.txt = R.Titles.WithdrawalScreen.Cash.cashTitle
        return label
    }()
    
    private let amountTextField: UITextField = {
        let field = CustomTextField()
        field.becomeFirstResponder()
        field.placeholder = R.Titles.WithdrawalScreen.Cash.cashPlaceholder
        return field
    }()
    
    private let withdrawalButton: UIButton = {
        let button = CustomButtom()
        button.setTitle(R.Titles.WithdrawalScreen.Cash.withdrawalButton, for: .normal)
        return button
    }()
    
    private let stackView = StackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        amountTextField.delegate = self
        setView()
        addTarget()
        setStackView()
        makeConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension CashContentView {
    func setView() {
        assambly.initialView(view: self)
        backgroundColor = .white
        addSubview(stackView)
    }
    
    func addTarget() {
        withdrawalButton.addTarget(self, action: #selector(withdrawalButtonPressed), for: .touchUpInside)
    }
    
    func setStackView() {
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(amountTextField)
        stackView.addArrangedSubview(withdrawalButton)
    }
    
    func makeConstraint() {
        NSLayoutConstraint.activate([
            amountTextField.heightAnchor.constraint(equalToConstant: 45),
            withdrawalButton.heightAnchor.constraint(equalToConstant: 50),
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 290),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100)
            ])
    }
    
    @objc func withdrawalButtonPressed() {
        presenter.wihdrawalCash(string: amountTextField.txt)
        onWithdrawalButtonAction?()
    }
}

// MARK: - CashContentViewProtocol
extension CashContentView: CashContentViewProtocol {
}

// MARK: - Extension textField delegate
extension CashContentView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        GlobalFunc.onlyDigit(for: string)
    }
}
