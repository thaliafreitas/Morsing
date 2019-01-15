//
//  PracticingViewController+CollectionViewDelegateDataSource.swift
//  Morsing
//
//  Created by Paloma Bispo on 12/01/19.
//  Copyright © 2019 Paloma Bispo. All rights reserved.
//

import Foundation
import CoreData
import UIKit


extension PracticingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CodeCollectionViewCell", for: indexPath) as! CodeCollectionViewCell
        let imageBit = self.data[self.indexItem].morse[indexPath.row]
        guard let characters = CoreDataManager.shared.fetching(isLetterData: isLetter), let done = characters[indexItem].getDone(isLetter: isLetter) else {return UICollectionViewCell()}
        if imageBit == 1{
            if done {
                cell.codeImage.image = UIImage.init(named: "hyColorful")
                self.resetButton.isHighlighted = false
            }else{
                cell.codeImage.image = UIImage.init(named: "hy")
                self.resetButton.isHighlighted = true
            }
        }else{
            if done{
                cell.codeImage.image = UIImage.init(named: "dotColorful")
                self.resetButton.isHighlighted = false
            }else{
                cell.codeImage.image = UIImage.init(named: "dot")
                self.resetButton.isHighlighted = true
            }
        }
        return cell
    }
}
