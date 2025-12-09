import Foundation
import FirebaseAuth

enum UserMapper: Mapper {
    typealias Domain = UserProfile
    typealias DTO = UserProfileDTO
    
    static func toDomain(dto: UserProfileDTO) -> UserProfile {
        UserProfile(dto: dto)
    }
    
    static func toDTO(domain: UserProfile) -> UserProfileDTO {
        UserProfileDTO(domain: domain)
    }
    
    static func toDomain(firebaseUser: User) -> UserProfile {
        UserProfile(
            id: firebaseUser.uid,
            username: firebaseUser.displayName,
            email: firebaseUser.email
        )
    }
    
    static func toDomains(dto: [UserProfileDTO]) -> [UserProfile] {
        dto.map(toDomain(dto:))
    }
    
    static func toDTOs(domain: [UserProfile]) -> [UserProfileDTO] {
        domain.map(toDTO(domain:))
    }
}

