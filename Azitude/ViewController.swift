//
//  ViewController.swift
//  Azitude
//
//  Created by Gastón on 31/12/2020.
//

import UIKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet var compassContainer: UIView?
    @IBOutlet var altitudeContainer: UIView?
    
    
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    
    var compassView: Compass?
    var altitudeView: AltitudeView?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        
        let view = Compass.instantiateFromXib()
        compassContainer?.addEmbedded(view: view)
        compassView = view
        
        let altitude = AltitudeView.instantiateFromXib()
        altitudeContainer?.addEmbedded(view: altitude)
        self.altitudeView = altitude
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationManager.startUpdatingHeading()
        
        motionManager.startDeviceMotionUpdates(to: .main) { (deviceMotion, error) in
            if let data = deviceMotion {
                // Get the attitude of the device
                     let attitude = data.attitude
                            // Get the pitch (in radians) and convert to degrees.
                            // Import Darwin to get M_PI in Swift
                            let angle = attitude.pitch * 180.0/M_PI
                
                DispatchQueue.main.async {
//                    self.altitudeLabel?.text = String(format: "%.1f", angle)
                    self.altitudeView?.setAltitude(angle: angle)
                }

//                            dispatch_async(dispatch_get_main_queue()) {
//                                // Update some UI
//                            }
                        
            }
        }
    }


}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        print(newHeading)
        
        compassView?.setHeading(newHeading.magneticHeading.magnitude)
        
//        headingLabel?.text = String(format: "%.2f", newHeading.magneticHeading.magnitude)
//        compassContainer?.transform = CGAffineTransform(rotationAngle: CGFloat(-newHeading.magneticHeading.magnitude/180.0*M_PI ))
        
//        compassView?.setHeading(CGFloat(newHeading.magneticHeading.magnitude/180.0*M_PI ))
    }
}
