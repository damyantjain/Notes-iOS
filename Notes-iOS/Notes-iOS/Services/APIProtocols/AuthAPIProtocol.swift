//
//  AuthAPIProtocol.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

protocol AuthAPIProtocol {

    func login(credentials: Credentials) async throws -> APIResponse<Auth>
    func register(credentials: Credentials) async throws -> APIResponse<Auth>
    
}
