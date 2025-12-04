import FirebaseFirestore

extension CollectionReference {
    func addDocument<T: Encodable>(
        from value: T,
        encoder: Firestore.Encoder = Firestore.Encoder()
    ) async throws -> DocumentReference {
        try await withCheckedThrowingContinuation { continuation in
            
        }
    }
}
