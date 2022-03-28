//
//  TableViewCell.swift
//  VK
//
//  Created by Данила Семисчастнов on 28.03.2022.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    var date: UILabel!
    var value: UILabel!
    
    private let bodyFontSize: CGFloat = 18
    private let captionFontSize: CGFloat = 12
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.date = UILabel()
        self.date.font = .boldSystemFont(ofSize: self.bodyFontSize)
        self.date.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.date)
        
        self.value = UILabel()
        self.value.font = .boldSystemFont(ofSize: self.bodyFontSize)
        self.value.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.value)
        
        let dateDescription: UILabel = UILabel()
        dateDescription.text = "Date"
        dateDescription.textColor = .systemGray
        dateDescription.font = .systemFont(ofSize: self.captionFontSize)
        dateDescription.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(dateDescription)
        
        let valueDescription: UILabel = UILabel()
        valueDescription.text = "Value"
        valueDescription.font = .systemFont(ofSize: 10)
        valueDescription.textColor = .systemGray
        valueDescription.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(valueDescription)
        
        NSLayoutConstraint.activate([
            self.date.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 40),
            self.value.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40),
            
            self.date.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.value.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            dateDescription.bottomAnchor.constraint(equalTo: self.date.topAnchor),
            dateDescription.centerXAnchor.constraint(equalTo: self.date.centerXAnchor),
            
            valueDescription.bottomAnchor.constraint(equalTo: self.value.topAnchor),
            valueDescription.centerXAnchor.constraint(equalTo: self.value.centerXAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
