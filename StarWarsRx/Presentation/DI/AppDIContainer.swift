//
//  AppDIContainer.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import UIKit

class AppDIContainer {
    
    var window: UIWindow?
        
        
  public func makeHomeViewController() -> JourneyViewController {
            return JourneyViewController.create(delegate: self)
            
        }
        
    }


extension AppDIContainer: JourneyViewControllerDelegate {
    func didTouchButtonJourney() -> UIViewController {
        let swRepo = SWRepositoryImpl()
        let usecase = SwUseCase(swRepository: swRepo)
        let vm = ListViewModel(usecase: usecase)
        let vc = ListViewController.instantiate(viewModel: vm)
        
        return vc
        
    }
    

}




