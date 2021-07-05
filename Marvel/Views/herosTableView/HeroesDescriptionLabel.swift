//
//  HeroesDescriptionLabel.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import UIKit

final class HeroesDescriptionLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    private func setupLabel(){
        numberOfLines = 0
        font = UIFont.systemFont(ofSize: 17, weight: .light)
        textColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
