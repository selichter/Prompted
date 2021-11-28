//
//  Prompt.swift
//  Prompted
//
//  Created by Sarah Lichter on 11/26/21.
//

import Foundation
import SwiftUI

struct Prompt: Identifiable {
    var id: Int
    let text: String
    let category: Category
    var lastUsed: Date?
    var backgroundColor: Color = Color.goldMetallic
    var textColor: Color = Color.white
}

