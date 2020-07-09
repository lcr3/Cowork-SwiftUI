//
//  EmailLoginViewModel.swift
//  Cowork-SwiftUI
//
//  Created by okano on 2020/07/09.
//  Copyright © 2020 lcr. All rights reserved.
//

import Combine

final class EmailLoginViewModel: ViewModelObject {
    final class Input: InputObject {
        /// ログインボタンのタップイベント
        let loginButtonTapped = PassthroughSubject<Void, Never>()
    }

    final class Binding: BindingObject {
        /// アドレス
        @Published var email = ""
        /// パスワード
        @Published var password = ""
    }

    final class Output: OutputObject {
        /// ログインボタンの有効フラグ
        @Published fileprivate(set) var isLoginButtonEnabled = false
    }

    let input: Input
    @BindableObject private(set) var binding: Binding
    let output: Output
    private var cancellables = Set<AnyCancellable>()

    init() {
        let input = Input()
        let binding = Binding()
        let output = Output()

        /// Emailのバリデーション（6文字以上かつ@が含まれていること）
        let isIdValid = binding.$email
            .map { $0.count >= 6 && $0.contains("@") }

        /// パスワードのバリデーション（8文字以上）
        let isPasswordValid = binding.$password
            .map { $0.count >= 8 }

       /// ログインボタン有効フラグ
       ///   - すべての入力内容が有効
       let isLoginEnabled = Publishers
           .CombineLatest(
               isIdValid,
               isPasswordValid
           )
        .map { $0.0 && $0.1 }

        // 組み立てたストリームをbinding, outputに反映
        cancellables.formUnion([isLoginEnabled.assign(to: \.isLoginButtonEnabled, on: output)])

        self.input = input
        self.binding = binding
        self.output = output
    }

    /*
     ViewModelの実装は基本的にイニシャライザのみで、InputObject、BindingObjectから流れてくるストリームの合成を行い、
     その結果をBindingObject、OutputObjectに反映させています。BindingObjectに定義されている双方向バインディング用の値は@Publishedとして定義されているため、
     $をつけることでPublisherを取り出すことができます。
    */
}
