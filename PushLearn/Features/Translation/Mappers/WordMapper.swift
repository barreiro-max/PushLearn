import Foundation

enum WordMapper: Mapper {
    typealias Domain = Word
    typealias DTO = WordDTO
    
    static func toDomain(dto: WordDTO) -> Word {
        Word(dto: dto)
    }
    
    static func toDTO(domain: Word) -> WordDTO {
        WordDTO(domain: domain)
    }
    
    static func toDomains(dto: [WordDTO]) -> [Word] {
        dto.map(WordMapper.toDomain(dto:))
    }
    
    static func toDTOs(domain: [Word]) -> [WordDTO] {
        domain.map(WordMapper.toDTO(domain:))
    }
}

enum WordSourceMapper: Mapper {
    typealias Domain = WordSource
    typealias DTO = WordSourceDTO
    
    static func toDomain(dto: WordSourceDTO) -> WordSource {
        WordSource(dto: dto)
    }
    
    static func toDTO(domain: WordSource) -> WordSourceDTO {
        WordSourceDTO(domain: domain)
    }
    
    static func toDomains(dto: [WordSourceDTO]) -> [WordSource] {
        dto.map(WordSourceMapper.toDomain(dto:))
    }
    
    static func toDTOs(domain: [WordSource]) -> [WordSourceDTO] {
        domain.map(WordSourceMapper.toDTO(domain:))
    }
}
