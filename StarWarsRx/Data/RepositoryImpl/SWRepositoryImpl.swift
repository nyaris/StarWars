//
//  SWRepositoryImpl.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift

public class SWRepositoryImpl: SWRepository {
    
    var swListService = SWListService()
    
    func getSW() -> Single<[SWResponse]> {
        let uncleanSW: Single<SWAPIResponse> =
        swListService.getDecodedResponse()
        return uncleanSW.map ({ sw in
            sw.map()
        })
    }
    
}
