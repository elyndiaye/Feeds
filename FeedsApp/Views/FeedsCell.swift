//
//  FeedsCell.swift
//  FeedsApp
//
//  Created by Ely Assumpcao Ndiaye on 05/11/21.
//

import UIKit


class FeedsCell: UITableViewCell {
    
    var status: Bool = false
    
    lazy var sellerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
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
        label.lineBreakMode = .byTruncatingTail // or .byWrappingWord
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
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.orange, for: .normal)
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
        addSubview(sellerLabel)
        addSubview(followLabel)
        addSubview(sellerDescriptionLabel)
        addSubview(itemImage)
        addSubview(itemSecondImage)
        addSubview(itemLastImage)
        addSubview(timeLabel)
        addSubview(shareButton)
    }
    
    func setupConstraints() {
        sellerLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(15)
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
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        itemSecondImage.snp.makeConstraints {
            $0.top.equalTo(sellerDescriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(itemImage.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        itemLastImage.snp.makeConstraints {
            $0.top.equalTo(sellerDescriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(itemSecondImage.snp.trailing)
            $0.width.equalToSuperview().multipliedBy(0.33)
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(itemImage.snp.bottom).inset(15)
            $0.leading.equalTo(sellerDescriptionLabel.snp.leading)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(timeLabel.snp.top)
            $0.trailing.equalToSuperview().inset(15)
            $0.height.equalTo(15)
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
