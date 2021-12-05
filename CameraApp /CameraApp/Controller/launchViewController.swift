//
//  launchViewController.swift
//  CameraApp
//
//  Created by Areej on 29/04/1443 AH.
//

import UIKit

class launchViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    let cameraLaunch : UIImageView = {
        let cameraLaunch = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        cameraLaunch.image = UIImage(named: "cameraOrenge")
        return cameraLaunch
    }()
    
    let lableLaunch : UILabel = {
        let lableLaunch = UILabel(frame: CGRect(x: 48, y: 500, width: 300, height: 50))
        lableLaunch.text = "Momment"
        return lableLaunch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(cameraLaunch)
        view.addSubview(lableLaunch)
        
        lableLaunch.textAlignment = .center
        lableLaunch.font = UIFont(name:  "Peachy Mochi", size: 50)
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cameraLaunch.center  = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.50, execute:{ self.animateLanch()
            
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute:{ self.animateLanch2()
            
        })
    }
    
    
    func animateLanch(){
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.height - size
            self.cameraLaunch.frame = CGRect(x: -(diffX/2),
                                             y: diffY/2 , // keep it in center
                                             width: size,
                                             height: size
            )
            self.cameraLaunch.alpha = 0
            
        }, completion: { done in
            if done{
                let value = self.defaults.string(forKey: "name")
                if value != "" {
                    let homeController = HomeViewController()
                    homeController.modalPresentationStyle = .fullScreen
                    homeController.username.text = "\(value ?? "")"
                    homeController.password.text = "\(value ?? "")"
                    self.present(homeController, animated: true, completion: nil)
                }
            }
        })
        
    }
    
    
    func animateLanch2(){
        UIView.animate(withDuration: 1, animations: {
            self.lableLaunch.alpha = 0
            
        })
        
    }
    
    
    
}
