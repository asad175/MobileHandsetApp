//
//  MobilesListDataSource.swift
//  Mobile Handset App
//
//  Created by Asad Choudhary on 9/8/20.
//  Copyright © 2020 Asad Choudhary. All rights reserved.
//

import UIKit

class MobilesListDataSource: GenericDataSource<MobileDataModel>, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /*    var vc: CarsListViewController?
    init(_ vc: CarsListViewController) {
        self.vc = vc
    }
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MobilesTableViewCell", for: indexPath as IndexPath) as! MobileCollectionViewCell
        cell.mobile = data.value[indexPath.row]
      //  cell.vc = vc
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellDimension = collectionView.bounds.width/2.0
        return CGSize(width: cellDimension, height: cellDimension)
    }
}
