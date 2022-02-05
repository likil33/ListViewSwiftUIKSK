//
//  ViewController.swift
//  SwiftKSKPractice
//
//  Created by Santhosh K on 02/01/22.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionViewSampleList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
     
        collectionViewSampleList.register(UINib(nibName: "DescriptionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DescriptionCollectionViewCell")
        collectionViewSampleList.register(
            UINib(nibName: "TitleCollectionReusableView", bundle: nil),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "TitleCollectionReusableView")
        collectionViewSampleList.delegate = self
        collectionViewSampleList.dataSource = self
        print("santhosh")
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCollectionViewCell", for: indexPath)
        
        return cell
    }

    func collectionView( _ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TitleCollectionReusableView", for: indexPath)
            
            return headerView
        default:
            assert(false, "Invalid element type")
        }
    }
}


extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let cellWidth = UIScreen.main.bounds.width
            let cellHeight = (UIScreen.main.bounds.width) / 2.8
            let size = CGSize(width: CGFloat(cellWidth), height: CGFloat(cellHeight))
            return  size

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width:collectionView.frame.size.width, height:60)
    }
}
