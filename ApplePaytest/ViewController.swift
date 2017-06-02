//
//  ViewController.swift
//  ApplePaytest
//
//  Created by Anand on 02/06/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import UIKit
import PassKit

class ViewController: UIViewController, PKPaymentAuthorizationViewControllerDelegate {

    private var merchantID = "merchant.com.xxxx.applepaytest"
    
    var paymentRequest : PKPaymentRequest!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func itemToSell(shipping: Double) -> [PKPaymentSummaryItem] {
        let teeShirt = PKPaymentSummaryItem(label: "Jordan Tee-Shirt", amount: 45.00)
        let discount = PKPaymentSummaryItem(label: "Discount", amount: -20.00)
        let shipping = PKPaymentSummaryItem(label: "Shipping", amount: NSDecimalNumber(string: "\(shipping)"))
        let totalAmount = teeShirt.amount.adding(discount.amount).adding(shipping.amount)
        let totalPrice = PKPaymentSummaryItem(label: "Pay to xxxxxx", amount: totalAmount)
        return [teeShirt, discount, shipping, totalPrice]
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didSelect shippingMethod: PKShippingMethod, completion: @escaping (PKPaymentAuthorizationStatus, [PKPaymentSummaryItem]) -> Void) {
        
        completion(PKPaymentAuthorizationStatus.success, itemToSell(shipping: Double(shippingMethod.amount)))
    }
    
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping (PKPaymentAuthorizationStatus) -> Void) {
        completion(PKPaymentAuthorizationStatus.success)
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func payAction(_ sender: Any) {
        
        let paymentNetworks = [PKPaymentNetwork.amex, .visa, .masterCard, .discover]
        
        if PKPaymentAuthorizationViewController.canMakePayments(usingNetworks: paymentNetworks) {
            
            paymentRequest = PKPaymentRequest()
            paymentRequest.currencyCode = "USD"
            paymentRequest.countryCode = "US"
            paymentRequest.merchantIdentifier = merchantID
            
            paymentRequest.supportedNetworks = paymentNetworks
            paymentRequest.merchantCapabilities = .capability3DS
            paymentRequest.requiredShippingAddressFields = [.all]
            paymentRequest.paymentSummaryItems = self.itemToSell(shipping: 4.99)
            
            let sameDayShyping = PKShippingMethod(label: "Same Day Delivery", amount: 12.99)
            sameDayShyping.detail = "Delivery is guaranted the same day"
            sameDayShyping.identifier = "sameDay"
            
            let twoDayShyping = PKShippingMethod(label: "Same Day Delivery", amount: 4.99)
            twoDayShyping.detail = "Delivered to you within next two days"
            twoDayShyping.identifier = "twoDay"
            
            let freeShyping = PKShippingMethod(label: "Same Day Delivery", amount: 0.00)
            freeShyping.detail = "Delivered to you within 7 days."
            freeShyping.identifier = "freeShipping"
            
            paymentRequest.shippingMethods = [sameDayShyping, twoDayShyping, freeShyping]
            
            let applePayVC = PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)
            applePayVC.delegate = self
            self.present(applePayVC, animated: true, completion: nil)
        } else {
            print("Tell the user that he needs to set up appl Pay.")
        }
    }
    
}

