//
//  KeyboardAdapter.swift
//  RentApp
//
//  Created by Melanie Kofman on 14.12.2020.
//

import UIKit

final class KeyboardAdapter {
    private let handler: (CGFloat, TimeInterval) -> Void
    
    init(handler: @escaping (CGFloat, TimeInterval) -> Void) {
        self.handler = handler
    }
    
    func start() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyBoardFrameChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func stop() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc
    private func onKeyBoardFrameChange(_ notification: Notification) {
        guard let endFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            assertionFailure()
            return
        }
        
        let frame = endFrame.cgRectValue
        let window = UIApplication.shared.windows[0]
        let duration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.0
        
        self.handler(window.frame.height - frame.origin.y, duration)
        
    }
    
    
}
