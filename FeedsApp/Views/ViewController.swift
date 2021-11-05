//
//  ViewController.swift
//  FeedsApp
//
//  Created by Ely Assumpcao Ndiaye on 04/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        segmentedControl.insertSegment(withTitle: "Following", at: 0, animated: false)
        segmentedControl.insertSegment(withTitle: "Explore", at: 1, animated: false)
        segmentedControl.selectedSegmentIndex = 0
        //after
        segmentedControl.selectedSegmentTintColor = .orange
        segmentedControl.backgroundColor = .white
        //segmentedControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        return segmentedControl
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        //tableView.delegate = self
        tableView.rowHeight = 320
        tableView.register(FeedsCell.self, forCellReuseIdentifier: String(describing: FeedsCell.self))
        //tableView.backgroundView = activity
        tableView.tableFooterView = UIView()
        return tableView
    }()

    var feed = [
        Feed(seller: "RECOMMENDED SELLER", sellerDescription: "Seller with a very long name that \nneeds two lines to fit", time: "32 minutes ago"),
        Feed(seller: "RECOMMENDED SELLER", sellerDescription: "Seller short name", time: "20-04-2020"),
        Feed(seller: "NEW ARRIVALS", sellerDescription: "Jerseygramm and Brandings Store", time: "20-04-2020")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = .gray
    }

}

extension ViewController: CodeView{
    func buildViewHierarchy() {
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            //$0.centerX.equalToSuperview()
            // $0.width.equalTo(200)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
       
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedsCell.self), for: indexPath) as? FeedsCell else {
            return UITableViewCell()
        }
        
        let item = feed[indexPath.row]
        print(item)
        cell.sellerLabel.text = item.seller
        cell.sellerDescriptionLabel.text = item.sellerDescription
        cell.timeLabel.text = item.time
        cell.imageView?.image = UIImage(named: "firstPhoto")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
}
