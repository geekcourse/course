//
//  AvatarView.swift
//  vkapp
//
//  Created by gorby on 02.11.2020.
//  Copyright © 2020 gorby. All rights reserved.
//

import UIKit

@IBDesignable class AvatarView: UIView {

    //MARK : SubView
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()

        return imageView
    }()

    lazy var shadowView: UIView = {
        let view = UIView()

        return view
    }()
    
    //MARK : - Init

    @IBOutlet weak var image : UIImageView! {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var shadowView : UIView!
    
    @IBInspectable var shadowColor : UIColor = UIColor.black
    @IBInspectable var shadowOffset : CGSize = CGSize(width: 10, height: 10)
    @IBInspectable var shadowRadius : CGFloat = 10
    @IBInspectable var shadowOpacity : Int = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let _ = image else {
            return
        }
        self.backgroundColor = .clear
        self.layer.cornerRadius = self.frame.width / 2
        image.layer.cornerRadius = self.frame.width / 2
        
        
        
        shadowView = UIView(frame: self.frame)
        shadowView.layer.shadowColor = shadowColor.cgColor
        shadowView.layer.shadowOffset = shadowOffset
        shadowView.layer.shadowRadius = shadowRadius
        shadowView.layer.shadowOpacity = Float(shadowOpacity) / 100
        
        if self.backgroundColor == .clear {
            addSubview(shadowView)
            self.layer.shadowColor = shadowColor.cgColor
            self.layer.shadowOffset = shadowOffset
            self.layer.shadowRadius = shadowRadius
            self.layer.shadowOpacity = Float(shadowOpacity) / 100
        }
    }
    
    //TODO так и не понял как добавить subView, чтобы тень применялась как отдельный View
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let _ = shadowView else {
            return
        }
        shadowView.frame = bounds
        
    }
    
}
