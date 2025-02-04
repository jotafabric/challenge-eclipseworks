//
//  ErrorView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import SwiftUI

struct ErrorView: View {
    let error: APODError
    var retryAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.yellow)
            
            Text("Ocorreu um erro")
                .font(.title)
                .bold()
            
            Text(error.errorDescription ?? "Erro desconhecido")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            if let suggestion = error.recoverySuggestion {
                Text(suggestion)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            if let retryAction = retryAction {
                Button(action: retryAction) {
                    Text("Tentar novamente")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
    }
}