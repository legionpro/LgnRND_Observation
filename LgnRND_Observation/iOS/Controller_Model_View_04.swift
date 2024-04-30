//
//  Controller_Model_View_04.swift
//  LgnRND_Observation_iOS
//
//  Created by Oleh Poremskyy on 30.04.2024.
//

import Combine
import Observation
import SwiftUI


// MODEL as struct without controller


//===========================================
// MODEL as struct


struct Model04 {
    private(set) var count = 0
}
extension Model04 {
    var countStr: String { count.description }
    mutating func incrCount() { count += 1 }
}

//=========================================
//View
struct View04 {
    @State private var model = Model04()
}

extension View04: View {
    var body: some View {
        Form {
            Section("04 M-V M-struct") {
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



