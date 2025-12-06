struct UserProfile {
    var id: String?
    var username: String?
    var email: String?
}

extension UserProfile {
    init(dto: UserProfileDTO) {
        self.id = dto.id
        self.username = dto.username
        self.email = dto.email
    }
}
