//
//  HomeCategoryTVCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 13/11/25.
//

import UIKit
import SDWebImage

class HomeCategoryTVCell: UITableViewCell {

@IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgTopBanner: UIImageView!
    @IBOutlet weak var imgVideoBanner: UIImageView!
    
    @IBOutlet weak var vwBanner: UIView!
    @IBOutlet weak var vwVideo: UIView!
    
    var strTitle = ""
    var arrayProducts = [Subcategory]()
    
override func awakeFromNib() {
    super.awakeFromNib()
    setupCollectionView()
    // Initialization code
}

    func configUI(topBanner: String?, videoBanner: String?,subcategory: [Subcategory]?) {
        DispatchQueue.main.async { [self] in
            vwBanner.isHidden = true
            vwVideo.isHidden = true
            
            if let imageURL = topBanner {
                vwBanner.isHidden = false
                self.imgTopBanner.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeHolderImage"))
            }
            
            if let imageURL = videoBanner {
                vwVideo.isHidden = false
                self.imgVideoBanner.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeHolderImage"))
            }
            arrayProducts = subcategory ?? []
            lblTitle.text = strTitle
            self.collectionView.reloadData()
        }
    }
    
    
override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
}

func setupCollectionView(){
    collectionView.register(UINib(nibName: HomeCategoryCollCell.className, bundle: nil), forCellWithReuseIdentifier: HomeCategoryCollCell.className)
    
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


extension HomeCategoryTVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCategoryCollCell.className, for: indexPath) as! HomeCategoryCollCell
    let model = self.arrayProducts[indexPath.row]
    cell.configUI(data: model)
    return cell
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return  self.arrayProducts.count
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
}

func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
}
}

extension HomeCategoryTVCell {
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
