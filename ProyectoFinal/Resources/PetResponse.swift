//
//  PetResponse.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

struct PetResponse : Decodable {
    let name: String
    let type: String
    let birthday: String?
    let color: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type = "tipo"
        case birthday
        case color
    }
}
