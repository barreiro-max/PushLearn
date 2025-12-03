import FirebaseFirestore

protocol WordRepositoryProtocool {
    
}

struct WordRepository: WordRepositoryProtocool {
    private let database: any Database
    
    init(
        database: some Database
    ) {
        self.database = database
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
