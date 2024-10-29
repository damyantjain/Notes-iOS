//
//  LoginService.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

class AuthService: AuthServiceProtocol {

    func login(credentials: Credentials) async -> APIResponse<Auth> {
        let parameters = [
            "email": credentials.email,
            "password": credentials.password,
        ]
        let response: APIResponse<Auth> = await APIClient.instance.postAsync(
            path: APIConstants.login, parameters: parameters)
        return response
    }

    func register(credentials: Credentials) async -> APIResponse<Auth> {
        let parameters = [
            "name": credentials.name,
            "email": credentials.email,
            "password": credentials.password,
        ]
        let response: APIResponse<Auth> = await APIClient.instance.postAsync(
            path: APIConstants.register, parameters: parameters)
        return response
    }
    
    func myDetails() async -> APIResponse<User> {
        let response: APIResponse<User> = await APIClient.instance.getAsync(path: APIConstants.details)
        return response
    }
}
