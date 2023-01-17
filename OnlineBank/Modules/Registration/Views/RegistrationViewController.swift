//
//  RegistrationViewController.swift
//  Super easy dev
//
//  Created by Иван Тарасенко on 10.01.2023
//

import UIKit

protocol RegistrationViewControllerProtocol: AnyObject {
    func checkRegistration(client isEmpty: Bool, completion: @escaping () -> Void)
}

final class RegistrationViewController: UIViewController {
    
    var presenter: RegistrationPresenterProtocol?
    var registrationView: RegistrationContentViewProtocol?
    var welcomeView: WelcomeViewProtocol?
    private let assambly: RegistrationAssamblyProtocol = RegistrationAssambly()
    private let alert = AlertService()

    // MARK: - Inition View
    init(contentView: RegistrationContentView) {
        self.registrationView = contentView
        super .init(nibName: nil, bundle: nil)

        welcomeView = WelcomeView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Loading View
    override func loadView() {
        assambly.initialController(controller: self)
        presenter?.checkRegistration()
    }
}

// MARK: - Private functions
private extension RegistrationViewController {

    func checkingFillingOfFields(complietion: @escaping () -> Void) {
        if let contentView = registrationView {
            if contentView.checkTextField() {
                alert.showAlert(in: self)
            } else {
                complietion()
            }
        }
    }
}

// MARK: - RegistrationViewControllerProtocol
extension RegistrationViewController: RegistrationViewControllerProtocol {

    func checkRegistration(client isEmpty: Bool, completion: @escaping () -> Void) {
        if isEmpty {
            view = registrationView as? UIView

            registrationView?.registrationAction = { [weak self] in
                guard let self else { return }
                self.checkingFillingOfFields {
                    self.presenter?.transition()
                }
            }

        } else {
            view = welcomeView as? UIView
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                completion()
            }
        }
    }
}
