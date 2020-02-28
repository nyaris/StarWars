//
//  SWAPIResponse.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 27/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

struct SWAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PeopleResults]
    
}

struct PeopleResults: Codable {
    let name: String
    let birth_year: String
    let skin_color: String
    let gender: String
    let hair_color: String
    let height: String
    let mass: String
    
}

extension SWAPIResponse {
    func map() -> [SWResponse] {
        var list: [SWResponse] = []
        self.results.forEach { (SwModel) in
            list.append(SWResponse(name: SwModel.name, birth_year: SwModel.birth_year, skin_color: SwModel.skin_color, gender: SwModel.gender, hair_color: SwModel.hair_color, height: SwModel.height, mass: SwModel.mass))
        }
        
        return list
    }
}
