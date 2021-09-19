//
//  localService.swift
//  TestiOS
//
//

import Foundation

class localService {
    
    static let shared = localService()
    
    func save(_ users: [user]) {
        let data = users.map { try? JSONEncoder().encode($0) }
        UserDefaults.standard.set(data, forKey: Constants.localData().KeyForUserDefaults)
    }
    
    func load() -> [user] {
        guard let encodedData = UserDefaults.standard.array(forKey: Constants.localData().KeyForUserDefaults) as? [Data] else {
            return []
        }
        
        return encodedData.map { try! JSONDecoder().decode(user.self, from: $0) }
    }
    
}
