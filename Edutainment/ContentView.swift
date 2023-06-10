//
//  ContentView.swift
//  Edutainment
//
//  Created by Fauzan Dwi Prasetyo on 07/06/23.
//

import SwiftUI

struct ContentView: View {
    @State private var fromNumber = 2
    @State private var toNumber = 12
    @State private var numberOfQuestions = 5
    
    private var numbersOfQuestions = [5, 10, 20]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    // from number
                    Section {
                        Stepper("\(fromNumber)", value: $fromNumber, in: 1...toNumber - 1)
                    } header: {
                        Text("From Number")
                    }
                    
                    // to number
                    Section {
                        Stepper("\(toNumber)", value: $toNumber, in: fromNumber + 1...12)
                    } header: {
                        Text("To Number")
                    }
                    
                    // number of question
                    Section {
                        Picker("Number of Question", selection: $numberOfQuestions) {
                            ForEach(numbersOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    } header: {
                        Text("Pick Number of Question")
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.yellow)
                
                NavigationLink {
                    // main game
                    MainGameView(fromNumber: fromNumber, toNumber: toNumber, numberOfQuestion: numberOfQuestions)
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
            .background(.yellow)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
