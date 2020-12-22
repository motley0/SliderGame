//
//  SliderGameContentView.swift
//  SliderGame
//
//  Created by Dmitry Shcherbakov on 22.12.2020.
//

import SwiftUI

struct SliderGameContentView: View {
    
    @State private var showingAlert = false
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    
    var body: some View {
        VStack {
            Text("Подвиньте сладер, как можно ближе к: \(targetValue)")
                .multilineTextAlignment(.center)
            HStack {
                Text("0")
                GameUISlider(targetValue: $targetValue,
                             currentValue: $currentValue)
                Text("100")
            }
            Button("Проверь меня!") {
                showingAlert = true
            }
            .padding(.top)
            .alert(isPresented : $showingAlert) {
                Alert(
                    title: Text("Your score"),
                    message: Text("\(Int(currentValue))")
                )
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            .padding(.top)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SliderGameContentView()
    }
}
