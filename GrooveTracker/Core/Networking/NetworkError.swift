//
//  NetworkError.swift
//  GrooveTracker
//
//  Created by Juan Adolfo Velazquez Reyes on 17/06/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError(String)
    case unauthorized
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL proporcionada no es válida"
        case .invalidResponse:
            return "El servidor devolvió una respuesta no válida"
        case .serverError(let statusCode):
            return "Error del servidor con código: \(statusCode)"
        case .decodingError(let message):
            return "Error al procesar los datos: \(message)"
        case .unauthorized:
            return "No tienes autorización para realizar esta petición"
        case .unknown(let error):
            return "Ocurrió un error desconocido: \(error.localizedDescription)"
        }
    }
}
