//
//  CustomCell.swift
//  HW24
//
//  Created by Jarae on 29/3/23.
//

import UIKit
import SnapKit

class CustomCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private var myImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 16
        return iv
    }()
    
    private var myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private var mySecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with: Article, and image: UIImage){
        myLabel.text = with.title
        mySecondLabel.text = with.description
        
        myImageView.image = image
        //myImageView.kf.setImage(with: URL(string: with.urlToImage!))

    }
    private func setupUI() {
        
        contentView.addSubview(myImageView)
        myImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.width.equalTo(100)
            make.height.equalTo(70)
        }
        
        contentView.addSubview(myLabel)
        myLabel.snp.makeConstraints { make in
            make.right.equalTo(myImageView.snp.left).offset(-30)
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(10)
        }
        
        contentView.addSubview(mySecondLabel)
        mySecondLabel.snp.makeConstraints { make in
            make.right.equalTo(myImageView.snp.left).offset(-30)
            make.top.equalTo(myLabel.snp.bottom).offset(20)
            
            make.left.equalToSuperview().offset(10)
        }
    }

    
}

//import UIKit
//import SnapKit
//import Kingfisher
//
//class CustomTableViewCell: UITableViewCell {
//    
//    static let idCell = "CustomCell"
//    
//    private lazy var titleLabel: UILabel = {
//        let title = UILabel()
//        title.font = .boldSystemFont(ofSize: 13)
//        title.numberOfLines = 2
//        title.textAlignment = .justified
//        return title
//    }()
//    
//    private lazy var descriptionLabel: UILabel = {
//        let descr = UILabel()
//        descr.font = .systemFont(ofSize: 11)
//        descr.numberOfLines = 5
//        descr.textAlignment = .justified
//        return descr
//    }()
//    
//    private lazy var imageOfNews: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.layer.masksToBounds = true
//        image.clipsToBounds = true
//        return image
//    }()
//    //    черта между строк
//    private lazy var dividerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .black
//        return view
//    }()
//    
//    //    func configure(with: Article){
//    //
//    //        self.titleLabel.text = with.title
//    //        self.descriptionLabel.text = with.description
//    //    }
//    
//    //    private func handleImage(url: String){
//    //        let url = URL(string: url)
//    //        self.imageOfNews.kf.setImage(with: url)
//    //    }
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupConstraints()
//    
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented")
//        }
//    
//    private func setupConstraints(){
//        
//        self.addSubview(imageOfNews)
//        imageOfNews.snp.makeConstraints{ make in
//            make.top.right.bottom.equalToSuperview().inset(8)
//            make.height.width.equalTo(140)
//        }
//        imageOfNews.layer.cornerRadius = imageOfNews.frame.height / 2.5
//        
//        self.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(20)
//            make.left.equalToSuperview().offset(10)
//            make.right.equalTo(imageOfNews.snp.left).offset(-20)
//        }
//        self.addSubview(descriptionLabel)
//        descriptionLabel.snp.makeConstraints{ make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(10)
//            make.left.equalToSuperview().offset(10)
//            make.right.equalTo(imageOfNews.snp.left).offset(-20)
//        }
//        self.addSubview(dividerView)
//        dividerView.snp.makeConstraints{ make in
//            make.bottom.equalToSuperview().offset(-2)
//            make.horizontalEdges.equalToSuperview().inset(5)
//            make.right.equalTo(0.3)
//        }
//    }
//}
