import XCTest
@testable import PushLearn

final class LanguageStore_Tests: XCTestCase {
    
    var sut: LanguageStoreSettings!
    var defaults: UserDefaults!
    
    override func setUpWithError() throws {
        defaults = UserDefaults(suiteName: "LanguageStore_Tests")
        defaults.removePersistentDomain(forName: "LanguageStore_Tests")
        
        sut = LanguageStore(defaults: defaults)
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        defaults.removePersistentDomain(forName: "LanguageStore_Tests")
        defaults = nil
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_LanguageStore_source_returnsStoredLanguage() {
        defaults.set("fr", forKey: "sourceLanguage")
        
        let result = sut.source
        
        XCTAssertEqual(result.minimalIdentifier, "fr")
    }
    
    func test_LanguageStore_target_returnsStoredLanguage() {
        defaults.set("en", forKey: "selectedLanguage")
        
        let result = sut.target
        
        XCTAssertEqual(result.minimalIdentifier, "en")
    }
}
