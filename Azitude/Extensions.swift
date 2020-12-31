//
//  Extensions.swift
//  Azitude
//
//  Created by Gastón on 31/12/2020.
//

import Foundation
import UIKit



extension UIView {

    static func instantiateFromXib() -> Self {
        return UINib(nibName: String(describing: self), bundle: .main)
        .instantiate(withOwner: nil, options: nil).first as! Self
    }
}




extension UIView {
    
    func addEmbedded(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.addConstraint(self.topAnchor.constraint(equalTo: view.topAnchor))
        self.addConstraint(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        self.addConstraint(self.leftAnchor.constraint(equalTo: view.leftAnchor))
        self.addConstraint(self.rightAnchor.constraint(equalTo: view.rightAnchor))
    }
}
