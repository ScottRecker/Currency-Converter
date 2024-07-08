//
//  ErrorView.swift
//  CurrencyConverter
//
//  Created by Scott Recker on 7/8/24.
//

import SwiftUI

struct ErrorView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            Text("Oops! and error occurred!")
                .font(.title2)
                .padding()
            Group {
                Text("We could not successfully fetch exchange information.")
                Text("Try again in a few minutes")
            }.multilineTextAlignment(.center)

            Image(.error)
                .resizable()
                .frame(width: 300, height: 300)
            Spacer()

            Button {
                dismiss()
            } label: {
                Text("Dismiss")
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .background(Color.appColor)
                    .cornerRadius(25)
            }
        }
        .padding(30)
    }
}

#Preview {
    ErrorView()
}
