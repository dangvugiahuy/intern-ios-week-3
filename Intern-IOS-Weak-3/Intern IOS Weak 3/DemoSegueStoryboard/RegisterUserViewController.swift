//
//  RegisterUserViewController.swift
//  Intern IOS Weak 3
//
//  Created by huy.dang on 8/26/24.
//

import UIKit

class RegisterUserViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "finishRegister" {
//            if let vc = segue.destination as! LandingViewController {
//                
//            }
//        }
//    }
    
    private func registerFinish() {
        let storyboard = UIStoryboard(name: "LoginFlow", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "LandingVC") as! LandingViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerUser(_ sender: Any) {
        registerFinish()
    }
}
