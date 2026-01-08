//
//  HomeItemTVCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 18/11/25.
//

import UIKit

class HomeItemTVCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var strTitle = ""
    var arrayProducts = [Items]()
    var arrBlogs = [LatestBlog]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        configUI()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configUI() {
        DispatchQueue.main.async { [self] in
            lblTitle.text = strTitle
            self.collectionView.reloadData()
        }
    }
    
    
    func setupCollectionView(){
        collectionView.register(UINib(nibName: HomeItemCollCell.className, bundle: nil), forCellWithReuseIdentifier: HomeItemCollCell.className)
        
        collectionView.register(UINib(nibName: HomeBlogCollCell.className, bundle: nil), forCellWithReuseIdentifier: HomeBlogCollCell.className)

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension HomeItemTVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if strTitle == "Latest Blogs"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBlogCollCell.className, for: indexPath) as! HomeBlogCollCell
            let model = arrBlogs[indexPath.row]
            cell.configUI(data: model)
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollCell.className, for: indexPath) as! HomeItemCollCell
            let model = arrayProducts[indexPath.row]
            cell.configUI(data: model)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if strTitle == "Latest Blogs"{
            return arrBlogs.count
        }else {
            return arrayProducts.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}

extension HomeItemTVCell {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.48, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
