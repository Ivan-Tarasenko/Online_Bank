//
//  MainViewController.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
}

final class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol?
    var contentView: MainContentViewProtocol?
    private let assambly: MainAssamblyProtocol = MainAssambly()

    init(contentView: MainContentViewProtocol) {
        self.contentView = contentView
        super .init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        assambly.initialController(controller: self)
        view = contentView as? UIView
        title = R.TabBar.title(for: Tabs.main)
        addProductPressed()
    }
}

extension MainViewController: MainViewControllerProtocol {
    func addProductPressed() {
        contentView?.addProductAction = {
            self.presenter?.pressedAddProduct()
        }
    }
}
