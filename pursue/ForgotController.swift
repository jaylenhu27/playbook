//
//  ForgotController.swift
//  pursue
//
//  Created by Jaylen Sanders on 12/4/17.
//  Copyright © 2017 Glory. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ForgotController : UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        emailTextField.delegate = self
        setupNavBar()
    }
    
    let emailLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        let attrString = NSMutableAttributedString(string:  "We will send a password reset link to your email.")
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        label.attributedText = attrString
        
        label.numberOfLines = 2
        label.textAlignment = .justified
        label.textColor = .black
        return label
    }()
    
    let submitButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SUBMIT", for: .normal)
        button.backgroundColor = UIColor.black
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    
    let emailTextField : UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = .black
        
        let attributes = [ NSAttributedString.Key.foregroundColor: UIColor.black,
                           NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes:attributes)
        return tf
    }()
    
    lazy var backButton : UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "back-arrow").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    lazy var backBackground : UIButton = {
       let button = UIButton()
        button.layer.cornerRadius = 19
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    let forgotLabel : UILabel = {
        let label = UILabel()
        label.text = "Forgot"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    @objc func handleDismiss(){
        navigationController?.popViewController(animated: true)
    }
    
    func setupNavBar() {
        view.addSubview(backButton)
        view.addSubview(backBackground)
        view.addSubview(forgotLabel)
        
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 48, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
        backBackground.centerXAnchor.constraint(equalTo: backButton.centerXAnchor).isActive = true
        backBackground.centerYAnchor.constraint(equalTo: backButton.centerYAnchor).isActive = true
        backBackground.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 38, height: 38)
        forgotLabel.anchor(top: backButton.topAnchor, left: backButton.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 18, paddingBottom: 0, paddingRight: 0, width: forgotLabel.intrinsicContentSize.width, height: forgotLabel.intrinsicContentSize.height)
        setupEmail()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func handleSignup() {
        guard let email = emailLabel.text else { return }
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print(error)
            }
            
            self.handleDismiss()
        }
    }
    
    func setupEmail(){
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(submitButton)
        
        emailLabel.anchor(top: forgotLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 42, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 60)
        
        view.addSubview(emailTextField)
        emailTextField.anchor(top: emailLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: emailTextField.intrinsicContentSize.height)
        
        let emailUnderline = UIView()
        emailUnderline.backgroundColor = .black
        
        view.addSubview(emailUnderline)
        emailUnderline.anchor(top: emailTextField.bottomAnchor, left: emailTextField.leftAnchor, bottom: nil, right: emailTextField.rightAnchor, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0.5)
        
        submitButton.anchor(top: emailUnderline.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 42, paddingLeft: 40, paddingBottom: 0, paddingRight: 40, width: 0, height: 60)
    }
}
