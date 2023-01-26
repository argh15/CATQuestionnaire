//
//  ViewController.swift
//  OMRSheet
//
//  Created by Arghadeep on 19/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var parentTable: UITableView!
        
    var listOfQuestions: [CATQuestionnaireModel] = []
    
    var totalScore: Int = 0
    
    var submitButtonEnabled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentTable.delegate = self
        parentTable.dataSource = self
        parentTable.separatorStyle = .none
        registerXIBs()
        createQuestions()
        // Do any additional setup after loading the view.
    }
    
    func registerXIBs() {
        parentTable.register(TableViewTopCell.nib, forCellReuseIdentifier: TableViewTopCell.identifier)
        parentTable.register(ExampleViewCell.nib, forCellReuseIdentifier: ExampleViewCell.identifier)
        parentTable.register(QuestionViewCell.nib, forCellReuseIdentifier: QuestionViewCell.identifier)
        parentTable.register(TotalScoreViewCell.nib, forCellReuseIdentifier: TotalScoreViewCell.identifier)
        parentTable.register(FooterViewCell.nib, forCellReuseIdentifier: FooterViewCell.identifier)
    }
    
    func createQuestions() {
        let question1 = CATQuestionnaireModel(minScaledQuestion: "I am very happy", maxScaledQuestion: "I cough all the time")
        let question2 = CATQuestionnaireModel(minScaledQuestion: "I have no phlegm (mu-cus) in my chest at all", maxScaledQuestion: "My chest is completely full of phlegm (mucus)")
        let question3 = CATQuestionnaireModel(minScaledQuestion: "My chest does not feel tight at all", maxScaledQuestion: "My chest feels very tight")
        let question4 = CATQuestionnaireModel(minScaledQuestion: "When I walk up a hill or one flight of stairs I am not breathless", maxScaledQuestion: "When I walk up a hill or one flight of stairs I am very breathless")
        let question5 = CATQuestionnaireModel(minScaledQuestion: "I am not limited doing any activities at home", maxScaledQuestion: "I am very limited doing any activities at home")
        let question6 = CATQuestionnaireModel(minScaledQuestion: "I am confident leaving my home despite my lung condition", maxScaledQuestion: "I am not all confident leaving my home because of my lung condition")
        let question7 = CATQuestionnaireModel(minScaledQuestion: "I sleep soundly", maxScaledQuestion: "I don’t sleep soundly because of my lung condition")
        let question8 = CATQuestionnaireModel(minScaledQuestion: "I have lots of energy", maxScaledQuestion: "I have no energy at all")
        
        listOfQuestions.append(contentsOf: [question1, question2, question3, question4, question5, question6, question7, question8])
    }
    
    func calculateFinalScore() {
        self.totalScore = 0
        for element in listOfQuestions {
            if let score = element.questionScore {
                self.totalScore += score
            }
        }
        self.parentTable.reloadSections(IndexSet(integer: 3), with: .none)
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Ready to submit?", message: "You’ve completed evaluation and your answers will be recorded.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Submit",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            //Sign out action
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func submitButtonUpdate() {
        for element in listOfQuestions {
            if element.questionScore == nil {
                self.submitButtonEnabled = false
            } else {
                self.submitButtonEnabled = true
            }
        }
        self.parentTable.reloadSections(IndexSet(integer: 4), with: .none)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 1
        case 1: return 1
        case 2: return listOfQuestions.count
        case 3: return 1
        case 4: return 1
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TableViewTopCell.identifier) as? TableViewTopCell {
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: ExampleViewCell.identifier) as? ExampleViewCell {
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: QuestionViewCell.identifier) as? QuestionViewCell {
                
                cell.setupScaleLables(min: listOfQuestions[indexPath.row].minScaledQuestion ?? "", max: listOfQuestions[indexPath.row].maxScaledQuestion ?? "")
                cell.getQuestionScore = { score in
                    self.listOfQuestions[indexPath.row].questionScore = score
                    self.calculateFinalScore()
                    self.submitButtonUpdate()
                }
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TotalScoreViewCell.identifier) as? TotalScoreViewCell {
                
                cell.setScore(score: self.totalScore)
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FooterViewCell.identifier) as? FooterViewCell {
                
                cell.updateSubmitButton(isEnabled: self.submitButtonEnabled)
                
                cell.submitQuestions =  {
                    self.showAlert()
                }
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 2:
            if (indexPath.row % 2 == 0) {
                cell.backgroundColor = UIColor.white;
            } else {
                cell.backgroundColor = UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0)
            }
        default:
            break
        }
    }
    
}

