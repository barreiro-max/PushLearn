protocol UserWordsRepositoryProtocol {
    // MARK: - UserProfile
    func createUserProfile(_ profile: UserProfile) async throws
    func getUserProfile(by id: String) async throws -> UserProfile
    func updateUserProfile(_ profile: UserProfile) async throws
    func deleteUserProfile(by id: String) async throws
    
    // MARK: - Words
    func addWord(_ word: Word, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [Word]
    func updateWord(_ word: Word, for profileId: String) async throws
    func deleteWord(wordId: String, for profileId: String) async throws
}
