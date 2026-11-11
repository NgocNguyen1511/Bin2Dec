//
//  ContentView.swift
//  Bin2Dec
//
//  Created by NguyenNgoc on 11/11/26.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    
    private let maxDigits = 8
    
    private var isValid: Bool {
        input.allSatisfy { $0 == "0" || $0 == "1" }
    }
    
    private var result: String {
        guard !input.isEmpty, isValid else { return "—" }
        return String(binaryToDecimal(input))
    }
    
    var body: some View {
        VStack(spacing: 20) {
             Text("Bin2Dec")
                 .font(.largeTitle.bold())

             TextField("Enter up to \(maxDigits) binary digits", text: $input)
                 .textFieldStyle(.roundedBorder)
                 .keyboardType(.numbersAndPunctuation)
                 .autocorrectionDisabled()
                 .onChange(of: input) { _, newValue in
                     if newValue.count > maxDigits {
                         input = String(newValue.prefix(maxDigits))
                     }
                 }

             if !isValid {
                 Text("Only 0 and 1 are allowed.")
                     .foregroundStyle(.red)
             }

             Text(result)
                 .font(.system(size: 48, weight: .semibold, design: .monospaced))
         }
         .padding()    }
    
    private func binaryToDecimal(_ binary: String) -> Int {
            var total = 0
            var position = binary.count - 1

            for char in binary {
                if char == "1" {
                    total += Int(pow(2.0, Double(position)))
                }
                position -= 1
            }
            return total
        }
}

#Preview {
    ContentView()
}
