//
//  NotesServiceProtocol.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/26/24.
//

protocol NotesServiceProtocol {
    
    func getAllNotes() async -> APIResponse<NoteResponse>
    func addNote(note : String) async -> APIResponse<PostedNote>
}
