import FirebaseFirestore
public struct WordDTO: Codable {
    @DocumentID var id: String?
    var source: String
    var target: String
    
    enum CodingKeys: String, CodingKey {
        case id = "word_id"
        case source
        case target
    }
}

extension WordDTO {
    init(domain: Word) {
        self.id = domain.id
        self.source = domain.source
        self.target = domain.target
    }
}
