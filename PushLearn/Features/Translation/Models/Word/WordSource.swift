struct WordSource {
    var id: String?
    var source: String
}

extension WordSource {
    init(dto: WordSourceDTO) {
        self.id = dto.id
        self.source = dto.source
    }
}
