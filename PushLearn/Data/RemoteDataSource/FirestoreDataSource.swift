import FirebaseFirestore

protocol Database {
    func add(word: Word)
    func fetchWords() -> [Word]
    func update(wordId: String)
    func delete(wordId: String)
}

struct FirestoreDataSource: Database {
    private let firestore: Firestore
    
    init(
        firestore: Firestore = .firestore()
    ) {
        self.firestore = firestore
    }
    
    public func add(word: Word) {
        
    }
    
    public func fetchWords() -> [Word] {
        []
    }
    
    public func update(wordId: String) {
        
    }
    
    public func delete(wordId: String) {
        
    }
    
}
