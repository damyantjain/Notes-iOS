//
//  APIConstants.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

class APIConstants {
    static let baseURL = "http://apis.sakibnm.work:3000/api"
    
    //Auth API
    static let details = "/auth/me"
    static let register = "/auth/register"
    static let login = "/auth/login"
    static let logout = "/auth/logout"
    
    //Note API
    static let getAllNotes = "/note/getall"
    static let addNote = "/note/post"
    static let deleteNote = "/note/delete"
    
}
