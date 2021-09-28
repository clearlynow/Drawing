 //
//  ContentView.swift
//  Shared
//
//  Created by Alison Gorman on 9/27/21.
//

import SwiftUI


struct ContentView: View {
    @State private var colorCycle = 0.0
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    public var body: some View {
        TabView() {
            ArrowView()
                .tabItem{
                    Image(systemName: "arrow.down.app")
                    Text("Arrow")
                }
            
            
            VStack {
                Text("Color Cycling Rectangle")
                ColorCyclingRectangle(amount: self.colorCycle)
                    .frame(width:300, height: 300)
                
                Slider(value: $colorCycle)
                }
                .tabItem{
                    Image(systemName: "rectangle.fill")
                    Text("CC Rectangle")
                }
            
            VStack {
                Text("Color Cycling Circle")
                ColorCyclingCircle(amount: self.colorCycle)
                    .frame(width:300, height: 300)
                
                Slider(value: $colorCycle)
                }
                .tabItem{
                    Image(systemName: "circle.fill")
                    Text("CC Circle")
                }
            
            VStack {
                Flower(petalOffset: petalOffset, petalWidth: petalWidth)
                    .fill(Color.red, style: FillStyle(eoFill: true))

                Text("Offset")
                Slider(value: $petalOffset, in: -40...40)
                    .padding([.horizontal, .bottom])

                Text("Width")
                Slider(value: $petalWidth, in: 0...100)
                    .padding(.horizontal)
            }
            .tabItem{
                Image(systemName: "seal.fill")
                Text("Flower")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
