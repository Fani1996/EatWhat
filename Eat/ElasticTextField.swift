import UIKit

class ElasticTextField: UITextField {
    
    var elasticView : ElasticView!
    
    @IBInspectable var overshootAmount: CGFloat = 10 {
        didSet {
            elasticView.overshootAmount = overshootAmount
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupView()
    }
    
    func setupView() {
        clipsToBounds = false
        borderStyle = .None
        
        elasticView = ElasticView(frame: bounds)
        elasticView.frame = CGRectMake(0, 0, 230, 54)
        elasticView.backgroundColor = backgroundColor
        addSubview(elasticView)
        
        backgroundColor = UIColor.clearColor()
        
        elasticView.userInteractionEnabled = false
    }
    
    override func touchesBegan(touches: Set< UITouch >, withEvent event: UIEvent?) {
        elasticView.touchesBegan(touches, withEvent: event)
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 5)
    }
}