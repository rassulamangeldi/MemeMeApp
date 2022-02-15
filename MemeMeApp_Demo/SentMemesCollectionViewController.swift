//
//  SentMemesCollectionViewController.swift
//  MemeMeApp_Demo
//
//  Created by Ras on 26.12.2021.
//

import Foundation
import UIKit

class SentMemesCollectionViewController: UICollectionViewController {
    
//    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    var memes: [Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SentMemesCell", for: indexPath) as! SentMemesCellCollectionViewCell
        cell.memedImageView.image = memes[indexPath.item].memedImage
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

        detailController.detail = memes[(indexPath as NSIndexPath).row]

        navigationController!.pushViewController(detailController, animated: true)

    }

}
