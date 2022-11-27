//
//  Observable.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import Foundation

final class Observable<T> {
    
    typealias Listener = ((T) -> Void)
    private var listener: Listener?
    
    var value: T { didSet{  listener?(value) } }
    
    init(_ value: T) {
        self.value = value
        listener?(self.value)
    }
    
    deinit{
        print("Observable deinit")
    }
}
