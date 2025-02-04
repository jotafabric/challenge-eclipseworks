//
//  MediaContainer.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct MediaContainer: View {
    let apod: APODItem
    
    var body: some View {
        Group {
            if apod.media_type == "image" {
                CachedAsyncImage(url: URL(string: apod.url))
            } else {
                VideoView(videoURL: apod.url)
                    .frame(height: 300)
                    .cornerRadius(12)
            }
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
