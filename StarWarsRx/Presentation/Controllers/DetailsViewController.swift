//
//  DetailsViewController.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import UIKit
import RxSwift


class DetailsViewController: UIViewController {
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayView: UIView!
    @IBOutlet weak var skinView: UIView!
    @IBOutlet weak var massView: UIView!
    
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var hairView: UIView!
    @IBOutlet weak var genderView: UIView!
    
    var viewModel: DetailsViewModel!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdayView.layer.cornerRadius = 20
        skinView.layer.cornerRadius = 20
        massView.layer.cornerRadius = 20
        heightView.layer.cornerRadius = 20
        hairView.layer.cornerRadius = 20
        genderView.layer.cornerRadius = 20
        
        
        setup()
    }
    
    static func instantiate(viewModel: DetailsViewModel) -> DetailsViewController {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           let view = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
           view.viewModel = viewModel
           return view
       }
    
      
    func setup() {
        nameLabel.text = viewModel.name 
        birthdayLabel.text = viewModel.birth_day
        skinColorLabel.text = viewModel.skin_color
        genderLabel.text = viewModel.gender
        hairColorLabel.text = viewModel.hair_color
        massLabel.text = viewModel.mass
        heightLabel.text = viewModel.height
        
        
    }
}
