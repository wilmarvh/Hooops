import UIKit
import NukeGifuPlugin

class ShotDetailImageCell: UICollectionViewCell {
    
    // MARK: Lifecycles
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    // MARK: Views
    
    lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.imageView)
        return view
    }()
    
    lazy var imageView: AnimatedImageView = {
        let view = AnimatedImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.imageView.contentMode = .scaleAspectFill
        view.prepareForReuse()
        return view
    }()
    
    func configureViews() {
        contentView.addSubview(containerView)
        let views = ["imageView" : imageView,
                     "containerView" : containerView]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[containerView]|", options: [], metrics: nil, views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[containerView]|", options: [], metrics: nil, views: views))
        
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: views))
        containerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]|", options: [], metrics: nil, views: views))
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        var newFrame = layoutAttributes.frame
        // note: don't change the width
        newFrame.size.height = 321
        layoutAttributes.frame = newFrame
        return layoutAttributes
    }
    
}
