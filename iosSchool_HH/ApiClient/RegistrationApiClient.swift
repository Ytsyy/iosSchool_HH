//
//  RegistrationApiClient.swift
//  iosSchool_HH
//
//  Created by student on 22.11.2023.
//

import Foundation

protocol RegistrationApiClient {

    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    )
}

extension ApiClient: RegistrationApiClient {
    func registration(
        username: String,
        password: String,
        onRequestCompleted: @escaping (TokenResponse?, ApiError?) -> Void
    ) {
        let url = NetworkConstants.URLStrings.nanoPost + "/auth/register"
        guard let userData = usernamePasswordToJSON(username: username, password: password) else {
            print("Ошибка при преобразовании данных в JSON")
            return
        }
        performRequest(url: url, data: userData, method: .post) { (result: Result<TokenResponse, ApiError>) in
            switch result {
            case .success(let token):
                onRequestCompleted(token, nil)
            case .failure(let error):
                onRequestCompleted(nil, error)
            }
        }
    }
    func usernamePasswordToJSON(username: String, password: String) -> Data? {
        do {
            let jsonData = try JSONEncoder().encode(["username": username, "password": password])

            return jsonData
        } catch {
            return nil
        }
    }
}
