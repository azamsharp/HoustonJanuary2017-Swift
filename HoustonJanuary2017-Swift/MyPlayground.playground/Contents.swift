
import UIKit
import PlaygroundSupport

// GET 

let url = URL(string: "http://localhost:8080/groceryCategory")!

URLSession.shared.dataTask(with: url) { (data, _, _) in
    
    print(data!)
    
    let json = try! JSONSerialization.jsonObject(with: data!, options: [])
    
    print(json)
    
}.resume()


// POST 

//let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
//
//var request = URLRequest(url: url)
//request.httpMethod = "POST"
//request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//let postBody :[String:Any] = ["title":"Hello World","body":"This is body","userId":1234]
//
//let postData = try! JSONSerialization.data(withJSONObject: postBody, options: [])
//
//request.httpBody = postData
//
//URLSession.shared.dataTask(with: request) { (data, _, _) in
//    
//    let json = try! JSONSerialization.jsonObject(with: data!, options: [])
//
//    print(json)
//    
//}.resume()

//{
//    
//    "title": "foo",
//    "body": "bar",
//    "userId": 1
//}


//let numbers = [2,3,4,12,5,67]
//
//numbers.map { number in
//    return number * 2
//}
//
//numbers.filter { number in
//    return number % 2 == 0
//}
//
//var numbersMultipliedBy2 = [Int]()
//
//for number in numbers {
//    
//     numbersMultipliedBy2.append(number * 2)
//}
//
//numbersMultipliedBy2
//
//let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//
//class Post {
//    
//    var title :String!
//    var body :String!
//    
//    init(dictionary :[String:Any]) {
//        self.title = dictionary["title"] as! String
//        self.body = dictionary["body"] as! String
//    }
//}
//
//URLSession.shared.dataTask(with: url) { (data, reponse, error) in
//    
//    let json = try! JSONSerialization.jsonObject(with: data!, options: [])
//    
//    let arrayOfDictionaries = json as! [[String:Any]]
//    
//    //arrayOfDictionaries.map(Post.init)
//    
//    for dictionary in arrayOfDictionaries {
//        
//        let post = Post(dictionary: dictionary)
//        print(post.title)
//    
//    }
//    
//    
////    print(data!)
////    
////    let  json = try! JSONSerialization.jsonObject(with: data!, options: [])
////    let usersArray = json as! [[String:Any]]
////    
////    let firstUser = usersArray[0]
////    
////    let firstUserName = firstUser["name"]
////    
////    let address = firstUser["address"] as! [String: Any]
////    
////    let street = address["street"] as! String
////    let city = address["city"] as! String
////    let geo = address["geo"] as! [String :Any]
////    let lat = geo["lat"] as! String
////    
////    print(street)
//    
//}.resume()


PlaygroundPage.current.needsIndefiniteExecution = true

