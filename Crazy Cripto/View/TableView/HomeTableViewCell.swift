//
//  HomeTableViewCell.swift
//  Crazy Cripto
//
//  Created by Ahmet Burak Öztürk on 22.06.2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK: - Variables
    static let identifier = "HomeTableViewCell"
    
    
    
    
    //MARK: - UI Components
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        return label
    }()
    
    
    
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUi()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: - Configure
    func configrue(nameText: String, priceText: String){
        self.nameLabel.text = nameText
        self.priceLabel.text = priceText
    }
    
    
    
    
    //MARK: - Setup UI
    private func setupUi(){
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(priceLabel)
        
        setConstraints()
    
    }
    
    
    
    //MARK: - Private Functions
    private func setConstraints(){
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            
            priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            
            
        ])
    }
    
}
