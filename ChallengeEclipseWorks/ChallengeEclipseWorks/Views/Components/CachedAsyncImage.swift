//
//  CachedAsyncImage.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

import SwiftUI

struct CachedAsyncImage: View {
    let url: URL?
    
    var body: some View {
        Group {
            if let url = url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
        }
    }
}
