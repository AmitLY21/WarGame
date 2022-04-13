//
//  HomeView.swift
//  WarGame
//
//  Created by user216694 on 4/12/22.
//

import UIKit

class HomeView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func btnStart(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "info") as! InfoView
        present(vc, animated: true)
    }
    

}
