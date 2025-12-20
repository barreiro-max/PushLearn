struct UserWordsRepository: UserWordsRepositoryProtocol {
    private let database: any Database
    
    init(
        database: some Database
    ) {
        self.database = database
    }
    
    // MARK: - UserProfile
    func create(userProfile: UserProfile) async throws {
        let profileDTO = UserMapper.toDTO(domain: userProfile)
        try await database.createUserProfile(profileDTO)
    }
    
    func getUserProfile(by id: String) async throws -> UserProfile {
        let fetchProfileDTO = try await database.getUserProfile(by: id)
        return UserMapper.toDomain(dto: fetchProfileDTO)
    }

    func update(userProfile: UserProfile) async throws {
        let profileDTO = UserMapper.toDTO(domain: userProfile)
        try await database.updateUserProfile(profileDTO)
    }

    func delete(by userProfileId: String) async throws {
        try await database.deleteUserProfile(by: userProfileId)
    }
    
    // MARK: - Words
    func add(word: WordSource, to profileId: String) async throws {
        let wordDTO = WordSourceMapper.toDTO(domain: word)
        try await database.addWord(wordDTO, to: profileId)
    }
    
    func getWords(for profileId: String) async throws -> [WordSource] {
        let fetchedWordDTOs = try await database.getWords(for: profileId)
        return WordSourceMapper.toDomains(dto: fetchedWordDTOs)
    }
    
    func update(word: WordSource, for profileId: String) async throws {
        let wordDTO = WordSourceMapper.toDTO(domain: word)
        try await database.updateWord(wordDTO, for: profileId)
    }
    
    func delete(wordId: String, for profileId: String) async throws {
        try await database.deleteWord(wordId: wordId, for: profileId)
    }
}
