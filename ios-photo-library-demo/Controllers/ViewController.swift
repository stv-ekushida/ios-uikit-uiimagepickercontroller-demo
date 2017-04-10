//
//  ViewController.swift
//  ios-photo-library-demo
//
//  Created by Eiji Kushida on 2017/04/07.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var helper = PhotoLibraryHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        guard helper.isAvaiable() else {
            print("フォロライブラリは、利用できません")
            return
        }
    }

    // MARK: - Actions
    @IBAction func didTapLoadPicture(_ sender: UIButton) {
    
        let vc = helper.createPhotoLibrary()
        self.present(vc, animated: true, completion: nil)
    }
    
    /// 初期化
    private func setup() {
        helper.delegate = self
    }
}

// MARK: - <#PhotoLibraryDelegate#>
extension ViewController: PhotoLibraryDelegate {
    
    func complated(status: PhotoLibraryStatus) {
        
        switch status {
        case .loaded(let image):
            imageView.image = image
        case .error(let message):
            print(message)
        case .canceled():
            print("キャンセルされました。")
        }
    }
}
