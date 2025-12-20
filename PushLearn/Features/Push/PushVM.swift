import Foundation
import FirebaseAuth

@MainActor
@Observable final public class PushVM {
    private let validator: any WordValidated
    private let repository: any UserWordsRepositoryProtocol
    private let store: any LanguageStoreSettings
    
    var state: WordState = .idle
    
    init(
        validator: some WordValidated,
        repository: some UserWordsRepositoryProtocol,
        store: some LanguageStoreSettings
    ) {
        self.validator = validator
        self.repository = repository
        self.store = store
    }
    
    func push(sourceText: String) {
        state = .idle
        
        state = validator.getWordState(
            word: sourceText,
            for: store.source.minimalIdentifier
        )
        
        guard case .validationSuccess = state
        else { return }
        
        Task { @MainActor in
            do {
                guard let user = Auth.auth().currentUser
                else { return }
                
                let word = WordSource(
                    id: sourceText,
                    source: sourceText
                )
                
                try await repository.add(word: word, to: user.uid)
            } catch {
                state = .failure(error: error.repositoryErrorMessage)
            }
        }
    }
}
