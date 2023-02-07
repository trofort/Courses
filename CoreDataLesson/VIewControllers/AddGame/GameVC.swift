//
//  GameVC.swift
//  CoreDataLesson
//
//  Created by Treschik on 7.02.23.
//

import Foundation

import UIKit

class GameVC: UIViewController {
    
    @IBOutlet private weak var labelLine1: UILabel!
    @IBOutlet private weak var labelLine2: UILabel!
    @IBOutlet private weak var labelLine3: UILabel!
    @IBOutlet private weak var labelLine4: UILabel!
    @IBOutlet private weak var labelLine5: UILabel!
    @IBOutlet private weak var labelLine6: UILabel!
    @IBOutlet private weak var labelLine7: UILabel!
    @IBOutlet private weak var labelLine8: UILabel!
    @IBOutlet private weak var labelLine9: UILabel!
    @IBOutlet private weak var timerLabel: UILabel!
    //
    var line1 = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
    var line2 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line3 = ["1", "I", "B", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line4 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line5 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line6 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line7 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
    var line8 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "E", "1"]
    var line9 = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
    var array: [[String]]?
    var myPositionX = 0
    var myPositionY = 0
    var exitX: Int?
    var exitY: Int?
    var blockX: Int?
    var blockY: Int?
    var zeros: [Int]?
    var timer: Timer?
    var time: TimeInterval = 0.0 {
        didSet {
            timerLabel.text = String(format: "%.1f" + " sec", time)
        }
    }
    var timerOnOff: Bool = false
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
        let massive0 = [line1, line2, line3, line4, line5, line6, line7, line8, line9]
        array = massive0
        let start = findStart(file: massive0)
        let exit = findExit(file: massive0)
        var block = findBlock(file: massive0)
        blockX = block[0]
        blockY = block[1]
        exitX = exit[0]
        exitY = exit[1]
        myPositionX = start[0]
        myPositionY = start[1]
        printLabel(file: massive0)
    }
    ///
    func didPlayButton() {
        switch timerOnOff {
        case false:
            timerOnOff = true
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                self.time += 0.1
            })
        case true:
            print("")
        }
    }
    func didStopButton() -> String{
        timer?.invalidate()
        timerOnOff = false
        timer?.invalidate()
        print("Stop")
        print(time)
        return "\(time)"
    }
    func findStart (file: [[String]]) -> [Int] {
        var x = 0
        var y = 0
        for element in file {
            for index in element {
                if index == "I" {
                    return [x, y]
                }
                y += 1
            }
            x += 1
            y = 0
        }
        return [0]
    }
    func findExit (file: [[String]]) -> [Int] {
        var x = 0
        var y = 0
        for element in file {
            for index in element {
                if index == "E" {
                    return [x, y]
                }
                y += 1
            }
            x += 1
            y = 0
        }
        return [0]
    }
    func findBlock (file: [[String]]) -> [Int] {
        var x = 0
        var y = 0
        for element in file {
            for index in element {
                if index == "B" {
                    return [x, y]
                }
                y += 1
            }
            x += 1
            y = 0
        }
        return [0]
    }
    ///
    func getNextStep (zeros: [Int], x: Int, y: Int ) -> [Int] {
        var buff = 0
        var steps: [Int] = [x, y]
        for ind in zeros {
            if ind == 1 {
                if buff == 0{
                   steps = [x - 1, y]
                    break
                } else if buff == 1{
                    steps = [x, y + 1]
                    break
                } else if buff == 2{
                    steps = [x + 1, y]
                    break
                } else if buff == 3{
                    steps = [x, y - 1]
                    break
                }
            } else if ind == 2 {
                if buff == 0{
                    steps = [x - 1, y]
                    blockX! -= 1
                    break
                } else if buff == 1{
                    steps = [x, y + 1]
                    blockY! += 1
                    break
                } else if buff == 2{
                    steps = [x + 1, y]
                    blockX! += 1
                    break
                } else if buff == 3{
                    steps = [x, y - 1]
                    blockY! += 1
                    break
                }
            }
            buff += 1
        }
        return steps
    }
    
    func printStep (file: inout[[String]], newX: Int, newY: Int, x: Int, y: Int) -> [[String]]{
        file[blockX!][blockY!] = "B"
        file[exitX!][exitY!] = "E"
            file[newX][newY] = "I"
            file[x][y] = "0"
            return file
    }
    ///
    func printLabel(file: [[String]]){
        var i = 0
            for element in file {
                var buff1 = ""
                for var ind in element {
                    if ind == "1" {
                        buff1 += "⬛️"
                    } else if ind == "B" {
                        buff1 += "🪙"
                    } else if ind == "E" {
                        buff1 += "🪣"
                    } else if ind == "0"{
                        buff1 += "⬜️"
                    } else if ind == "I"{
                        buff1 += "🧍🏼‍♂️"
                    } else if ind == "x"{
                        ind = "x"
                        buff1 += ind
                    }
                }
                switch i{
                case 0:labelLine1.text = buff1
                case 1:labelLine2.text = buff1
                case 2:labelLine3.text = buff1
                case 3:labelLine4.text = buff1
                case 4:labelLine5.text = buff1
                case 5:labelLine6.text = buff1
                case 6:labelLine7.text = buff1
                case 7:labelLine8.text = buff1
                case 8:labelLine9.text = buff1
                default: print()
                }
                i += 1
            }
    }
    ///
    func actionTap(zeros: [Int]) {
        let nextSteps = getNextStep(zeros: zeros, x: myPositionX, y: myPositionY)
        let myOldPositionX = myPositionX
        let myOldPositionY = myPositionY
            myPositionX = nextSteps[0]
            myPositionY = nextSteps[1]
        if zeros == [0,0,0,0] {
        } else {
            array = printStep(file: &array!, newX: myPositionX, newY: myPositionY, x: myOldPositionX, y: myOldPositionY)
        }
        if blockX == exitX && blockY == exitY {
            let record = didStopButton()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "\(WinVC.self)") as! WinVC
            nextVC.record = record
            present(nextVC, animated: true)
        }
        printLabel(file: array!)
    }
    func findZero (file: [[String]], x: Int, y: Int, ind: Int) -> [Int] {
        switch ind {
        case 1:
            if x-1 >= 0 && file[x-1][y] == "0" || x-1 >= 0 && file[x-1][y] == "E"{
                return [1, 0, 0, 0]
            } else {
                if x-1 >= 0 && file[x-1][y] == "B" {
                    if x-2 >= 0 && file[x-2][y] == "1" {
                        return [0, 0, 0, 0]
                    } else {
                        return [2, 0, 0, 0]
                    }
                } else {
                    return [0, 0, 0, 0]
                }
            }
        case 2:
            if y+1 != file[x].count && file[x][y+1] == "0" || y+1 != file[x].count && file[x][y+1] == "E"{
                return [0, 1, 0, 0]
            } else {
                if y+1 != file[x].count && file[x][y+1] == "B" {
                    if y+2 != file[x].count && file[x][y+2] == "1" {
                        return[0, 0, 0, 0]
                    } else {
                        return [0, 2, 0, 0]
                    }
                } else {
                    return [0, 0, 0, 0]
                }
            }
        case 3:
            if x+1 != file.count && file[x+1][y] == "0" || x+1 != file.count && file[x+1][y] ==     "E"{
                return [0, 0, 1, 0]
            } else {
                if x+1 != file.count && file[x+1][y] == "B" {
                    if x+2 != file.count && file[x+2][y] == "1" {
                        return [0, 0, 0, 0]
                    } else {
                        return [0, 0, 2, 0]
                    }
                } else {
                    return [0, 0, 0, 0]
                }
            }
        case 4:
            if y-1 >= 0 && file[x][y-1] == "0" || y-1 >= 0 && file[x][y-1] == "E"{
                return [0, 0, 0, 1]
            } else {
                if y-1 >= 0 && file[x][y-1] == "B" {
                    if y-2 >= 0 && file[x][y-2] == "1" {
                        return [0, 0, 0, 0]
                    } else {
                        return [0, 0, 0, 2]
                    }
                } else {
                    return [0, 0, 0, 0]
                }
            }
        default:
            return [0, 0, 0, 0]
        }
    }
    func restartGame() {
        timer?.invalidate()
        time = 0.0
        timerOnOff = false
        timer?.invalidate()
        line1 = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
        line2 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line3 = ["1", "I", "B", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line4 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line5 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line6 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line7 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1"]
        line8 = ["1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "E", "1"]
        line9 = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"]
        array = [line1, line2, line3, line4, line5, line6, line7, line8, line9]
        printLabel(file: array!)
        let start = findStart(file: array!)
        let block = findBlock(file: array!)
        let exit = findExit(file: array!)
        blockX = block[0]
        blockY = block[1]
        exitX = exit[0]
        exitY = exit[1]
        myPositionX = start[0]
        myPositionY = start[1]
        
    }
    
    ///
    
    @IBAction func didTapButtonUP() {
        didPlayButton()
        printLabel(file: array!)
        zeros = findZero(file: array!, x: myPositionX, y: myPositionY, ind: 1)
        print("up")
        actionTap(zeros: zeros!)
    }
    @IBAction func didTapButtonRight() {
        didPlayButton()
        printLabel(file: array!)
        zeros = findZero(file: array!, x: myPositionX, y: myPositionY, ind: 2)
        print("right")
        actionTap(zeros: zeros!)
    }
    @IBAction func didTapButtonDown() {
        didPlayButton()
        printLabel(file: array!)
        zeros = findZero(file: array!, x: myPositionX, y: myPositionY, ind: 3)
        print("down")
        actionTap(zeros: zeros!)
    }
    @IBAction func didTapButtonLeft() {
        didPlayButton()
        printLabel(file: array!)
        zeros = findZero(file: array!, x: myPositionX, y: myPositionY, ind: 4)
        print("left")
        actionTap(zeros: zeros!)
    }
    @IBAction func didTapRestartButton() {
        restartGame()
    }
    @IBAction private func backToProfile() {
        navigationController?.popViewController(animated: true)
    }
}
