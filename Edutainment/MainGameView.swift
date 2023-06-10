//
//  MainGameView.swift
//  Edutainment
//
//  Created by Fauzan Dwi Prasetyo on 07/06/23.
//

import SwiftUI

struct MainGameView: View {
    var numberOfQuestion: Int
    
    private var firstNumbers = [0]
    private var secondNumbers = [0]
    
    @State private var inputValue = ""
    @State private var currentQuestion = 0
    @State private var isCorrect = false
    @State private var isFinish = false
    
    @FocusState private var isFocused
    
    init(fromNumber: Int, toNumber: Int, numberOfQuestion: Int) {
        self.numberOfQuestion = numberOfQuestion
        
        self.firstNumbers = generateNumbers(fromNumber: fromNumber, toNumber: toNumber)
        self.secondNumbers = generateNumbers(fromNumber: fromNumber, toNumber: toNumber)
        
//        print(self.firstNumbers)
//        print(self.secondNumbers)
//        print(numberOfQuestion)
    }
    
    
    
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            
            ZStack {
                Color.mint
                    .frame(width: 200, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("\(firstNumbers[currentQuestion]) x \(secondNumbers[currentQuestion])")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            TextField("Input Answer", text: $inputValue)
                .foregroundColor(.white)
                .font(.title)
                .frame(width: 200)
                .padding(15)
                .background(.yellow)
                .clipShape(Capsule())
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused)
                .disabled(isFinish)
            
            Spacer()
            
            if isCorrect {
                Text("Correct")
            }
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("SUBMIT") {
                    isFocused = false
                    checkAnswer()
                }
                .padding(5)
                .foregroundColor(.white)
                .background(.mint)
                .clipShape(Capsule())
            }
        }
    }
    
    func generateNumbers(fromNumber: Int, toNumber: Int) -> [Int] {
        var arrayOfNumber = [Int]()

        for _ in 0..<numberOfQuestion {
            let number = Int.random(in: fromNumber...toNumber)
            arrayOfNumber.append(number)
        }
        
        return arrayOfNumber
    }
    
    func checkAnswer() {
        let correctAnswer = firstNumbers[currentQuestion] * secondNumbers[currentQuestion]
        
        if Int(inputValue) == correctAnswer {
            isCorrect = true
        } else {
            isCorrect = false
        }
        
        inputValue = ""
        
        if currentQuestion != numberOfQuestion - 1 {
            currentQuestion += 1
        } else {
            inputValue = "Finish"
            isFinish = true
        }
    }
}

struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView(fromNumber: 5, toNumber: 8, numberOfQuestion: 5)
    }
}
