//
//  ContentView.swift
//  Meditation
//
//  Created by Shashidhar Jagatap on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    @State private var isAnimating: Bool = false
    @State private var numberOfCircle: Double = 2
    @State private var shapeColor: Color
    
    init(shapeColor: Color) {
        _shapeColor = State(initialValue: shapeColor)
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(uiColor: .black)
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                Spacer()
                
                ZStack {
                    // MARK: Background Circles
                    CircleGroupView(ShapeOpacity: 0.2,
                                    LineWidth: 40,
                                    shapeColor: shapeColor,
                                    numberOfCircle: Int(numberOfCircle))

                    // MARK: Meditate Image
                    Image("meditate")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 1)
                                .repeatForever()
                            , value: isAnimating
                        )
                        .background(Color(uiColor: .clear))
                }
                
                
                // MARK: FOOTER
                Spacer()
                VStack {
                    // MARK: ColorsView
                    ColorsView(shapeColor: $shapeColor)
                    
                    Text("Number of Circles: \(numberOfCircle, specifier: "%.f")") // Display the current value
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                    
                    Slider(value: $numberOfCircle, in: 0...10, step: 1)
                        .accentColor(Color(.systemTeal))
                        .padding()
                }
                
            } //: VSTACK
            
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shapeColor: .white) // You don't need to use @State here
    }
}
