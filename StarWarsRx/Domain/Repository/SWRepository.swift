//
//  SWRepository.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import RxSwift

protocol SWRepository {
    func getSW() -> Single<[SWResponse]>

}

