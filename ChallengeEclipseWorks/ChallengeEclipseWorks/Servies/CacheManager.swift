import Foundation

class CacheManager {
    static let shared = CacheManager()
    private let cache = NSCache<NSString, ApodCache>()
    
    func getApod(forKey key: String) -> Apod? {
        return cache.object(forKey: key as NSString)?.apod
    }
    
    func saveApod(_ apod: Apod, forKey key: String) {
        cache.setObject(ApodCache(apod: apod), forKey: key as NSString)
    }
}
