//
//  TopUpPhoneNumderContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 18.01.2023
//

import UIKit

protocol TopUpPhoneNumderContentViewProtocol: AnyObject {
    func setTitle(string: String)
    var onyYesButtonAction: ((String) -> Void)? { get set }
    var onReplenishButtonAction: ((String) -> Void)? { get set }
}

final class TopUpPhoneNumderContentView: UIView {
    
    var onyYesButtonAction: ((String) -> Void)?
    var onReplenishButtonAction: ((String) -> Void)?
    
    var presenter: TopUpPhoneNumderPresenterProtocol!
    var assembly: TopUpPhoneNumderAssemblyProtocol = TopUpPhoneNumderAssembly()
    
    // Top up your number
    private let titleLabel: UILabel = {
        let label = CustomLabel()
        label.textAlignment = .center
        return label
    }()
    
    private let amountTextField: UITextField = {
        let field = CustomTextField()
        field.becomeFirstResponder()
        field.placeholder = R.Titles.TranslationScreen.TopUpPhoneNumber.amountPlaceholder
        return field
    }()
    
    private let yesButton: UIButton = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.TopUpPhoneNumber.yesButton, for: .normal)
        return button
    }()
    
    private let noButton: UIButton = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.TopUpPhoneNumber.noButton, for: .normal)
        return button
    }()
    
    private let horizontStackView = StackView()
    
    private let selfNumberStackView = StackView()
        
    // Enter the number for replenishment
    private let inputNumberLabel: UILabel = {
        let label = CustomLabel()
        label.txt = R.Titles.TranslationScreen.TopUpPhoneNumber.inputNumberLabel
        label.textAlignment = .center
        return label
    }()
    
    private let numberPhoneTextField: UITextField = {
        let field = CustomTextField()
        field.becomeFirstResponder()
        field.placeholder = R.Titles.TranslationScreen.TopUpPhoneNumber.inputNumberPlaceholder
        return field
    }()
    
    private let inputAmountTextField: UITextField = {
        let field = CustomTextField()
        field.placeholder = R.Titles.TranslationScreen.TopUpPhoneNumber.inputAmountPlaceholder
        return field
    }()
    
    private let replenishButton: UIButton = {
        let button = CustomButtom()
        button.setTitle(R.Titles.TranslationScreen.TopUpPhoneNumber.replenishButton, for: .normal)
        return button
    }()
    
    private let inputNumberStackView = StackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        amountTextField.delegate = self
        inputAmountTextField.delegate = self
        numberPhoneTextField.delegate = self
        setView()
        setStackView()
        makeConstraint()
        presenter.setTitleLabel()
        addTarget()
        inputNumberPhone()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension TopUpPhoneNumderContentView {
    
    func setView() {
        assembly.initialView(view: self)
        backgroundColor = .white
        addSubview(selfNumberStackView)
        addSubview(inputNumberStackView)
        inputNumberStackView.isHidden = true
    }
    
    func addTarget() {
        yesButton.addTarget(self, action: #selector(yesButtonPressed), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(noButtonPressed), for: .touchUpInside)
        replenishButton.addTarget(self, action: #selector(replenishButtonPressed), for: .touchUpInside)
    }
    
    func setStackView() {
        horizontStackView.axis = .horizontal
        horizontStackView.addArrangedSubview(yesButton)
        horizontStackView.addArrangedSubview(noButton)
        
        selfNumberStackView.distribution = .fillProportionally
        selfNumberStackView.addArrangedSubview(titleLabel)
        selfNumberStackView.addArrangedSubview(amountTextField)
        selfNumberStackView.addArrangedSubview(horizontStackView)
    }
    
    func inputNumberPhone() {
        inputNumberStackView.distribution = .fillProportionally
        inputNumberStackView.addArrangedSubview(inputNumberLabel)
        inputNumberStackView.addArrangedSubview(numberPhoneTextField)
        inputNumberStackView.addArrangedSubview(inputAmountTextField)
        inputNumberStackView.addArrangedSubview(replenishButton)
    }
    
    func makeConstraint() {
        NSLayoutConstraint.activate([
            yesButton.heightAnchor.constraint(equalToConstant: 50),
            amountTextField.heightAnchor.constraint(equalToConstant: 45),
            selfNumberStackView.widthAnchor.constraint(equalToConstant: 290),
            selfNumberStackView.heightAnchor.constraint(equalToConstant: 290),
            selfNumberStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            selfNumberStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            
            numberPhoneTextField.heightAnchor.constraint(equalToConstant: 45),
            inputAmountTextField.heightAnchor.constraint(equalToConstant: 45),
            replenishButton.heightAnchor.constraint(equalToConstant: 50),
            inputNumberStackView.widthAnchor.constraint(equalToConstant: 290),
            inputNumberStackView.heightAnchor.constraint(equalToConstant: 360),
            inputNumberStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            inputNumberStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100)
        ])
    }
    
    @objc func yesButtonPressed() {
        onyYesButtonAction?(amountTextField.txt)
    }
    
    @objc func noButtonPressed() {
        selfNumberStackView.isHidden = true
        inputNumberStackView.isHidden = false
    }
    
    @objc func replenishButtonPressed() {
        onReplenishButtonAction?(inputAmountTextField.txt)
    }
}

// MARK: - TopUpPhoneNumderContentViewProtocol
extension TopUpPhoneNumderContentView: TopUpPhoneNumderContentViewProtocol {
    func setTitle(string: String) {
        titleLabel.txt = string
    }
}

// MARK: - Extension textField delegate
extension TopUpPhoneNumderContentView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        GlobalFunc.onlyDigit(for: string)
    }
}
