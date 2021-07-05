//
//  HerosTableViewCell.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import Foundation
import UIKit
import Kingfisher
final class HerosTableViewCell: UITableViewCell{
    
    private lazy var heroImageView = HeroesImageView(frame: .zero)
    private lazy var heroNameLabel = HeroNameLabel()
    private lazy var heroDescriptionLabel = HeroesDescriptionLabel()
    
    static let identifier = "HerosTableViewCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        setupViews()
        setupConstraints()
    }
    private func setupViews(){
        contentView.addSubview(heroImageView)
        contentView.addSubview(heroNameLabel)
        contentView.addSubview(heroDescriptionLabel)
    }
    
    private func setupConstraints() {
        setupHeroImageViewConstraints()
        setupHeroNameLabel()
        setupHeroDescriptionLabel()
    }
    
    private func setupHeroImageViewConstraints(){
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        let top = heroImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        let bottom = heroImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        let leading = heroImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        let height = heroImageView.heightAnchor.constraint(equalToConstant: 70)
        let widht = heroImageView.widthAnchor.constraint(equalToConstant: 70)
        NSLayoutConstraint.activate([top,bottom,leading,height,widht])
    }
    
    private func setupHeroNameLabel(){
        heroNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let top = heroNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        let leading = heroNameLabel.leadingAnchor.constraint(equalTo: heroImageView.trailingAnchor, constant: 10)
        NSLayoutConstraint.activate([top,leading])
    }
    private func setupHeroDescriptionLabel(){
        heroDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let top = heroDescriptionLabel.topAnchor.constraint(equalTo: heroNameLabel.bottomAnchor, constant: 5)
        let leading = heroDescriptionLabel.leadingAnchor.constraint(equalTo: heroImageView.trailingAnchor, constant: 10)
        let trailing = heroDescriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10)
        let bottom = heroDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.layer.cornerRadius = heroImageView.frame.size.height/2
        heroImageView.layer.borderWidth = 3
        heroImageView.layer.borderColor = CGColor(red: 1, green: 1, blue: 0, alpha: 1)
        heroImageView.layer.masksToBounds = true
    }
    public func prepareCell(with hero: Hero){
        heroNameLabel.text = hero.name
        heroDescriptionLabel.text = hero.description
        if let url = URL(string: hero.thumbnail.url){
            heroImageView.kf.indicatorType = .activity
            heroImageView.kf.setImage(with: url)
        } else {
            heroImageView.image = nil
        }
        
    }
}
