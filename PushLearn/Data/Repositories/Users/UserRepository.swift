protocol UserRepository: Sendable {

    func create(userProfile: UserProfile) async throws
    func getUserProfile(by id: String) async throws -> UserProfile
    func update(userProfile: UserProfile) async throws
    func delete(by userProfileId: String) async throws
}
