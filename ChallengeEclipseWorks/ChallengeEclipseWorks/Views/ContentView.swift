//
//  ContentView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject private var viewModel = ApodViewModel()
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Selecionar Data", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    .onChange(of: selectedDate) { _  in
                        viewModel.fetchApod(date: selectedDate.toApiFormat())
                    }
                
                if let apod = viewModel.apod {
                    if apod.mediaType == "image" {
                        AsyncImage(url: URL(string: apod.url)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                    } else if apod.mediaType == "video" {
                        VideoPlayerView(videoURL: apod.url)
                    }
                    
                    Text(apod.title).font(.headline)
                    Text(apod.date).font(.subheadline)
                    Text(apod.explanation).padding()
                    
                    Button(action: {
                        viewModel.toggleFavorite()
                    }) {
                        Label(viewModel.isFavorite ? "Remover dos Favoritos" : "Adicionar aos Favoritos", systemImage: viewModel.isFavorite ? "heart.fill" : "heart")
                    }
                    .padding()
                } else {
                    ProgressView().onAppear {
                        viewModel.fetchApod()
                    }
                }
            }
            .navigationTitle("Imagem Astronômica do Dia")
            .toolbar {
                NavigationLink(destination: FavoritesView(viewModel: viewModel)) {
                    Text("Favoritos")
                }
            }
        }
    }
}

extension Date {
    func toApiFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}
