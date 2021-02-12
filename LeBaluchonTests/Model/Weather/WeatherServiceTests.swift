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
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
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
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
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
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
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
            guard case .failure(let error) = result else { return }
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
    
    func testGetWeatherShouldGetCorrectCallbackNoErrorAndCorrectData() {
        // Given
        let weatherService = WeatherService(
            weatherSession: URLSessionFake(data: FakeResponseData.weatherCorrectData, response: FakeResponseData.responseOK, error: nil)
        )
        // When
        
        let expectation = XCTestExpectation(description: "Wait for queue change")
        weatherService.getWeather(callback:) { (result) in
            // Then
            guard case .success(let data) = result else { return }
            
            let weatherText = -0.12
            XCTAssertEqual(data.list[0].main.temp, weatherText)
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
        let stringImage = weatherService.imageString(icon: "01n")
        // Then
        XCTAssertEqual(stringImage, "moon")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode02d_ThenWeatherHasPictureFewClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "02d")
        // Then
        XCTAssertEqual(stringImage, "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode02n_ThenWeatherHasPictureFewClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "02n")
        // Then
        XCTAssertEqual(stringImage, "fewClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode03d_ThenWeatherHasPictureScatteredClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "03d")
        // Then
        XCTAssertEqual(stringImage, "scatteredClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode03n_ThenWeatherHasPictureScatteredClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "03n")
        // Then
        XCTAssertEqual(stringImage, "scatteredClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode04d_ThenWeatherHasPictureOvercastClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "04d")
        // Then
        XCTAssertEqual(stringImage, "overcastClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode04n_ThenWeatherHasPictureOvercastClouds() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "04n")
        // Then
        XCTAssertEqual(stringImage, "overcastClouds")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode09d_ThenWeatherHasPictureDrizzle() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "09d")
        // Then
        XCTAssertEqual(stringImage, "drizzle")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode09n_ThenWeatherHasPictureDrizzle() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "09n")
        // Then
        XCTAssertEqual(stringImage, "drizzle")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode10d_ThenWeatherHasPictureRain() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "10d")
        // Then
        XCTAssertEqual(stringImage, "rain")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode10n_ThenWeatherHasPictureRain() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "10n")
        // Then
        XCTAssertEqual(stringImage, "rain")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode11d_ThenWeatherHasPictureThunderstorm() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "11d")
        // Then
        XCTAssertEqual(stringImage, "thunderstorm")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode11n_ThenWeatherHasPictureThunderstorm() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "11n")
        // Then
        XCTAssertEqual(stringImage, "thunderstorm")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode13d_ThenWeatherHasPictureSnow() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "13d")
        // Then
        XCTAssertEqual(stringImage, "snow")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode13n_ThenWeatherHasPictureSnow() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "13n")
        // Then
        XCTAssertEqual(stringImage, "snow")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode50d_ThenWeatherHasPictureMist() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "50d")
        // Then
        XCTAssertEqual(stringImage, "mist")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasCaseCode50n_ThenWeatherHasPictureMist() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "50d")
        // Then
        XCTAssertEqual(stringImage, "mist")
    }
    
    func testGivenWeatherHasNoPicture_WhenWeatherHasNoCode_ThenWeatherHasNoPicture() {
        // Given
        let weatherService = WeatherService()
        // When
        let stringImage = weatherService.imageString(icon: "")
        // Then
        XCTAssertEqual(stringImage, "")
    }
    
    
}
