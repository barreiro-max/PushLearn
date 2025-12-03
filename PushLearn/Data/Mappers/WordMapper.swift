import Foundation

protocol Mapper {
    associatedtype Domain
    associatedtype DTO
    
    static func toDomain(dto: DTO) -> Domain
    static func toDTO(domain: Domain) -> DTO
}

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
