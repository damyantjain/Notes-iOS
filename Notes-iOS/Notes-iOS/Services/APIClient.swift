//
//  APIClient.swift
//  Notes-iOS
//
//  Created by Damyant Jain on 10/25/24.
//

import Alamofire

public class APIClient {
    
    public static let instance = APIClient(baseURL: APIConstants.baseURL)

    private let baseURL: String

    private init(baseURL: String) {
        self.baseURL = baseURL
    }

    func getAsync<T: Codable>(path: String, parameters: [String: Any]? = nil)
        async
        -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(url, method: .get, parameters: parameters)
        let response = await request.serializingData().response
        return handleResponse(response)
    }

    func postAsync<T: Codable>(
        path: String, parameters: [String: Any]? = nil
    ) async
        -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(
            url, method: .post, parameters: parameters,
            encoding: JSONEncoding.default)
        let response = await request.serializingData().response
        return handleResponse(response)
    }

    func deleteAsync<T: Codable>(path: String, parameters: [String: Any]? = nil)
        async -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(
            url, method: .delete, parameters: parameters,
            encoding: URLEncoding.default)
        let response = await request.serializingData().response
        return handleResponse(response)
    }

    func handleResponse<T: Codable>(_ response: AFDataResponse<Data>)
        -> APIResponse<T>
    {
        var apiResponse = APIResponse<T>(
            success: false, data: nil, message: nil)
        let status = response.response?.statusCode
        switch response.result {
        case .success(let data):
            if let statusCode = status {
                switch statusCode {
                case 200...299:
                    do {
                        let decodedData = try JSONDecoder().decode(
                            T.self, from: data)
                        apiResponse = APIResponse(
                            success: true, data: decodedData, message: "Success"
                        )
                    } catch {
                        print("JSON couldn't be decoded.")
                    }
                    break
                case 400...499:
                    apiResponse.message = "Client Error: \(statusCode)"
                    break
                default:
                    apiResponse.message = "Server Error: \(statusCode)"
                    break
                }
            }
        case .failure:
            apiResponse.message = "Request Failed"
            break
        }
        return apiResponse
    }
}
