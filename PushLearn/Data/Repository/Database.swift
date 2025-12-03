import FirebaseFirestore
protocol Database: AnyObject {
    
}
extension Firestore: Database { }

