//
//  ContentView.swift
//  Three Letter Word
//
//  Created by Tom Bredemeier on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var letter = ""
    @State private var counter = 0
    @State private var selectedLetters = ["", "", ""]
    let alphabet =  "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var body: some View {
        VStack {
            Text("Three Letter Word")
                .font(.title).bold()
            Text("Tap the gray box to change the letter")
            CustomLetterBox(color: .gray, text: letter)
                .onTapGesture {
                    let position = alphabet.index(alphabet.startIndex, offsetBy: counter)
                    letter = String(alphabet[position])
                    counter += 1
                    if counter == alphabet.count {
                        counter = 0
                    }
                }
            Text("Tap a red box to select that letter")
            HStack {
                ForEach(0..<3) {index in
                    CustomLetterBox(color: .red, text: selectedLetters[index])
                        .onTapGesture {
                            selectedLetters[index] = letter
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct CustomLetterBox: View {
    let color : Color
    let text : String
    var body: some View {
        ZStack {
            color
            Text(text)
                .font(.system(size: 90))
                .fontWeight(.heavy)
        }
        .frame(width: 120, height: 120, alignment: .center)
    }
}
