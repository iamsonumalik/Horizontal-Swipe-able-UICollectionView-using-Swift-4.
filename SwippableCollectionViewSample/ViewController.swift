//
//  ViewController.swift
//  SwippableCollectionViewSample
//
//  Created by Sonu Malik on 07/11/17.
//  Copyright © 2017 Sonu Malik. All rights reserved.
//
import  UIKit
class ViewController: UIViewController {

    let cellID  = "cellID";
    let dataSource = [
        Tab1ViewController.init(nibName: nil, bundle: nil),
        Tab2ViewController.init(nibName: nil, bundle: nil),
        Tab3ViewController.init(nibName: nil, bundle: nil)];
    
    lazy var collectionView : UICollectionView = {
        let layout  = UICollectionViewFlowLayout();
        layout.scrollDirection = .horizontal;
        let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout);
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white;
        collectionView.isPagingEnabled = true;
        collectionView.translatesAutoresizingMaskIntoConstraints = false;
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID);
        self.view.addSubview(collectionView);
        
        // Anchoring.
        collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true;
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true;
        collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true;
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true;
    }

}
extension  ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath);
        
        // init View Contoller.
        let vc  = dataSource[indexPath.row];
        vc.view.translatesAutoresizingMaskIntoConstraints = false;
        
        //add to cell's subView.
        cell.addSubview(vc.view)
        
        // Anchoring.
        vc.view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true;
        vc.view.leftAnchor.constraint(equalTo: cell.leftAnchor).isActive = true;
        vc.view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true;
        vc.view.rightAnchor.constraint(equalTo: cell.rightAnchor).isActive = true;
        return cell;
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
}
