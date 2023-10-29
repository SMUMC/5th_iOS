// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct ResponseFile: Codable {
    let response: Response?
}

// MARK: - Response
struct Response: Codable {
    let header: Header?
    let body: Body?
}

// MARK: - Body
struct Body: Codable {
    let dataType: String?
    let items: Items?
    let pageNo, numOfRows, totalCount: Int?
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let baseDate, baseTime: String?
    let fcstDate, fcstTime, fcstValue: String?
    let nx, ny: Int?
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String?
}
