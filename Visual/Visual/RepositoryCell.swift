//
//  RepositoryCell.swift
//  Visual
//
//  Created by Hélio Mesquita on 14/12/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import UIKit

public class RepositoryCell: UICollectionViewCell {

    private var titleColor = UIColor.Design.title
    private var subtitleColor = UIColor.Design.subtitle

    private lazy var repositoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = titleColor
        label.text = "testing"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "testing"
        label.textColor = subtitleColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureViews() {
        backgroundColor = UIColor.Design.background
        contentView.backgroundColor = UIColor.Design.background
        addRepositoryImageView()
        addTitleLabel()
        addSubtitleLabel()
    }

    func addRepositoryImageView() {
        contentView.addSubview(repositoryImageView)
        NSLayoutConstraint.activate([
            repositoryImageView.heightAnchor.constraint(equalToConstant: 80),
            repositoryImageView.widthAnchor.constraint(equalToConstant: 80),
            repositoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            repositoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            repositoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
        ])
    }

    func addTitleLabel() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: repositoryImageView.trailingAnchor, constant: 8),
        ])
    }

    func addSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: repositoryImageView.trailingAnchor, constant: 8),
        ])
    }

}