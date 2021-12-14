
import Foundation

struct ItemInfo: Decodable {
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
