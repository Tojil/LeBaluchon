//
//  ExchangeServiceTests.swift
//  LeBaluchonTests
//
//  Created by Sergio Canto  on 09/12/2020.
//

import XCTest
@testable import LeBaluchon

class ExchangeServiceTests: XCTestCase {
    func testGetExchangeShouldGetFailedCallbackError() {
        // Given
        
        let exchangeService = ExchangeService(
            exchangeSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange(callback:) { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetExchangeShouldGetFailedCallbackIfNoData() {
        // Given
        let exchangeService = ExchangeService(
            exchangeSession: URLSessionFake(data: nil, response: nil, error: nil)
        )
        // When
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange(callback:) { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetExchangeShouldGetFailedCallbackIfIncorrectResponse() {
        // Given
        
        let exchangeService = ExchangeService(
            exchangeSession: URLSessionFake(data: FakeResponseData.exchangeCorrectData, response: FakeResponseData.responseKO, error: nil)
        )
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange(callback:) { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetExchangeShouldGetFailedCallbackIfIncorrectData() {
        // Given
        
        let exchangeService = ExchangeService(
            exchangeSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange(callback:) { (result) in
            // Then
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetExchangeShouldGetCorrectCallbackNoErrorAndCorrectData() {
        // Given
        
        let exchangeService = ExchangeService(
            exchangeSession: URLSessionFake(data: FakeResponseData.exchangeCorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        exchangeService.getExchange(callback:) { (result) in
            // Then
            guard case .success(let data) = result else { return }
            
            let exchangeText = 1.212651
            XCTAssertEqual(data.rates.usd, exchangeText)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
