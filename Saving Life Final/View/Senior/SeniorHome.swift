//
//  SeniorHome.swift
//  Saving Life Final
//
//  Created by Kanyanee P on 4/4/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import UIKit
import SwiftyGif
import Firebase
import FirebaseStorage
import Photos

class SeniorHome: UIViewController{

    @IBOutlet weak var sunFlowerview: UIImageView!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var bottomBar: UIImageView!
    var ref: DatabaseReference!
    var storageRef: StorageReference!
     let imagePickerController = UIImagePickerController() 
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        //self.title = "หน้าหลัก"
        ref = Database.database().reference()
        storageRef = Storage.storage().reference()
        profileCircle()
        //gif
        let url = URL(string: "https://media1.giphy.com/media/K9AnZe1fuZb68/giphy.gif?cid=790b76115ca6c55f756f386977f7c70f")
        self.bottomBar.setGifFromURL(url)
        //Weather
        let weather = WeatherGetter()
        weather.getWeather()
    }
    func profileCircle(){
        profileView.layer.borderWidth = 1
        profileView.layer.borderColor = UIColor.white.cgColor
        profileView.layer.masksToBounds = true
        profileView.layer.cornerRadius = profileView.frame.height/2
        profileView.clipsToBounds = true
    }
    // MARK: Image
    @IBAction func imgPickerBTN(_ sender: Any) {
        checkPermission()
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: - Hidden Navigation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
extension SeniorHome:UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let imageData = pickedImage.jpegData(compressionQuality: 1.0)
            let imageName = "\(SeniorUID)"
            let docDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let imageURL = docDir.appendingPathComponent(imageName)
            try! imageData!.write(to: imageURL)
            
            print(imageURL)
            let metadata = StorageMetadata()
            ref = Database.database().reference()
            metadata.contentType = "image/jpg"
            
            
            let uploadTask = storageRef.child("images").child("\(imageName)").putFile(from: imageURL, metadata: metadata)
            let dd = storageRef.child("images").child("\(imageName)")
            
            uploadTask.observe(.success){
                snapshot in print(snapshot.reference.fullPath)
                dd.downloadURL { url, error in
                    if error != nil {
                        // Handle any errors
                    } else {
                        
                        // Get the download URL for 'images/stars.jpg'
                        self.ref.child("User/Senior/\(SeniorUID)/ProfileURL").setValue(["URL": "\(url!)"])
                    }
                }
                
            }
            uploadTask.observe(.failure){
                snapshot in
                if let error = snapshot.error as NSError?{
                    print(error)}
            }
            uploadTask.observe(.progress){
                snapshot in
                let percentCom = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
                print(percentCom)
            }
            self.profileView.contentMode = .scaleToFill
            //self.profileImg.contentModepickedImage = .scaleToFill
            self.profileView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func upload(){
        
        // let uploadTask = storageRef.child("Images").putFile(from: , metadata: metadata)
    }
    func checkPermission() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized: print("Access is granted by user")
        case .notDetermined: PHPhotoLibrary.requestAuthorization({
            (newStatus) in print("status is \(newStatus)")
            if newStatus == PHAuthorizationStatus.authorized {
                print("success")
            }
        })
        case .restricted:
            print("User do not have access to photo album.")
        case .denied:
            print("User has denied the permission.")
            
        }
    }
    
}
