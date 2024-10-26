//
//  AuthAPIProtocol.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

protocol AuthServiceProtocol {

    func login(credentials: Credentials) async -> APIResponse<Auth>
    func register(credentials: Credentials) async -> APIResponse<Auth>
    
}
