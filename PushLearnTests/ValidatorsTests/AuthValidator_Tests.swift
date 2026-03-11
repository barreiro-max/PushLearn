import XCTest
@testable import PushLearn

final class AuthValidator_Tests: XCTestCase {

    var sut: AuthValidated!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = AuthValidator()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    // MARK: - isEmailValid(_ email: String) -> Bool
    func test_AuthValidator_isEmailValid_returnsTrue() {
        let email = "unicorn.rainbow@gmail.com"
        
        let result = sut.isEmailValid(email)
        
        XCTAssertTrue(result)
    }
    
    func test_AuthValidator_isEmailValid_returnsFalse() {
        let email = "incorrectEmail"
        
        let result = sut.isEmailValid(email)

        XCTAssertFalse(result)
    }
    
    // MARK: - isPasswordValid(_ password: String) -> Bool
    func test_AuthValidator_isPasswordValid_returnsTrue() {
        let password = "4129168hefbg"
        
        let result = sut.isPasswordValid(password)
        
        XCTAssertTrue(result)
    }
    
    func test_AuthValidator_isPasswordValid_noLetters_returnsFalse() {
        let password = "129804701"
        
        let result = sut.isPasswordValid(password)
        
        XCTAssertFalse(result)
    }
    
    func test_AuthValidator_isPasswordValid_noNumbers_returnsFalse() {
        let password = "fdsnlaefnl"
        
        let result = sut.isPasswordValid(password)
        
        XCTAssertFalse(result)
    }
    
    func test_AuthValidator_isPasswordValid_whenPasswordTooShort_returnsFalse() {
        let password = "524"
        
        let result = sut.isPasswordValid(password)
        
        XCTAssertFalse(result)
    }
    
    // MARK: - getValidationState(email: String, password: String) -> AuthState
    func test_AuthValidator_getValidationState_returnsValidationSuccess() {
        let result = sut.getValidationState(
            email: "nickWorlack@gmail.com",
            password: "123456789Qfe"
        )
        let expected = AuthState.validationSuccess
        
        XCTAssertEqual(result, expected)
    }
    
    func test_AuthValidator_getValidationState_returnsEmailFailure() {
        let result = sut.getValidationState(
            email: "messotty@flo",
            password: "123456789Qfe"
        )
        let expected = AuthState.failure(email: "Невалідна електронна пошта")
        
        XCTAssertEqual(result, expected)
    }
    
    func test_AuthValidator_getValidationState_returnsPasswordFailure() {
        let result = sut.getValidationState(
            email: "test@gmail.com",
            password: "11111111"
        )
        let expected = AuthState.failure(password: "Невалідний пароль")
        
        XCTAssertEqual(result, expected)
    }
}

