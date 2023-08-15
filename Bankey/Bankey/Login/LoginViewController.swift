//
//  ViewController.swift
//  Bankey
//
//  Created by Pedro Filipe Pereira Rodrigues on 13/08/2023.
//

import UIKit

class LoginViewController: UIViewController {

    let appName = UILabel()
    let appDescription = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        
    }
    


}

extension LoginViewController{
    private func style(){
        appName.translatesAutoresizingMaskIntoConstraints = false
        appName.textAlignment = .center
        appName.textColor = .black
        appName.text = "Bankey"
        appName.font = UIFont.boldSystemFont(ofSize: 40)
        
        appDescription.translatesAutoresizingMaskIntoConstraints = false
        appDescription.textAlignment = .center
        appDescription.textColor = .black
        appDescription.numberOfLines = 0
        appDescription.text = "Best app for all things for all things banks maybe yes maybe not"
        appDescription.font = UIFont.systemFont(ofSize: 20)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout(){

        view.addSubview(loginView)
        view.addSubview(appDescription)
        view.addSubview(appName)
     
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
  
       
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter:view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
        ])
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: appDescription.bottomAnchor, multiplier: 2),
            appDescription.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: appDescription.trailingAnchor, multiplier: 4),
            
        ])
        
        
        NSLayoutConstraint.activate([
            appDescription.topAnchor.constraint(equalToSystemSpacingBelow: appName.bottomAnchor, multiplier: 2),
            appName.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            appName.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        
      
        
    }
    
    
}

extension LoginViewController{
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("username|/password not nil")
            return
        }
        if username.isEmpty || password.isEmpty{
            configureView(withMessage: "username/pass must not be empty")
            return
        }
        if username == "a" || password == "a"{
            signInButton.configuration?.showsActivityIndicator = true
        }else{
            configureView(withMessage: "wrong username/password")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
