//
//  Creature.swift
//  CatchEmAll
//
//  Created by Remi Pacifico Hansen on 11/7/22.
//

import Foundation


struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name, url
    }
}



