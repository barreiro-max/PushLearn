protocol Mapper: Sendable {

    associatedtype Domain: Sendable
    associatedtype DTO: Codable & Sendable

    static func toDomain(dto: DTO) -> Domain
    static func toDTO(domain: Domain) -> DTO
}
