//
//  StackView.swift
//
//  Created by Ahmed Mostafa
//

import UIKit

extension UIStackView {
    private enum AnimationDirection {
        case up
        case down
        case left
        case right
    }

    private func reloadData(animationDirection: AnimationDirection) {
        layoutIfNeeded()
        let views = arrangedSubviews
        var index = 0
        let tableHeight: CGFloat = bounds.size.height
        for i in views {
            let cell = i as UIView
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

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
