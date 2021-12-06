import Foundation

struct ExpoInformation {
    let title: String
    let visitors: Int
    let location: String
    let duration: String
    let description: String
}

extension ExpoInformation: Decodable { }
