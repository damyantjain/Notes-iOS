//
//  NotesService.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/26/24.
//

class NotesService: NotesServiceProtocol {
    func getAllNotes() async -> APIResponse<NoteResponse> {
        let response: APIResponse<NoteResponse> = await APIClient.instance.getAsync(
            path: APIConstants.getAllNotes)
        return response
    }

    func addNote(note: String) async -> APIResponse<PostedNote> {
        let parameters: [String: Any] = ["text": note]
        let response: APIResponse<PostedNote> = await APIClient.instance.postAsync(
            path: APIConstants.addNote, parameters: parameters)
        return response
    }

}
