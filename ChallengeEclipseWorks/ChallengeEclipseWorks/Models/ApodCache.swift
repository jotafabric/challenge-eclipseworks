//
//  ApodCache.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import Foundation

class ApodCache: NSObject, NSCoding {
    let apod: Apod
    
    init(apod: Apod) {
        self.apod = apod
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(try? JSONEncoder().encode(apod), forKey: "apod")
    }
    
    required init?(coder: NSCoder) {
        if let data = coder.decodeObject(forKey: "apod") as? Data,
           let apod = try? JSONDecoder().decode(Apod.self, from: data) {
            self.apod = apod
        } else {
            return nil
        }
    }
}
