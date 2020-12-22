//
//  GameUISlider.swift
//  SliderGame
//
//  Created by Dmitry Shcherbakov on 22.12.2020.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    
    @Binding var targetValue: Int
    @Binding var currentValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let alpha = computeScore() / 100
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
        uiView.value = currentValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentvalue: $currentValue)
    }
    
    private func computeScore() -> CGFloat {
        let difference = abs(targetValue - Int(currentValue))
        return CGFloat(100 - difference)
    }
    
}

extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var currentvalue: Float
        
        init(currentvalue: Binding<Float>) {
            self._currentvalue = currentvalue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentvalue = sender.value
        }
    }
}

struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(targetValue: .constant(10), currentValue: .constant(30))
    }
}
