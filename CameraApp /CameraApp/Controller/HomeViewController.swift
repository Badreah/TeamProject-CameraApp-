//
//  ViewController.swift
//  CameraApp
//
//  Created by Areej on 27/04/1443 AH.
//

import UIKit


class HomeViewController: UIViewController, UITextFieldDelegate {
    
    
    let username = UITextField(frame: CGRect(x: 60, y: 500, width: 260, height: 30))
    let password = UITextField(frame: CGRect(x: 60, y: 580, width: 260, height: 30))
    let welcomeLable = UILabel(frame: CGRect(x: -50, y: 50, width: 500, height:200 ))
    let nameLable = UILabel(frame: CGRect(x: 60, y: 430, width: 400, height:100 ))
    let passwordLable = UILabel(frame: CGRect(x: 60, y: 510, width: 400, height:100 ))
    let login = UIButton(frame: CGRect(x: 60, y: 670, width: 260, height: 40))
    let appImage = UIImageView()
    let loginMasge = UILabel(frame: CGRect(x: 50, y: 600, width: 400, height: 60))
    let anotherAccount = UIButton(frame: CGRect(x: 100, y: 700, width: 200, height: 60))
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(username)
        view.addSubview(password)
        view.addSubview(welcomeLable)
        view.addSubview(nameLable)
        view.addSubview(passwordLable)
        view.addSubview(login)
        view.addSubview(appImage)
        view.addSubview(loginMasge)
        view.addSubview(anotherAccount)
        
        username.placeholder = "Enter Username"
        username.backgroundColor = .lightText
        username.borderStyle = .line
        username.keyboardType = .asciiCapable
        username.delegate = self
        
        password.backgroundColor = .lightText
        password.placeholder = "Enter your password"
        password.borderStyle = .line
        password.keyboardType = .default
        password.delegate = self
        password.isSecureTextEntry = true
        
        welcomeLable.text = "Welcome To Momment App"
        welcomeLable.numberOfLines = 2
        welcomeLable.font = UIFont(name: "Peachy Mochi", size: 50)
        welcomeLable.textAlignment = .center
        
        nameLable.text = "Name"
        
        passwordLable.text = "Password"
        
        login.setTitle("Login", for: .normal)
        login.backgroundColor = .black
        login.layer.cornerRadius = 10
        login.addTarget(self, action: #selector (loginButton), for: .touchDown)
        
        appImage.image = UIImage(named: "cameraOrenge")
        appImage.frame = CGRect(x: 90, y: 220, width: 200, height: 200)
        appImage.tintColor = .systemBrown
        
        anotherAccount.setTitle(" Use Another Account? ", for: .normal)
        anotherAccount.setTitleColor(.blue, for: .normal)
        anotherAccount.titleLabel?.font = .boldSystemFont(ofSize: 15)
        anotherAccount.addTarget(self, action: #selector (useAnotherAccount), for: .touchDown)
        
    }
    
    
    @objc func loginButton() {
        
        let name = username.text
        defaults.set(name, forKey: "name")
        
        if username.text != "" && password.text != "" {
            let nextVC = GalleryViewController()
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true, completion: nil)
            nextVC.userPhoto.text = "\(username.text!)'s Photo"
        } else {
            loginMasge.text = "pleas Enter Your UserName & PassWord"
            loginMasge.textColor = .red
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func useAnotherAccount() {
        username.text = ""
        password.text = ""
    }
    
    
}
