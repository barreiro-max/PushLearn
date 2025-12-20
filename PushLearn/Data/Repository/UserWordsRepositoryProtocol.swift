protocol UserWordsRepositoryProtocol {
    // MARK: - UserProfile
    func create(userProfile: UserProfile) async throws
    func getUserProfile(by id: String) async throws -> UserProfile
    func update(userProfile: UserProfile) async throws
    func delete(by userProfileId: String) async throws
    
    // MARK: - Words
    func add(word: WordSource, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [WordSource]
    func update(word: WordSource, for profileId: String) async throws
    func delete(wordId: String, for profileId: String) async throws
}
