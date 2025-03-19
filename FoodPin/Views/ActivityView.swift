//
//  ActivityView.swift
//  FoodPin
//
//  Created by นางสาวพรนัชชา ประทีปสังคม on 19/3/2568 BE.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    var activityItem: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let activityController = UIActivityViewController(activityItems: activityItem, applicationActivities: applicationActivities)
        return activityController
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

