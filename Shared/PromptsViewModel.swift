//
//  PromptsViewModel.swift
//  Prompted
//
//  Created by Sarah Lichter on 11/26/21.
//

import Foundation
import Combine
import SwiftUI

class PromptsViewModel: ObservableObject {
    @Published var prompts: [Prompt] = []
    @Published var displayedPrompt: Prompt = Prompt(id: 12,
                                                    text: "Default Prompt",
                                                    category: Category.health)
    var defaultPrompt: Prompt = Prompt(id: 20,
                                       text: "What are you looking to gain from building a journaling habit?",
                                       category: Category.selfDiscovery)
    
    init() {}
    
    func loadPrompts() {
        prompts = [
            Prompt(id: 0,
                   text: "What do I know to be true that I didn’t know a year ago?",
                   category: Category.selfDiscovery,
                   backgroundColor: Color.peachCrayola),
            Prompt(id: 1,
                   text: "What distractions get in the way of being my most productive?",
                   category: Category.selfDiscovery),
            Prompt(id: 2,
                   text: "When do I feel most in tune with myself?",
                   category: Category.selfDiscovery,
                   backgroundColor: Color.peachCrayola),
            Prompt(id: 3,
                   text: "If someone described me, what would they say?",
                   category: Category.selfDiscovery,
                   backgroundColor: Color.forestGreen),
            Prompt(id: 4,
                   text: "What can wait until next week?",
                   category: Category.selfDiscovery),
            Prompt(id: 5,
                   text: "How does every part of my body feel in this moment?",
                   category: Category.selfDiscovery),
            Prompt(id: 6,
                   text: "What emotions am I holding on to?",
                   category: Category.managingEmotions),
            Prompt(id: 7,
                   text: "How can I detach or neutralize this emotion?",
                   category: Category.managingEmotions,
                   backgroundColor: Color.forestGreen),
            Prompt(id: 8,
                   text: "Why am I doing X?",
                   category: Category.managingEmotions),
            Prompt(id: 9,
                   text: "Why am I feeling this way?",
                   category: Category.managingEmotions),
            Prompt(id: 10,
                   text: "What can wait until next week?",
                   category: Category.managingEmotions,
                   backgroundColor: Color.forestGreen),
            Prompt(id: 11,
                   text: "What is causing these feelings?",
                   category: Category.managingEmotions),
        ]
        
        displayedPrompt = prompts.first ?? defaultPrompt
    }
    
    func advancePrompt() {
        let nextId = displayedPrompt.id + 1
        displayedPrompt = prompts.first { $0.id == nextId} ?? defaultPrompt
    }
    
    func setDateUsed(date: Date) {
        displayedPrompt.lastUsed = date
        var prompt = prompts.first { $0.id == displayedPrompt.id}
        prompts.removeAll { $0.id == displayedPrompt.id}
        if var prompt = prompt {
            prompt.lastUsed = date
            prompts.append(prompt)
        }
        
        advancePrompt()
    }
    
}

