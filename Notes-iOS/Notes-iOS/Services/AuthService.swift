//
//  LoginService.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

class AuthService: AuthAPIProtocol {

    func login(credentials: Credentials) async throws -> APIResponse<Auth> {
        let parameters = [
            "email": credentials.email,
            "password": credentials.password,
        ]
        let response: APIResponse<Auth> = await APIClient.instance.postAsync(
            path: APIConstants.login, parameters: parameters)
        return response
    }

    func register(credentials: Credentials) async throws -> APIResponse<Auth> {
        let parameters = [
            "name": credentials.name,
            "email": credentials.email,
            "password": credentials.password,
        ]
        let response: APIResponse<Auth> = await APIClient.instance.postAsync(
            path: APIConstants.register, parameters: parameters)
        return response
    }
}
