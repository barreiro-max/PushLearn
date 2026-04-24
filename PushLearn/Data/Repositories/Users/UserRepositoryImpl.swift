struct UserRepositoryImpl: UserRepository {

    private let datasource: UserDataSource

    init(datasource: UserDataSource) {
        self.datasource = datasource
    }

    func create(userProfile: UserProfile) async throws {
        let profileDTO = UserMapper.toDTO(domain: userProfile)
        try await datasource.createUserProfile(profileDTO)
    }

    func getUserProfile(by id: String) async throws -> UserProfile {
        let fetchProfileDTO = try await datasource.getUserProfile(by: id)
        return UserMapper.toDomain(dto: fetchProfileDTO)
    }

    func update(userProfile: UserProfile) async throws {
        let profileDTO = UserMapper.toDTO(domain: userProfile)
        try await datasource.updateUserProfile(profileDTO)
    }

    func delete(by userProfileId: String) async throws {
        try await datasource.deleteUserProfile(by: userProfileId)
    }
}
