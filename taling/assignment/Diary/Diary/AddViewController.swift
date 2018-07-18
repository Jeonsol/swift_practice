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
    
    @IBAction func tabImage(_ sender: UITapGestureRecognizer) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addDiary(_ sender: UIButton) {
        let listView = storyboard?.instantiateViewController(withIdentifier: "listViewController") as? ListViewController
        guard let diary = makeDiary() else {return}
        if let indexPath = indexPath {
            diaryStore.diaries[indexPath.row] = diary
        }
        else {
            diaryStore.addDiary(diary)
        }
        self.show(listView!, sender: self)
    }
    
    let imagePicker = UIImagePickerController()
    let diaryStore = Global.shared.diaryStore
    var indexPath: IndexPath?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = indexPath {
            let diary = diaryStore.diaries[indexPath.row]
            addTitle.text = diary.title
            addContent.text = diary.content
            imageView.image = UIImage(data: diary.image!)
        }
    }
    
    func makeDiary() -> Diary? {
        guard let title = addTitle.text else { return nil}
        guard let content = addContent.text else { return nil}
        guard let image = imageView.image else {
            showAlert(title: "경고", message: "이미지가 필요합니다.")
            return nil
        }
        guard let imageData = UIImagePNGRepresentation(image) else {return nil}
        
        if title.isEmpty || content.isEmpty {
            showAlert(title: "경고", message: "텍스트가 필요합니다.")
            return nil
        }

        return Diary(title: title, content: content, image: imageData)
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(okAction)
    }
    
    @objc func tapDismissKeyboard() {
        addContent.endEditing(true)
    }
    
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
