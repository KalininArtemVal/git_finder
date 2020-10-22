//
//  ViewController.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 21.10.2020.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    private let logo = URL(string:"https://avatars.mds.yandex.net/get-zen_doc/225409/pub_5bf04238a76bb400aefdd6a1_5bf0479ae74e5400aad12c1d/scale_1200")
    
    lazy var lableGitHub: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    lazy var loginField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9332439899, green: 0.9334002733, blue: 0.9332234263, alpha: 1)
        textField.placeholder = "UserName"
        textField.textAlignment = .left
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var passwordField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9332439899, green: 0.9334002733, blue: 0.9332234263, alpha: 1)
        textField.placeholder = "Password"
        textField.textAlignment = .left
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var loginButton: UILabel = {
        let login = UILabel()
        login.text = "Login"
        login.textColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .purple
        setupConstraints()
        getGitLogo()
        tapOnLogin()
    }
    
    func tapOnLogin() {
        let tapRecogmizer = UITapGestureRecognizer(target: self, action: #selector(tapOn))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(tapRecogmizer)
    }
    
    @objc func tapOn() {
        let vc = SearchViewController()
        present(vc, animated: true, completion: nil)
    }
    
    func getGitLogo() {
        if let logo = logo {
            lableGitHub.kf.setImage(with: logo)
        }
    }

    func setupConstraints() {
        view.addSubview(lableGitHub)
        view.addSubview(loginField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        
        let constraints = [
            lableGitHub.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            lableGitHub.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            lableGitHub.widthAnchor.constraint(equalToConstant: 300),
            lableGitHub.heightAnchor.constraint(equalToConstant: 175),
            
            loginField.topAnchor.constraint(equalTo: lableGitHub.bottomAnchor, constant: 30),
            loginField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            loginField.widthAnchor.constraint(equalToConstant: 300),
            loginField.heightAnchor.constraint(equalToConstant: 30),
            
            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor, constant: 30),
            passwordField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            passwordField.widthAnchor.constraint(equalToConstant: 300),
            passwordField.heightAnchor.constraint(equalToConstant: 30),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
//
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}

