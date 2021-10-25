//
//  main.swift
//  HW3 Mirovaia
//
//  Created by Christine Mirovaia on 21.10.21.
//

import Foundation

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum EngineStatus {
    case on
    case off
}

enum WindowsStatus {
    case opened
    case closed
}

enum CarActions {
    case startEngine
    case stopEngine
    case openWindows
    case closeWindows
}

struct SportCar {
    let brand: String
    let year: Int
    let color: String
    let trunkVolumeMax: Int
    var trunkCurrentVolume: Int
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    let maxSpeed: Int
    
    mutating func doAction(action: CarActions) {
        switch action {
        case .openWindows:
            windowsStatus = .opened
        case .closeWindows:
            windowsStatus = .closed
        case .startEngine:
            engineStatus = .on
        case .stopEngine:
            engineStatus = .off
        }
    }
    
    mutating func changeCurrentTrunkVolume(volume: Int) {
        self.trunkCurrentVolume = volume
    }
}

struct TrunkCar {
    let brand: String
    let year: Int
    let weightFull: Int
    let trunkVolumeMax: Int
    var trunkCurrentVolume: Int
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    let sleepingPlace: Bool
    
    
    mutating func doAction(action: CarActions) {
        switch action {
        case .openWindows:
            windowsStatus = .opened
        case .closeWindows:
            windowsStatus = .closed
        case .startEngine:
            engineStatus = .on
        case .stopEngine:
            engineStatus = .off
        }
    }
    
    mutating func changeCurrentTrunkVolume(volume: Int) {
        self.trunkCurrentVolume = volume
    }
}

var tesla = SportCar(brand: "Tesla", year: 2021, color: "red", trunkVolumeMax: 300, trunkCurrentVolume: 0, engineStatus: .off, windowsStatus: .closed, maxSpeed: 320)

tesla.doAction(action: .openWindows)
tesla.doAction(action: .startEngine)

print("Двигатель Tesla \(tesla.engineStatus)")

var volvo = TrunkCar(brand: "Volvo", year: 2019, weightFull: 41000, trunkVolumeMax: 28000, trunkCurrentVolume: 10000, engineStatus: .off, windowsStatus: .opened, sleepingPlace: false)

volvo.doAction(action: .closeWindows)
volvo.doAction(action: .stopEngine)
volvo.changeCurrentTrunkVolume(volume: 28000)

print("Окна грузовика Volvo \(volvo.windowsStatus)" )
print("Двигатель грузовика Volvo \(volvo.engineStatus)" )
print("Кузов грузовика Volvo наполнен на \(volvo.trunkCurrentVolume) кг" )


if (volvo.sleepingPlace) {
    print("Спальное место в кабине Volvo есть")
} else {
    print("Спальное место в кабине Volvo отсутствует")
}
