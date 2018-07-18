//
//  DetailViewController.swift
//  TablePractice
//
//  Created by 전솔 on 2018. 7. 3..
//  Copyright © 2018년 전솔. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    let diaryStore = Global.shared.diaryStore
    var indexPath: IndexPath?
    
    
    @IBAction func tabImage(_ sender: UITapGestureRecognizer) {
        present(imagePicker, animated: true, completion: nil)
        
    }
    var fromText: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem?.target = self
        self.navigationItem.rightBarButtonItem?.action = #selector(modifyDiary)
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDismissKeyboard))

        ]
        toolBar.sizeToFit()
        textView.inputAccessoryView = toolBar // 키보드 위에있는애를 악세서리뷰
        //imageView.image = UIImage(data: Data)
        
        // Do any additional setup after loading the view.
    }
    @objc func tapDismissKeyboard() {
        textView.endEditing(true)
    }
    @IBAction func addDiary(_ sender: UIButton) {
        
        guard let diary = makeDiary() else {return}
        diaryStore.addDiary(diary)
        
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title:String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = indexPath {
            let path = diaryStore.diaries[indexPath.row]
            textField.text = path.title
            textView.text = path.body
            imageView.image = UIImage(data: path.image!)

        }
    }
    
    func makeDiary()-> Diary? {
        guard let titleText = textField.text else {return nil}
        guard let bodyText = textView.text else {return nil}
        guard let image = imageView.image else {
            showAlert(title: "경고", message: "이미지가 필요합니다.")
            return nil
            
        }
        if titleText.isEmpty || bodyText.isEmpty {
            showAlert(title: "경고", message: "글ㅆㅓ용")
            return nil
        }
        guard let imageData = UIImagePNGRepresentation(image)  else {return nil}
        
        return Diary(title: titleText, body: bodyText, image: imageData)
    }
    @objc func modifyDiary() {
        guard let diary = makeDiary() else {return}
        guard let indexPath = indexPath else {return}
        diaryStore.diaries[indexPath.row] = diary
        self.navigationController?.popViewController(animated: true)
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

extension DetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}

//extension DetailViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        <#code#>
//    }
//}

