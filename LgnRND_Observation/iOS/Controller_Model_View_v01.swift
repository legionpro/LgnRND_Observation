//
//  Controller_Model_View_v01.swift
//  LgnRND_Observation_iOS
//
//  Created by Oleh Poremskyy on 26.04.2024.
//

import Combine
import Observation
import SwiftUI

//===========================================
// MODEL with @Observable

@Observable
class Model01 {
    private(set) var count = 0
}

extension Model01 {
    var countStr: String { count.description }
    func incrCount() { count += 1 }
}

//=========================================
//Controller @STATE only
//class Controller01: ObservableObject {
//if @Published is ommitted - then : ObservableObject is requiered
class Controller01 {
    @Published private var model = Model01()
}

extension Controller01{
    //calculated var
    var calcCount: String { model.count.description }
    
    func incrementModel() { model.incrCount() }
}

//=========================================
//View
struct View01 {
    @State private var controller = Controller01()
}

extension View01: View {
    var body: some View {
        Form {
            Section("01 M-C-V @Observable") {
                HStack{
                    Button("+", action: { controller.incrementModel()}).buttonStyle(.bordered).frame(alignment: .leading)
                    Text("count in the model: " + controller.calcCount).frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding(20)
        .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
    }
}


