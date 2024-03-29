//
//  ErrorMessage.swift
//  EStoreCRUD
//
//  Created by Aditya Himawan on 27/02/24.
//

import Foundation

struct ErrorMessage {
    static func message(for error: Error) -> String {
        switch error {
        case let urlError as URLError:
            return message(for: urlError)
        default:
            return FailedMessage.unexpected
        }
    }
    
    private static func message(for urlError: URLError) -> String {
        switch urlError.code {
        case .notConnectedToInternet:
            return FailedMessage.notConnectedToInternet
        case .timedOut:
            return FailedMessage.timeout
        case .unknown:
            return FailedMessage.unexpected
        default:
            return FailedMessage.unexpected
        }
    }
}
