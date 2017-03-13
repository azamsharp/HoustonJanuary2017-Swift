
import UIKit
import PlaygroundSupport

class Movie {
    var title :String!
    var posterURL :String!
}

class MoviesTableViewController : UITableViewController {
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateMovies()
    }
    
    private func populateMovies() {
        
        let url = URL(string: "http://www.omdbapi.com/?s=Superman&page=2")!
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let rootDictionary = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
            
            let moviesArrayOfDictionary = rootDictionary["Search"] as! [[String:Any]]
            
            for movieDictionary in moviesArrayOfDictionary {
                
                let movie = Movie()
                movie.title = movieDictionary["Title"] as! String
                movie.posterURL = movieDictionary["Poster"] as! String
                
                self.movies.append(movie)
            }
            
           // DispatchQueue.main.async {
                self.tableView.reloadData()
           // }
            
        }.resume()
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        let movie = self.movies[indexPath.row]
        
      //  DispatchQueue.global().async {
            
            let posterData = NSData(contentsOf: URL(string: movie.posterURL)!)
            
       //     DispatchQueue.main.async {
                
                cell.imageView?.image = UIImage(data: posterData as! Data)
       //     }
            
       // }
        
        cell.textLabel?.text = movie.title
        return cell
    }
    
    
}


let moviesTVC = MoviesTableViewController()
moviesTVC.view.frame = CGRect(x: 0, y: 0, width: 320, height: 480)

PlaygroundPage.current.liveView = moviesTVC
PlaygroundPage.current.needsIndefiniteExecution = true

