//
//  CollectionViewController.swift
//  CollectionApp
//
//  Created by Maks on 05.05.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayoutSettings()
    }
    
    @IBAction func unwindSegue(_ unwindSegue: UIStoryboardSegue) {  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "showInfoSegue" {
            let cell = sender as! CollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let cat = cats[indexPath.item]
            let navigationVC = segue.destination as! UINavigationController
            let infoVC = navigationVC.topViewController as! InformationViewController
            infoVC.cat = cat
            infoVC.title = cat.name
        }
    }
    
    private func setLayoutSettings(){
        let itemPerRow: CGFloat = 2
        let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let paddingWidth = sectionInserts.left * (itemPerRow + 1)
        let availableSpace = collectionView.frame.width - paddingWidth
        let widthPerItem = availableSpace / itemPerRow
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        layout.sectionInset = sectionInserts
        layout.minimumLineSpacing = sectionInserts.left
        layout.minimumInteritemSpacing = sectionInserts.left
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let imageName = cats[indexPath.item].pictureName
        let image = UIImage(named: imageName)
        let name = cats[indexPath.item].name
        cell.catName.text = name
        cell.catImageView.image = image
        
        return cell
    }
    
}
