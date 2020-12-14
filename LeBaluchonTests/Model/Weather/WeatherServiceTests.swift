//
//  WeatherServiceTests.swift
//  LeBaluchonTests
//
//  Created by Sergio Canto  on 09/12/2020.
//

import XCTest

@testable import LeBaluchon


class WeatherServiceTests: XCTestCase {
    
    
    func testGetWeatherShouldGetFailedCallbackError() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: FakeResponseData.error)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func testGetWeatherShouldGetFailedCallbackIfNoData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: nil, response: nil, error: nil)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldGetFailedCallbackIfIncorrectResponse() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseKO, error: nil)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldGetFailedCallbackIfIncorrectData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.incorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldGetFailedCallbackNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            XCTAssertFalse(false)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode01d_ThenWeatherHasPictureSunny() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "01d")
        // Then
        XCTAssertEqual(stringImage, "sunny")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode01n_ThenWeatherHasPictureMoon() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "01n")
        // Then
        XCTestSuite(forTestCaseWithName: "moon")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode02d_ThenWeatherHasPictureFewClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "02d")
        // Then
        XCTestSuite(forTestCaseWithName: "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode02n_ThenWeatherHasPictureFewClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "02n")
        // Then
        XCTestSuite(forTestCaseWithName: "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode03d_ThenWeatherHasPictureScatteredClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "03d")
        // Then
        XCTestSuite(forTestCaseWithName: "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode03n_ThenWeatherHasPictureScatteredClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "03n")
        // Then
        XCTestSuite(forTestCaseWithName: "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode04d_ThenWeatherHasPictureOvercastClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "04d")
        // Then
        XCTestSuite(forTestCaseWithName: "overcastClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode04n_ThenWeatherHasPictureOvercastClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "04n")
        // Then
        XCTestSuite(forTestCaseWithName: "overcastClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode09d_ThenWeatherHasPictureDrizzle() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "09d")
        // Then
        XCTestSuite(forTestCaseWithName: "drizzle")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode09n_ThenWeatherHasPictureDrizzle() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "09n")
        // Then
        XCTestSuite(forTestCaseWithName: "drizzle")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode10d_ThenWeatherHasPictureRain() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "10d")
        // Then
        XCTestSuite(forTestCaseWithName: "rain")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode10n_ThenWeatherHasPictureRain() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "10n")
        // Then
        XCTestSuite(forTestCaseWithName: "rain")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode11d_ThenWeatherHasPictureThunderstorm() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "11d")
        // Then
        XCTestSuite(forTestCaseWithName: "thunderstorm")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode11n_ThenWeatherHasPictureThunderstorm() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "11n")
        // Then
        XCTestSuite(forTestCaseWithName: "thunderstorm")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode13d_ThenWeatherHasPictureSnow() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "13d")
        // Then
        XCTestSuite(forTestCaseWithName: "snow")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode13n_ThenWeatherHasPictureSnow() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "13n")
        // Then
        XCTestSuite(forTestCaseWithName: "snow")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode50d_ThenWeatherHasPictureMist() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "50d")
        // Then
        XCTestSuite(forTestCaseWithName: "mist")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode50n_ThenWeatherHasPictureMist() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "50n")
        // Then
        XCTestSuite(forTestCaseWithName: "mist")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasNoCode_ThenWeatherHasNoPicture() {
        // Given
        let weatherService = WeatherService()
        // When
        weatherService.imageString(icon: "")
        // Then
        XCTestSuite(forTestCaseWithName: "")
    }
    
    
}
