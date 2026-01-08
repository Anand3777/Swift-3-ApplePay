//
//  HomeModel.swift
//  RoyalFurnitures
//
//  Created by CIPL on 10/11/25.
//


import Foundation

// MARK: - HomeModel
struct HomeResponseModel: Codable {
    let version, detail, message: String?
    let data: HomeDataModel?
    let meta: Meta?
}

// MARK: - DataClass
struct HomeDataModel: Codable {
    let topBar: TopBar?
    let activeSale: ActiveSale?
    let promotionalBanners, offerBanners: [Banner]?
    let sofasAndSeating, bedroom, diningroom, livingroom: Bedroom?
    let offersSpotlight: OffersSpotlight?
    let trendingProducts: FeaturedDeals?
    let personalizedForYou: PersonalizedForYou?
    let featuredDeals, newLaunches: FeaturedDeals?
    let shopByCategory: [ShopByCategory]?
    let roomOffers: [Banner]?
    let findStores: FindStores?
    let socialMedia: SocialMedia?
    let floatingOffers: FloatingOffers?
    let latestBlog: [LatestBlog]?

    enum CodingKeys: String, CodingKey {
        case topBar = "top_bar"
        case activeSale = "active_sale"
        case promotionalBanners = "promotional_banners"
        case offerBanners = "offer_banners"
        case sofasAndSeating = "sofas_and_seating"
        case bedroom, diningroom, livingroom
        case offersSpotlight = "offers_spotlight"
        case trendingProducts = "trending_products"
        case personalizedForYou = "personalized_for_you"
        case featuredDeals = "featured_deals"
        case newLaunches = "new_launches"
        case shopByCategory = "shop_by_category"
        case roomOffers = "room_offers"
        case findStores = "find_stores"
        case socialMedia = "social_media"
        case floatingOffers = "floating_offers"
        case latestBlog = "latest_blog"
    }
}

// MARK: - ActiveSale
struct ActiveSale: Codable {
    let isActive: Bool?
    let title, timeRemaining: String?
    let banners: [Banner]?
    let autoScrollSeconds: Int?

    enum CodingKeys: String, CodingKey {
        case isActive = "is_active"
        case title
        case timeRemaining = "time_remaining"
        case banners
        case autoScrollSeconds = "auto_scroll_seconds"
    }
}

// MARK: - Bedroom
struct Bedroom: Codable {
    let title: String?
    let banner: Banner?
    let subcategories: [Subcategory]?
    let videoBanner: Banner?

    enum CodingKeys: String, CodingKey {
        case title, banner, subcategories
        case videoBanner = "video_banner"
    }
}

// MARK: - Banner
struct Banner: Codable {
    let id: Int?
    let title: String?
    let description: String?
    let type: String?
    let image: String?
    let video: String?
    let linkURL: String?
    let startTime, endTime: String?
    let showCountdown: Bool?
    let sortOrder: Int?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case id, title, description, type, image, video
        case linkURL = "link_url"
        case startTime = "start_time"
        case endTime = "end_time"
        case showCountdown = "show_countdown"
        case sortOrder = "sort_order"
        case isActive = "is_active"
    }
}

// MARK: - Subcategory
struct Subcategory: Codable {
    let id: Int?
    let name: String?
    let icon, bannerImage: String?
    let displayPriority, productCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, icon
        case bannerImage = "banner_image"
        case displayPriority = "display_priority"
        case productCount = "product_count"
    }
}

// MARK: - FeaturedDeals
struct FeaturedDeals: Codable {
    let autoScrollSeconds: Int?
    let items: [Items]?

    enum CodingKeys: String, CodingKey {
        case autoScrollSeconds = "auto_scroll_seconds"
        case items
    }
}

// MARK: - Item
struct Items: Codable {
    let id: Int?
    let name, slug, description: String?
    let category: ShopByCategory?
    let subCategory: Subcategory?
    let pricing: Pricing?
    let thumbnailImage: String?
    let label: Label?
    let show3DView: Bool?
    let threeDModel: String?
    let viewCount: Int?
    let isCustomizable, isOffer: Bool?
    let deliveryEstimateDays: String?
    let displayPriority, addedToCartCount: Int?
    let status: Status?
    let variants: [Variant]?
    let averageRating, reviewCount: Int?
    let isTrending, isInWishlist: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, description, category
        case subCategory = "sub_category"
        case pricing
        case thumbnailImage = "thumbnail_image"
        case label
        case show3DView = "show_3d_view"
        case threeDModel = "three_d_model"
        case viewCount = "view_count"
        case isCustomizable = "is_customizable"
        case isOffer = "is_offer"
        case deliveryEstimateDays = "delivery_estimate_days"
        case displayPriority = "display_priority"
        case addedToCartCount = "added_to_cart_count"
        case status, variants
        case averageRating = "average_rating"
        case reviewCount = "review_count"
        case isTrending = "is_trending"
        case isInWishlist = "is_in_wishlist"
    }
}

