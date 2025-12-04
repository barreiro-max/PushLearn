import FirebaseFirestore

extension CollectionReference {
    func addDocument<T: Encodable>(
        from value: T,
        encoder: Firestore.Encoder = Firestore.Encoder()
    ) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try self.addDocument(from: value, encoder: encoder) { error in
                    if let error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume()
                    }
                }
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
}
