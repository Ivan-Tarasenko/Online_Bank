//
//  CustomTableViewCell.swift
//  OnlineBank
//
//  Created by Иван Тарасенко on 02.01.2023.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {

   static var identifier: String {
        return String(describing: self)
    }
    
    let customImageView = UIImageView()
    
    let image = UIImage(systemName: "arrow.up")

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        
        addSubview(customImageView)
        makeConstraint()

        customImageView.image = image
        customImageView.tintColor = .systemGreen
        
    }
    
    
    
    private func makeConstraint() {
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customImageView.widthAnchor.constraint(equalToConstant: 30),
            customImageView.heightAnchor.constraint(equalToConstant: 30),
            customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            customImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
