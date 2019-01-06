//
//  ViewController.swift
//  LoginScreen
//
//  Created by Сергей Иванов on 05/01/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

extension UIViewController{
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    let userName = "User"
    let password = "123"
    var prepareData = ""
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = prepareData
        }
    
    @IBAction func unwind (segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        }
    
    @IBAction func Login(_ sender: UIButton) {
        if userNameTextField.text == userName && passwordTextField.text == password {
            prepareData = "Welcome"
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    @IBAction func forgotUN(_ sender: UIButton) {
        prepareData = "Username recovery"
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func forgotP(_ sender: UIButton) {
        prepareData = "Password recovery"
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
}

