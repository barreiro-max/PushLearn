import FirebaseFirestore

extension DocumentReference {
    func setData<T: Encodable>(
        from value: T,
        merge: Bool = true,
        encoder: Firestore.Encoder = Firestore.Encoder()
    ) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try self.setData(from: value, merge: merge) { error in
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

