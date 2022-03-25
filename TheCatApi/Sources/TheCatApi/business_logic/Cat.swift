import Foundation

struct Cat: Decodable{
    var name: String
    var origin: String
    var description: String
    var reference_image_id: String?
}

struct Vote: Decodable{
    var image_id: String
    var value: Int
}