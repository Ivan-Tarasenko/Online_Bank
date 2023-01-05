//
//  MainPresenter.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 04.01.2023.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    func configurView()
}

final class MainPresenter: MainPresenterProtocol {

    weak var view: MainContentViewProtocol?
    var interactor: MainInteractorProtocol!
    
    func configurView() {
        print("Presenter")
    }
}
