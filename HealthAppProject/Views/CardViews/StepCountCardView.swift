//
//  StepCountCardView.swift
//  HealthAppProject
//
//  Created by Kevin Mattocks on 1/27/23.
//

import SwiftUI

struct StepCountCardView: View {
    var progress: Double
    var minValue: Double
    var maxValue: Double
    var title: Int
    var goalText: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.darkModeColor)
                .shadow(color: .black.opacity(0.5), radius: 5)
                .padding(.horizontal)
                .frame(width: 400, height: 80)
            
            HStack(spacing: 20){
                Spacer()
                VStack (alignment: .leading, spacing: 0) {
                    ProgressGaugeView(progress: progress,
                                       minValue: minValue,
                                       maxValue: maxValue,
                                       scaleValue: 0.8,
                                       gaugeColor: .blue,
                                       title: title)
                        .padding(.top, 5)
                    Text("\(goalText) steps")
                        .font(.caption)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                }
                Spacer()
                
                Text("\(Int(progress)) steps")
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
                Image(systemName: "chevron.forward")
                Spacer()
            }
            .padding(.trailing, 30)
        }
    }
}

struct StepCountCardView_Previews: PreviewProvider {
    static var previews: some View {
        StepCountCardView(progress: 3500, minValue: 0, maxValue: 10_000, title: 35, goalText: 8000)
    }
}
