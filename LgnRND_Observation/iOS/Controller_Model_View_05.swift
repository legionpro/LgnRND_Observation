//
//  Controller_Model_View_05.swift
//  LgnRND_Observation_iOS
//
//  Created by Oleh Poremskyy on 30.05.2054.
//

import Combine
import SwiftUI

// M-C-V  модел це клас
//===========================================
// MODEL

struct Model05 {
    private(set) var count = 0
}

extension Model05 {
    var countStr: String { count.description }
    mutating func incrCount() { count += 1 }
}

//=========================================
//Controller @STATE only
class Controller05: ObservableObject {
    @Published private var model = Model05()
    @Published var countStr = ""
    
    init() {
        $model.map(\.count.description).assign(to: &$countStr)
    }
}

extension Controller05{
    //var countStr: String { model.count.description }
    func incrCount() { model.incrCount() }
}

//=========================================
//View
struct View05 {
    @StateObject private var controller = Controller05()
}

extension View05: View {
    var body: some View {
        Form {
            Section("05 M-C-V @Observable") {
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


