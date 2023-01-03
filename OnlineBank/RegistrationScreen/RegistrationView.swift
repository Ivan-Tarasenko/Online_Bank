//
//  RegistrationView.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class RegistrarionView: UIView {

    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        return button
    }()

    let title: CustomLabel = {
        let label = CustomLabel()
        label.text = R.Titles.RegisterScreen.title
        return label
    }()

    let nameTextField: CustomTextField = {
        let field = CustomTextField()
        return field
    }()

    let surNameTextField: CustomTextField = {
        let field = CustomTextField()
        return field
    }()

    let numberCardTextField: CustomTextField = {
        let field = CustomTextField()
        return field
    }()

    let registerButton: CustomButtom = {
        let button = CustomButtom()
        button.backgroundColor = .white
        button.setTitle(R.Titles.RegisterScreen.registerButton, for: .normal)
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
        addSubview(closeButton)
        addSubview(stackView)
    }

    func addTargets() {
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }

    private func setStackView() {
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(surNameTextField)
        stackView.addArrangedSubview(numberCardTextField)
        stackView.addArrangedSubview(registerButton)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalToConstant: 290),
            stackView.heightAnchor.constraint(equalToConstant: 350),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
    }

    private func makeConstraints() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 100),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }

    @objc func closeButtonPressed() {
        self.isHidden = true
    }

    @objc func registerButtonPressed() {
        print("register")
    }
}

// MARK: - PreviewProvider
#if DEBUG
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct Representable: UIViewRepresentable {
    let view: UIView

    func makeUIView(context: Context) -> UIView {
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

@available(iOS 13.0, *)
struct DicesViewRepresentablePreview: PreviewProvider {
    static var previews: some View {
        Representable(view: RegistrarionView(frame: .zero))

            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.height,
                alignment: .center
            )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.light)
    }
}
#endif
#endif
