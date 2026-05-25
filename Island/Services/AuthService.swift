import SwiftUI
import Supabase

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var state: AuthState = AuthState(status: .unknown)

    private let client = SupabaseService.shared.client

    // MARK: - Sign In

    func signInWithGoogle() async {
        do {
            try await client.auth.signInWithOAuth(provider: .google) { _ in }
            await refreshState()
        } catch {
            state = AuthState(status: .unauthenticated, errorMessage: error.localizedDescription)
        }
    }

    func signInWithApple() async {
        do {
            try await client.auth.signInWithOAuth(provider: .apple) { _ in }
            await refreshState()
        } catch {
            state = AuthState(status: .unauthenticated, errorMessage: error.localizedDescription)
        }
    }

    func signInWithPhone(_ phone: String) async {
        do {
            try await client.auth.signInWithOTP(phone: phone)
        } catch {
            state = AuthState(status: .unauthenticated, errorMessage: error.localizedDescription)
        }
    }

    func verifyOTP(phone: String, code: String) async {
        do {
            try await client.auth.verifyOTP(phone: phone, token: code, type: .sms)
            await refreshState()
        } catch {
            state.errorMessage = error.localizedDescription
        }
    }

    // MARK: - Sign Out

    func signOut() async {
        do {
            try await client.auth.signOut()
            state = AuthState(status: .unauthenticated)
        } catch {
            state.errorMessage = error.localizedDescription
        }
    }

    // MARK: - State

    func refreshState() async {
        do {
            let session = try await client.auth.session
            let profile = try? await fetchProfile(userId: session.user.id.uuidString)
            state = AuthState(
                status: .authenticated,
                userId: session.user.id.uuidString,
                profile: profile
            )
        } catch {
            state = AuthState(status: .unauthenticated)
        }
    }

    private func fetchProfile(userId: String) async throws -> Profile {
        let response: Profile = try await client
            .from("profiles")
            .select()
            .eq("id", value: userId)
            .single()
            .execute()
            .value
        return response
    }
}

// MARK: - Auth State

struct AuthState {
    enum Status { case unknown, authenticated, unauthenticated }
    var status: Status
    var userId: String?
    var profile: Profile?
    var errorMessage: String?
}
