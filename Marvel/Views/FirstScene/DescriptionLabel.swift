//
//  DescriptionLabel.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 29/06/21.
//

import UIKit
class DescriptionLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    private func setupLabel(){
        translatesAutoresizingMaskIntoConstraints = false
        text = "Insira o nome do seu personagem favorito da MARVEL para buscar informações"
        textColor = .white
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
