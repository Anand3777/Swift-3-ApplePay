//
//  TopTVCell.swift
//  RoyalFurnitures
//
//  Created by CIPL on 11/11/25.
//

import UIKit
protocol TopTVCellDelegate: AnyObject {
    func searchTapped()
    func notificationTapped()
    func categorySelected(category: String)
    func addressDropDownTapped()
}

class TopTVCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var vwFlash: UIView!
    @IBOutlet weak var lblDays: UILabel!
    @IBOutlet weak var lblHours: UILabel!
    @IBOutlet weak var lblMins: UILabel!
    @IBOutlet weak var lblFlashTitle: UILabel!
    
    @IBOutlet weak var txtSearch: UITextField!
    weak var delegate: TopTVCellDelegate?
    var arrayCate = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        // Initialization code
    }
    
    override func prepareForReuse() {
        configureCell()
    }
    
    func configureCell(){
        guard let modelObj = AppSessionManager.shared.homeData else { return }
        self.arrayCate = modelObj.topBar?.categories ?? []
       
        if let isActive = modelObj.activeSale?.isActive {
            vwFlash.isHidden = !isActive
        }
        
        lblFlashTitle.text = "\(modelObj.activeSale?.title ?? "")"
        txtSearch.placeholder = modelObj.topBar?.searchPlaceholder ?? ""
        
        let parts = modelObj.activeSale?.timeRemaining?.split(separator: ":")

        if parts?.count == 3,
           let hours = Int(parts?[0] ?? "00"),
           let minutes = Int(parts?[1] ?? "00") {

            let days = hours / 24
            let remainingHours = hours % 24
            
            let formatted = "\(days) Days \(remainingHours) Hrs \(minutes) Min"
            print(formatted)
            lblDays.text = "\(days) Days"
            lblHours.text = "\(remainingHours) Hrs"
            lblMins.text = "\(minutes) Min"
            collectionView.reloadData()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        delegate?.searchTapped()
    }
    
    @IBAction func notificationTapped(_ sender: Any) {
        delegate?.notificationTapped()
    }
    
    @IBAction func addressDropDownTapped(_ sender: Any) {
        delegate?.addressDropDownTapped()
    }
    
    func setupCollectionView(){
        collectionView.register(UINib(nibName: TopCollCell.className, bundle: nil), forCellWithReuseIdentifier: TopCollCell.className)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.minimumLineSpacing = 0
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout.invalidateLayout()
    }
}


extension TopTVCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopCollCell.className, for: indexPath) as! TopCollCell
        cell.lblCate.text = arrayCate[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = arrayCate[indexPath.row]
        delegate?.categorySelected(category: category)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
}

extension TopTVCell {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let text = arrayCate[indexPath.item]
        let font = UIFont.systemFont(ofSize: 16)

        let textWidth = (text as NSString).size(withAttributes: [.font: font]).width
        let cellWidth = textWidth + 50
        return CGSize(width: cellWidth, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
}
