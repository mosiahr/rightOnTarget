//
//  ViewController.swift
//  Right on target
//
//  Created by Gregory Mosia on 08.11.2021.
//

import UIKit

// загаданное число
var number: Int = 0
// раунд
var round: Int = 0
// сумма очков за раунд var points: Int = 0
var points: Int = 0


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    @IBAction func showMessage() {
//        print("Hello from showMessage!!!")
//    }

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    // загаданное число
    var number:Int = 0
    // раунд
    var round: Int = 0
    // сумма очков за раунд
    var points: Int = 0
    
    
    @IBAction func checkNumber() {
        // если игра только начинается
        if self.round == 0 {
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            // передаем значение случайного числа в label
            self.label.text = String(self.number)
            // устанавливаем счетчик раундов на 1
            self.round = 1
        } else {
            // получаем значение на слайдере
            let numSlider = Int(self.slider.value.rounded())
            // сравниваем значение с загаданным
            // и подсчитываем очки
            if numSlider > self.number {
                self.points += 50 - numSlider + self.number
            } else if numSlider < self.number {
                self.points += 50 - self.number + numSlider
            } else {
                self.points += 50
            }
            
            if self.round == 5 {
                // выводим информационное окно с результатами игры
                let alert = UIAlertController(
                    title: "Игра окончена",
                    message: "Вы заработали \(self.points) очков",
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                self.round = 1
                self.points = 0
            } else {
                self.round += 1
            }
            // генерируем случайное число
            self.number = Int.random(in: 1...50)
            // передаем значение случайного числа в label
            self.label.text = String(self.number)
        }
    }
}



