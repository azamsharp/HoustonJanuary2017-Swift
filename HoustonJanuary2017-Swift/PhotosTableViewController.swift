//
//  PhotosTableViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/6/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class PhotosTableViewController: UITableViewController {

    //var arrayOfDictionaries = [[String:Any]]()
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        populatePhotos()
    }
    
    private func populatePhotos() {
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            let dictionaries = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
         
            for dictionary in dictionaries {
                
                let id = dictionary["id"] as! Int
                let title = dictionary["title"] as! String
                let thumbnailURL = dictionary["thumbnailUrl"] as! String
                
                let photo = Photo(id: id, title: title, thumbnailURL: thumbnailURL)
                
                self.photos.append(photo)
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }.resume()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let photo = self.photos[indexPath.row]
        
        //cell.textLabel?.text = photoDictionary["title"] as! String
        cell.textLabel?.text = photo.title
        
        //let photoURL = photoDictionary["thumbnailUrl"] as! String
        let photoURL = photo.thumbnailURL

        DispatchQueue.global().async {
            
            let imageData = NSData(contentsOf: URL(string: photoURL)!)
            let photoImage = UIImage(data: imageData! as Data)
            
            DispatchQueue.main.async {
                cell.imageView?.image = photoImage
            }
        }
        
        return cell
    }
    

    }
