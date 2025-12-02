import FirebaseFirestore

struct WordRepository: WordRepositoryProtocool {
    private let database: Firestore
    
    init(
        database: Firestore
    ) {
        self.database = database
    }
}
