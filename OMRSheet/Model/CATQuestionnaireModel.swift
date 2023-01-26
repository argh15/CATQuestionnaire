//
//  CATQuestionnaireModel.swift
//  OMRSheet
//
//  Created by Arghadeep on 25/01/23.
//

import Foundation

class CATQuestionnaireModel: NSObject {
    
    var minScaledQuestion: String?
    var maxScaledQuestion: String?
    var questionScore: Int?
    
    init(minScaledQuestion: String? = nil, maxScaledQuestion: String? = nil, questionScore: Int? = nil) {
        self.minScaledQuestion = minScaledQuestion
        self.maxScaledQuestion = maxScaledQuestion
        self.questionScore = questionScore
    }
}
