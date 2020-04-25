//
//  NewsDetailViewController.swift
//  Eco-Friend
//
//  Created by Александр Арсенюк on 01.04.2020.
//  Copyright © 2020 Александр Арсенюк. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, NewsDetailViewInput {
    
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    var fadeView: UIView!
    var tabBarFadeView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var model: NewsTableViewCellModel!
    var presenter: NewsDetailViewOutput!
    var navigationBar: UINavigationBar!
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureText()
        presenter.setupInitialState()
        configureNavifationBar()
        configureCollectionView()
        configureFadeView()
        
    }
        
    private func configureNavifationBar() {
        navigationBar = self.navigationController?.navigationBar
        self.title = "Статья"
    }
    
    private func configureText() {
        
        textView.isScrollEnabled = false
        textView.attributedText = configureLinks(on: model.text ?? "")
        textView.isUserInteractionEnabled = true
        textView.font = .systemFont(ofSize: 19, weight: .medium)
        textView.isSelectable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
        textViewHeightConstraint.constant = textView.contentSize.height
    }
    
    private func configureCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 60, height: 60)
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "NewsDetailCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "newsDetailCollectionViewCell")
    }
    
    private func configureFadeView() {
        tabBarFadeView = UIView()
        tabBarFadeView.frame = tabBarController?.tabBar.frame ?? CGRect.zero
        fadeView = UIView()
        fadeView.frame = UIScreen.main.bounds
        self.navigationController?.view.addSubview(fadeView)
        self.tabBarController?.view.addSubview(tabBarFadeView)
        fadeView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        fadeView.isHidden = true
        tabBarFadeView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        tabBarFadeView.isHidden = true
    }
    
    private func configureLinks(on text: String) -> NSMutableAttributedString {
        let stopWords = [",", ".", "?", "!", ":", ";", "-", "_", "\""]
        let mutableText = NSMutableAttributedString(string: text)
        for var word in mutableText.string.split(whereSeparator: { $0 == " " || $0 == "\n"}) {
            if word.contains("http") {
                if stopWords.contains(String(word.last!)) {
                    word = word.dropLast()
                }
                mutableText.setAsLink(textToFind: String(word), linkURL: String(word))
            }
        }
        return mutableText
    }
    
    //MARK: - NewsDetailViewInput
    
    func setModel(model: NewsTableViewCellModel) {
        self.model = model
    }
    
    
}

extension NSMutableAttributedString {

    public func setAsLink(textToFind:String, linkURL:String) {

        let foundRange = self.mutableString.range(of: textToFind)
        if foundRange.location != NSNotFound {
            self.addAttribute(.link, value: linkURL, range: foundRange)
        }
    }
}

extension NewsDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.imagesURL?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newsDetailCollectionViewCell", for: indexPath) as! NewsDetailCollectionViewCell
        let imageURL = model.imagesURL![indexPath.row]
        cell.configureCell(withURL: imageURL, and: .detail)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        fadeView.isHidden = false
        tabBarFadeView.isHidden = false
        presenter!.showCollection(withImagesURL: model.imagesURL!, at: indexPath)
    }
}
