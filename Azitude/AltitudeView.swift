//
//  AltitudeView.swift
//  Azitude
//
//  Created by Gastón on 31/12/2020.
//

import Foundation
import UIKit

class AltitudeView: UIView {
    
    @IBOutlet private var mailLabel: UILabel?
    @IBOutlet private var topBarHeight: NSLayoutConstraint?
    @IBOutlet private var bottomBarHeight: NSLayoutConstraint?
    
    func setAltitude(angle: Double) {
        mailLabel?.text = String(format: "%.1f", angle)
        
        let angleF = CGFloat(angle)
        if angle > 0 {
            setBarHeight(forAngle: angleF, inConstraint: topBarHeight)
            bottomBarHeight?.constant = 0
        } else if angle < 0 {
            topBarHeight?.constant = 0
            setBarHeight(forAngle: -angleF, inConstraint: bottomBarHeight)
        } else { // == 0
            topBarHeight?.constant = 0
            bottomBarHeight?.constant = 0
        }
    }
    
    private func setBarHeight(forAngle angle: CGFloat, inConstraint constraint: NSLayoutConstraint?) {
        let maxHeight = bounds.height / 2
        let barHeight = maxHeight * (angle / 90)
        constraint?.constant = barHeight
    }
}
