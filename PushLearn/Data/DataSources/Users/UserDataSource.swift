protocol UserDataSource: Sendable {

    func createUserProfile(_ profileDTO: UserProfileDTO) async throws
    func getUserProfile(by id: String) async throws -> UserProfileDTO
    func updateUserProfile(_ profileDTO: UserProfileDTO) async throws
    func deleteUserProfile(by id: String) async throws
}
