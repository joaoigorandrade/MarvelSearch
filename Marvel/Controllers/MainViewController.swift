//
//  ViewController.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 29/06/21.
//

import UIKit

final class MainViewController: UIViewController {
    private lazy var mainView = FirstSceneView()
    private lazy var descriptionLabel = DescriptionLabel()
    private lazy var nomeTextField = NomeTextField()
    private lazy var buscarButton = BuscarButton()
    private lazy var viewCenterY = mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeTextField.delegate = self
        addToSubViews()
        setupConstraints()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.nomeTextField.endEditing(true)
    }
    private func addToSubViews(){
        view.addSubview(mainView)
        view.addSubview(descriptionLabel)
        view.addSubview(nomeTextField)
        view.addSubview(buscarButton)
    }
    private func setupConstraints() {
        setupDecriptionLabelConstraints()
        setupNomeTextFieldConstraints()
        setupMainViewConstraints()
        setupBuscarButtonConstraints()
    }
    
    private func setupMainViewConstraints(){
        mainView.translatesAutoresizingMaskIntoConstraints = false
        let leading = mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let height = mainView.heightAnchor.constraint(equalToConstant: 310)
        NSLayoutConstraint.activate([viewCenterY,leading,trailing,height])
    }
    private func setupDecriptionLabelConstraints(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        let top = descriptionLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10)
        let leading = descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant : 20)
        let trailing = descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        NSLayoutConstraint.activate([top,leading,trailing])
    }
    private func setupNomeTextFieldConstraints(){
        nomeTextField.translatesAutoresizingMaskIntoConstraints = false
        let top = nomeTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40)
        let leading = nomeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let trailing = nomeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let height = nomeTextField.heightAnchor.constraint(equalToConstant: 30)
        NSLayoutConstraint.activate([top,leading,trailing,height])
    }
    private func setupBuscarButtonConstraints(){
        buscarButton.delegate = self
        buscarButton.translatesAutoresizingMaskIntoConstraints = false
        let top = buscarButton.topAnchor.constraint(equalTo: nomeTextField.bottomAnchor, constant: 40)
        let leading = buscarButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60)
        let trailing = buscarButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -60)
        let height = buscarButton.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([top,leading,trailing,height])
    }
    
    func animateViewConstraint(with constraint: CGFloat){
        self.viewCenterY.isActive = false
        UIView.animate(withDuration: 0.25) {
            self.viewCenterY = self.mainView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: constraint)
            NSLayoutConstraint.activate([self.viewCenterY])
        }
    }
}

extension MainViewController: BuscarButtonDelegate{
    func pushTableViewController() {
        let tableViewController = TableViewController()
        guard let text = nomeTextField.text else {
            return
        }
        tableViewController.name = text
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
        navigationController?.navigationBar.barTintColor = UIColor.black
        tableViewController.title = "Marvel Heroes"
        tableViewController.view.backgroundColor = .black
        navigationController?.pushViewController(tableViewController, animated: true)
    }
}

extension MainViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.becomeFirstResponder()
        animateViewConstraint(with: -120)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
        animateViewConstraint(with: 0)
    }
}
