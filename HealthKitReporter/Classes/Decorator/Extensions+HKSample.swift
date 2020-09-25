//
//  Extensions+HKSample.swift
//  HealthKitReporter
//
//  Created by Florian on 25.09.20.
//

import Foundation
import HealthKit

extension HKSample {
    func parsed() throws -> Sample {
        if let quantitiy = self as? HKQuantitySample {
            return try Quantitiy(quantitySample: quantitiy)
        }
        if let category = self as? HKCategorySample {
            return try Category(categorySample: category)
        }
        if let workout = self as? HKWorkout {
            return try Workout(workout: workout)
        }
        if #available(iOS 14.0, *) {
            if let electrocardiogram = self as? HKElectrocardiogram {
                return try Electrocardiogram(electrocardiogram: electrocardiogram)
            }
        }
        throw HealthKitError.parsingFailed("HKSample could not be parsed")
    }
}