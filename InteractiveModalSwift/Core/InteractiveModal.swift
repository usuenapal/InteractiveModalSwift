//
//  InteractiveModal.swift
//  InteractiveModalSwift
//
//  Created by Usue Napal on 09/04/2019.
//  Copyright © 2019 Usit Development. All rights reserved.
//

import UIKit

struct ModalConstants {
    static let topMargin = 80
    static let radius = CGFloat(16.0)
    static let selectorWidth = CGFloat(120.0)
    static let selectorHeight = CGFloat(6.0)
    static let touchAreaHeight = CGFloat(60.0)
    static let bottomMargin = CGFloat(60.0)
}

class InteractiveModal: UIViewController
{
    private var initialY: Int = ModalConstants.topMargin
    private var radius: CGFloat = ModalConstants.radius
    private var touchArea: UIView?

    init()
    {
        super.init(nibName: nil, bundle: nil)
    }
    
    init(topMargin: Int)
    {
        self.initialY = topMargin
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.layer.cornerRadius = radius
    }
    
    override func viewWillLayoutSubviews()
    {
        setViewFrame()
        addTouchArea()
        addGesture()
    }
    
    
    //MARK - Public methods
    
    public func presentModalIn(controller: UIViewController)
    {
        view.backgroundColor = UIColor.white
        definesPresentationContext = true
        providesPresentationContextTransitionStyle = true
        modalPresentationStyle = .overCurrentContext
        
        if UIDevice.current.model.lowercased().contains("ipad") {
            popoverPresentationController?.sourceView = controller.view
            popoverPresentationController?.permittedArrowDirections = .up
        }
        
        if controller.navigationController != nil {
            controller.navigationController?.present(self, animated: true, completion: nil)
        } else {
            controller.present(self, animated: true, completion: nil)
        }
    }
    
    
    //MARK - Private methods
    
    private func setViewFrame()
    {
        let size = UIScreen.main.bounds.size
        view.frame = CGRect.init(x: 0.0, y: CGFloat(initialY), width: size.width, height: size.height - CGFloat(initialY) + CGFloat(radius/2))
    }
    
    private func addTouchArea()
    {
        let size = UIScreen.main.bounds.size
        touchArea = UIView.init(frame: CGRect.init(x: 0, y: 0, width: size.width, height: ModalConstants.touchAreaHeight))
        
        let bar = UIView.init(frame: CGRect.init(x: (size.width - ModalConstants.selectorWidth)/2, y: (ModalConstants.touchAreaHeight - ModalConstants.selectorHeight)/2, width: ModalConstants.selectorWidth, height: ModalConstants.selectorHeight))
        bar.backgroundColor = UIColor.lightGray
        
        touchArea?.addSubview(bar)
        view.addSubview(touchArea!)
    }
    
    private func addGesture()
    {
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(InteractiveModal.isSwipping(gesture:)))
        touchArea?.addGestureRecognizer(gesture)
        view.bringSubviewToFront(touchArea!)
    }
    
    
    //MARK - Gesture delegate
    
    @objc private func isSwipping(gesture: UIPanGestureRecognizer)
    {
        let point = gesture.velocity(in: view.superview)
        let vel = fabsf(Float(point.x/point.y))
        
        if gesture.state == UIGestureRecognizer.State.ended && point.y > point.x && point.y - point.x > 0 && vel > 0.03 {
            dismiss(animated: true, completion: nil)
        }
        
        let animator = UIViewPropertyAnimator.init(duration: 0.0, curve: .easeInOut) {
            let touchLocation = gesture.location(in: self.view.superview)
            let y = CGFloat(self.initialY) > touchLocation.y ? CGFloat(self.initialY) : touchLocation.y
            
            if y > UIScreen.main.bounds.size.height - ModalConstants.bottomMargin {
                self.dismiss(animated: true, completion: nil)
            } else {
                self.view.frame = CGRect.init(x: 0, y: y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
        
        animator.startAnimation()
    }
}
