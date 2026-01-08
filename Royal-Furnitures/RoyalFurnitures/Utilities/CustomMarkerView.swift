//
//  CustomMarkerView.swift
//  CustomMarker
//
//  Created by Sai Sandeep on 11/12/19.
//  Copyright © 2019 Sai Sandeep. All rights reserved.
//

import UIKit

class CustomMarkerView: UIView {

    var imageName: String?
    
    init(frame: CGRect, imageName: String?, tag: Int) {
        super.init(frame: frame)
        self.imageName = imageName
        self.tag = tag
        setupViews()
    }
    
    func setupViews() {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imgView)
        imgView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imgView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.layer.cornerRadius = 25
        imgView.layer.borderColor = UIColor(hex: "922BE2")?.cgColor
        imgView.contentMode = .scaleAspectFill
        imgView.layer.borderWidth = 2
        imgView.clipsToBounds = true
        imgView.image = UIImage(named:"Ellipse 93")
//        imgView.sd_setImage(with: URL(string: "\(imageName ?? "")"), placeholderImage: #imageLiteral(resourceName: "placeHolder_small"))
        
        let triangleImgView = UIImageView()
        self.insertSubview(triangleImgView, belowSubview: imgView)
        triangleImgView.translatesAutoresizingMaskIntoConstraints = false
        triangleImgView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        triangleImgView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -6).isActive = true
        triangleImgView.widthAnchor.constraint(equalToConstant: 23/2).isActive = true
        triangleImgView.heightAnchor.constraint(equalToConstant: 24/2).isActive = true
        triangleImgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        triangleImgView.image = UIImage(named: "markerTriangle")
        triangleImgView.tintColor = UIColor(hex: "922BE2")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
