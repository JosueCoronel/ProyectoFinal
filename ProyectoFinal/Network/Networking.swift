//
//  Networking.swift
//  ProyectoFinal
//
//  Created by Maximo Josue Coronel Flores on 17/12/22.
//

import Foundation

protocol RemoteRespository {
    func fetchPets() -> [PetResponse]
    func fetchTrendingPets() -> [PetResponse]
}

class PetSocialAPI: RemoteRespository {
    func fetchPets() -> [PetResponse] {
        return []
    }
    
    func fetchTrendingPets() -> [PetResponse] {
        return []
    }
}

class PetsMocksAPI: RemoteRespository {
    func fetchPets() -> [PetResponse] {
        return []
    }
    
    func fetchTrendingPets() -> [PetResponse] {
        
        let resource = "pets_success"
        if let url = Bundle.main.url(forResource: resource, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                
                // API real
                let decoder = JSONDecoder()
                let result = try decoder.decode([PetResponse].self, from: data)
                return result
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        
        return []
    }
    
    
}

protocol ExternalAPI {
    
}

class FirebaseAPI : ExternalAPI {
    
}

class CompetenciaFirebaseAPI : ExternalAPI {
    
}

class MiPropioAPI : ExternalAPI {
    
}

protocol DataBase {
    func getData()
    func saveData(_ data: String)
    func updateData(_ value: String)
    func deleteData(_ value: String)
}

class UserDefaultDataBase : DataBase {
    func getData() {
        
    }
    
    func saveData(_ data: String) {
        
    }
    
    func updateData(_ value: String) {
        
    }
    
    func deleteData(_ value: String) {
        
    }
}

class CoreDataDataBase: DataBase {
    func getData() {
        
    }
    
    func saveData(_ data: String) {
        
    }
    
    func updateData(_ value: String) {
        
    }
    
    func deleteData(_ value: String) {
        
    }
    
    
}

