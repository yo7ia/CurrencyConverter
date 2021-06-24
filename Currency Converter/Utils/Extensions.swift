//
//  Extensions.swift
//  FixerIoCurrencyConverter (iOS)
//
//  Created by Ahmed Yehia on 24/06/2021.
//

import UIKit
import AnyFormatKit
extension UIView {
    
    
    
    // OUTPUT 2
    func dropShadow(color: UIColor = .lightGray,
                    opacity: Float = 0.5,
                    offSet: CGSize = CGSize(width: -1, height: 1),
                    radius: CGFloat = 3,
                    scale: Bool = true,
                    roundCorner :CGFloat = 10) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.cornerRadius = roundCorner
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: roundCorner).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        
    }
    
    func applyGradient(isVertical: Bool, colorArray: [UIColor]) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isVertical {
            //top to bottom
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //left to right
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension String
{
    var fromNormaltoCurrencyFormat : String
    {
        let sumFormatter = SumTextInputFormatter(textPattern: "#,###.##")
        return sumFormatter.format(self.toEnglishNumbers)!.toEnglishNumbers
    }
    
    var toEnglishNumbers : String {
        var temp = self
        temp = temp.replacingOccurrences(of: "٠", with: "0")
        temp = temp.replacingOccurrences(of: "١" , with:"1")
        temp = temp.replacingOccurrences(of: "٢" , with:"2")
        temp = temp.replacingOccurrences(of: "٣" , with:"3")
        temp = temp.replacingOccurrences(of: "٤" , with:"4")
        temp = temp.replacingOccurrences(of: "٥" , with:"5")
        temp = temp.replacingOccurrences(of: "٦" , with:"6")
        temp = temp.replacingOccurrences(of: "٧" , with:"7")
        temp = temp.replacingOccurrences(of: "٨" , with:"8")
        temp = temp.replacingOccurrences(of: "٩" , with:"9")
        return temp
    }
}
