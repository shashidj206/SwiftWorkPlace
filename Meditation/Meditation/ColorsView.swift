//
//  ColorsView.swift
//  Meditation
//
//  Created by Shashidhar Jagatap on 18/10/23.
//

import SwiftUI

struct ColorsView: View {
    @Binding var shapeColor: Color
    let colors = [Color.white,Color.orange, Color(.systemTeal),Color(.systemPurple),Color.green]
   
    var body: some View {
        HStack{
            ForEach(0 ..< colors.count, id: \.self) { index in
                
                Button(action: {
                    self.shapeColor = colors[index]
                }) {
                    Circle()
                        .fill(colors[index])
                }
                .padding()
            }
        }
    }
}

struct ColorsView_Previews: PreviewProvider {
    @State private static var shapeColor: Color = .white

    static var previews: some View {
        ColorsView(shapeColor: $shapeColor)
            .previewLayout(.sizeThatFits)
    }
}

