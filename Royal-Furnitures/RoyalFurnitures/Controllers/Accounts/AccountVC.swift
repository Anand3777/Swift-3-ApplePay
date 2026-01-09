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

        //
        myAccountTableView.register(
            UINib(nibName: "AccountHeaderCell", bundle: nil),
            forCellReuseIdentifier: "AccountHeaderCell"
        )
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "AccountHeaderCell",
                for: indexPath
            ) as! AccountHeaderCell

        return cell
    }
}
