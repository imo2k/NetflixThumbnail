import UIKit

//Task {
//    let url = URL(string:"https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!
//    
//    let (data, _) = try! await URLSession.shared.data(from: url)
//    
//    let jsonString = String(data: data, encoding: .utf8)
//    
//    print(jsonString!)
//}

Task {
    let url = URL(string:"https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!
    
    let (data, _) = try! await URLSession.shared.data(from: url)
    
    let decoder = JSONDecoder()
    let dramaCollection = try! decoder.decode(DramaCollection.self, from: data)
    
    print("Big Banner : ", dramaCollection.bigBanner)
    
//    for drama in dramaCollection.dramas {
//        print("Category Title : ", drama.categoryTitle)
//    }
//    for drama in dramaCollection.dramas {
//        for poster in drama.posters {
//            print("Poster Image Address : ", poster)
//        }
//    }
    
    for drama in dramaCollection.dramas {
        print("카테고리 타이틀 : ", drama.categoryTitle)
        for poster in drama.posters {
            print("포스터 이미지 주소: ", poster)
        }
    }
}

struct DramaCollection: Decodable{
    var bigBanner: String
    var dramas: [Drama]
    
    enum CodingKeys: String, CodingKey {
        case bigBanner = "BIG_BANNER"
        case dramas = "DRAMAS"
    }
}
struct Drama: Decodable {
    var categoryTitle: String
    var posters: [String]
    
    enum CodingKeys: String, CodingKey {
        case categoryTitle = "CATEGORY_TITLE"
        case posters = "POSTERS"
    }
}
