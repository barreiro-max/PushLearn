import FirebaseFirestore
public struct WordDTO: Codable {
    @DocumentID var id: String?
    var source: String
    var target: String
}

extension WordDTO {
    init(domain: Word) {
        self.id = domain.id
        self.source = domain.source
        self.target = domain.target
    }
}
