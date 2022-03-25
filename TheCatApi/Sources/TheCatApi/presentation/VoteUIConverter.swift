import Foundation

struct UIVote{
    let imageId: String
    let voteRating: Int
}


class VoteUIConverter{

    func convert (_ votes:[Vote]) -> [UIVote]{
        return votes.map({ vote in
            return convertVote(vote)
        })
    }

    func convertVote (_ vote:Vote ) -> UIVote {
        let imageId = vote.image_id
        let voteRating = vote.value
        return UIVote(imageId:imageId,voteRating:voteRating)
    }
}
