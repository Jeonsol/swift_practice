//
//  AddViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 6..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addTitle: UITextField!
    @IBOutlet weak var addContent: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    var imgData : Data!
    var dairy = Diary()
    
    @IBAction func tabImage(_ sender: UITapGestureRecognizer) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDismissKeyboard))
        ]
        toolBar.sizeToFit()
        addContent.inputAccessoryView = toolBar
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    @IBAction func addDiary(_ sender: UIButton) {
        dairy.saveData(addTitle.text!,addContent.text!, imgData)
        UIImageWriteToSavedPhotosAlbum(imageView.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
        self.show(listView!, sender: self)
    }
    
    @objc func tapDismissKeyboard() {
        addContent.endEditing(true)
    }
    
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.image = selectedImage
        
//        if let imgUrl = info[UIImagePickerControllerImageURL] as? URL{
//            let imgName = imgUrl.lastPathComponent
//            var documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//            let localPath = documentDirectory?.appending(imgName)
//            
//            photoURL = localPath
//        }
        
        let saveImage = UIImagePNGRepresentation(selectedImage!) as NSData?
        imgData = saveImage as! Data
        
        dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
