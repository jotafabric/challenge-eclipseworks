import Foundation

struct Apod: Codable, Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let explanation: String
    let url: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case title, date, explanation, url
        case mediaType = "media_type"
    }
}
