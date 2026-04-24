struct WordRepositoryImpl: WordRepository {

    private let datasource: WordDataSource

    init(datasource: WordDataSource) {
        self.datasource = datasource
    }

    func add(word: WordSource, to profileId: String) async throws {
        let wordDTO = WordSourceMapper.toDTO(domain: word)
        try await datasource.addWord(wordDTO, to: profileId)
    }

    func getWords(for profileId: String) async throws -> [WordSource] {
        let fetchedWordDTOs = try await datasource.getWords(for: profileId)
        return WordSourceMapper.toDomains(dto: fetchedWordDTOs)
    }

    func update(word: WordSource, for profileId: String) async throws {
        let wordDTO = WordSourceMapper.toDTO(domain: word)
        try await datasource.updateWord(wordDTO, for: profileId)
    }

    func delete(wordId: String, for profileId: String) async throws {
        try await datasource.deleteWord(wordId: wordId, for: profileId)
    }
}
