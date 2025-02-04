//
//  APODDetails.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct APODDetailView: View {
    let apod: APODItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(apod.title)
                .font(.title.bold())
            
            Text(apod.date)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            Text(apod.explanation)
                .font(.body)
            
            if let copyright = apod.copyright {
                Text("© \(copyright)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}
