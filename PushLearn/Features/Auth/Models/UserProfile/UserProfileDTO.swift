import FirebaseFirestore
struct UserProfileDTO: Codable {
    @DocumentID var id: String?
    var username: String?
    var email: String?
}

extension UserProfileDTO {
    init(domain: UserProfile) {
        self.id = domain.id
        self.username = domain.username
        self.email = domain.email
    }
}
