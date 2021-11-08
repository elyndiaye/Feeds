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
        segmentedControl.selectedSegmentTintColor = .orange
        segmentedControl.backgroundColor = .white
        segmentedControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        return segmentedControl
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .gray
        tableView.register(FeedsCell.self, forCellReuseIdentifier: String(describing: FeedsCell.self))
        return tableView
    }()
    
    var feeds = [
        Feed(seller: "RECOMMENDED SELLER", sellerDescription: "Seller with a very long name that \nneeds two lines to fit", time: "32 minutes ago", status: false, logoImages: [
                "firstPhoto", "secondPhoto", "lastPhoto"]),
        
        Feed(seller: "RECOMMENDED SELLER", sellerDescription: "Seller short name", time: "20-04-2020", status: false, logoImages: [
                "firstPhoto", "secondPhoto", "lastPhoto"]),
        
        Feed(seller: "NEW ARRIVALS", sellerDescription: "Jerseygramm and Brandings Store", time: "20-04-2020",status: true, logoImages: [
                "firstJersey", "secondJersey", "lastJersey"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.view.backgroundColor = .gray
    }
    
}

extension ViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(segmentedControl)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).inset(15)
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
        
        let item = feeds[indexPath.row]
        cell.sellerLabel.text = item.seller
        cell.sellerDescriptionLabel.text = item.sellerDescription
        cell.timeLabel.text = item.time
        cell.itemImage.image = UIImage(named: item.logoImages[0])
        cell.itemSecondImage.image = UIImage(named:  item.logoImages[1])
        cell.itemLastImage.image = UIImage(named:  item.logoImages[2])
        if item.status { cell.changeCollor() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = feeds[indexPath.row]
        
        let alert = UIAlertController(title: "\(item.seller)", message:"The feed has been selected", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

extension ViewController{
    @objc func didTapSegmentControl(){
        let alert = UIAlertController(title: "To be implemented", message: "Seguemented Changed", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
