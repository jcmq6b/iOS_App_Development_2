//
//  Entry+CoreDataClass.swift
//  Travelouge
//  Image processing code used from Noted Project Created by Dale Musser on 10/16/18. Copyright © 2018 Tech Innovator. All rights reserved.

import UIKit
import CoreData

@objc(Entry)
public class Entry: NSManagedObject {
    
      var date: Date?{
          get{
              return rawDate as Date?
          }
          set{
            rawDate = newValue as NSDate?
          }
      }

      var image: UIImage?{
          get{
              if let imageData = rawImage as Data?{
                  return UIImage(data: imageData)
              }else{
                return nil
              }
          }
          set{
              if let image = newValue{
                rawImage = convertImageToNSData(image: image)
              }
          }
      }
    
    convenience init?(title: String, description: String?, date: Date?, image: UIImage?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext, !title.isEmpty else {
            return nil
        }
        
        self.init(entity: Entry.entity(), insertInto: managedContext)
        self.title = title
        self.entryDescription = description
        self.date = date
        
        if let image = image {
            self.rawImage = convertImageToNSData(image: image)
        }
    }

      func processImage(image: UIImage) -> UIImage{
          if (image.imageOrientation == .up) {
              return image
          }

          UIGraphicsBeginImageContext(image.size)

          image.draw(in: CGRect(origin: CGPoint.zero, size: image.size), blendMode: .copy, alpha: 1.0)
          let copy = UIGraphicsGetImageFromCurrentImageContext()

          UIGraphicsEndImageContext()

          guard let unwrappedCopy = copy else{
              return image
          }

          return unwrappedCopy
      }

      func convertImageToNSData(image: UIImage) -> NSData?{
          return image.jpegData(compressionQuality: 1.0) as NSData?
      }
}
