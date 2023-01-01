//
//  ViewController.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

final class ViewController<ContentView: ContentViewProtocol>: UIViewController {

    private let contentView: ContentView
    private let viewModel: MainViewModelProtocol = MainViewModel()

    init(contentView: ContentView) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView as? UIView
        view.backgroundColor = R.Colors.background
        viewModel.setTitle(for: self)
    }
}
