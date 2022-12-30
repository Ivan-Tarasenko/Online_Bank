//
//  Resources.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 28.12.2022.
//

import UIKit

enum R {
    enum TabBar {
        static func title(for tab: Tabs) -> String {
            switch tab {
            case .main: return ""
            case .translations: return
            case .withdrawal: return
            case .history: return
            }
        }
    }
}
