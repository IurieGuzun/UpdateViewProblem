//
//  ContentView.swift
//  UpdateViewProblem
//
//  Created by Iurie Guzun on 2021-01-07.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import SwiftUI

class Global: ObservableObject {
    @Published var showMe = false
   
}
struct ContentView: View {
    @EnvironmentObject var global: Global
//     @ObservedObject var global = Global()
    var body: some View {
        VStack {
            Text((String(self.global.showMe)))
           
            if global.showMe {
                Circle()
                    .padding()
            }
            Button(action: {
                self.global.showMe.toggle()
             }) {
                Text("Internal")
                .foregroundColor(.red)
                .padding()
            }
            ButtonView()
        }
    }
}

struct ButtonView: View {
    @ObservedObject var global = Global()
    var body: some View {
        Button(action: {
            self.global.showMe.toggle()
            print(self.global.showMe)
        }) {
        Text("External")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
