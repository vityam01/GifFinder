//
//  DetailTableViewCell.swift
//  KevychTestTask
//
//  Created by Vitya Mandryk on 27.05.2022.
//

import UIKit
import SDWebImage

class DetailTableViewCell: UITableViewCell {
    
    //MARK: Create UI Elements
    
    private let requestImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .redraw
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postedDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: Variables/Constants
    
    private var viewModel: DetailTableViewCellModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(requestImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(postedDateLabel)
        applyconstraints()
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public method
    
    func configure(model: DetailTableViewCellModel) {
        viewModel = model
        guard let viewModel = viewModel else { return }
        // using ImageIO
        self.requestImageView.image = UIImage.gifImageWithData(viewModel.loadingData())
        // //using SDWebImage
//        self.requestImageView.image = UIImage.sd_image(withGIFData: viewModel.loadingData())
        titleLabel.text = viewModel.modelData.title
        postedDateLabel.text = viewModel.modelData.date
        
    }
    
    
    //MARK: Private methods
    
    private func initUI() {
        self.clipsToBounds = true
        contentView.addSubview(requestImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(postedDateLabel)
        applyconstraints()
    }
    
    private func applyconstraints() {
        let requestImageViewConstraints = [
            requestImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            requestImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            requestImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                     constant: 5),
            requestImageView.widthAnchor.constraint(equalToConstant: 220)
        ]
        
        let titleLabelConstriant = [
            titleLabel.leadingAnchor.constraint(equalTo: requestImageView.trailingAnchor,
                                                 constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            titleLabel.centerYAnchor.constraint(equalTo: requestImageView.centerYAnchor)
        ]
        
        let postedDateLabelConstraint = [
            postedDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                                 constant: 25),
            postedDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            postedDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                      constant: 8),
        ]
        
        NSLayoutConstraint.activate(requestImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstriant)
        NSLayoutConstraint.activate(postedDateLabelConstraint)
        
    }
    
}
