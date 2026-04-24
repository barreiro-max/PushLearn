@preconcurrency import FirebaseFirestore

struct FirestoreUserDataSource: UserDataSource {

    private let firestore: Firestore

    private var usersRef: CollectionReference {
        firestore.collection("users")
    }

    init(firestore: Firestore = .firestore()) {
        self.firestore = firestore
    }

    func createUserProfile(_ profileDTO: UserProfileDTO) async throws {
        guard let id = profileDTO.id else {
            return
        }

        try await usersRef
            .document(id)
            .setData(from: profileDTO)
    }

    func getUserProfile(by id: String) async throws -> UserProfileDTO {
        try await usersRef
            .document(id)
            .getDocument(as: UserProfileDTO.self)
    }

    func updateUserProfile(_ profileDTO: UserProfileDTO) async throws {
        guard let id = profileDTO.id else {
            return
        }

        try await usersRef
            .document(id)
            .setData(from: profileDTO)
    }

    func deleteUserProfile(by id: String) async throws {
        try await usersRef
            .document(id)
            .delete()
    }
}
