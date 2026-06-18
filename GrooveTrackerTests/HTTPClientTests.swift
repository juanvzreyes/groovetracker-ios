//
//  HTTPClientTests.swift
//  GrooveTrackerTests
//
//  Created by Juan Adolfo Velazquez Reyes on 17/06/26.
//

import XCTest

@testable import GrooveTracker

final class HTTPClientTests: XCTestCase {

    var sut: HTTPClient!
    var session: URLSession!

    @MainActor override func setUp() {
        super.setUp()
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
        sut = HTTPClient(session: session)
    }

    @MainActor override func tearDown() {
        sut = nil
        session = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.stubResponse = nil
        MockURLProtocol.stubError = nil
        super.tearDown()
    }

    struct MockModel: Codable, Equatable {
        let id: Int
        let name: String
    }

    func testFetch_WhenResponseIs200_AndDataIsValid_ShouldReturnDecodedObject()
        async throws
    {
        let expectedModel = MockModel(id: 1, name: "Test Artist")
        let jsonData = try JSONEncoder().encode(expectedModel)
        let url = URL(string: "https://api.test.com")!

        MockURLProtocol.stubResponseData = jsonData
        MockURLProtocol.stubResponse = HTTPURLResponse(
            url: url,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        let result: MockModel = try await sut.fetch(
            request: URLRequest(url: url)
        )

        XCTAssertEqual(result, expectedModel)
    }

    func testFetch_WhenResponseIs404_ShouldThrowServerError() async {
        let url = URL(string: "https://api.test.com")!
        MockURLProtocol.stubResponse = HTTPURLResponse(
            url: url,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )

        do {
            let _: MockModel = try await sut.fetch(
                request: URLRequest(url: url)
            )
            XCTFail("Se esperaba un error, pero la petición tuvo éxito")
        } catch NetworkError.serverError(let statusCode) {
            XCTAssertEqual(statusCode, 404)
        } catch {
            XCTFail("Se lanzó un error inesperado: \(error)")
        }
    }

    func testFetch_WhenDataIsInvalid_ShouldThrowDecodingError() async {
        let invalidJsonData = Data("invalid_json".utf8)
        let url = URL(string: "https://api.test.com")!

        MockURLProtocol.stubResponseData = invalidJsonData
        MockURLProtocol.stubResponse = HTTPURLResponse(
            url: url,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        do {
            let _: MockModel = try await sut.fetch(
                request: URLRequest(url: url)
            )
            XCTFail("Se esperaba un error de decodificación")
        } catch NetworkError.decodingError {
            XCTAssertTrue(true)
        } catch {
            XCTFail("Se lanzó un error inesperado: \(error)")
        }
    }
}
