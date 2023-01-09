//
//  MainPresenter.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func configureView()
    func pressedAddProduct()

    init(_ view: MainContentViewProtocol)
    init(_ controller: MainViewControllerProtocol)

}

final class MainPresenter {

    weak var viewController: MainViewControllerProtocol?
    weak var view: MainContentViewProtocol?
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!

    required init(_ view: MainContentViewProtocol) {
        self.view = view
    }

    required init(_ controller: MainViewControllerProtocol) {
        self.viewController = controller
    }

    func configureView() {
//        viewController?.configer(view: contentView!)
    }

}

// MARK: - MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {

    func pressedAddProduct() {
        router.transitionOnNewProduct()
    }
}
