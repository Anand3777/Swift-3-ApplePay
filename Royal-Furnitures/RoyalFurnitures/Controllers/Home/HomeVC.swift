//
//  HomeVC.swift
//  RoyalFurnitures
//
//  Created by CIPL on 08/11/25.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        doInitialSetup()
        
    }
    
    fileprivate func doInitialSetup() {
        setupTableView()
       viewModel = HomeViewModel(output: self)
        viewModel?.callHomeAPICall()
    }
    
    fileprivate func setupTableView() {
        tblView.delegate = self
        tblView.dataSource = self
        registerCells()
    }
    
    //MARK: - TableViewCells
    fileprivate func registerCells() {
        tblView?.register(UINib(nibName: TopTVCell.className, bundle: nil), forCellReuseIdentifier: TopTVCell.className)
        tblView?.register(UINib(nibName: CarrousalTVCell.className, bundle: nil), forCellReuseIdentifier: CarrousalTVCell.className)
        
        tblView?.register(UINib(nibName: TopOffersTVCell.className, bundle: nil), forCellReuseIdentifier: TopOffersTVCell.className)
        
        
        tblView?.register(UINib(nibName: HomeItemTVCell.className, bundle: nil), forCellReuseIdentifier: HomeItemTVCell.className)
        
        tblView?.register(UINib(nibName: HomeCategoryTVCell.className, bundle: nil), forCellReuseIdentifier: HomeCategoryTVCell.className)
        
        tblView?.register(UINib(nibName: SocialMedioTVCell.className, bundle: nil), forCellReuseIdentifier: SocialMedioTVCell.className)
        
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.totalItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let source = viewModel?.item(at: indexPath), let itemType = source.itemType else {
            return UITableViewCell()
        }

        switch itemType {
        case .top:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopTVCell.className, for: indexPath) as! TopTVCell
            cell.delegate = self
            return cell
        case .carousel:
            let cell = tableView.dequeueReusableCell(withIdentifier: CarrousalTVCell.className, for: indexPath) as! CarrousalTVCell
            return cell
        case .offers:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopOffersTVCell.className, for: indexPath) as! TopOffersTVCell
            return cell
        case .trending:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTVCell.className, for: indexPath) as! HomeItemTVCell
            cell.strTitle = "Trending Products"
            cell.configUI()
            cell.arrayProducts = viewModel?.homeData?.trendingProducts?.items ?? []
            return cell
        case .sofa:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCategoryTVCell.className, for: indexPath) as! HomeCategoryTVCell
            let model = self.viewModel?.homeData?.sofasAndSeating
            cell.strTitle = model?.title ?? ""
            cell.configUI(topBanner: model?.banner?.image, videoBanner: model?.videoBanner?.video, subcategory: model?.subcategories)
            return cell
        case .bedroom:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCategoryTVCell.className, for: indexPath) as! HomeCategoryTVCell
            let model = self.viewModel?.homeData?.bedroom
            cell.strTitle = model?.title ?? ""
            cell.configUI(topBanner: model?.banner?.image, videoBanner: model?.videoBanner?.video, subcategory: model?.subcategories ?? [])
            return cell
        case .livingRoom:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCategoryTVCell.className, for: indexPath) as! HomeCategoryTVCell
            let model = self.viewModel?.homeData?.livingroom
            cell.strTitle = model?.title ?? ""
            cell.configUI(topBanner: model?.banner?.image, videoBanner: model?.videoBanner?.video, subcategory: model?.subcategories ?? [])
            return cell
        case .socialMedia:
            let cell = tableView.dequeueReusableCell(withIdentifier: SocialMedioTVCell.className, for: indexPath) as! SocialMedioTVCell
            
            return cell
            
        case .blogs:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTVCell.className, for: indexPath) as! HomeItemTVCell
            cell.strTitle = "Latest Blogs"
            cell.arrBlogs = viewModel?.homeData?.latestBlog ?? []
            cell.configUI()
            return cell
            
        case .newArrivals:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTVCell.className, for: indexPath) as! HomeItemTVCell
            cell.strTitle = "New Arrivals"
            cell.configUI()
            cell.arrayProducts = viewModel?.homeData?.newLaunches?.items ?? []
            return cell
        case .diningRoom:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeCategoryTVCell.className, for: indexPath) as! HomeCategoryTVCell
            let model = self.viewModel?.homeData?.diningroom
            cell.strTitle = model?.title ?? ""
            cell.configUI(topBanner: model?.banner?.image, videoBanner: model?.videoBanner?.video, subcategory: model?.subcategories ?? [])
            return cell
        case .savedProducts:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTVCell.className, for: indexPath) as! HomeItemTVCell
            cell.strTitle = "Saved Products"
            cell.configUI()
            cell.arrayProducts = viewModel?.homeData?.personalizedForYou?.items ?? []
            return cell
        case .personalized:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeItemTVCell.className, for: indexPath) as! HomeItemTVCell
            cell.strTitle = "Personalized To You"
            cell.configUI()
            cell.arrayProducts = viewModel?.homeData?.personalizedForYou?.items ?? []
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        guard let source = viewModel?.item(at: indexPath), let itemType = source.itemType else {
            return UITableView.automaticDimension
        }

        switch itemType {
        case .top:
            return UITableView.automaticDimension
        case .carousel:
            return 270
        case .offers:
            return 105
        case .trending:
            return UITableView.automaticDimension
        case .sofa:
            return UITableView.automaticDimension
        case .bedroom:
            return UITableView.automaticDimension
        case .livingRoom:
            return UITableView.automaticDimension
        case .socialMedia:
            return UITableView.automaticDimension
        case .blogs:
            return UITableView.automaticDimension
        case .newArrivals:
            return UITableView.automaticDimension
        case .diningRoom:
            return UITableView.automaticDimension
        case .savedProducts:
            return UITableView.automaticDimension
        case .personalized:
            return UITableView.automaticDimension
        }
       
    }
}


extension HomeVC: HomelOutputProtocol {
    func didGetHomeResponse(response: HomeResponseModel, error: String?) {
        DispatchQueue.main.async {
            self.tblView.reloadData()
        }
    }
    
    func showLoadingIndicator() {
        Utilities.showIndicatorView()
    }
    
    func hideLoadingIndicator() {
        Utilities.hideIndicatorView()
    }
    
    func showErrorDialog(with error: String?) {
        
    }
    
    
}

extension HomeVC: TopTVCellDelegate{
    func searchTapped() {
        self.tabBarController?.selectedIndex = 1
    }
    
    func notificationTapped() {
        // Notification
        print("Notification Tapped")
    }
    
    func categorySelected(category: String) {
        print("Selected Category \(category)")
        self.tabBarController?.selectedIndex = 3
    }
    
    func addressDropDownTapped() {
        // Address
        print("Address DropDown Tapped")
    }
    
    
}
