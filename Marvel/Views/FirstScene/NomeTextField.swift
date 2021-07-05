//
//  NomeTextField.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 29/06/21.
//

import UIKit
import Foundation
class NomeTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        setNeedsLayout()
        layoutIfNeeded()
        placeholder = " Nome (ingles)"
        backgroundColor = .white
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        layer.cornerRadius = 5
        textColor = .black
    }
}

