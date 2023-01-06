//
//  MainViewModel.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 31.12.2022.
//

import UIKit

protocol MainViewModelProtocol: AnyObject {
    func setTitle(for controller: UIViewController)
}

final class MainViewModel: MainViewModelProtocol {

    func setTitle(for controller: UIViewController) {
        switch controller.view {
        case controller.view as MainContentView:
            controller.title = R.TabBar.title(for: Tabs.main)
        case controller.view as TranslationsContentView:
            controller.title = R.TabBar.title(for: Tabs.translations)
        case controller.view as WithdrawalContentView:
            controller.title = R.TabBar.title(for: Tabs.withdrawal)
        case controller.view as HistoryContentView:
            controller.title = R.TabBar.title(for: Tabs.history)
        default: break
        }
    }
}
