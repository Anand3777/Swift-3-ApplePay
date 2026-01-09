//
//  AccountVC.swift
//  RoyalFurnitures
//
//  Created by CIPL on 08/11/25.
//

import UIKit

class AccountVC: UIViewController {
    @IBOutlet weak var myAccountTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(
            red: 126 / 255,
            green: 0,
            blue: 0,
            alpha: 1
        )
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

        // Create label
        let titleLabel = UILabel()
        titleLabel.text = "My Account"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.sizeToFit()

        // Add directly to navigation bar
        if let navBar = self.navigationController?.navigationBar {
            navBar.addSubview(titleLabel)

            // Set frame manually to x = 0
            titleLabel.frame.origin = CGPoint(
                x: 35,
                y: (navBar.frame.height - titleLabel.frame.height) / 2
            )
        }

        setupTableView()
    }
}

extension AccountVC: UITableViewDataSource, UITableViewDelegate {

    func setupTableView() {
        myAccountTableView.delegate = self
        myAccountTableView.dataSource = self
        myAccountTableView.separatorStyle = .none

        //
        myAccountTableView.register(
            UINib(nibName: "AccountHeaderCell", bundle: nil),
            forCellReuseIdentifier: "AccountHeaderCell"
        )
        myAccountTableView.register(
            UINib(nibName: "ExclusiveOffersCell", bundle: nil),
            forCellReuseIdentifier: "ExclusiveOffersCell"
        )
        myAccountTableView.register(
            UINib(nibName: "SettingsCell", bundle: nil),
            forCellReuseIdentifier: "SettingsCell"
        )
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        if section == 0{
            return 1
        }
        
        if section == 3 || section == 4 || section == 5 {
            if section == 3 {
                return 3
            } else if section == 4 {
                return 6
            } else {
                return 2
            }
        }
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell =
                tableView.dequeueReusableCell(
                    withIdentifier: "AccountHeaderCell",
                    for: indexPath
                ) as! AccountHeaderCell

            return cell
        } else if indexPath.section == 1 {
            let cell =
                tableView.dequeueReusableCell(
                    withIdentifier: "ExclusiveOffersCell",
                    for: indexPath
                ) as! ExclusiveOffersCell

            return cell
        } else if indexPath.section == 3 {
            let cell =
                tableView.dequeueReusableCell(
                    withIdentifier: "SettingsCell",
                    for: indexPath
                ) as! SettingsCell

            return cell
        } else {
            let cell =
                tableView.dequeueReusableCell(
                    withIdentifier: "ExclusiveOffersCell",
                    for: indexPath
                ) as! ExclusiveOffersCell

            return cell
        }

    }

    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        if indexPath.row == 0 {
            return 90
        } else if indexPath.row == 1 {
            return 85
        }
        return 90
    }
}
