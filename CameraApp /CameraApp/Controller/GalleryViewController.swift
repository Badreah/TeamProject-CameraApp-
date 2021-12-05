//
//  Gallery.swift
//  CameraApp
//
//  Created by Areej on 27/04/1443 AH.
//

import UIKit

class GalleryViewController : UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate  {
    
    let userPhoto = UILabel(frame: CGRect(x: 50, y: 100, width: 300, height: 50))
    let takePic = UIButton(frame: CGRect(x: 100, y: 710, width: 200, height: 100))
    let logout = UIButton(frame: CGRect(x: 280, y: 30, width: 100, height: 30))
    let photo = UIImageView()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(userPhoto)
        view.addSubview(takePic)
        view.addSubview(photo)
        view.addSubview(logout)
        
        userPhoto.textAlignment = .center
        userPhoto.font = .boldSystemFont(ofSize: 30)
        
        takePic.setTitle("Take Picture", for: .normal)
        takePic.titleLabel?.font = .boldSystemFont(ofSize: 25)
        takePic.backgroundColor = .black
        takePic.layer.cornerRadius = 10
        takePic.layer.cornerRadius = takePic.frame.height/2
        takePic.clipsToBounds = true
        takePic.addTarget(self, action: #selector(takePicture), for: .touchDown)
        
        photo.image = UIImage(named: "emptyPhoto")
        photo.frame = CGRect(x: 45, y: 150, width: 300, height: 500)
        photo.layer.cornerRadius =  photo.frame.height/17
        photo.clipsToBounds = true
        
        logout.setTitle("Logout", for: .normal)
        logout.addTarget(self, action: #selector(logoutButton), for: .touchDown)
        logout.setTitleColor(.gray, for: .normal)
        logout.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        
    }
    
    
    
    @objc func takePicture(){
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = UIImagePickerController.SourceType.camera
        self.present(cameraView, animated: true, completion: nil)
        cameraView.allowsEditing = true
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        photo.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func logoutButton() {
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}


