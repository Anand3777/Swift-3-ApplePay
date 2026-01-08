//
//  ForgotPswdVC.swift
//  RoyalFurnitures
//
//  Created by CIPL on 07/11/25.
//

import UIKit
import CountryPickerView

class ForgotPswdVC: UIViewController {

    
    let cpvInternal = CountryPickerView()
    @IBOutlet weak var dialCodeTxt: UITextField!
    @IBOutlet weak var dialCodeImg: UIImageView!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    
    @IBOutlet weak var btnMobile: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var vwMobile: UIView!
    
    var selectedLogin = "email"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }
    
    func configUI() {
        let fields = [txtEmail, txtMobile]
        fields.forEach { $0?.setLeftPaddingPoints(10) }
        
        btnMobile.setImage(UIImage(named: "unSelect")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnEmail.setImage(UIImage(named: "selected")?.withRenderingMode(.alwaysTemplate), for: .normal)
        if selectedLogin == "email" {
            emailSelected()
        }else {
            mobileSelected()
        }
    }
    
    func emailSelected() {
        btnMobile.tintColor = .textGray
        btnEmail.tintColor = .primaryRed
        
        btnMobile.setTitleColor(.textGray, for: .normal)
        btnEmail.setTitleColor(.primaryRed, for: .normal)
        
        
        vwMobile.isHidden = true
        txtEmail.isHidden = false
    }
    
    func mobileSelected() {
        btnEmail.tintColor = .textGray
        btnMobile.tintColor = .primaryRed
        
        btnEmail.setTitleColor(.textGray, for: .normal)
        btnMobile.setTitleColor(.primaryRed, for: .normal)
                
        vwMobile.isHidden = false
        txtEmail.isHidden = true
    }
    
    @IBAction func countryCodeAction(_ sender: Any) {
        cpvInternal.delegate = self
        cpvInternal.showCountriesList(from: self)
    }
    
    @IBAction func emailSelected(_ sender: Any) {
        emailSelected()
    }
    
    @IBAction func mobileSelected(_ sender: Any) {
        mobileSelected()
    }
    
    @IBAction func continueAction(_ sender: Any) {
        
    }

}



extension ForgotPswdVC: CountryPickerViewDelegate {
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.dialCodeTxt.text = country.phoneCode
        self.dialCodeImg.image = country.flag
    }
}
