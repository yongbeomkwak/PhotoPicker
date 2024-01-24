//
//  UIControl+publisher.swift
//  PhotoPicker
//
//  Created by yongbeomkwak on 1/24/24.
//

import Foundation
import Combine
import UIKit

/// uikit  ui 이벤트를 combine publisher로 변환
public extension UIControl {
    func controlPublisher(for event: UIControl.Event) -> UIControl.EventPublisher {
        return UIControl.EventPublisher(control: self, event: event)
    }
    
    
    struct EventPublisher: Publisher {
        
        public typealias Output = UIControl // Publisher가 생성할 수 있는 값의 타입을 나타냅니다.
        public typealias Failure = Never // Publisher가 생성할 수 있는 Error 타입을 나타냅니다.
        
        let control: UIControl
        let event: UIControl.Event
        

        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, UIControl == S.Input {
            
            let subscription = EventSubscription(
                           control: control,
                           subscrier: subscriber,
                           event: event
                       )
            subscriber.receive(subscription: subscription)
            
        }
    }
    
    fileprivate class EventSubscription<EventSubscriber: Subscriber>: Subscription
        where EventSubscriber.Input == UIControl, EventSubscriber.Failure == Never {
        let control: UIControl
        let event: UIControl.Event
        var subscriber: EventSubscriber?

        init(control: UIControl, subscrier: EventSubscriber, event: UIControl.Event) {
            self.control = control
            self.subscriber = subscrier
            self.event = event

            control.addTarget(self, action: #selector(eventDidOccur), for: event)
        }

        /// Publisher에게 Subscriber가 값을 요구하는 횟수를 알려줍니다.

        func request(_ demand: Subscribers.Demand) {}

        /// 할당 해제
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(eventDidOccur), for: event)
        }

        @objc func eventDidOccur() {
            _ = subscriber?.receive(control)
        }
    }
}
