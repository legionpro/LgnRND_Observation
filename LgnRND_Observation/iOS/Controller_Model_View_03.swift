//
//  Controller_Model_View_03.swift
//  LgnRND_Observation_iOS
//
//  Created by Oleh Poremskyy on 30.04.2034.
//

import Combine
import Observation
import SwiftUI

// MODEL as class without Controller

//===========================================
// MODEL as class

class Model03: ObservableObject {
    @Published private(set) var count = 0
}

extension Model03 {
    var countStr: String { count.description }
    func incrCount() { count += 1 }
}



//=========================================
//View
struct View03 {
    @StateObject private var model = Model03()
}

extension View03: View {
    var body: some View {
        Form {
            Section("03 M-V M-class") {
                HStack{
                    Button("+", action: { model.incrCount()}).buttonStyle(.bordered).frame(alignment: .leading)
                    Text("count in the model: " + model.countStr).frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding(20)
        .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
    }
}


