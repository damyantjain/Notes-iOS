//
//  LoginService.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

class AuthService : AuthAPIProtocol {
    
    func login(credentials: Credentials) async throws -> Auth {
        return Auth(token: "123456789", auth: false)
    }
    
    func register(credentials: Credentials) async throws -> Auth {
        return Auth(token: "123456789", auth: true)
    }
}
