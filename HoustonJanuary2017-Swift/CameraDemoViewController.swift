//
//  CameraDemoViewController.swift
//  HoustonJanuary2017-Swift
//
//  Created by Mohammad Azam on 3/20/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import UIKit

class CameraDemoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView :UIImageView! 
    var imagePicker :UIImagePickerController!
    var originalImage :UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imagePicker = UIImagePickerController()
        self.imagePicker.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func applySepiaTone() {
        
        DispatchQueue.global().async {
            
            guard let sepiaFilter = CIFilter(name: "CISepiaTone") else {
                fatalError("CISepiaTone filter not found")
            }
            
            let beginImage = CIImage(image: self.originalImage)
            
            sepiaFilter.setValue(beginImage, forKey: kCIInputImageKey)
            sepiaFilter.setValue(1.0, forKey: kCIInputIntensityKey)
            
            let sepiaFilteredImage = UIImage(ciImage: sepiaFilter.outputImage!)
            
            DispatchQueue.main.async {
                self.imageView.image = sepiaFilteredImage
            }
            
        }
    }
    
    @IBAction func applyMonochromeTome() {
        
        DispatchQueue.global().async {
            
            let beginImage = CIImage(image: self.originalImage)
            guard let monochromeFilter = CIFilter(name: "CIColorMonochrome") else {
                fatalError("CIColorMonochrome not available!")
            }
            monochromeFilter.setValue(beginImage, forKey: kCIInputImageKey)
            monochromeFilter.setValue(1.0, forKey: kCIInputIntensityKey)
            let monochromeImage = UIImage(ciImage: monochromeFilter.outputImage!)
            
            DispatchQueue.main.async {
                self.imageView.image = monochromeImage
            }
        }

        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        print(info)

        //
//        
//        if UIImagePickerController.isSourceTypeAvailable(.camera) {
//            // camera is available
//        } else {
//            // camera is not available
//        }
        
        // UIImagePickerControllerOriginalImage
        self.originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.imageView.image = self.originalImage
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openCameraButtonPressed() {
        
        let alertController = UIAlertController(title: "My Picture App", message: "Select an option", preferredStyle: .actionSheet)
        
        let takePhotoAction = UIAlertAction(title: "Take a Photo", style: .default) { (action :UIAlertAction) in
            
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
            
        }
        
        let pickFromLibraryAction = UIAlertAction(title: "Pick from Library", style: .default) { (action :UIAlertAction) in
            
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        
        alertController.addAction(takePhotoAction)
        alertController.addAction(pickFromLibraryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
       
    }
}
