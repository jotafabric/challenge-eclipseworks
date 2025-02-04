//
//  SettingsViewModel.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//


import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var selectedTheme: Theme = .system
    
    enum Theme: String, CaseIterable {
        case system = "Sistema"
        case light = "Claro"
        case dark = "Escuro"
    }
    
    var colorScheme: ColorScheme? {
        switch selectedTheme {
        case .system:
            return nil
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}
