//
//  ContentView.swift
//  Flags
//
//  Created by Nikolay Zhukov on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FlagsViewModel()
    @State private var currentFlagOffset = CGFloat.zero
    @State private var nextFlagOffset: CGFloat = -160
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Text(viewModel.flags[viewModel.currentFlagIndex])
                    .font(.system(size: 100))
                    .offset(y: currentFlagOffset)
                
                Text(viewModel.flags[viewModel.nextFlagIndex])
                    .font(.system(size: 100))
                    .offset(y: nextFlagOffset)
            }
            .frame(width: 160, height: 160)
            .background(Color.clear)
            .overlay(
                Rectangle()
                    .strokeBorder(Color.black, lineWidth: 5)
            )
            .clipped()
            
            Spacer()
            
            Button("Hit me!") {
                let animationDuration = 1.5
                let flagMovementDistance: CGFloat = 160
                
                nextFlagOffset = flagMovementDistance
                
                withAnimation(.easeInOut(duration: animationDuration)) {
                    currentFlagOffset = -flagMovementDistance
                    nextFlagOffset = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
                    viewModel.changeFlag()
                    currentFlagOffset = 0
                    nextFlagOffset = flagMovementDistance
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    ContentView()
}
