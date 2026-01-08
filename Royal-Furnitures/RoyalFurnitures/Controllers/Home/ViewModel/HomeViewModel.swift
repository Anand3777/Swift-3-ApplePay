//
//  HomeViewModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 10/11/25.
//


import UIKit

class HomeItem: NSObject {
    var itemType: HomeItemType?
    
    convenience init(type: HomeItemType) {
        self.init()
        itemType = type
    }
}

enum HomeItemType {
    case top
    case carousel
    case offers
    case trending
    case newArrivals
    
    case sofa
    case livingRoom
    case diningRoom
    case bedroom
    
    case savedProducts
    case personalized
    
    case socialMedia
    case blogs

}

protocol HomelOutputProtocol: AnyObject {
    func didGetHomeResponse(response: HomeResponseModel, error: String?)

    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showErrorDialog(with error: String?)

}

protocol HomeInputProtocol: AnyObject {
    func totalItems() -> Int
    func item(at index: IndexPath) -> HomeItem?
    func callHomeAPICall()
}

class HomeViewModel: HomeInputProtocol {
    var homeItems: [HomeItem] = []
    weak var presenterOutput: HomelOutputProtocol?
    var homeData: HomeDataModel?
    
    init(output: HomelOutputProtocol) {
        presenterOutput = output
    }
    
    
    func totalItems() -> Int {
        homeItems.removeAll()
        let topView = HomeItem(type: .top)
        let carousel = HomeItem(type: .carousel)
        let offers = HomeItem(type: .offers)
      
        let trending = HomeItem(type: .trending)
        let newArrivals = HomeItem(type: .newArrivals)
        
        let sofa = HomeItem(type: .sofa)
        let livingRoom = HomeItem(type: .livingRoom)
        
        let diningRoom = HomeItem(type: .diningRoom)
        let bedroom = HomeItem(type: .bedroom)
        
        let savedProducts = HomeItem(type: .savedProducts)
        let personalized = HomeItem(type: .personalized)
        let blogs = HomeItem(type: .blogs)
        
        let socialMedia = HomeItem(type: .socialMedia)
        
        // Top
        homeItems.append(topView)
        homeItems.append(carousel)
        homeItems.append(offers)
        
        //trending
        if self.homeData?.trendingProducts?.items?.count ?? 0 > 0 {
            homeItems.append(trending)
        }
        
        //new Arrival
        if self.homeData?.newLaunches?.items?.count ?? 0 > 0 {
            homeItems.append(newArrivals)
        }
        
        //Sofa
        if self.homeData?.sofasAndSeating?.subcategories?.count ?? 0 > 0 {
            homeItems.append(sofa)
        }
        
        //living Room
        if self.homeData?.livingroom?.subcategories?.count ?? 0 > 0 {
            homeItems.append(livingRoom)
        }
        
        //dining
        if self.homeData?.diningroom?.subcategories?.count ?? 0 > 0 {
            homeItems.append(diningRoom)
        }
        
        //bedroom
        if self.homeData?.bedroom?.subcategories?.count ?? 0 > 0 {
            homeItems.append(bedroom)
        }
        
//        //saved Products
//        if self.homeData?.savedProducts?.items.count ?? 0 > 0 {
//            homeItems.append(trending)
//        }
        
        
        //personalized
        if self.homeData?.personalizedForYou?.items?.count ?? 0 > 0 {
            homeItems.append(personalized)
        }
        
        
        homeItems.append(socialMedia)
        
        //latestBlog
        if self.homeData?.latestBlog?.count ?? 0 > 0 {
            homeItems.append(blogs)
        }
        
        return homeItems.count
    }
    
    func item(at index: IndexPath) -> HomeItem? {
        return homeItems[index.row]
    }
    
    func callHomeAPICall() {
        print("Call Home API")
        //        if let homeModel: HomeResponseModel = Utilities.loadJSONFromFile("Home", type: HomeResponseModel.self) {
        //
        //             print("✅ Loaded Product:")
        //             homeData = homeModel.data
        //             AppSessionManager.shared.homeData = homeData
        //            presenterOutput?.didGetHomeResponse(response: homeModel, error: nil)
        //         }
        self.presenterOutput?.showLoadingIndicator()
        OnboardingAPIManager.shared.getHome { result in
            self.presenterOutput?.hideLoadingIndicator()
            switch result {
            case .success(let homeModel):
                // Handle the successful response
                print("✅ Loaded Product:")
                self.homeData = homeModel.data
                AppSessionManager.shared.homeData = self.homeData
                self.presenterOutput?.didGetHomeResponse(response: homeModel, error: nil)
            case .failure(let error):
                // Handle the error
                
                print("Failed to fetch languages: \(error.localizedDescription)")
            }
        }
        
    }
    
    
    
    
}
