//
//  EmailLoginView.swift
//  Cowork-SwiftUI
//
//  Created by okano on 2020/07/08.
//  Copyright © 2020 lcr. All rights reserved.
//

import SwiftUI

struct EmailLoginView: View {
    @State private var mailText = ""

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
                        TextField("メールアドレス", text: $mailText, onEditingChanged: { isBegin in
                        }, onCommit: {
                        })
                        .padding(.horizontal, 12)
                    }
                    .frame(height: 50, alignment: .center)
                }
                .border(Color.black, width: 0.5)


                VStack() {
                    VStack() {
                        TextField("パスワード", text: $mailText, onEditingChanged: { isBegin in
                        }, onCommit: {
                        })
                        .padding(.horizontal, 12)
                    }
                    .frame(height: 50, alignment: .center)
                }
                .border(Color.black, width: 0.5)


                Button("ログイン") {

                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(.white)
                .background(Colors.startMailButtonColor)
                .cornerRadius(8)

            }
        }
        .padding(.horizontal, 34)
    }
}

struct EmailLoginView_Previews: PreviewProvider {
    static var previews: some View {
        EmailLoginView()
    }
}
