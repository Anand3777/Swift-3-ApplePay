//
//  TopOffersTVCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 18/11/25.
//

import UIKit

class TopOffersTVCell: UITableViewCell {

@IBOutlet weak var collectionView: UICollectionView!

var arrayOffers = [Banner]()
override func awakeFromNib() {
    super.awakeFromNib()
    setupCollectionView()
   
    // Initialization code
}

    override func prepareForReuse() {
        configUI()
    }
    
override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)

    // Configure the view for the selected state
}

func setupCollectionView(){
    collectionView.register(UINib(nibName: TopOffersCollCell.className, bundle: nil), forCellWithReuseIdentifier: TopOffersCollCell.className)
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumInteritemSpacing = 0
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    layout.minimumLineSpacing = 0
    collectionView.isPagingEnabled = false
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.collectionViewLayout = layout
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.collectionViewLayout.invalidateLayout()
}
    
    func configUI() {
        DispatchQueue.main.async { [self] in
            guard let modelObj = AppSessionManager.shared.homeData?.offerBanners else { return }
            arrayOffers = modelObj
            self.collectionView.reloadData()
        }
        
    }
    
    
}


extension TopOffersTVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopOffersCollCell.className, for: indexPath) as! TopOffersCollCell
    let model = arrayOffers[indexPath.row]
    cell.configUI(imageURL: model.image ?? "", title: model.title ?? "", disc: model.description ?? "")
    return cell
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrayOffers.count
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
}

func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
}
}

extension TopOffersTVCell {
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: collectionView.frame.width*0.68, height: 125)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
}

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
}
}
