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

    private func getHeaders() -> HTTPHeaders? {
        if let token = UserDefaults.standard.string(forKey: "accessToken") {
            return ["x-access-token": token]
        }
        return nil
    }

    func getAsync<T: Codable>(path: String, parameters: [String: Any]? = nil)
        async -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(
            url, method: .get, parameters: parameters, headers: getHeaders())
        let response = await request.serializingData().response
        return handleResponse(response)
    }

    func postAsync<T: Codable>(path: String, parameters: [String: Any]? = nil)
        async -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(
            url, method: .post, parameters: parameters,
            encoding: JSONEncoding.default, headers: getHeaders())
        let response = await request.serializingData().response
        return handleResponse(response)
    }

    func deleteAsync<T: Codable>(path: String, parameters: [String: Any]? = nil)
        async -> APIResponse<T>
    {
        let url = baseURL + path
        let request = AF.request(
            url, method: .delete, parameters: parameters,
            encoding: URLEncoding.default, headers: getHeaders())
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
                        print("JSON Decoding Failed")
                    }
                case 400...499:
                    apiResponse.message = "Client Error: \(statusCode)"
                default:
                    apiResponse.message = "Server Error: \(statusCode)"
                }
            }
        case .failure:
            apiResponse.message = "Request Failed"
        }
        return apiResponse
    }
}
