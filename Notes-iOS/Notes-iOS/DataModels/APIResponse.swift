//
//  Response.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/25/24.
//

struct APIResponse<T: Codable>: Codable {
    var success: Bool
    var data: T?
    var message: String?
}
