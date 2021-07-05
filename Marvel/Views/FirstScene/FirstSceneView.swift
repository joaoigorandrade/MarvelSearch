//
//  FirstSceneView.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 29/06/21.
//

import Foundation
import UIKit

class FirstSceneView: UIView{
    private lazy var descriptionLabel = DescriptionLabel()
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    override func layoutSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 40
        backgroundColor = .red
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
