//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Sear Ahmad on 23/02/22.
//

import UIKit

class MainBoardViewController: UIViewController {
   
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var guessNumberLabel: UILabel!
    @IBOutlet weak var remainingAttempt: UILabel!
    
    //переменная хранящая рандомные числа
    var guessNumber: Int = Int.random(in: 1...100)
    //начальное значение очков
    var score: Int = 0
    //начальное оставшихся попыток
    var remainAttempt: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalThumbImages = UIImage(named: "SliderThumb-Normal")
        let highlightedThumbImages = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(normalThumbImages, for: .normal)
        slider.setThumbImage(highlightedThumbImages, for: .highlighted)
        setUp()
    }
    
    @IBAction func restartButton(_ sender: Any){
        setUp()
    }
    
    @IBAction func didTapSelectButton(_ sender: Any) {
        
        print("Значение слайдера: ", Int(slider.value))
        //1. забрать число у слайдера
        let sliderValue: Float = slider.value
        //2. перевести это число в целочисленный тип
        let sliderValueInt: Int = Int(sliderValue)
        //3. Сравнить два числа, если совпадают, то начислить 1 очко игроку
        let isValueEquals: Bool = sliderValueInt == guessNumber
        if  isValueEquals {
            score += 1
            scoreLabel.text = "Очки: \(score)"
            remAttempt()
            print("Вы угадали число!")
        } else {
            remAttempt()
            print("Вы выбрали число \(sliderValueInt)")
        }
        updateGuessingNumber()
        //
}
    //настройка игры
    func setUp( ) {
        //установим начальное значение слайдера
        slider.value = 21
        //конкатенируем текст и рандомное число
        updateGuessingNumber()
        //конкатенируем текст и количество очков
        score = 0
        scoreLabel.text = "Очки: \(score)"
        //количество оставшихся попыток
        remainAttempt = 1
        remainingAttempt.text = "Раунд: \(remainAttempt)"
    }
    
    func updateGuessingNumber() {
        guessNumber = Int.random(in: 1...100)
        guessNumberLabel.text = ("Попробуйте угадать число: \(guessNumber)")
    }
    func remAttempt() {
        remainAttempt += 1
        remainingAttempt.text = "Раунд: \(remainAttempt)"
    }
}
