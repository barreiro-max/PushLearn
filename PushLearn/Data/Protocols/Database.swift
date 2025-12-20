protocol Database {
    // MARK: - UserProfile
    func createUserProfile(_ profileDTO: UserProfileDTO) async throws
    func getUserProfile(by id: String) async throws -> UserProfileDTO
    func updateUserProfile(_ profileDTO: UserProfileDTO) async throws
    func deleteUserProfile(by id: String) async throws

    // MARK: - Words (subcollection of UserProfile)
    func addWord(_ wordDTO: WordSourceDTO, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [WordSourceDTO]
    func updateWord(_ wordDTO: WordSourceDTO, for profileId: String) async throws
    func deleteWord(wordId: String, for profileId: String) async throws
}
