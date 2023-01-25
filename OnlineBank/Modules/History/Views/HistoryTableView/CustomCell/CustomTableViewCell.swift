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
    
    let spentImageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 30)))
    
    let amountLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 30, height: 100)))
    
    let dateLabel = UILabel()
    
    let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupStackView()
        setupLabel()
        makeConstraint()
    }
    
    func getImage(isSpent: Bool) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        if !isSpent {
            spentImageView.image = arrowDown
            spentImageView.tintColor = .systemRed
        } else {
            spentImageView.image = arrowUp
            spentImageView.tintColor = .systemGreen
        }
        
    }
    
    private func setupCell() {
        backgroundColor = .clear
        addSubview(stackView)
    }
    
    private func setupLabel() {
        amountLabel.textAlignment = .center
        dateLabel.textAlignment = .center
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(spentImageView)
        stackView.addArrangedSubview(amountLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func makeConstraint() {
        spentImageView.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            spentImageView.widthAnchor.constraint(equalToConstant: 30),
            amountLabel.widthAnchor.constraint(equalToConstant: 100),
            dateLabel.widthAnchor.constraint(equalToConstant: 300),
            
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
