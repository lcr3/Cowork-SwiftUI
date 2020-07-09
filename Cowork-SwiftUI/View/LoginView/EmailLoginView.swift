//
//  EmailLoginView.swift
//  Cowork-SwiftUI
//
//  Created by okano on 2020/07/08.
//  Copyright © 2020 lcr. All rights reserved.
//

import Combine
import SwiftUI

struct EmailLoginView: View {
    @ObservedObject var viewModel: EmailLoginViewModel

    var body: some View {
        VStack() {
            Text("co-work")
                .font(.largeTitle)
                .foregroundColor(Colors.startTitleColor)
                .frame(height: 80)
            Text("ログイン")

            VStack(spacing: 24) {
                VStack() {
                    VStack() {
                        TextField("メールアドレス", text: viewModel.$binding.email)
                            .padding(.horizontal, 12)
                    }
                    .frame(height: 50, alignment: .center)
                }
                .border(Color.black, width: 0.5)

                VStack() {
                    VStack() {
                        SecureField("パスワード", text: viewModel.$binding.password)
                        .padding(.horizontal, 12)
                    }
                    .frame(height: 50, alignment: .center)
                }
                .border(Color.black, width: 0.5)

                Button(action: { self.viewModel.input.loginButtonTapped.send(()) }) {
                    HStack() {
                        Spacer()
                        Text("サインアップ")
                            .padding(.vertical)
                        Spacer()
                    }
                }
                .disabled(!viewModel.output.isLoginButtonEnabled)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(loginButtonColor())
                .cornerRadius(8)
            }
        }
        .padding(.horizontal, 34)
    }

    func loginButtonColor() -> Color {
        return viewModel.output.isLoginButtonEnabled ? Colors.startMailButtonColor: .gray
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView(viewModel: EmailLoginViewModel())
    }
}
