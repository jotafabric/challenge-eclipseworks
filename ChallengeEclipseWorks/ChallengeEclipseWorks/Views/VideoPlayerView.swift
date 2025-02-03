//
//  VideoPlayerView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct VideoPlayerView: View {
    let videoURL: String
    
    var body: some View {
        if let url = URL(string: videoURL) {
            Link("Ver vídeo", destination: url)
        } else {
            Text("Vídeo indisponível")
        }
    }
}
