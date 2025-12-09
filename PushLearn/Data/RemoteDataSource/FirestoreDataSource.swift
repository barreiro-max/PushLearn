import FirebaseFirestore

struct FirestoreDataSource: Database {
    private let firestore: Firestore
    
    init(
        firestore: Firestore = .firestore()
    ) {
        self.firestore = firestore
    }
    
    private var usersRef: CollectionReference {
        firestore.collection("users")
    }
    // MARK: - UserProfile
    func createUserProfile(_ profileDTO: UserProfileDTO) async throws {
        guard let id = profileDTO.id else { return }
        let profileDocumentRef = usersRef.document(id)
        try await profileDocumentRef.setData(from: profileDTO)
    }

    func getUserProfile(by id: String) async throws -> UserProfileDTO {
        let profileDocumentRef = usersRef.document(id)
        let userDTO = try await profileDocumentRef.getDocument(as: UserProfileDTO.self)
        return userDTO
    }
    
    func updateUserProfile(_ profileDTO: UserProfileDTO) async throws {
        guard let id = profileDTO.id else { return }
        let profileDocumentRef = usersRef.document(id)
        try await profileDocumentRef.setData(from: profileDTO)
    }

    func deleteUserProfile(by id: String) async throws {
        let profileDocumentRef = usersRef.document(id)
        try await profileDocumentRef.delete()
    }
    // MARK: - Words
    
    private func wordsRef(for profileId: String) -> CollectionReference {
        let profileDocumentRef = usersRef.document(profileId)
        return profileDocumentRef.collection("words")
    }
    
    func addWord(_ wordDTO: WordDTO, to profileId: String) async throws {
        guard let id = wordDTO.id else { return }
        let wordRef = wordsRef(for: profileId).document(id)
        try await wordRef.setData(from: wordDTO)
    }

    func getWords(for profileId: String) async throws -> [WordDTO] {
        let snapshot = try await wordsRef(for: profileId).getDocuments()

        let wordDTOs = try snapshot.documents.compactMap { try $0.data(as: WordDTO.self) }
        return wordDTOs
    }
    
    func updateWord(_ wordDTO: WordDTO, for profileId: String) async throws {
        guard let id = wordDTO.id else { return }
        try await wordsRef(for: profileId).document(id).setData(from: wordDTO)
    }

    func deleteWord(wordId: String, for profileId: String) async throws {
        try await wordsRef(for: profileId).document(wordId).delete()
    }
}
