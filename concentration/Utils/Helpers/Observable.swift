//
//  Observable.swift
//  concentration
//
//  Created by qbuser on 27/11/22.
//

import Foundation

final class Observable<T> {
    private var listener: ((T) -> Void)?
    
    var value: T { didSet{  listener?(value) } }
    
    init(_ value: T) {
        self.value = value
    }
    
    deinit{
        print("Observable deinit")
    }
    
    func bind(listener: @escaping ((T) -> Void)) {
        self.listener = listener
        self.listener?(self.value)
    }
}
