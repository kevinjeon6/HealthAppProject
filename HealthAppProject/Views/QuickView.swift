//
//  ContentView.swift
//  HealthAppProject
//
//  Created by Kevin Mattocks on 12/27/22.
//

import Charts
import HealthKit
import SwiftUI

struct QuickView: View {
  
    @ObservedObject var healthStoreVM: HealthStoreViewModel
    
 
    var body: some View {
      
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    
                    Image(systemName: "figure.walk")
                        .font(.largeTitle)
                    Text("\(healthStoreVM.currentStepCount) steps")
                    HStack {
                        Text("Goal: 10,000 steps")
                            .font(.caption)
                        Spacer()
                        Text("\(healthStoreVM.stepCountPercent)%")
                            .font(.caption)
                    }
                    //MARK: - Progression Step bar
                    ProgressionStepBar(value: healthStoreVM.currentStepCount, goalValue: 10_000)
                        .padding(.bottom, 20)
                    
                    //MARK: - Quick Snapshot of health variables
                    Grid {
                        GridRow {
                            CurrentSummaryCardView(title: "Resting HR", description: "Resting Heart Rate how well your heart pumps", categoryValue: "\(healthStoreVM.currentRestHR)")
                            
                            CurrentSummaryCardView(title: "Exercise Time", description: "Exercise is beneficial", categoryValue: "\(healthStoreVM.currentExTime)")
                        }
                    }
                        
                }
                .padding(.horizontal)
                .navigationTitle("Health Project App")
            }
        }
    }
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView(healthStoreVM: HealthStoreViewModel())
    }
}
