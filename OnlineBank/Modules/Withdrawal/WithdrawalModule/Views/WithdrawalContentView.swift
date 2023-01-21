//
//  WithdrawalContentView.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 08.01.2023
//

import UIKit

protocol WithdrawalContentViewProtocol: AnyObject {
    var onCashAction: (() -> Void)? { get set }
    var onRequestAction: (() -> Void)? { get set }
}

final class WithdrawalContentView: UIView {

    var onCashAction: (() -> Void)?
    var onRequestAction: (() -> Void)?

    var presenter: WithdrawalPresenterProtocol!
    var assambly: WithdrawalAssamblyProtocol = WithdrawalAssambly()

    let titleWithdrawalLabel: CustomLabel = {
        let label = CustomLabel()
        label.text = R.Titles.WithdrawalScreen.titleWithdrawal
        return label
    }()

    let cashButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.WithdrawalScreen.cash, for: .normal)
        return button
    }()

    let requestButton: CustomButtom = {
        let button = CustomButtom()
        button.setTitle(R.Titles.WithdrawalScreen.request, for: .normal)
        return button
    }()

    let stackView = StackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        makeConstraionts()
        setStackView()
        addTargets()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private functions
private extension WithdrawalContentView {

    func setView() {
        assambly.initialView(view: self)
        addSubview(titleWithdrawalLabel)
        addSubview(stackView)
        backgroundColor = R.Colors.background
    }

    func setStackView() {
        stackView.axis = .horizontal
        stackView.addArrangedSubview(cashButton)
        stackView.addArrangedSubview(requestButton)

        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 130),
            stackView.topAnchor.constraint(equalTo: titleWithdrawalLabel.topAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func makeConstraionts() {
        NSLayoutConstraint.activate([
            titleWithdrawalLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleWithdrawalLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleWithdrawalLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
        ])
    }

    func addTargets() {
        cashButton.addTarget(self, action: #selector(cashPressed), for: .touchUpInside)
        requestButton.addTarget(self, action: #selector(requestPressed), for: .touchUpInside)
    }

    @objc func cashPressed() {
        onCashAction?()
    }
    @objc func requestPressed() {
        onRequestAction?()
    }
}

// MARK: - WithdrawalContentViewProtocol
extension WithdrawalContentView: WithdrawalContentViewProtocol {
}
