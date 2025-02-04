//
//  FavoritesView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesViewModel: FavoritesViewModel // Usa o ViewModel compartilhado
    
    var body: some View {
        NavigationStack {
            List {
                if favoritesViewModel.favorites.isEmpty {
                    Text("Nenhum favorito adicionado ainda.")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(favoritesViewModel.favorites) { favorite in
                        NavigationLink {
                            APODDetailView(apod: favorite)
                        } label: {
                            FavoriteRow(favorite: favorite)
                        }
                    }
                    .onDelete(perform: deleteFavorites)
                }
            }
            .navigationTitle("Favoritos")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func deleteFavorites(at offsets: IndexSet) {
        offsets.forEach { index in
            let favorite = favoritesViewModel.favorites[index]
            favoritesViewModel.removeFavorite(favorite)
        }
    }
}

struct FavoriteRow: View {
    let favorite: APODItem
    
    var body: some View {
        HStack(spacing: 12) {
            if favorite.media_type == "image" {
                CachedAsyncImage(url: URL(string: favorite.url))
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
            } else {
                Image(systemName: "video.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(favorite.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(favorite.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 8)
    }
}
