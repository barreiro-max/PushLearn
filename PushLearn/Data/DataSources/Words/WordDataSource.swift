protocol WordDataSource: Sendable {

    func addWord(_ wordDTO: WordSourceDTO, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [WordSourceDTO]
    func updateWord(_ wordDTO: WordSourceDTO, for profileId: String) async throws
    func deleteWord(wordId: String, for profileId: String) async throws
}
