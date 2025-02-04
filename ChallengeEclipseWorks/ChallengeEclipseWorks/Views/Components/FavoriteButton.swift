//
//  FavoriteButton.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct FavoriteButton: View {
    let apod: APODItem
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel // Usa o ViewModel compartilhado
    
    var body: some View {
        Button {
            toggleFavorite()
        } label: {
            Image(systemName: favoritesViewModel.isFavorite(apod) ? "heart.fill" : "heart")
                .foregroundColor(.red)
        }
    }
    
    private func toggleFavorite() {
        if favoritesViewModel.isFavorite(apod) {
            favoritesViewModel.removeFavorite(apod)
        } else {
            favoritesViewModel.addFavorite(apod)
        }
    }
}
