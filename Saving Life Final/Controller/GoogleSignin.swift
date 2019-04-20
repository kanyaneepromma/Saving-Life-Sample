//
//  GoogleSignin.swift
//  Saving Life Final
//
//  Created by Kanyanee P on 28/3/2562 BE.
//  Copyright © 2562 Kanyanee P. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleSignin: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func ggBTN(_ sender: Any) {
        self.present(UINavigationController(rootViewController: Choice()), animated: true, completion: nil)
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
