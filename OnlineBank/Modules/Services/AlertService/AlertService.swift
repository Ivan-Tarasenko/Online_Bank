//
//  AlertService.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 16.01.2023.
//

import UIKit

final class AlertService {
    
    var massage: String
    
    init(massage: String) {
        self.massage = massage
    }

    func showAlert( in controller: UIViewController) {
        let alert = UIAlertController(
            title: R.Titles.Alert.title,
            message: massage,
            preferredStyle: .alert
        )

        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(cancel)
        controller.present(alert, animated: true)
    }
}
