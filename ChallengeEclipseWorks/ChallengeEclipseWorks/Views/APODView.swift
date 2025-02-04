//
//  APODView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import Foundation
import SwiftUI
import Combine

struct APODView: View {
    @StateObject private var apodViewModel = APODViewModel()
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    DatePicker("Selecione a data", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding()
                        .onChange(of: selectedDate) { newDate in
                            Task {
                                await apodViewModel.fetchAPOD(for: newDate)
                            }
                        }
                    
                    if apodViewModel.isLoading {
                        ProgressView()
                    } else if let error = apodViewModel.error {
                        ErrorView(error: error)
                    } else if let apod = apodViewModel.apodItem {
                        MediaContainer(apod: apod)
                            .overlay(alignment: .topTrailing) {
                                FavoriteButton(apod: apod)
                                    .padding()
                            }
                        APODDetailView(apod: apod)
                    }
                }
            }
            .navigationTitle("APOD NASA")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        FavoritesView()
                    } label: {
                        Label("Favoritos", systemImage: "heart.fill")
                    }
                }
            }
            .task {
                await apodViewModel.fetchAPOD(for: selectedDate)
            }
        }
        .environmentObject(favoritesViewModel) 
    }
}
