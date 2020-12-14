//
//  TranslateServiceTests.swift
//  LeBaluchonTests
//
//  Created by Sergio Canto  on 09/12/2020.
//

import XCTest
@testable import LeBaluchon

class TranslateServiceTests: XCTestCase {
    func testGetTranslationShouldGetFailedCallbackError() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result") { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetFailedCallbackIfNoData() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: nil, response: nil, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result") { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetFailedCallbackIfIncorrectResponse() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseKO, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result") { (result) in
            // Then
            XCTAssertFalse(false)
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetFailedCallbackIfIncorrectData() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result") { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetSuccessCallbackNoErrorAndCorrectData() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "translateText") { (result) in
            // Then
            XCTAssertTrue(true)
            
            let translatedText = "Hello"
            let detectedSourceLanguage = "fr"
            
            
            XCTAssertEqual(translatedText, translatedText)
            XCTAssertEqual(detectedSourceLanguage, detectedSourceLanguage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
