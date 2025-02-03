import SwiftUI

class ApodViewModel: ObservableObject {
    @Published var apod: Apod?
    @Published var favorites: [Apod] = []
    private let service = ApodService()
    
    var isFavorite: Bool {
        guard let apod = apod else { return false }
        return favorites.contains(where: { $0.date == apod.date })
    }
    
    func fetchApod(date: String? = nil) {
        service.fetchApod(date: date) { [weak self] apod in
            self?.apod = apod
        }
    }
    
    func toggleFavorite() {
        guard let apod = apod else { return }
        if isFavorite {
            favorites.removeAll { $0.date == apod.date }
        } else {
            favorites.append(apod)
        }
    }
}
