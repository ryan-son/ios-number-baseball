//
//  NumberBaseball - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 전역 변수 생성 (게임 중 사용자 입력, 정답 숫자, 잔여 시도 횟수)
var threeNumbersInputByUserForNumberBaseballGame = [Int]()
var answerNumbers = [Int]()
var remainingTryCount: Int = 9

class NumberBaseballGame {
    // 메뉴 출력 함수
    func printMenu() {
        print("""
                1. 게임 시작
                2. 게임 종료
                원하는 기능을 선택해주세요 :
                """, terminator: " ")
    }

    // 메뉴 선택 시 사용자 입력의 유효성 검사 및 메뉴 이동을 수행하는 함수
    func selectMenu() {
        while true {
            printMenu()
            if let menuSelectedByUser: String = readLine() {
                switch menuSelectedByUser {
                case "1": startGame()
                case "2": return
                default:
                    print("입력값이 잘못되었습니다.")
                }
            }
        }
    }

    // 숫자야구게임 수행을 위해 사용자가 입력한 내용의 유효성 검사 및 공백으로 이루어진 입력을 정수 배열로 바꾸는 전처리를 수행하는 함수
    func getAndPreprocessThreeNumbersInputByUserForNumberBaseballGame() -> [Int] {
        var preprocessedUserInputForNumberBaseballGame = [Int]()
        while preprocessedUserInputForNumberBaseballGame.count != 3 {
            preprocessedUserInputForNumberBaseballGame = []
            print("숫자 3개를 띄어쓰기로 구분하여 입력해주세요.\n중복 숫자는 허용하지 않습니다.")
            print("입력 :", terminator: " ")
            if let rawUserInputForNumberBaseballGame: String = readLine() {
                let stringElementsUserInputForNumberBaseballGame: [String] = rawUserInputForNumberBaseballGame.split(separator: " ").map { String($0) }
                for index in stringElementsUserInputForNumberBaseballGame {
                    if let integerElementUserInput: Int = Int(index) {
                        preprocessedUserInputForNumberBaseballGame.append(integerElementUserInput)
                    }
                }
            }
            if preprocessedUserInputForNumberBaseballGame.count != 3 {
                print("입력이 잘못되었습니다.")
            }
        }
        return preprocessedUserInputForNumberBaseballGame
    }

    // 중복되지 않는 임의의 정수 3개 생성 함수
    func generateThreeRandomUniqueNumbers() -> [Int] {
        var threeRandomUniqueNumbers = [Int]()
        while threeRandomUniqueNumbers.count < 3 {
            let randomNumberToBeAppendedInThreeRandomUniqueNumbers: Int = Int.random(in: 1...9)
            if threeRandomUniqueNumbers.contains(randomNumberToBeAppendedInThreeRandomUniqueNumbers) {
                continue
            } else {
                threeRandomUniqueNumbers.append(randomNumberToBeAppendedInThreeRandomUniqueNumbers)
            }
        }
        return threeRandomUniqueNumbers
    }

    // 스트라이크, 볼 판단 및 출력 함수
    func checkStrikeOrBall(threeNumbersToCheckStrikeOrBall: [Int]) -> [Int] {
        var strikeCount = 0
        var ballCount = 0
        remainingTryCount -= 1
        for index in 0...2 {
            if threeNumbersToCheckStrikeOrBall[index] == answerNumbers[index] {
                strikeCount += 1
            } else if answerNumbers.contains(threeNumbersToCheckStrikeOrBall[index]) {
                ballCount += 1
            }
        }
        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        return [strikeCount, ballCount]
    }

    // remainingTryCount 또는 승자를 출력하는 함수
    func printRemainingTryCountOrWhoWins(strikeCount: Int, remainingTryCount: Int) {
        if strikeCount == 3 {
            print("사용자 승리!")
        } else if remainingTryCount == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainingTryCount)")
        }
    }

    // 게임 시작 함수
    func startGame() {
        remainingTryCount = 9
        answerNumbers = generateThreeRandomUniqueNumbers()
        while remainingTryCount != 0 {
            threeNumbersInputByUserForNumberBaseballGame = getAndPreprocessThreeNumbersInputByUserForNumberBaseballGame()
            let ResultOfCheckStrikeOrBall: [Int] = checkStrikeOrBall(threeNumbersToCheckStrikeOrBall: threeNumbersInputByUserForNumberBaseballGame)
            let strikeCountIndexInResultOfCheckStrikeOrBall: Int = 0
            printRemainingTryCountOrWhoWins(strikeCount: ResultOfCheckStrikeOrBall[strikeCountIndexInResultOfCheckStrikeOrBall], remainingTryCount: remainingTryCount)
            if threeNumbersInputByUserForNumberBaseballGame == answerNumbers {
                break
            }
        }
    }
}

let numberBaseballGame = NumberBaseballGame()
numberBaseballGame.selectMenu()
