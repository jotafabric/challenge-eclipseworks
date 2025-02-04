//
//  SettingsView.swift
//  ChallengeEclipseWorks
//
//  Created by Josias Fabrício on 03/02/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var settingsViewModel: SettingsViewModel
    
    var body: some View {
        Form {
            Section(header: Text("Tema")) {
                Picker("Selecione o tema", selection: $settingsViewModel.selectedTheme) {
                    ForEach(SettingsViewModel.Theme.allCases, id: \.self) { theme in
                        Text(theme.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Configurações")
    }
}
