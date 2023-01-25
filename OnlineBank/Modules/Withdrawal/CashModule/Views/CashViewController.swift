//
//  CashViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 19.01.2023
//

import UIKit

protocol CashViewControllerProtocol: AnyObject {
}

final class CashViewController: UIViewController {
    
    var presenter: CashPresenterProtocol?
    var contentView: CashContentViewProtocol?
    private let assambly: CashAssamblyProtocol = CashAssambly()
    private let alert = AlertService(massage: R.Titles.Alert.withdrawalErrorMassage)
    
    // MARK: - Inition View
    init(contentView: CashContentView) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Loading View
    override func loadView() {
        assambly.initialController(controller: self)
        view = contentView as? UIView
        didWithdrawalButtonPressed()
    }
}

// MARK: - Private functions
private extension CashViewController {
    func didWithdrawalButtonPressed() {
        contentView?.onWithdrawalButtonAction = { [weak self] string in
            guard let self else { return }
            if self.presenter!.checkBalance(string: string) {
                self.presenter?.wihdrawalCash(string: string)
                self.dismiss(animated: true)
            } else {
                self.alert.showAlert(in: self)
            }
        }
    }
}

// MARK: - CashViewControllerProtocol
extension CashViewController: CashViewControllerProtocol {
}
