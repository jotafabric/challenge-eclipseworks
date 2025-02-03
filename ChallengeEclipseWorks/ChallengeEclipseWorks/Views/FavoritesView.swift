//
//  FavoritesView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: ApodViewModel
    
    var body: some View {
        List(viewModel.favorites) { apod in
            VStack(alignment: .leading) {
                Text(apod.title).font(.headline)
                Text(apod.date).font(.subheadline)
            }
        }
        .navigationTitle("Favoritos")
    }
}
