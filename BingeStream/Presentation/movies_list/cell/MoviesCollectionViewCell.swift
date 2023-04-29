//
//  MoviesCollectionViewCell.swift
//  BingeStream
//
//  Created by Ankit Saxena on 24/04/23.
//

import UIKit

final class MoviesCollectionViewCell: UICollectionViewCell {
    
    //MARK: Outelets
    @IBOutlet private weak var movieTitleLbl: UILabel!
    @IBOutlet private weak var actorLbl: UILabel!
    @IBOutlet private weak var directorLbl: UILabel!
    @IBOutlet private weak var descriptionLbl: UILabel!
    
    @IBOutlet private var cons_parent_width: NSLayoutConstraint!
    
    //MARK: Properties
    static let reuseIdentifier = String(describing: MoviesCollectionViewCell.self)
    private var model: FilmsListModel!
    
    //MARK: UI Properties
    
    //MARK: Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configureUI(with: model)
    }
    
    //MARK: Helpers
    private func configureUI(with model: FilmsListModel) {
        movieTitleLbl.text = model.title
        actorLbl.text = model.actors
        directorLbl.text = model.director
        descriptionLbl.text = model.description
    }
    
    //MARK: Selectors

}

//MARK : - Internal Methods
extension MoviesCollectionViewCell {
    
    func configureCell(model: FilmsListModel) {
        self.model = model
        configureUI(with: model)
    }
    
    func configure(width: CGFloat) {
        DispatchQueue.main.async {
            self.cons_parent_width.constant = width
            self.layoutIfNeeded()
        }
        
    }
    
}
