protocol WordRepository: Sendable {

    func add(word: WordSource, to profileId: String) async throws
    func getWords(for profileId: String) async throws -> [WordSource]
    func update(word: WordSource, for profileId: String) async throws
    func delete(wordId: String, for profileId: String) async throws
}
