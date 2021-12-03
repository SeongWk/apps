//
//  ViewController.swift
//  CameraLibrary
//
//  Created by seong_wook_lim on 2021/12/03.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let imagepicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCapture(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagepicker.delegate = self
            imagepicker.sourceType = .camera
            imagepicker.mediaTypes = [kUTTypeImage as String]
            imagepicker.allowsEditing = false
            
            present(imagepicker, animated: true, completion: nil)
        }
        else {
            myAlert(_title: "error", message: "not access")
        }
    }
    @IBAction func btnCaptLoad(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagepicker.delegate = self
            imagepicker.sourceType = .photoLibrary
            imagepicker.mediaTypes = [kUTTypeImage as String]
            imagepicker.allowsEditing = true
            
            present(imagepicker, animated: true, completion: nil)
        }
        else {
            myAlert(_title: "error", message: "not access")
        }
    }
    
    @IBAction func btnVideoRecord(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagepicker.delegate = self
            imagepicker.sourceType = .camera
            imagepicker.mediaTypes = [kUTTypeMovie as String]
            imagepicker.allowsEditing = false
            
            present(imagepicker, animated: true, completion: nil)
        }
        else {
            myAlert(_title: "error", message: "not access")
        }
    }
    @IBAction func btnVideoLoad(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            imagepicker.delegate = self
            imagepicker.sourceType = .photoLibrary
            imagepicker.mediaTypes = [kUTTypeMovie as String]
            imagepicker.allowsEditing = false
            
            present(imagepicker, animated: true, completion: nil)
        }
        else {
            myAlert(_title: "error", message: "not access")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString

        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage

            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }

            imgView.image = captureImage
        }
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) {
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)

                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }

        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func myAlert(_title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

