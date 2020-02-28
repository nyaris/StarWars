//
//  ViewController.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 27/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit

class JourneyViewController: UIViewController {
    @IBOutlet weak var buttonJourney: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.view.backgroundColor = UIColor(patternImage: UIImage(named: "starwars.jpg")!)
        
        buttonJourney.layer.cornerRadius = 18
    }


}

