//
//  CircleGroupView.swift
//  Meditation
//
//  Created by Shashidhar Jagatap on 18/10/23.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeOpacity: Double
    @State var LineWidth: Double
    @State private var isAnimating: Bool = false
    
    var shapeColor: Color
    var numberOfCircle: Int

    // MARK: - BODY
    
    var body: some View {
        ZStack {
            if numberOfCircle > 1 {
                ForEach(1..<numberOfCircle, id: \.self) { index in
                    Circle()
                        .stroke(shapeColor.opacity(ShapeOpacity), lineWidth: LineWidth * Double(index))
                        .frame(width: 260, height: 260, alignment: .center)
                }
            }
        } //: ZSTACK
        //.blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(
            Animation
                .easeInOut(duration: 1)
                .repeatForever()
            , value: isAnimating
        )
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(uiColor: .orange)
            .ignoresSafeArea(.all, edges: .all)
          
            CircleGroupView(ShapeOpacity: 0.2, LineWidth: 40, shapeColor: .white, numberOfCircle: 4)
        }
    }
}
