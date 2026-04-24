@preconcurrency import FirebaseFirestore

struct FirestoreWordDataSource: WordDataSource {

    private let firestore: Firestore

    init(firestore: Firestore = .firestore()) {
        self.firestore = firestore
    }

    func addWord(_ wordDTO: WordSourceDTO, to profileId: String) async throws {
        guard let id = wordDTO.id else {
            return
        }

        try await wordsRef(for: profileId)
            .document(id)
            .setData(from: wordDTO)
    }

    func getWords(for profileId: String) async throws -> [WordSourceDTO] {
        let snapshot = try await wordsRef(for: profileId).getDocuments()

        return try snapshot.documents.compactMap {
            try $0.data(as: WordSourceDTO.self)
        }
    }

    func updateWord(_ wordDTO: WordSourceDTO, for profileId: String) async throws {
        guard let id = wordDTO.id else {
            return
        }

        try await wordsRef(for: profileId)
            .document(id)
            .setData(from: wordDTO)
    }

    func deleteWord(wordId: String, for profileId: String) async throws {
        try await wordsRef(for: profileId)
            .document(wordId)
            .delete()
    }

    private func wordsRef(for profileId: String) -> CollectionReference {
        firestore
            .collection("users")
            .document(profileId)
            .collection("words")
    }
}
