public struct Word {
    var id: String?
    var source: String
    var target: String
    
    init(dto: WordDTO) {
        self.id = dto.id
        self.source = dto.source
        self.target = dto.target
    }
}
