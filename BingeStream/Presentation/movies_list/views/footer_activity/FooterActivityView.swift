//
//  FooterActivityView.swift
//  BingeStream
//
//  Created by Ankit Saxena on 03/05/23.
//

import UIKit

protocol FooterActivityView {
    func activity(enable: Bool)
}

final class FooterActivityViewImpl: UIView {
    
    //MARK: UI Properties
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    //MARK: Properties
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    //MARK: Helpers
    private func setup() {
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    //MARK: Selectors
    
}

// MARK: - Public Methods
extension FooterActivityViewImpl: FooterActivityView {
    
    func activity(enable: Bool) {
        DispatchQueue.main.async {
            enable ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
    }
    
}
