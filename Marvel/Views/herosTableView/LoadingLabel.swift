//
//  LoadingLabel.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import UIKit

final class LoadingLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(){
        font = UIFont.systemFont(ofSize: 24, weight: .light)
        textColor = .gray
        textAlignment = .center
    }
}
