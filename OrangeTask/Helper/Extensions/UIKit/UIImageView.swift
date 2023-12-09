//
//  UIImageView.swift
//
//  Created by Ahmed Mostafa
//

import Kingfisher


extension UIImageView {
    func setWith(url: String? ,withLoder : Bool = true) {
        self.kf.indicatorType = withLoder ? .activity : .none
        if let newURL = ((url ?? "")).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            self.kf.setImage(with: URL(string: newURL), placeholder: UIImage(named: "def-icon"), options: [.transition(.fade(0.2))])
            return
        }
        self.kf.setImage(with: URL(string: (url ?? "")), placeholder: UIImage(named: "def-icon"), options: [.transition(.fade(0.2))])
    }
    
    func generateQRCode(from string: String){
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: frame.width, y: frame.height)

            if let output = filter.outputImage?.transformed(by: transform) {
                image = UIImage(ciImage: output)
            }
        }
    }
}
