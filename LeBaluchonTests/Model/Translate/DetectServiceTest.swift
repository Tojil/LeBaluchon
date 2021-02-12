//
//  DetectServiceTest.swift
//  LeBaluchonTests
//
//  Created by Sergio Canto  on 25/12/2020.
//

import XCTest
@testable import LeBaluchon

class DetectServiceTest: XCTestCase {
    
    
    func testGetDetectionShouldGetFailedCallbackError() {
        // Given
        let detectService = TranslateService(
            detectSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error))
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        detectService.getDetection(text: "result") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
        }
            expectation.fulfill()

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetDetectionShouldGetFailedCallbackIfNoData() {
        // Given
        let detectService = TranslateService(
            detectSession: URLSessionFake(data: nil, response: nil, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        detectService.getDetection(text: "result") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
        }
            expectation.fulfill()

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetDetectionShouldGetFailedCallbackIfIncorrectResponse() {
        // Given
        let detectService = TranslateService(
            detectSession: URLSessionFake(data: FakeResponseData.detectCorrectData, response: FakeResponseData.responseKO, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        detectService.getDetection(text: "Bonjour") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
        }
            expectation.fulfill()

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetDetectionShouldGetFailedCallbackIfIncorrectData() {
        // Given
        let detectService = TranslateService(
            detectSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        detectService.getDetection(text: "Detect") { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
        }
            expectation.fulfill()

        wait(for: [expectation], timeout: 0.01)
    }

    func testGetDetectionShouldGetFailedCallbackNoErrorAndCorrectData() {
        // Given
        let detectService = TranslateService(
            detectSession: URLSessionFake(data: FakeResponseData.detectCorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        detectService.getDetection(text: "detections") { (result) in
            // Then
            guard case .success(let data) = result else { return }
            
            let detectLanguage = "fr"
            XCTAssertEqual(data.data.detections[0][0].language, detectLanguage)
        }
            expectation.fulfill()

        wait(for: [expectation], timeout: 0.01)
    }
}
