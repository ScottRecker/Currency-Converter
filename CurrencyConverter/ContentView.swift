//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Scott Recker on 7/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var currencies = CurrencyState.currencies

    @State private var amount: String = "100.0"
    @State private var fromCurrency: Currency = CurrencyState.currencies[0]
    @State private var toCurrency: Currency = CurrencyState.currencies[1]

    var body: some View {
        VStack(spacing: 20) {
            Text("Currency Converter")
                .font(.system(size: 22.0, weight: .medium))
                .foregroundStyle(Color.appColor)
                .padding()
            Image(.currencyExchange)
                .resizable()
                .frame(width: 100, height: 100)
            Text("Your Converted Amount")
                .font(.title3)

            HStack {
                Text("$100.0")
                    .font(.title)
                    .foregroundStyle(.white)

            }.frame(width: 350, height: 80)
                .background(Color.appColor)
                .cornerRadius(12)
            VStack(alignment: .leading) {
                Text("Covert Amount")
                    .font(.title3)
                    .padding()
                TextField("", text: $amount)
                    .font(.system(size: 22))
                    .padding(10)
                    .frame(width: 350, height: 50)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(12)
            }

            HStack {
                Text("To Currency")

                Spacer()

                Picker("To Currency", selection: $fromCurrency) {
                    ForEach(currencies, id: \.code) { cur in
                        Text(cur.code)
                            .tag(cur)
                    }
                }
            }

            HStack {
                Text("From Currency")

                Spacer()

                Picker("From Currency", selection: $toCurrency) {
                    ForEach(currencies, id: \.code) { cur in
                        Text(cur.code)
                            .tag(cur)
                    }
                }
            }

            Button {
                convertCurrency()
            } label: {
                Text("Convert")
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .background(Color.appColor)
                    .cornerRadius(12)
            }
        }
        .padding(.top, 30).padding(.leading, 30).padding(.trailing, 30)
    }

    func convertCurrency() {
        print("From currency", fromCurrency.code)
        print("To currency", toCurrency.code)
        print("Convert amount:", amount)
    }
}

#Preview {
    ContentView()
}
