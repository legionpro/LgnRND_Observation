//
//  Controller_Model_View_02.swift
//  LgnRND_Observation_iOS
//
//  Created by Oleh Poremskyy on 30.04.2024.
//

import Combine
import SwiftUI

// M-C-V  модел це клас
//===========================================
// MODEL

class Model02: ObservableObject {
    @Published private(set) var count = 0
}

extension Model02 {
    var countStr: String { count.description }
    func incrCount() { count += 1 }
}

//=========================================
//Controller @STATE only
class Controller02: ObservableObject {
    private var model = Model02()
    @Published var countStr = ""
    
    init() {
        model.$count.map(\.description).assign(to: &$countStr)
    }
}

extension Controller02{
    //var countStr: String { model.count.description }
    func incrCount() { model.incrCount() }
}

//=========================================
//View
struct View02 {
    @StateObject private var controller = Controller02()
}

extension View02: View {
    var body: some View {
        Form {
            Section("02 M-C-V @Observable") {
                HStack{
                    Button("+", action: { controller.incrCount()}).buttonStyle(.bordered).frame(alignment: .leading)
                    Text("count in the model: " + controller.countStr).frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
        }
        .padding(20)
        .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
    }
}


