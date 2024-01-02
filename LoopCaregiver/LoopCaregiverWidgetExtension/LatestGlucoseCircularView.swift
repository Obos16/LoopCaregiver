//
//  LatestGlucoseCircularView.swift
//  LoopCaregiverWidgetExtension
//
//  Created by Bill Gestrich on 6/3/23.
//

import LoopCaregiverKit
import SwiftUI
import LoopKit
import HealthKit

struct LatestGlucoseCircularView: View {
    
    let viewModel: WidgetViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.currentGlucoseDateText)
                .strikethrough(viewModel.isGlucoseStale)
                .font(.footnote)
            Text(viewModel.currentGlucoseText)
                .strikethrough(viewModel.isGlucoseStale)
                .font(.headline)
                .bold()
            if let currentTrendImageName = viewModel.currentTrendImageName {
                Image(systemName: currentTrendImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 15)
                    .offset(.init(width: 0.0, height: -7.0))
            }
        }
    }
    
}

struct CurrentBGView_Previews: PreviewProvider {
    static var previews: some View {
        let latestGlucose = NewGlucoseSample(date: Date(), quantity: .init(unit: .internationalUnitsPerHour, doubleValue: 1.0), condition: .aboveRange, trend: .down, trendRate: .none, isDisplayOnly: false, wasUserEntered: false, syncIdentifier: "12345")
        let viewModel = WidgetViewModel(timelineEntryDate: Date(), latestGlucose: latestGlucose, lastGlucoseChange: 3, isLastEntry: true, glucoseDisplayUnits: .gramsPerUnit)
        LatestGlucoseCircularView(viewModel: viewModel)
    }
}
