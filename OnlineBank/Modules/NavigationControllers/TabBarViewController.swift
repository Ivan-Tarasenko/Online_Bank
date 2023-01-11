//
//  TabBarViewController.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case main
    case translations
    case withdrawal
    case history
}

final class TabBarViewController: UITabBarController {

//    private let registerView = RegistrationContentView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setTabBar()
        configureAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setTabBar() {
        tabBar.backgroundColor = .green

        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.borderWidth = 0.6
        tabBar.layer.masksToBounds = true
    }
    
    private func configureAppearance() {
        
        let controllers: [NavigationController] = Tabs.allCases.map { tab in
            let controller = NavigationController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(
                title: R.TabBar.title(for: tab),
                image: UIImage(systemName: R.TabBar.icon(for: tab)),
                tag: tab.rawValue
            )

            return controller
        }

        setViewControllers(controllers, animated: true)
    }
    
    private func getController(for tab: Tabs) -> UIViewController {
        
        switch tab {
        case .main: return MainViewController(contentView: MainContentView())
        case .translations: return  TranslationViewController(contentView: TranslationContentView())
        case .withdrawal: return WithdrawalViewController(contentView: WithdrawalContentView())
        case .history: return HistoryViewController(contentView: HistoryContentView())
        }
    }
}
