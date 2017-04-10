//
//  PhotoLibraryHelper.swift
//  ios-photo-library-demo
//
//  Created by Eiji Kushida on 2017/04/07.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import Foundation
import UIKit

enum PhotoLibraryStatus {
    case loaded(image: UIImage)
    case canceled()
    case error(message: String)
}

protocol PhotoLibraryDelegate {
    func complated(status: PhotoLibraryStatus)
}

final class PhotoLibraryHelper: NSObject {
    
    var delegate: PhotoLibraryDelegate?
    private var imagePickerController: UIImagePickerController!
    
    /// フォトライブラリが利用できるか？
    ///
    /// - Returns: フォトライブラリが利用できるか
    func isAvaiable() -> Bool {
        
        return UIImagePickerController
            .isSourceTypeAvailable(.photoLibrary)
    }
    
    /// フォトライブラリのインスタンスを生成
    ///
    /// - Returns: フォトライブラリのインスタンス
    func createPhotoLibrary() -> UIImagePickerController {
        
        imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        return imagePickerController
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension PhotoLibraryHelper: UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            delegate?.complated(status: .loaded(image: editedImage))
        } else {
            delegate?.complated(status: .error(message: "写真が取り込めませんでした。"))
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.complated(status: .canceled())
    }
}
