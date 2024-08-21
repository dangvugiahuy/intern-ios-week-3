//
//  Week3UIScrollViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UIScrollViewController: BaseViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var comfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        handleKeyboardShowing()
        userNameTextField.delegate = self
        userEmailTextField.delegate = self
        passwordTextField.delegate = self
        comfirmPasswordTextField.delegate = self
    }
    
    //Can't handle (temponary)
    private func handleKeyboardShowing() {
        var constraints: [NSLayoutConstraint] = [NSLayoutConstraint]()
        constraints.append(contentsOf: [view.keyboardLayoutGuide.topAnchor.constraint(equalTo: userEmailTextField.bottomAnchor),
                                        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
                                        view.keyboardLayoutGuide.topAnchor.constraint(equalTo: comfirmPasswordTextField.bottomAnchor)])
        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func goToPreviousScreen(_ sender: Any) {
        self.backToPreviousScreen()
    }
    
    @IBAction func register(_ sender: Any) {
        
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
}

extension Week3UIScrollViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            userEmailTextField.becomeFirstResponder()
        case userEmailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            comfirmPasswordTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
