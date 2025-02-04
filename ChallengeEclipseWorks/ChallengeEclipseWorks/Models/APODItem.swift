//
//  APODItem.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import Foundation

struct APODItem: Codable, Identifiable, Equatable {
    let id = UUID()
    let date: String
    let title: String
    let explanation: String
    let url: String
    let media_type: String
    let copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case date, title, explanation, url, media_type, copyright
    }
}
