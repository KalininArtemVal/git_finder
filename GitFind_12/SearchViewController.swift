//
//  SearchViewController.swift
//  GitFind_12
//
//  Created by Калинин Артем Валериевич on 21.10.2020.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    private let logo = URL(string:"https://i.etsystatic.com/6874471/r/il/a27bfc/900056752/il_fullxfull.900056752_4qy9.jpg")
    
    private let scheme = "https"
    private let host = "api.github.com"
    private let searchRepoPath = "/search/repositories"
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 140 / 2
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var userName: UILabel = {
        let lable = UILabel()
        lable.text = "UserName"
        lable.textAlignment = .center
        lable.layer.cornerRadius = 8
        lable.font = .systemFont(ofSize: 24)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var searchField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9332439899, green: 0.9334002733, blue: 0.9332234263, alpha: 1)
        textField.placeholder = "Repository name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var langueageFiewld: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.9332439899, green: 0.9334002733, blue: 0.9332234263, alpha: 1)
        textField.placeholder = "Language"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var sortedLable: UILabel = {
        let lable = UILabel()
        lable.text = "Sorted by stars"
        lable.textAlignment = .center
        lable.layer.cornerRadius = 8
        lable.font = .systemFont(ofSize: 24)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    lazy var switcher: UISwitch = {
        let switcher = UISwitch()
        switcher.layer.cornerRadius = 15
        switcher.backgroundColor = #colorLiteral(red: 1, green: 0.5241836905, blue: 0.5077878833, alpha: 1)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 25
        stack.addArrangedSubview(sortedLable)
        stack.addArrangedSubview(switcher)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var serachButton: UIButton = {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(tapOnButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8567112088, blue: 0.7653070092, alpha: 1)
        setupConstraints()
        getGitLogo()
    }
    
    //search request
    func searchRepositoriesRequest() -> URLRequest? {
        
        guard let searchName = searchField.text else {return nil}
        guard let searchLanguage = langueageFiewld.text else {return nil}
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = searchRepoPath
        
        if switcher.isOn == true {
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: "\(searchName)+language:\(searchLanguage)+stars:>3"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "order", value: "desc")
            ]
        } else {
            urlComponents.queryItems = [
                URLQueryItem(name: "q", value: "\(searchName)+language:\(searchLanguage)"),
                URLQueryItem(name: "order", value: "desc")
            ]
        }
        
        guard let url = urlComponents.url else {
            return nil
        }
        print("search request url:\(url)")
        let request = URLRequest(url: url)
        return request
    }
    
    //Tap on button
    @objc func tapOnButton() {
        
        guard let urlRequest = searchRepositoriesRequest() else {
            print("url request error")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //Error
            if let error = error {
                print(error.localizedDescription)
                return
            }
            //Response
            if let httpResponse = response as? HTTPURLResponse {
                print("http status code: \(httpResponse.statusCode)")
            }
            //Data
            guard let data = data else {
                print("no data received")
                return
            }
            //Text
            guard let text = String(data: data, encoding: .utf8) else {
                print("data encoding failed")
                return
            }
            print("received data: \(text)")
        }
        dataTask.resume()
    }
    
    //Get logo
    func getGitLogo() {
        if let logo = logo {
            userImage.kf.setImage(with: logo)
        }
    }
    
    //Constraints
    func setupConstraints() {
        view.addSubview(userName)
        view.addSubview(userImage)
        view.addSubview(searchField)
        view.addSubview(langueageFiewld)
        view.addSubview(stackView)
        view.addSubview(serachButton)
        
        let constraints = [
            userImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            userImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            userImage.widthAnchor.constraint(equalToConstant: 140),
            userImage.heightAnchor.constraint(equalToConstant: 140),
            
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 30),
            userName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            userName.widthAnchor.constraint(equalToConstant: 300),
            userName.heightAnchor.constraint(equalToConstant: 30),
            
            searchField.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            searchField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            searchField.widthAnchor.constraint(equalToConstant: 300),
            searchField.heightAnchor.constraint(equalToConstant: 30),
            
            langueageFiewld.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 30),
            langueageFiewld.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            langueageFiewld.widthAnchor.constraint(equalToConstant: 300),
            langueageFiewld.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.topAnchor.constraint(equalTo: langueageFiewld.bottomAnchor, constant: 30),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            
            serachButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            serachButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
