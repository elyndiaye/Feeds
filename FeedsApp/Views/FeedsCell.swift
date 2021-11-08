//
//  FeedsCell.swift
//  FeedsApp
//
//  Created by Ely Assumpcao Ndiaye on 05/11/21.
//

import UIKit


class FeedsCell: UITableViewCell {
    
    lazy var view: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var sellerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var followLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.text = "FOLLOW"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sellerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.minimumScaleFactor = 0.8
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var itemImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var itemSecondImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    lazy var itemLastImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "shared"), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedsCell: CodeView{
    func buildViewHierarchy() {
        addSubview(view)
        view.addSubview(sellerLabel)
        view.addSubview(followLabel)
        view.addSubview(sellerDescriptionLabel)
        view.addSubview(itemImage)
        view.addSubview(itemSecondImage)
        view.addSubview(itemLastImage)
        view.addSubview(timeLabel)
        view.addSubview(shareButton)
    }
    
    func setupConstraints() {
        
        view.snp.makeConstraints {
            $0.top.equalToSuperview().inset(25)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview()
        }
        
        sellerLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
                $0.leading.equalToSuperview().offset(15)
        }
        
        followLabel.snp.makeConstraints {
            $0.top.equalTo(sellerLabel.snp.top)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        sellerDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(sellerLabel.snp.bottom).offset(10)
            $0.leading.equalTo(sellerLabel.snp.leading)
        }
        
        itemImage.snp.makeConstraints {
            $0.top.equalTo(sellerDescriptionLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.height.equalTo(150)
        }
        
        itemSecondImage.snp.makeConstraints {
            $0.top.equalTo(itemImage.snp.top)
            $0.leading.equalTo(itemImage.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.height.equalTo(150)
        }
        
        itemLastImage.snp.makeConstraints {
            $0.top.equalTo(itemImage.snp.top)
            $0.leading.equalTo(itemSecondImage.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.35)
            $0.height.equalTo(150)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(itemImage.snp.bottom).offset(15)
            $0.leading.equalTo(sellerDescriptionLabel.snp.leading)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.top)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(15)
            $0.width.equalTo(50)
            $0.bottom.equalToSuperview().inset(15)

        }
    }
    
    func setupAdditionalConfiguration() {
        sellerLabel.backgroundColor = .gray
        followLabel.backgroundColor = .orange
    }
    
    func changeCollor(){
        sellerLabel.backgroundColor = .green
        followLabel.isHidden = true
    }
    
}
