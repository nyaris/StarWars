//
//  SwUseCase.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift

public class SwUseCase {
    let swRepo: SWRepository
    
    init (swRepository: SWRepository) {
        self.swRepo = swRepository
    }
    
    public func listSW() -> Single<[SWResponse]> {
        return swRepo.getSW()
    }
    
    
}
