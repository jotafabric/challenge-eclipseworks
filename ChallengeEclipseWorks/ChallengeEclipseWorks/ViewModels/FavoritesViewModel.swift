//
//  FavoritesViewModel.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI
import Foundation

class FavoritesViewModel: ObservableObject {
    @Published var favorites: [APODItem] = []
    
    func addFavorite(_ item: APODItem) {
        if !favorites.contains(where: { $0.id == item.id }) {
            favorites.append(item)
        }
    }
    
    func removeFavorite(_ item: APODItem) {
        favorites.removeAll { $0.id == item.id }
    }
    
    func isFavorite(_ item: APODItem) -> Bool {
        favorites.contains { $0.id == item.id }
    }
}
