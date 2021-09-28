//
//  Arrow.swift
//  Drawing
//
//  Created by Alison Gorman on 9/28/21.
//

import Foundation
import SwiftUI

struct Arrow: Shape {
    var thickness: CGFloat = 100
    var inset: CGFloat = 100
    
    var animatableData: CGFloat {
        get { thickness }
        set { self.thickness = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+inset, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX+inset, y: rect.maxY-2*inset))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-2*inset))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY-2*inset))
        path.addLine(to: CGPoint(x: rect.maxX-inset, y: rect.maxY-2*inset))
        path.addLine(to: CGPoint(x: rect.maxX-inset, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX+inset, y: rect.minY))
        
        return path
    }
}

struct ArrowView: View {
    @State var thickness : CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text("Tap Arrow To Change Border Thickness with Animation")
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Arrow(thickness: thickness)
                .stroke(Color.red, style: StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))

                .frame(width:300, height:500)
                .onTapGesture {
                    withAnimation {
                    self.thickness = CGFloat.random(in: 10...90)
                }
            }
        }
        .padding(50)
    }
}

