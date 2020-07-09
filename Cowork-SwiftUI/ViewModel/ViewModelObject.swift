//
//  ViewModelObject.swift
//  Cowork-SwiftUI
//
//  Created by okano on 2020/07/09.
//  Copyright © 2020 lcr. All rights reserved.
//

import Combine
import SwiftUI

/// 値の変更をSwiftUIに通知するためにObservableObjectに準拠
protocol ViewModelObject: ObservableObject {
    /// ユーザからの入力であるタップなどのイベント一覧をPassthroughSubjectとして定義
    associatedtype Input: InputObject
    /// TextFieldの文字列やToggleのオン・オフなどのような双方向バインディングする値の一覧を@Publishedとして定義
    associatedtype Binding: BindingObject
    /// Textに表示する文字列やListに表示する配列などUIに出力する値の一覧を@Publishedとして定義
    associatedtype Output: OutputObject

    var input: Input { get }
    var binding: Binding { get }
    var output: Output { get }

}

extension ViewModelObject where Binding.ObjectWillChangePublisher == ObservableObjectPublisher, Output.ObjectWillChangePublisher == ObservableObjectPublisher {

    var objectWillChange: AnyPublisher<Void, Never> {
        return Publishers.Merge(binding.objectWillChange, output.objectWillChange).eraseToAnyPublisher()
    }

}

protocol InputObject: AnyObject {
}

protocol BindingObject: ObservableObject {
}

protocol OutputObject: ObservableObject {
}

@propertyWrapper struct BindableObject<T: BindingObject> {

    @dynamicMemberLookup struct Wrapper {
        fileprivate let binding: T
        subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<T, Value>) -> Binding<Value> {
            return .init(
                get: { self.binding[keyPath: keyPath] },
                set: { self.binding[keyPath: keyPath] = $0 }
            )
        }
    }

    var wrappedValue: T

    var projectedValue: Wrapper {
        return Wrapper(binding: wrappedValue)
    }

}
