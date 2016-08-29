//
//  MMProgress.swift
//  Pods
//
//  Created by Alexander Larson on 3/21/16.
//
//

public typealias Completion = () -> Void

public class MMProgress : UIView {
    
    //Constraints
    @IBOutlet weak var animationViewWidth: NSLayoutConstraint!
    @IBOutlet weak var animationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var hudStackView: UIStackView!
    
    //UI
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var statusLabel: TOMSMorphingLabel!
    @IBOutlet weak var backgroundEffectView: UIVisualEffectView!
    @IBOutlet weak var backgroundColorView: UIView!
    
    //State
    public var defaultConfiguration: MMProgressConfiguration = MMProgressConfiguration.init()
    var activeConfiguration: MMProgressConfiguration?
    var status: String?
}

//Lifecycle
public extension MMProgress {
    class func sharedView() -> MMProgress? {
        var sharedView: MMProgress?
        var token: dispatch_once_t = 0
        
        dispatch_once(&token) {
            sharedView = NSBundle.podBundle().loadNibNamed("MMProgressView", owner: self, options: nil).first as? MMProgress
        }
        
        return sharedView
    }
}

//Public Show
public extension MMProgress {
    //TODO:
//    completion: () -> Void
    
    public class func show() {
        show(nil)
    }
    
    public class func show(status: String?) {
        show(status, superview: nil)
    }
    
    public class func show(status: String?, superview: UIView?) {
        show(status, superview: superview, tempConfig: nil)
    }
    
    public class func show(status: String?, superview: UIView?, tempConfig: MMProgressConfiguration?) {
        sharedView()?.show(status, superview: superview, tempConfig: tempConfig)
    }
}

//Public Dismiss
public extension MMProgress {
    public class func dismiss() {
        dismiss(nil)
    }
    
    public class func dismiss(completion: Completion?) {
        sharedView()?.dismiss(completion)
    }
}

//Show Implementation
extension MMProgress {
    
    func show(status: String?, superview: UIView?, tempConfig: MMProgressConfiguration?) {
        //TODO: Is this needed?
        self.status = status
        updateActiveConfiguration(tempConfig)
        
        if let targetView = superview ?? primaryWindow() {
            if self.superview == targetView {
                updateUIAnimated()
            } else {
                present(status, superview: targetView)
            }
        }
    }
    
    //Update
    
    func updateUIAnimated() {
        layer.removeAllAnimations()
        present()
        
        UIView.animateWithDuration(Constants.kLayoutAnimationDuration) { [weak self] () in
            let status = ""
            self?.statusLabel.text = status
            self?.setupUI(status)
        }
    }
    
    func setupUI(status: String?) {
        setupAnimationView()
        setupStatus(status)
        setupViews()
    }
    
    // Setup
    
    func present(status: String?, superview: UIView) {
        clearUI()
        addToView(superview)
        setupHUDConstraints()
        setupUI(status)
        present()
    }
    
    //TODO: Rename or abstract out
    func present() {
        if activeConfiguration?.presentAnimated ?? false {
            animateAppearance()
        } else {
            appearanceCompleted()
        }
    }
    
    func clearUI () {
        if activeConfiguration?.presentAnimated ?? false {
            //TODO: zero floats
//            layer.transform = CATransform3DMakeScale(<#T##sx: CGFloat##CGFloat#>, <#T##sy: CGFloat##CGFloat#>, 1)
        }
        
        statusLabel.setTextWithoutMorphing("")
    }
    
    func addToView(superview: UIView) {
        //TODO constraints
//        self.superview?.removeConstraint(<#T##constraint: NSLayoutConstraint##NSLayoutConstraint#>)
        self.superview?.removeFromSuperview()
        
        superview.addSubview(self)
        superview.bringSubviewToFront(self)
    }
    
    func setupViews() {
        
    }
    
    func setupAnimationView() {
        animationView.subviews.forEach { $0.removeFromSuperview() }
        
        if let loadingIndicator = activeConfiguration?.loadingIndicator {
            animationView.addSubview(loadingIndicator)
            animationViewWidth.constant = loadingIndicator.bounds.size.width
            animationViewWidth.constant = loadingIndicator.bounds.size.width
        }
    }
    
    func setupStatus(status: String?) {
        statusLabel.text = status
        statusLabel.textColor = activeConfiguration?.statusColor
        statusLabel.font = activeConfiguration?.statusFont
    }
    
    func setupHUDConstraints() {
        
    }
    
    // Appearance
    
    func animateAppearance() {
        
    }
    
    func appearanceCompleted() {
        
    }
    
    //Convenience
    
    func updateActiveConfiguration(tempConfig: MMProgressConfiguration?) {
        self.activeConfiguration = tempConfig ?? defaultConfiguration
    }
    
    func primaryWindow() -> UIWindow? {
        for window in UIApplication.sharedApplication().windows.reverse() {
            //TODO: Check for alert
            if let window = window as? UIWindow {
                return window
            }
        }
        
        return nil
    }
}

//Dismiss Implementation
extension MMProgress {
    func dismiss(completion: Completion?) {
    }
}