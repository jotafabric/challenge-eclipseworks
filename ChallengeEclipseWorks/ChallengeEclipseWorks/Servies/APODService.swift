//
//  APODService 2.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import Foundation

class APODService {
    static let shared = APODService()
    private let apiKey = "n03vaJcdpvzk0hHleKJc33yjuPdbLtoC94THCn5w"
    private let baseURL = "https://api.nasa.gov/planetary/apod"
    
    func fetchAPOD(for date: Date) async throws -> APODItem {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        guard let url = URL(string: "\(baseURL)?api_key=\(apiKey)&date=\(dateString)") else {
            throw APODError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw APODError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(APODItem.self, from: data)
        } catch {
            throw APODError.decodingError
        }
    }
}

enum APODError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case generalError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "URL inválida"
        case .invalidResponse: return "Resposta inválida do servidor"
        case .decodingError: return "Erro ao decodificar dados"
        case .generalError: return "Ocorreu um erro"
        }
    }
}
