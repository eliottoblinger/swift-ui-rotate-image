//
//  ContentView.swift
//  RotateImage
//
//  Created by Eliott Oblinger on 14/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var degrees: Double = 0;
    @State private var isRotating: Bool = false;
    
    private func rotate() -> Void {
        isRotating = true;
        
        let rotation =
            degrees == 270 ?
                -degrees :
                90
        
        degrees += rotation
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isRotating = false
        }
    }
    
    var body: some View {
        VStack {
            Image("memoji")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .padding(.bottom)
                .rotationEffect(.degrees(degrees))
                .onTapGesture {
                    rotate()
                }
            Text(isRotating ? "Wow!" : "Click to rotate image")
                .font(.headline)
                .foregroundColor(isRotating ? Color.blue : Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
