//
//  HTTPClient.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 17/06/26.
//

import Foundation

protocol HTTPClientProtocol {
    func fetch<T: Decodable>(request: URLRequest) async throws -> T
}

struct HTTPClient: HTTPClientProtocol {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T>(request: URLRequest) async throws -> T where T: Decodable {
        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            switch httpResponse.statusCode {
            case 200...299:
                do {
                    let decoder = JSONDecoder()
                    return try decoder.decode(T.self, from: data)
                } catch {
                    throw NetworkError.decodingError(error.localizedDescription)
                }
            case 401:
                throw NetworkError.unauthorized
            default:
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            }
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
