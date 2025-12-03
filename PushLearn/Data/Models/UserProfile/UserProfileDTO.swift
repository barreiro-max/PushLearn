import FirebaseFirestore
struct UserProfileDTO: Codable {
    @DocumentID var id: String?
}
