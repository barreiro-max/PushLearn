import XCTest
@testable import PushLearn

final class WordValidator_Tests: XCTestCase {
    
    var sut: WordValidated!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = WordValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - isCorrectLanguage(for word: String, for languageCode: String) -> Bool
    
    func test_WordValidator_isCorrectLanguage_validEnglishWord_returnsTrue() {
        let result = sut.isCorrectLanguage(for: "apple", for: "en")
        
        XCTAssertTrue(result)
    }
    
    func test_WordValidator_isCorrectLanguage_invalidEnglishWord_returnsFalse() {
        let result = sut.isCorrectLanguage(for: "яблуко", for: "en")
        
        XCTAssertFalse(result)
    }
    
    func test_WordValidator_isCorrectLanguage_validUkrainianWord_returnsTrue() {
        let result = sut.isCorrectLanguage(for: "яблуко", for: "uk")
        
        XCTAssertTrue(result)
    }
    
    func test_WordValidator_isCorrectLanguage_invalidUkrainianWord_returnsFalse() {
        let result = sut.isCorrectLanguage(for: "apple", for: "uk")
        
        XCTAssertFalse(result)
    }
    
    // MARK: - isReal(word: String, for languageCode: String) -> Bool
    
    func test_WordValidator_isReal_existingEnglishWord_returnsTrue() {
        let result = sut.isReal(word: "apple", for: "en")
        
        XCTAssertTrue(result)
    }
    
    func test_WordValidator_isReal_nonExistingEnglishWord_returnsFalse() {
        let result = sut.isReal(word: "asdasdzz", for: "en")
        
        XCTAssertFalse(result)
    }
    
    // MARK: - getWordState(word: String, for languageCode: String) -> WordState
    
    func test_WordValidator_getWordState_wordTooShort_returnsFailure() {
        let result = sut.getWordState(word: "ab", for: "en")
        
        let expected = WordState.failure(error: "Слово має містити щонайменше 3 літери")
        
        XCTAssertEqual(result, expected)
    }
    
    func test_WordValidator_getWordState_invalidLanguageCharacters_returnsFailure() {
        let result = sut.getWordState(word: "яблуко", for: "en")
        
        let expected = WordState.failure(error: "Слово не відповідає обраній мові")
        
        XCTAssertEqual(result, expected)
    }
    
    func test_WordValidator_getWordState_nonExistingWord_returnsFailure() {
        let result = sut.getWordState(word: "asdasdzz", for: "en")
        
        let expected = WordState.failure(error: "Такого слова не існує")
        
        XCTAssertEqual(result, expected)
    }
    
    func test_WordValidator_getWordState_validWord_returnsValidationSuccess() {
        let result = sut.getWordState(word: "apple", for: "en")
        
        let expected = WordState.validationSuccess
        
        XCTAssertEqual(result, expected)
    }
}
