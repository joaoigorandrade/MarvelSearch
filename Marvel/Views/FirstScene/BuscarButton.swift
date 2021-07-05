//
//  BuscarButton.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import UIKit

class BuscarButton: UIButton{
    public var delegate:BuscarButtonDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        setTitle("Buscar", for: .normal)
        setTitleColor(.yellow, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    @objc func search(){
        delegate?.pushTableViewController()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol BuscarButtonDelegate: AnyObject {
    func pushTableViewController()->Void
}
