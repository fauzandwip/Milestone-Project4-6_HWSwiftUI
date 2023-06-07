//
//  ContentView.swift
//  Edutainment
//
//  Created by Fauzan Dwi Prasetyo on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumber = 2
    @State private var secondNumber = 12
    @State private var numberOfQuestions = 10
    
    private var numbersOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    // first number
                    Section {
                        Stepper("Up to... \(firstNumber)", value: $firstNumber, in: 1...secondNumber)
                    } header: {
                        Text("First Number")
                    }
                    
                    // second number
                    Section {
                        Stepper("Up to... \(secondNumber)", value: $secondNumber, in: firstNumber...12)
                    } header: {
                        Text("Second Number")
                    }
                    
                    // number of question
                    Section {
                        Picker("Number of Question", selection: $numberOfQuestions) {
                            ForEach(5..<21) {
                                if $0 % 5 == 0 {
                                    Text("\($0)")
                                }
                            }
                        }
                    } header: {
                        Text("Pick Number of Question")
                    }
                }
                
                NavigationLink {
                    // main game
                } label: {
                    Text("START")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(20)
                        .background(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
            }
            .navigationTitle("Edutainment")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
