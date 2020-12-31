//
//  Compass.swift
//  Azitude
//
//  Created by Gastón on 31/12/2020.
//

import Foundation
import UIKit

class Compass: UIView {
    
    @IBOutlet var circle: UIView?
    @IBOutlet var innerCircle: UIView?
    
    @IBOutlet var northLetter: UILabel?
    @IBOutlet var northNumber: UILabel?
    @IBOutlet var westLetter: UILabel?
    @IBOutlet var westNumber: UILabel?
    @IBOutlet var eastLetter: UILabel?
    @IBOutlet var eastNumber: UILabel?
    @IBOutlet var southLetter: UILabel?
    @IBOutlet var southNumber: UILabel?
    
    @IBOutlet var headingLabel: UILabel?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circle?.layer.cornerRadius = (circle?.bounds.height ?? 0)/2
        
        innerCircle?.layer.cornerRadius = (circle?.layer.cornerRadius ?? 0) - 16
        innerCircle?.layer.borderWidth = 2
        innerCircle?.layer.borderColor = UIColor.white.cgColor
    }
    
    /// `heading`
    func setHeading(_ heading: Double) {
        
        let headingInRadians = CGFloat(heading / 180.0 * Double.pi)
        
        circle?.transform = CGAffineTransform(rotationAngle: -headingInRadians)
        
        northLetter?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        northNumber?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        westLetter?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        westNumber?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        eastLetter?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        eastNumber?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        southLetter?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        southNumber?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        headingLabel?.transform = CGAffineTransform(rotationAngle: headingInRadians)
        
        headingLabel?.text = String(format: "%.1fº", heading)
    }
}
