struct WordRepository: WordRepositoryProtocool {
    private let database: any Firestored
    
    init(
        database: some Firestored
    ) {
        self.database = database
    }
}
