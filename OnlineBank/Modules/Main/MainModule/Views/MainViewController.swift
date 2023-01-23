//
//  MainViewController.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit
import RealmSwift

protocol MainViewControllerProtocol: AnyObject {
    func setBalanceDeposit(balance: String)
}

final class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol?
    var contentView: MainContentViewProtocol?
    private let assambly: MainAssamblyProtocol = MainAssambly()
    private let scrollView = UIScrollView()

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.getBalance()
        
    }
}

// MARK: - Private extension func
private extension MainViewController {
    func addProductPressed() {
        contentView?.addProductAction = {
            self.presenter?.pressedAddProduct()
        }
    }
}

// MARK: - Extension MainViewControllerProtocol
extension MainViewController: MainViewControllerProtocol {
    func setBalanceDeposit(balance: String) {
        contentView?.depositBalanceLabel.txt = balance
    }
}
