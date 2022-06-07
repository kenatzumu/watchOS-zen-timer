//
//  ContentView.swift
//  ZenTimer WatchKit Extension
//
//  Created by Horea Crisan on 07.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false
    @State var timerValue = 1
    
    var body: some View {
        VStack {
            Text("⏰ Start timer for \(timerValue) seconds")
                .multilineTextAlignment(.center)
            Picker(selection: $timerValue, label: Text("")) {
                Text("1").tag(1)
                Text("3").tag(3)
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
            }
            NavigationLink(destination: SecondView(secondScreenShown: $secondScreenShown, timerValue: timerValue),
                           isActive: $secondScreenShown,
                           label: {Text("Go")})
        }
    }
}

struct SecondView: View {
    @Binding var secondScreenShown: Bool
    @State var timerValue: Int
    
    var body: some View {
        VStack {
            if timerValue > 0 {
                Text("Time remaining")
                    .font(.system(size: 14))
                Text("\(timerValue)")
                    .font(.system(size: 40))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.timerValue > 0 {
                                self.timerValue -= 1
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 14))
                Button(action: {
                    self.secondScreenShown = false // Unwind the navigation
                }) {
                    Text("Cancel")
                        .foregroundColor(.red)
                }
            } else {
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Done")
                        .foregroundColor(.green)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
