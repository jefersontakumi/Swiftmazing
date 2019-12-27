//
//  RepositoryCell.swift
//  Visual
//
//  Created by Hélio Mesquita on 14/12/19.
//  Copyright © 2019 Hélio Mesquita. All rights reserved.
//

import UIKit
import SDWebImage

public class FeedRepositoryCell: UICollectionViewCell {

    private var designTitleColor = UIColor.Design.title
    private var designSubtitleColor = UIColor.Design.subtitle
    private var designLineColor = UIColor.Design.line
    private var designBackgroundColor = UIColor.Design.background

    internal lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = designLineColor?.cgColor
        return imageView
    }()

    internal lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = designTitleColor
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    internal lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = designSubtitleColor
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureViews() {
        backgroundColor = designBackgroundColor
        addRepositoryImageView()
        addStackView()
        addNameLabel()
        addSubtitleLabel()
    }

    private func addRepositoryImageView() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 63),
            imageView.widthAnchor.constraint(equalToConstant: 63),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }

    private func addStackView() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            stackView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
        ])
    }

    private func addNameLabel() {
        stackView.addArrangedSubview(nameLabel)
    }

    private func addSubtitleLabel() {
        stackView.addArrangedSubview(descriptionLabel)
    }

    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        imageView.layer.borderColor = designLineColor?.cgColor
    }

    public func configure<T: FeedCollectionViewModelProtocol>(_ element: T) {
        nameLabel.text = element.name
        descriptionLabel.text = element.description
        imageView.sd_setImage(with: element.images.first)
    }

}


#if DEBUG && canImport(SwiftUI)
import SwiftUI

struct FeedRepositoryCellRepresentable: UIViewRepresentable {

    @Binding var nameLabel: String
    @Binding var descriptionLabel: String
    @Binding var avatar: UIImage?

    public typealias UIViewType = FeedRepositoryCell

    func makeUIView(context: UIViewRepresentableContext<FeedRepositoryCellRepresentable>) -> FeedRepositoryCell {
        return FeedRepositoryCell(frame: .zero)
    }

    func updateUIView(_ uiView: FeedRepositoryCell, context: UIViewRepresentableContext<FeedRepositoryCellRepresentable>) {
        uiView.nameLabel.text = nameLabel
        uiView.descriptionLabel.text = descriptionLabel
        uiView.imageView.image = avatar
    }

}

@available(iOS 13.0, *)
struct FeedRepositoryCell_Preview: PreviewProvider {

    static var previews: some View {
        FeedRepositoryCellRepresentable(nameLabel: .constant("Name label"),
                                        descriptionLabel: .constant("Description Label"),
                                        avatar: .constant(UIImage(named: "swift", in: Bundle.module, compatibleWith: nil)))
            .padding(.horizontal, 8.0)
    }
}

#endif
