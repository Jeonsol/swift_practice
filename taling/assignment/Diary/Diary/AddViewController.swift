//
//  AddViewController.swift
//  Diary
//
//  Created by 전솔 on 2018. 7. 6..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var addTitle: UITextField!
    @IBOutlet weak var addContent: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var registerButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    var dairy = Diary()
    
    @IBAction func tabImage(_ sender: UITapGestureRecognizer) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePicker.sourceType = .photoLibrary
    }
    
    @IBAction func addDiary(_ sender: UIButton) {
        dairy.saveData(addTitle.text!,addContent.text!)
        let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
        self.show(listView!, sender: self)
    }
    
}

extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
