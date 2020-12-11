//
//  PhotoViewController.swift
//  Photos
//
//  Created by Jessica Murphey on 10/23/20.
//

import UIKit

class PhotoViewController: UIViewController {

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openCamera(){
        //Checks for camera
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else{
            print("Camera is not available or supported by this device")
            return
        }
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        
        present(imagePicker, animated: true)
    }
}

extension PhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]){
        defer {
            picker.dismiss(animated: true)
        }
        
        print(info)
    }
    
    //If the user cancels
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        defer{
            picker.dismiss(animated: true)
        }
        
        print("Did cancel")
    }
    
    //I couldnt figure out how to get this to work with the view
    
    //Get the image
//    guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else{
//        return
//    }
    
   // imageView.image = image
    
}
