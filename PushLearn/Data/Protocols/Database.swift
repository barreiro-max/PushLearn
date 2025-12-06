protocol Database {
    // MARK: - UserProfile
    func createUserProfile(_ profileDTO: UserProfileDTO) async throws
    func getUserProfile(by id: String) async throws -> UserProfileDTO
    func updateUserProfile(_ profileDTO: UserProfileDTO) async throws
    func deleteUserProfile(by id: String) async throws

    // MARK: - Words (subcollection of UserProfile)
    func addWord(_ wordDTO: WordDTO, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [WordDTO]
    func updateWord(_ wordDTO: WordDTO, for profileId: String) async throws
    func deleteWord(wordId: String, for profileId: String) async throws
}
