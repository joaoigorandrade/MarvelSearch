//
//  HeroDetailViewController.swift
//  Marvel
//
//  Created by João Igor de Andrade Oliveira on 01/07/21.
//

import UIKit
import WebKit

final class HeroDetaiViewController:UIViewController{
    public var url: String!
    private var heroWebView = WKWebView()
    private var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        activityIndicator.startAnimating()
        let request = URLRequest(url: URL(string: url)!)
        heroWebView.load(request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupViews(){
        view.addSubview(heroWebView)
        view.addSubview(activityIndicator)
    }
    
    private func setupConstraints(){
        setupHeroWebViewConstraints()
        setupActivityIndicatorConstraints()
    }
    
    private func setupHeroWebViewConstraints(){
        heroWebView.translatesAutoresizingMaskIntoConstraints = false
        heroWebView.backgroundColor = .black
        heroWebView.allowsLinkPreview = true
        heroWebView.allowsBackForwardNavigationGestures = true
        heroWebView.navigationDelegate = self
        let top = heroWebView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let bottom = heroWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let leading = heroWebView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trailing = heroWebView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        NSLayoutConstraint.activate([top,bottom,leading,trailing])
    }
    private func setupActivityIndicatorConstraints(){
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let height = activityIndicator.heightAnchor.constraint(equalToConstant: 40)
        let width = activityIndicator.widthAnchor.constraint(equalToConstant: 40)
        let centerX = activityIndicator.centerXAnchor.constraint(equalTo: heroWebView.centerXAnchor)
        let centerY = activityIndicator.centerYAnchor.constraint(equalTo: heroWebView.centerYAnchor)
        NSLayoutConstraint.activate([height,width,centerX,centerY])
    }
}

extension HeroDetaiViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
