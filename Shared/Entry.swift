//
//  Entry.swift
//  Prompted
//
//  Created by Sarah Lichter on 12/9/21.
//

import Foundation

struct Entry: Identifiable {
    var id: UUID = UUID()
    var text: String
    var date: Date
    var promptId: Int
}
