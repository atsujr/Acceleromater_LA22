//
//  GameViewController.swift
//  Acceleromater
//
//  Created by Atsuhiro Muroyama on 2022/08/27.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    @IBOutlet var awaImageVIew: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
                
                self.accelerationX = (data?.acceleration.x)!
                self.awaImageVIew.center.x += CGFloat(self.accelerationX*20)
                if(self.awaImageVIew.frame.origin.x < 40) {
                    self.awaImageVIew.frame.origin.x = 40
                }
                
                if self.awaImageVIew.frame.origin.x > 260 {
                    self.awaImageVIew.frame.origin.x = 260
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewControkker: ResultViewController = segue.destination as! ResultViewController
        resultViewControkker.accelerationX = self.accelerationX
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
