import Foundation

struct Vote{
    var nameBreed: String
    var like: String
    var disLike: String

    
    init(nameBreed:String, like:String , disLike:String) {
        self.nameBreed = nameBreed
        self.like = like
        self.disLike = disLike
    }
    
}