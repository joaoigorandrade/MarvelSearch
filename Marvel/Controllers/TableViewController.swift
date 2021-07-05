//
//  TableViewController.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 30/06/21.
//

import UIKit

final class TableViewController: UIViewController{
    public var name: String?
    private var heroes = [Hero]()
    private var total = 0
    private var loadingHeroes = false
    private var currentPage = 0
    private var _errorFlag = false
    
    
    private var herosTableView = HeroesTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()
        setupConstraints()
    }
    private func setupConstraints() {
        setupViews()
        setupHerosTableViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func loadHeroes(){
        loadingHeroes = true
        MarvelAPI.loadHeros(name: name, page: currentPage) { info in
            if let info = info{
                self.heroes += info.data.results
                self.total = info.data.total
                print("Total:",self.total, "- Já incluídos:", self.heroes.count)
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.herosTableView.reloadData()
                }
            } else {
                self._errorFlag = true
                self.herosTableView.reloadData()
            }
        }
    }
    private func setupViews(){
        view.addSubview(herosTableView)
    }
    private func setupHerosTableViewConstraints(){
        herosTableView.dataSource = self
        herosTableView.delegate = self
        herosTableView.translatesAutoresizingMaskIntoConstraints = false
        let top  = herosTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leading = herosTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = herosTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let bottom = herosTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([top,leading,trailing,bottom])
    }
}

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let label = LoadingLabel()
        label.text = _errorFlag ? "Erro ao procurar Herois" : "Carregando Herois"
        herosTableView.backgroundView = heroes.count == 0 ? label : nil
        return heroes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HerosTableViewCell.identifier, for: indexPath) as? HerosTableViewCell else { return UITableViewCell() }
        cell.prepareCell(with: heroes[indexPath.row])
        return cell
    }
}

extension TableViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroDetailViewController = HeroDetaiViewController()
        guard let url = heroes[indexPath.row].urls.first?.url else { return }
        heroDetailViewController.url = url
        heroDetailViewController.view.backgroundColor = .black
        navigationController?.pushViewController(heroDetailViewController, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total{
            currentPage+=1
            loadHeroes()
            print("Carregando mais Herois")
        }
    }
}
