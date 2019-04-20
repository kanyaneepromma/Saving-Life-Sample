//
//  Input.swift
//  Saving Life Final
//
//  Created by Kanyanee P on 2/4/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import UIKit
import TextFieldEffects
import JSSAlertView

class Input: UIViewController {

    @IBOutlet weak var nameTF: KaedeTextField!
    @IBOutlet weak var telTF: KaedeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func deleteBTN(_ sender: Any) {
        nameTF.text = ""
        telTF.text = ""
    }
    @IBAction func saveBTN(_ sender: Any) {
        let alert = JSSAlertView().show(
            self,
            title: "ยินดีต้อนรับ คุณ \(nameTF.text ?? "")",
            text: "เบอร์โทรของคุณคือ \(telTF.text ?? "") \nข้อมูลถูกต้องหรือไม่",
            cancelButtonText: "Cancel", color: UIColorFromHex(0x42e2f4, alpha: 1),
            iconImage: #imageLiteral(resourceName: "love"))
        alert.addAction {
            self.present(UINavigationController(rootViewController: GoogleSignin()), animated: true, completion: nil)
        }
        alert.addCancelAction {
            print("Edit")
        }
        
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
