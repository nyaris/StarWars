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

class JourneyViewController: UIViewController {
    @IBOutlet weak var buttonJourney: UIButton!
    
      var delegate: JourneyViewControllerDelegate?
      let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonJourney.layer.cornerRadius = 18
        
        buttonJourney.rx.tap.bind { (_) in
               let vc = self.delegate?.didTouchButtonJourney()
               vc?.modalPresentationStyle = .fullScreen
               self.present(vc!, animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }
    
    
       public class func create(delegate: JourneyViewControllerDelegate) -> JourneyViewController {

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let view = storyboard.instantiateViewController(withIdentifier: "JourneyViewController") as! JourneyViewController
            view.delegate = delegate
            
            return view

         }
        
    }

    protocol JourneyViewControllerDelegate {
        func didTouchButtonJourney() -> UIViewController
    }
    



