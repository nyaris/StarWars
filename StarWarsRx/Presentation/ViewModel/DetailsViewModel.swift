//
//  DetailsViewModel.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 02/03/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


public protocol DetailsViewModelContract {
    var name: String { get }
    var birth_day: String { get }
    var skin_color: String { get }
    var gender: String { get }
    var hair_color: String { get }
    var height: String { get }
    var mass: String { get }
}

public class DetailsViewModel: DetailsViewModelContract {
    let disposeBag = DisposeBag()
    var usecase: SwUseCase
    var swResponse: SWResponse
       
    public var name: String {
        return swResponse.name
    }
    
    public var birth_day: String {
        return swResponse.birth_year
    }
    
    public var skin_color: String {
        return swResponse.skin_color
    }
    
    public var gender: String {
        return swResponse.gender
    }
    
    public var hair_color: String {
        return swResponse.hair_color
    }
    
    public var height: String {
        return swResponse.height
    }
    
    public var mass: String {
        return swResponse.mass
    }
     
    
    init(usecase: SwUseCase, swResponse: SWResponse) {
        self.usecase = usecase
        self.swResponse = swResponse
    }
}
