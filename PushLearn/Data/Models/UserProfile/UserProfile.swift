struct UserProfile {
    var id: String?
}

extension UserProfile {
    init(dto: UserProfileDTO) {
        self.id = dto.id
    }
}
