import FirebaseFirestore
struct UserProfileDTO: Codable {
    @DocumentID var id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
    }
}

extension UserProfileDTO {
    init(domain: UserProfile) {
        self.id = domain.id
    }
}
