//
//  DataModel.swift
//  Lotte-Cinema
//
//  Created by 지희의 MAC on 2023/05/20.
//
import Foundation

// MARK: - Welcome
struct Response: Codable {
    let code: Int
    let message: String
    let data: [TheaterResponse]
}

// MARK: - Datum
struct TheaterResponse: Codable {
    let theaterName: String
    let multiplexList: [MultiplexList]
}

// MARK: - MultiplexList
struct MultiplexList: Codable {
    let movieType, multiplexLocation: String
    let scheduleList: [ScheduleList]
}

// MARK: - ScheduleList
struct ScheduleList: Codable {
    let startTime, endTime, currentPeople, maxPeople: String
}
