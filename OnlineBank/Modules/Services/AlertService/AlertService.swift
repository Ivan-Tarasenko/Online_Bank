//
//  AlertService.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 16.01.2023.
//

import UIKit

final class AlertService {

    static let shared = AlertService()

    init() {}

    func showAlert( in controller: UIViewController) {
        var alert = UIAlertController(
            title: R.Titles.Alert.title,
            message: R.Titles.Alert.massage,
            preferredStyle: .alert
        )

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(cancel)
        controller.present(alert, animated: true)
    }
}
