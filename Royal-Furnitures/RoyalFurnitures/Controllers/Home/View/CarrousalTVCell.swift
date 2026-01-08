//
//  CarrousalTVCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 18/11/25.
//

import UIKit

class CarrousalTVCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var arrBannerList = [String]()
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
        collectionView.register(UINib(nibName: CarrousalCollCell.className, bundle: nil), forCellWithReuseIdentifier: CarrousalCollCell.className)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func configUI() {
        DispatchQueue.main.async { [self] in
            guard let modelObj = AppSessionManager.shared.homeData else { return }
            arrBannerList = modelObj.promotionalBanners?.map({ $0.image ?? ""}) ?? []
            pageControl.numberOfPages = arrBannerList.count
            self.collectionView.reloadData()
        }
        
    }
}


extension CarrousalTVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarrousalCollCell.className, for: indexPath) as! CarrousalCollCell
    let imgURL = arrBannerList[indexPath.row]
    cell.configUI(imageURL: imgURL)
    return cell
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrBannerList.count
}

func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
}

func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
}
}

extension CarrousalTVCell {
func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: collectionView.frame.width, height: 260)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
}
}

extension CarrousalTVCell: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + (0.5 * pageWidth)) / pageWidth)
        pageControl.currentPage = currentPage
    }
}
