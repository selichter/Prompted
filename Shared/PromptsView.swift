//
//  PromptsView.swift
//  Prompted
//
//  Created by Sarah Lichter on 11/26/21.
//

import SwiftUI

struct PromptsView: View {
    @ObservedObject var vm = PromptsViewModel()
    internal var didAppear: ((Self) -> Void)?
    
    var body: some View {
        ZStack {
            vm.displayedPrompt.backgroundColor.ignoresSafeArea()

            VStack(alignment: .leading) {
                Spacer()
                Text("Today's Prompt")
                    .foregroundColor(.white)
                    .font(.body)
                Text(vm.displayedPrompt.text)
                    .foregroundColor(.white)
                    .bold()
                    .font(.title)
                    .textCase(.uppercase)
                    .lineSpacing(2)
                    .padding(.bottom)
                    .accessibilityIdentifier("prompt")
                
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .onTapGesture {
                            vm.advancePrompt()
                        }
                    Spacer()
                    
                    if (vm.displayedPrompt.lastUsed == nil) {
                        Image(systemName: "checkmark.circle")
                            .onTapGesture {
                                vm.setDateUsed(date: Date())
                            }
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                    }

                    Spacer()
                }
                .font(.title)
            }
            .foregroundColor(.white)
            .padding(.bottom, 100)
            .padding(Spacing.defaultViewMargin)
        }
        .onAppear {
            vm.loadPrompts()
            self.didAppear?(self)
        }


    }
}

struct PromptsView_Previews: PreviewProvider {
    static var previews: some View {
        PromptsView()
    }
}
