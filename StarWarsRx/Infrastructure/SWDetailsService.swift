//
//  SWDetailsService.swift
//  StarWarsRx
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 28/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

class PokemonListService: MoyaService {
    override var baseURL: URL {
        return URL(string: "https://swapi.co/api/")!
    }
    
    override var path: String {
        return "people"
    }
}

