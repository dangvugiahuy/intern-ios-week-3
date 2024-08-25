//
//  Week3UIScrollViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/14/24.
//

import UIKit

class Week3UIScrollViewController: BaseViewController {
    
    private var isExpand:Bool = false
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var comfirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardApperence(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        userNameTextField.delegate = self
        userEmailTextField.delegate = self
        passwordTextField.delegate = self
        comfirmPasswordTextField.delegate = self
    }
    
    
    @objc func keyboardApperence(notification: NSNotification){
        if !isExpand {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = keyboardFrame.cgRectValue.height
                self.mainScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.mainScrollView.contentSize.height + keyboardHeight)
                if userEmailTextField.isEditing {
                    self.mainScrollView.setContentOffset(CGPoint(x: 0, y: userEmailTextField.frame.minY + userEmailTextField.frame.height + 10), animated: true)
                } else if passwordTextField.isEditing {
                    self.mainScrollView.setContentOffset(CGPoint(x: 0, y: passwordTextField.frame.minY + passwordTextField.frame.height + 100), animated: true)
                } else if comfirmPasswordTextField.isEditing {
                    self.mainScrollView.setContentOffset(CGPoint(x: 0, y: comfirmPasswordTextField.frame.minY + comfirmPasswordTextField.frame.height + 170), animated: true)
                }
            }
            isExpand = true
        }
    }
    
    @objc func keyboardDisappear(notification: NSNotification){
        if isExpand {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardHeight = keyboardFrame.cgRectValue.height
                self.mainScrollView.contentSize = CGSize(width: self.view.frame.width, height: self.mainScrollView.contentSize.height - keyboardHeight)
            }
            isExpand = false
        }
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
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: userEmailTextField.frame.minY + userEmailTextField.frame.height + 10), animated: true)
        case userEmailTextField:
            passwordTextField.becomeFirstResponder()
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: passwordTextField.frame.minY + passwordTextField.frame.height + 100), animated: true)
        case passwordTextField:
            comfirmPasswordTextField.becomeFirstResponder()
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: comfirmPasswordTextField.frame.minY + comfirmPasswordTextField.frame.height + 170), animated: true)
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}