// MARK: - ShopByCategoryElement
struct ShopByCategory: Codable {
    let id: Int?
    let name: String?
    let icon: String?
    let bannerImage: String?
    let displayPriority: Int?
    let deliveryEstimateDays: String?
    let defaultDeliveryDays: Int?
    let supportsExpressDelivery: Bool?
    let expressDeliveryDuration, expressDeliveryCharge: String?
    let supportsFreeAssembly: Bool?
    let productCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, icon
        case bannerImage = "banner_image"
        case displayPriority = "display_priority"
        case deliveryEstimateDays = "delivery_estimate_days"
        case defaultDeliveryDays = "default_delivery_days"
        case supportsExpressDelivery = "supports_express_delivery"
        case expressDeliveryDuration = "express_delivery_duration"
        case expressDeliveryCharge = "express_delivery_charge"
        case supportsFreeAssembly = "supports_free_assembly"
        case productCount = "product_count"
    }
}

// MARK: - Label
struct Label: Codable {
    let name: String?
}

// MARK: - Pricing
struct Pricing: Codable {
    let basePrice: String?
    let offerPrice: String?
    let offerPercentage: Double?
    let tax: String?

    enum CodingKeys: String, CodingKey {
        case basePrice = "base_price"
        case offerPrice = "offer_price"
        case offerPercentage = "offer_percentage"
        case tax
    }
}

enum Status: String, Codable {
    case active = "active"
}

// MARK: - Variant
struct Variant: Codable {
    let id: Int?
    let sku: String?
    let regionPrices: Pricing?
    let variantImages: [String]?

    enum CodingKeys: String, CodingKey {
        case id, sku
        case regionPrices = "region_prices"
        case variantImages = "variant_images"
    }
}

// MARK: - FindStores
struct FindStores: Codable {
    let mapURL: String?
    let list: [ListStore]?

    enum CodingKeys: String, CodingKey {
        case mapURL = "map_url"
        case list
    }
}

// MARK: - List
struct ListStore: Codable {
    let id: Int?
    let name, phoneNumber, email, country: String?
    let street, city, state, postalCode: String?
    let latitude, longitude: Double?

    enum CodingKeys: String, CodingKey {
        case id, name
        case phoneNumber = "phone_number"
        case email, country, street, city, state
        case postalCode = "postal_code"
        case latitude, longitude
    }
}

// MARK: - FloatingOffers
struct FloatingOffers: Codable {
    let visible: Bool?
    let badgeCount: Int?
    let label, linkURL: String?

    enum CodingKeys: String, CodingKey {
        case visible
        case badgeCount = "badge_count"
        case label
        case linkURL = "link_url"
    }
}

// MARK: - LatestBlog
struct LatestBlog: Codable {
    let id: Int?
    let title, slug: String?
    let author: String?
    let category: LatestBlogCategory?
    let thumbnail: String?
    let shortDescription: String?
    let publishedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title, slug, author, category, thumbnail
        case shortDescription = "short_description"
        case publishedAt = "published_at"
    }
}

// MARK: - LatestBlogCategory
struct LatestBlogCategory: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - OffersSpotlight
struct OffersSpotlight: Codable {
    let title, description, sectionType: String?
    let mainBanner: Banner?
    let subcategories: [Subcategory]?

    enum CodingKeys: String, CodingKey {
        case title, description
        case sectionType = "section_type"
        case mainBanner = "main_banner"
        case subcategories
    }
}

// MARK: - PersonalizedForYou
struct PersonalizedForYou: Codable {
    let available: Bool?
    let items: [Items]?
}

// MARK: - SocialMedia
struct SocialMedia: Codable {
    let facebook, instagram, youtube, twitter: String?
}

// MARK: - TopBar
struct TopBar: Codable {
    let searchPlaceholder: String?
    let categories: [String]?
    let notificationCount: Int?
    let location: LocationDetail?

    enum CodingKeys: String, CodingKey {
        case searchPlaceholder = "search_placeholder"
        case categories
        case notificationCount = "notification_count"
        case location
    }
}

// MARK: - Location
struct LocationDetail: Codable {
    let current: String?
    let canUpdate: Bool?
    let countryID: Int?

    enum CodingKeys: String, CodingKey {
        case current
        case canUpdate = "can_update"
        case countryID = "country_id"
    }
}

// MARK: - Meta
struct Meta: Codable {
    let type, action: String?
}
