import Foundation

class ApodService {
    private let apiKey = "n03vaJcdpvzk0hHleKJc33yjuPdbLtoC94THCn5w"
    
    func fetchApod(date: String? = nil, completion: @escaping (Apod?) -> Void) {
        var urlString = "https://api.nasa.gov/planetary/apod?api_key=\(apiKey)"
        if let date = date {
            urlString += "&date=\(date)"
        }
        
        if let cachedApod = CacheManager.shared.getApod(forKey: urlString) {
            completion(cachedApod)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    if let fetchedApod = try? JSONDecoder().decode(Apod.self, from: data) {
                        CacheManager.shared.saveApod(fetchedApod, forKey: urlString)
                        completion(fetchedApod)
                    } else {
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

