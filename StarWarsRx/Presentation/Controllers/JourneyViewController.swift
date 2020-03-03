//
//  JourneyViewController.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 27/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseAuth

class JourneyViewController: UIViewController {
    @IBOutlet weak var buttonJourney: UIButton!
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    @IBOutlet weak var buttonFacebook: UIButton!
    var delegate: JourneyViewControllerDelegate?
    let disposeBag = DisposeBag()
    var appDI = AppDIContainer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonFacebook.layer.cornerRadius = 16
        textFieldUser.layer.masksToBounds = true
        textFieldUser.layer.cornerRadius = 16
        textFieldPassword.layer.masksToBounds = true
        textFieldPassword.layer.cornerRadius = 16
        
        
        let imageView = UIImageView(image: UIImage(named: "skywalker"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleToFill
        

        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = imageView.bounds
        imageView.addSubview(blurredEffectView)
        
        
        buttonJourney.layer.cornerRadius = 18
        
    }
       public class func create(delegate: JourneyViewControllerDelegate) -> JourneyViewController {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view = storyboard.instantiateViewController(withIdentifier: "JourneyViewController") as! JourneyViewController
            view.delegate = delegate
            
            return view

         }
        
    @IBAction func buttonFace(_ sender: Any) {
     UIApplication.shared.openURL(URL(string: "https://www.facebook.com")!)
        
    }
    
    @IBAction func buttonInscrever(_ sender: Any) {
        
        let vc = RegisterViewController.instantiate()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func buttonLogin(_ sender: Any) {
        
        if let email = textFieldUser.text, let password = textFieldPassword.text{
            Auth.auth().signIn(withEmail: email, password: password, completion:{ user, error in
                if let firebaseError = error{
                    print(firebaseError.localizedDescription)
                    return
                }
                
                let vc = self.delegate?.didTouchButtonJourney()
                vc?.modalPresentationStyle = .fullScreen
                self.present(vc!, animated: true, completion: nil)
                
                print("Usuário logado")
                
            })
        }
        
    }
}

    protocol JourneyViewControllerDelegate {
        func didTouchButtonJourney() -> UIViewController
    }
    



