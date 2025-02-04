//
//  ChallengeEclipseWorksApp.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

@main
struct ChallengeEclipseWorksApp: App {
    @StateObject private var settingsViewModel = SettingsViewModel()

    var body: some Scene {
        WindowGroup {
            APODView()
                .environmentObject(settingsViewModel)
                .preferredColorScheme(settingsViewModel.colorScheme) 
        }
    }
}
