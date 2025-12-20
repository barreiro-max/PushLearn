import FirebaseFirestore

struct WordSourceDTO: Codable {
    @DocumentID var id: String?
    var source: String
}

extension WordSourceDTO {
    init(domain: WordSource) {
        self.id = domain.id
        self.source = domain.source
    }
}
