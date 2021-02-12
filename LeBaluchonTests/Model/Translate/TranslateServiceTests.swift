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
            translateSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result", source: "fr") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
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
        translateService.getTranslation(text: "result", source: "fr") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetFailedCallbackIfIncorrectResponse() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseKO, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result", source: "fr") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetFailedCallbackIfIncorrectData() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "result", source: "fr") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetTranslationShouldGetSuccessCallbackNoErrorAndCorrectData() {
        // Given
        let translateService = TranslateService(
            translateSession: URLSessionFake(data: FakeResponseData.translateCorrectData, response: FakeResponseData.responseOK, error: nil))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        translateService.getTranslation(text: "translateText", source: "fr") { (result) in
            // Then
            guard case .success(let data) = result else { return }
            
            
            let translatedText = "Hello"
            XCTAssertEqual(data.data.translations[0].translatedText, translatedText)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
