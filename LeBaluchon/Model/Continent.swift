//
//  Continent.swift
//  LeBaluchon
//
//  Created by Sergio Canto  on 06/11/2020.
//

import Foundation

struct Continent {
    
    var continent: String?
    var country: String?
    
    enum Status {
        case accepted
        case rejected(String)
    }
    
    var status: Status {
        if continent == nil || continent == "" {
            return .rejected("Vous n'avez pas indiquez quel continent voulez-vous visiter !")
        }

        if country == nil || country == "" {
            return .rejected("Vous n'avez pas indiquez quel Pays voulez-vous visiter !")
        }
        return .accepted
    }
}
