//
//  CollectionViewContentSized.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

class CollectionViewContentSized: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

// MARK: - Extensions -

extension UICollectionView {
    private enum AnimationDirection {
        case up
        case down
        case left
        case right
    }

    private func reloadData(animationDirection: AnimationDirection) {
        reloadData()
        layoutIfNeeded()
        let cells = visibleCells
        var index = 0
        let tableHeight: CGFloat = bounds.size.height
        for i in cells {
            let cell: UICollectionViewCell = i as UICollectionViewCell
            switch animationDirection {
            case .up:
                cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                break
            case .down:
                cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                break
            case .left:
                cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                break
            case .right:
                cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                break
            }
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }

    func animateToLeft() {
        reloadData(animationDirection: .left)
    }

    func animateToRight() {
        reloadData(animationDirection: .right)
    }

    func animateToTop() {
        reloadData(animationDirection: .down)
    }

    func animateToBottom() {
        reloadData(animationDirection: .up)
    }
}

extension UICollectionView {
    func scrollToBottom(animated: Bool = true) {
        DispatchQueue.main.async {
            let sections = self.numberOfSections - 1
            let rows = self.numberOfItems(inSection: sections) - 1
            if rows > 0 {
                self.scrollToBottom()
                self.scrollToItem(at: NSIndexPath(row: rows, section: sections) as IndexPath, at: .bottom, animated: true)
            }
        }
    }
}


extension UICollectionView {
    
    //MARK: -Properties -
    private static var placeholderAction: (()->())? = nil
    private var action: (()->())? {
        get {
            return UICollectionView.placeholderAction
        }
        set(newValue) {
            UICollectionView.placeholderAction = newValue
        }
    }
    
    //MARK: - Logic Methods -
    private func creatPlaceholder(title: String?, message: String?, image: UIImage? = nil, actionName: String? = nil, action: (()->())? = nil) {
        
        self.action = action
        
        //MARK:- Colors-
        let titleColor = Theme.colors.secondryDarkFontColor
        let messageColor = Theme.colors.secondryDarkFontColor
//        let buttonTextColor = #colorLiteral(red: 0.1058823529, green: 0.5568627451, blue: 0.5450980392, alpha: 1)
        
        //MARK:-Views-
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let stackView = UIStackView()
        let imageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        let actionButton = UIButton()
        
        //MARK:-Handel Views-
        
        //MARK:- EmptyView
        emptyView.backgroundColor = .clear
        
        //MARK:- StackView
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.alignment = .center
        stackView.spacing = 16
        
        //MARK:- ImageView
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        if image == nil {
            imageView.isHidden = true
        }
        
        //MARK:- Title Label
        titleLabel.textColor = titleColor
        titleLabel.font = .systemFont(ofSize: 18)
        titleLabel.text = title
        titleLabel.textAlignment = .center
        if title == nil {
            titleLabel.isHidden = true
        }
        
        //MARK:- Message Label
        messageLabel.textColor = messageColor
        messageLabel.font = .systemFont(ofSize: 17)
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        if message == nil {
            messageLabel.isHidden = true
        }
        
        //MARK:- Action Button
        actionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        actionButton.setTitleColor(Theme.colors.mainColor, for: .normal)
        actionButton.setTitle(actionName, for: .normal)
        actionButton.layer.borderColor = Theme.colors.mainColor.cgColor
        actionButton.layer.borderWidth = 1
        actionButton.layer.cornerRadius = 25
        actionButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.4).isActive = true
        actionButton.clipsToBounds = true
        
        if action == nil {
            actionButton.isHidden = true
        } else {
            actionButton.addTarget(self, action: #selector(self.tempFunc), for: .touchUpInside)
        }
        
        
        //MARK:-Add Views As Subviews-
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(messageLabel)
        stackView.addArrangedSubview(actionButton)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.addSubview(stackView)
        
        //MARK:-Handel Constriant-
        stackView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(greaterThanOrEqualTo: emptyView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(greaterThanOrEqualTo: emptyView.trailingAnchor).isActive = true
        
        //MARK:- The Final Result
        emptyView.alpha = 0
        self.backgroundView = emptyView
        
        UIView.animate(withDuration: 0.3) {
            emptyView.alpha = 1
        }
        
    }
    
    func createPlaceholder(_ placeholder: TableViewPlaceHolder) {
        self.creatPlaceholder(title: placeholder.title, message: placeholder.message, image: UIImage(named: placeholder.imageName), actionName: placeholder.actionName, action: placeholder.action)
    }
    func restorePlaceholderWith(separator: UITableViewCell.SeparatorStyle) {
        UIView.animate(withDuration: 0.2) {
            self.backgroundView?.alpha = 0
        } completion: { (_) in
            self.backgroundView = nil
//            self.separatorStyle = separator
        }
    }
    
    //MARK: - Action -
    @objc func tempFunc() {
        self.action?()
    }
    
}
