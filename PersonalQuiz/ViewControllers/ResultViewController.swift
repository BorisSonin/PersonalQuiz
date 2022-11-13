//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    var responses: [Answer] = []
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var definitionLabel: UILabel!
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным
    
    // использовать функции высшего порядка map и sorted
    // отдельный метод для поиска результата
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        calculateResult()
    }
    
    func calculateResult() {
        var frequencyOfAnswers: [Animal:Int] = [:]
        let responsesType = responses.map { $0.animal }
        for response in responsesType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let answerSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value})
        
        let mostCommonAnswer = answerSorted.first?.key
        
        answerLabel.text = "Вы - \(String(describing: mostCommonAnswer!.rawValue))"
        definitionLabel.text = mostCommonAnswer?.definition
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    deinit {
        print("ResultVC has been delocated")
    }
    
}
