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

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureAppearance() {
        tabBar.backgroundColor = .white

        let controllers: [NavigationController] = Tabs.allCases.map { tab in
            let controller = NavigationController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(
                title: "Test",
                image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                tag: tab.rawValue
            )
            return controller
        }

        setViewControllers(controllers, animated: true)
    }

    private func getController(for tab: Tabs) -> UIViewController {

        switch tab {
        case .main: return ViewController(contentView: MainContentView())
        case .translations: return ViewController(contentView: TranslationsContentView())
        case .withdrawal: return ViewController(contentView: WithdrawalContentView())
        case .history: return ViewController(contentView: HistoryContentView())
        }
    }
}
