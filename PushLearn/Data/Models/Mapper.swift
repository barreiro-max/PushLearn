protocol Mapper {
    associatedtype Domain
    associatedtype DTO
    
    static func toDomain(dto: DTO) -> Domain
    static func toDTO(domain: Domain) -> DTO
}
