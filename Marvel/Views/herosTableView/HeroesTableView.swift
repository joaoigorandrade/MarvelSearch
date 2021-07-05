//
//  HeroesTableView.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import UIKit

final class HeroesTableView : UITableView{
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    private func setupTableView(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        register(HerosTableViewCell.self, forCellReuseIdentifier: HerosTableViewCell.identifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
