//
//  ContentView.swift
//  TimerAppEN
//
//  Created by Ryuji Ganaha on 2020/11/07.
//

import SwiftUI

struct ContentView: View {
    
    @State var timerMode: TimerMode = .initial
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("60")
                    .font(.system(size: 80))
                    .padding(.top, 80)
                Image(systemName: timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    .foregroundColor(.red)
                if timerMode == .paused {
                    Image(systemName: "gobackward")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .padding(.top, 40)
                }
                if timerMode == .initial {
                    Picker(selection: $selectedPickerIndex, label: Text("")) {
                        ForEach(0 ..< availableMinutes.count) {
                            Text("\(self.availableMinutes[$0]) min")
                        }
                    }
                    .labelsHidden()
                }
                Spacer()
                    
            }
            .navigationBarTitle("Timer")
        }
        .environment(\.colorScheme, .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
