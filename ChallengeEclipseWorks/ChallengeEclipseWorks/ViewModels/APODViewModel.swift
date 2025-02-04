//
//  APODViewModel.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

@MainActor
class APODViewModel: ObservableObject {
    @Published var apodItem: APODItem?
    @Published var isLoading = false
    @Published var error: APODError?
    
    private let service = APODService.shared
    
    func fetchAPOD(for date: Date) async {
        isLoading = true
        do {
            apodItem = try await service.fetchAPOD(for: date)
            error = nil
        } catch let error as APODError {
            self.error = error
        } catch {
            self.error = .generalError
        }
        isLoading = false
    }
}
