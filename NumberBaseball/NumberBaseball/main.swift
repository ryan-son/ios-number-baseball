
import Foundation

// 전역 변수 생성 (게임 중 사용자 입력, 정답 숫자, 잔여 시도 횟수)
var threeNumbersInputByUser = [Int]()
var answerNumbers = [Int]()
var remainingTryCount: Int = 9

class NumberBaseballGame {
    // 중복되지 않는 임의의 정수 3개 생성 함수
    func generateThreeRandomUniqueNumbers() -> [Int] {
        var threeRandomUiqueNumbers = [Int]()

        while threeRandomUiqueNumbers.count < 3 {
            let randomNumber: Int = Int.random(in: 1...9)
            if threeRandomUiqueNumbers.contains(randomNumber) {
                continue
            } else {
                threeRandomUiqueNumbers.append(randomNumber)
            }
        }
        return threeRandomUiqueNumbers
    }

    // 스트라이크, 볼, 사용자 승리, 컴퓨터 승리 판단 및 출력 함수
    func checkStrikeOrBall(Of: [Int]) {
        var strikeCount = 0
        var ballCount = 0
        remainingTryCount -= 1

        for index in 0...2 {
            if Of[index] == answerNumbers[index] {
                strikeCount += 1
            } else if answerNumbers.contains(threeNumbersInputByUser[index]) {
                ballCount += 1
            }
        }
        
        print("임의의 수 :", terminator: " ")
        for i in 0...2 {
            print("\(threeNumbersInputByUser[i])", terminator: " ")
        }
        print("")

        print("\(strikeCount) 스트라이크, \(ballCount) 볼")
        
        if strikeCount == 3 {
            print("사용자 승리...!")
        } else if remainingTryCount == 0 {
            print("컴퓨터 승리...!")
        } else {
            print("남은 기회 : \(remainingTryCount)")
        }
        print("---------------")
    }

    // 게임 시작 함수
    func gameStart() {
        answerNumbers = generateThreeRandomUniqueNumbers()
        while remainingTryCount != 0 {
            threeNumbersInputByUser = generateThreeRandomUniqueNumbers()
            checkStrikeOrBall(Of: threeNumbersInputByUser)
            if threeNumbersInputByUser == answerNumbers {
                break
            }
        }
    }
}

let numberBaseballGame = NumberBaseballGame()
numberBaseballGame.gameStart()
