//
//  StartView.swift
//  Cowork-SwiftUI
//
//  Created by ryookano on 2020/07/08.
//  Copyright © 2020 lcr. All rights reserved.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack() {
                Text("co-work")
                    .font(.largeTitle)
                    .foregroundColor(Colors.startTitleColor)
                    .frame(height: 80)
                    .padding(.top, -200)

                // alignment: 配置方法 spacing: 子View同士の間隔)
                VStack(alignment: .center, spacing: 24) {
                    Button(action: {}) {
                        Text("Facebookで登録")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .foregroundColor(.white)
                    .background(Colors.startFacebookButtonColor)

                    Button(action: {}) {
                        Text("Googleで登録")
                    }
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .foregroundColor(.black)
                    .background(Color.white)
                    .border(Color.black, width: 0.5)

                    Button(action: {
                    }) {
                        NavigationLink(destination: EmailLoginView(viewModel: EmailLoginViewModel())) {
                            Text("メールアドレスで登録")
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .foregroundColor(.white)
                    .background(Colors.startMailButtonColor)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 36)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            StartView()
        }
    }
}
