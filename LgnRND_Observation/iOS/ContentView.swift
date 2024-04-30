//
//  ContentView.swift
//  LgnRND_Observation
//
//  Created by Oleh Poremskyy on 26.04.2024.
//

import SwiftUI

struct ContentView {

}

extension ContentView: View {
    var body: some View {
        List {
            View01().frame(height: 140)
            View02().frame(height: 140)
            View03().frame(height: 140)
            View04().frame(height: 140)
            View05().frame(height: 140)
        }
    }
}
