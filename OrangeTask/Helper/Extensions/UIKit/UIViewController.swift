//
//  UIViewController.swift
//  OrangeTask
//
//  Created by Ahmed Mostafa on 24/11/2023.
//

import UIKit

extension UIViewController {
    func showWithAnimate() {
        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)

        })
    }

    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0

        }, completion: { (finished: Bool) in
            if finished {
                self.view.removeFromSuperview()
            }
        })
    }

    enum mediaTypes: String {
        case publicImage = "public.image"
        case publicMovie = "public.movie"
    }

    func Takephoto(forSourseTybe source: UIImagePickerController.SourceType, types: [String], fromViewController viewController: UIViewController) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = viewController as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = source
            imagePicker.allowsEditing = true
            imagePicker.mediaTypes = types
            imagePicker.modalPresentationStyle = .automatic
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func uploadImage(mediaType: [String]) {
        let alert = UIAlertController(title: "Choose photo".localized, message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera".localized, style: .default, handler: { _ in
            self.Takephoto(forSourseTybe: .camera, types: mediaType, fromViewController: self)
        }))
        alert.addAction(UIAlertAction(title: "Photos".localized, style: .default, handler: { _ in
            self.Takephoto(forSourseTybe: .photoLibrary, types: mediaType, fromViewController: self)
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .destructive, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }))
        UIApplication.shared.windows.filter { $0.isKeyWindow }.first?
            .rootViewController?.present(alert, animated: true, completion: nil)
    }

    func setupStatusBar(color: UIColor) {
        if #available(iOS 13.0, *) {
            let window = UIApplication.shared.windows.first
            let topPadding = window?.safeAreaInsets.top
            let statusbarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: topPadding ?? 0.0))
            statusbarView.backgroundColor = color
            statusbarView.tag = 1
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.addSubview(statusbarView)
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.tag = 1
            statusBar?.backgroundColor = color
        }
    }

    func removeStatusBarColor() {
        let subviewArray = UIApplication.shared.windows.first?.subviews
        for view in subviewArray! {
            if view.tag == 1 {
                view.removeFromSuperview()
            }
        }
    }
}
