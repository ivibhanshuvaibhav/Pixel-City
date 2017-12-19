//
//  PopVC.swift
//  Pixel City
//
//  Created by Vibhanshu Vaibhav on 02/10/17.
//  Copyright © 2017 Vibhanshu Vaibhav. All rights reserved.
//

import UIKit
import Alamofire

class PopVC: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var passedImage: UIImage!
    var imageId: String!
    var secretId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = passedImage
        addDoubleTap()
        titleLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.adjustsFontSizeToFitWidth = true
        displayImageInfo()
    }

    func initialize(forImage image: UIImage) {
        self.passedImage = image
    }

    func addDoubleTap() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapPressed))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.delegate = self
        view.addGestureRecognizer(doubleTap)
    }
    
    @objc func doubleTapPressed() {
        dismiss(animated: true, completion: nil)
    }
    
    func displayImageInfo() {
        Alamofire.request(flickrInfo(forAPIKey: API_KEY, withPhotoId: imageId, andSecretId: secretId)).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String, AnyObject> else { return }
            print(json)
            let photoDict = json["photo"]! as? Dictionary<String, AnyObject>
            
            let titleDict = photoDict!["title"] as! Dictionary<String, AnyObject>
            let title = titleDict["_content"] as! String
            self.titleLabel.text = title
            
            let descDict = photoDict!["description"] as! Dictionary<String, AnyObject>
            let desc = descDict["_content"] as! String
            self.descriptionLabel.text = desc
            
            let datePosted = photoDict!["dateuploaded"] as! String
            self.date.text = String(describing: NSDate(timeIntervalSince1970: Double(datePosted)!))
        }
    }
    
}
