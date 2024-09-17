import UIKit


Task {
    let url = URL(string:"https://gvec03gvkf.execute-api.ap-northeast-2.amazonaws.com/")!
    
    let (data, _) = try! await URLSession.shared.data(from: url)
    
    let jsonString = String(data: data, encoding: .utf8)
    
    print(jsonString!)
}
