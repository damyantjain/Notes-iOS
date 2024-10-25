//
//  APIConstants.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/24/24.
//

class APIConstants {
    static let baseURL = "http://apis.sakibnm.work:3000/api"
    
    //Auth API
    static let details = baseURL + "/auth/me"
    static let register = baseURL + "/auth/register"
    static let login = baseURL + "/auth/login"
    static let logout = baseURL + "/auth/logout"
    
    //Note API
    static let getAllNotes = baseURL + "/note/getall"
    static let addNote = baseURL + "/note/post"
    static let deleteNote = baseURL + "/note/delete"
    
}
