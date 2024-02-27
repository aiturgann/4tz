//
//  ViewController.swift
//  4tz
//
//  Created by Aiturgan Kurmanbekova on 25/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let mainLabel = MakerView().uiLabelMaker(text: "Create New Password 🔐",
                                                     size: 28,
                                                     weight: .bold)
    
    private let secondLabel = MakerView().uiLabelMaker(text: "Enter your new password. If you forget it, then you have to do forgot password.",
                                                       size: 18)
    
    private let passwordLabel = MakerView().uiLabelMaker(text: "Password",
                                                         size: 16)
    
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "123456789"
        tf.layer.cornerRadius = 6
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftViewMode = .always
        
        let rightView = UIButton(frame: CGRect(x: 8, y: 0, width: 8, height: 8))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tintColor = .red
        rightView.addTarget(self, action: #selector(hideShowText), for: .touchUpInside)
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.tag = 1
        return tf
    }()
    
    private let hideButton = MakerView().uiButtonMaker(title: nil,
                                                       image: UIImage(named: "hide"),
                                                       tintColor: .systemGray4)
    
    private let confirmPswLabel = MakerView().uiLabelMaker(text: "Confirm Password",
                                                           size: 16)
    
    
    private let confirmPswTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "123456789"
        tf.layer.cornerRadius = 6
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray.cgColor
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 8))
        tf.leftViewMode = .always
        
        let rightView = UIButton(frame: CGRect(x: 8, y: 0, width: 8, height: 8))
        rightView.setBackgroundImage(UIImage(systemName: "eye"), for: .normal)
        rightView.tintColor = .red
        rightView.addTarget(self, action: #selector(hideShowText2), for: .touchUpInside)
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.tag = 2
        return tf
    }()
    
    private let hhideButton = MakerView().uiButtonMaker(title: nil,
                                                        image: UIImage(named: "hide"),
                                                        tintColor: .systemGray4)
    
    private let checkButton = MakerView().uiButtonMaker(title: nil, image: .checkmark, tintColor: .systemGray3)
    
    private let checkLabel = MakerView().uiLabelMaker(text: "Remember me")
    
    private let continueButton = MakerView().uiButtonMaker(title: "Continue",
                                                           titleColor: .white,
                                                           backgroundColor: .systemGray3,
                                                           cornerRadius: 30)
    
    private let errorLabel = MakerView().uiLabelMaker(text: "Please, enter 8 or more symbols!",
                                                      textColor: .systemGray4)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        continueButton.isEnabled = false
    }
    
    private func setupUI() {
        view.addSubview(mainLabel)
        NSLayoutConstraint.activate(
            [mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
             mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             mainLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
             mainLabel.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        view.addSubview(secondLabel)
        NSLayoutConstraint.activate(
            [secondLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 16),
             secondLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             secondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
            ])
        
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate(
            [passwordLabel.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 30),
             passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             passwordLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        view.addSubview(passwordTF)
        NSLayoutConstraint.activate(
            [passwordTF.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
             passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
             passwordTF.heightAnchor.constraint(equalToConstant: 41)
            ])
        
        
        view.addSubview(confirmPswLabel)
        NSLayoutConstraint.activate(
            [confirmPswLabel.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20),
             confirmPswLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             confirmPswLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        view.addSubview(confirmPswTF)
        NSLayoutConstraint.activate(
            [confirmPswTF.topAnchor.constraint(equalTo: confirmPswLabel.bottomAnchor, constant: 16),
             confirmPswTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             confirmPswTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
             confirmPswTF.heightAnchor.constraint(equalToConstant: 41)
            ])
        
        view.addSubview(checkButton)
        NSLayoutConstraint.activate(
            [checkButton.topAnchor.constraint(equalTo: confirmPswTF.bottomAnchor, constant: 16),
             checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             checkButton.heightAnchor.constraint(equalToConstant: 24),
             checkButton.widthAnchor.constraint(equalToConstant: 24)
            ])
        
        view.addSubview(checkLabel)
        NSLayoutConstraint.activate(
            [checkLabel.topAnchor.constraint(equalTo: confirmPswTF.bottomAnchor, constant: 16),
             checkLabel.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 5),
             checkLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        view.addSubview(continueButton)
        NSLayoutConstraint.activate(
            [continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
             continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
             continueButton.heightAnchor.constraint(equalToConstant: 58)
            ])
        
        view.addSubview(errorLabel)
        NSLayoutConstraint.activate(
            [errorLabel.topAnchor.constraint(equalTo: checkLabel.bottomAnchor, constant: 10),
             errorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
             errorLabel.heightAnchor.constraint(equalToConstant: 16)
            ])
        
        
        passwordTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        confirmPswTF.addTarget(self, action: #selector(validateTF), for: .editingChanged)
        checkButton.addTarget(self, action: #selector(checkBtnTppd), for: .touchUpInside)
        
    }
    
    @objc private func validateTF() {
        guard let text = passwordTF.text, text.count >= 8 else { return }
        
        if text == confirmPswTF.text {
            continueButton.isEnabled = true
            continueButton.backgroundColor = .red
            continueButton.addTarget(self, action: #selector(continueBtnTppd), for: .touchUpInside)
        } else {
            continueButton.isEnabled = false
            continueButton.backgroundColor = .systemGray3
        }
        
        
    }
    
    @objc private func checkBtnTppd() {
        checkButton.tintColor = .red
    }
    
    @objc private func continueBtnTppd() {
        if checkButton.tintColor == .red {
            let vc = SecondViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @objc private func hideShowText(_ sender: UIButton) {
        passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
    }
    
    @objc private func hideShowText2(_ sender: UIButton) {
        confirmPswTF.isSecureTextEntry = !confirmPswTF.isSecureTextEntry
    }
    
}
    
    




