//
//  MediaAccess.swift
//  DRBINEW
//
//  Created by mac on 23/11/1441 AH.
//  Copyright © 1441 a2solution. All rights reserved.
//

import Foundation
import UIKit

public protocol VideoPickerDelegate: class {
    func didSelect(url: URL?,data : Data?)
}

open class VideoPicker: NSObject {
    
    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: VideoPickerDelegate?
    
    public init(presentationController: UIViewController, delegate: VideoPickerDelegate) {
        self.pickerController = UIImagePickerController()
        
        super.init()
        
        self.presentationController = presentationController
        self.delegate = delegate
        
        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.movie"]
        self.pickerController.videoQuality = .typeHigh
    }
    
    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }
        
        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }
    
    public func present(from sourceView: UIView) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        if let action = self.action(for: .camera, title: "Take video") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Video library") {
            alertController.addAction(action)
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }
        
        self.presentationController?.present(alertController, animated: true)
    }
    
    private func pickerController(_ controller: UIImagePickerController, didSelect url: URL?,data : Data?) {
        controller.dismiss(animated: true, completion: nil)
        
        self.delegate?.didSelect(url: url,data:data)
    }
}

extension VideoPicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil,data: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        guard let url = info[.mediaURL] as? URL else {
            return self.pickerController(picker, didSelect: nil , data: nil)
        }
        guard let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? URL else {
            return self.pickerController(picker, didSelect: nil , data: nil)
        }
        do {
            let data = try Data(contentsOf: videoUrl, options: .mappedIfSafe)
            self.pickerController(picker, didSelect: url,data:data)
        } catch  {
            self.pickerController(picker, didSelect: nil,data :nil )
        }
        
        self.pickerController(picker, didSelect: nil,data :nil )
    }
}

extension VideoPicker: UINavigationControllerDelegate {
    
}
