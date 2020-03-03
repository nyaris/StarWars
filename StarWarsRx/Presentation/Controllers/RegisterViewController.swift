//
//  RegisterViewController.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 03/03/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var buttonRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldEmail.layer.masksToBounds = true
        textFieldEmail.layer.cornerRadius = 16
        textFieldPassword.layer.masksToBounds = true
        textFieldPassword.layer.cornerRadius = 16
        buttonRegister.layer.cornerRadius = 16

      
    }
    
    static func instantiate() -> RegisterViewController {
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let view = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
              return view
          }
    

    @IBAction func buttonRegister(_ sender: Any) {
        
        if let email = textFieldEmail.text, let password = textFieldPassword.text{
            Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
        
                self.dismiss(animated: true, completion: nil)
                
            })
            
        }
        
    }
    
}

