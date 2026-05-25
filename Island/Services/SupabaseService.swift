import Foundation
import Supabase

final class SupabaseService {
    static let shared = SupabaseService()

    let client: SupabaseClient

    private init() {
        let urlStr = ProcessInfo.processInfo.environment["SUPABASE_URL"] ?? "YOUR_SUPABASE_URL"
        let key = ProcessInfo.processInfo.environment["SUPABASE_ANON_KEY"] ?? "YOUR_SUPABASE_ANON_KEY"

        guard let url = URL(string: urlStr) else {
            fatalError("Invalid SUPABASE_URL: \(urlStr)")
        }

        client = SupabaseClient(supabaseURL: url, supabaseKey: key)
    }
}
