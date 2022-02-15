//
//  DetailViewController.swift
//  MemeMeApp_Demo
//
//  Created by Ras on 01.01.2022.
//
import UIKit


class DetailViewController: UIViewController {
    
    var detail: Meme!
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.detailImageView!.image = detail.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    

}
