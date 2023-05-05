//
//  HomeScreen.swift
//  pftp-lms
//
//  Created by Maheen on 04/05/2023.
//

import UIKit

class HomeScreen: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var cardTableView: UITableView!
    
    let pictures: [UIImage] = [UIImage(named: "study.jpg")!, UIImage(named: "bookshelf.jpg")!, UIImage(named: "classroom.jpg")!, UIImage(named: "brainstorm.jpg")!, UIImage(named: "coding.jpg")!, UIImage(named: "research.jpg")!, UIImage(named: "lecture.jpg")!, UIImage(named: "experiment.jpg")!, UIImage(named: "writing.jpg")!, UIImage(named: "training.jpg")!]

    let titles: [String] = [
        "Study Habits for Effective Learning.",
        "The Power of Reading: Building Your Personal Bookshelf.",
        "How to Engage and Motivate Students in the Classroom.",
        "Brainstorming Techniques for Innovative Thinking.",
        "Introduction to Coding: Learning a New Language.",
        "Research Skills for Effective Data Analysis.",
        "Effective Lecture Strategies for Knowledge Retention.",
        "Experimentation: A Hands-On Approach to Learning.",
        "The Art of Writing: Developing Your Creative Voice.",
        "Training Your Brain: Developing Cognitive Skills for Lifelong Learning."
    ]

    let descriptions: [String] = [
        "Good study habits include finding a quiet location to study, taking breaks, settings goals, and taking practice tests",
        "Reading is not just about picking an article and going through it. It is a cognitive, multifaceted process",
        "Learn how to create an engaging and inclusive classroom environment that promotes student participation and motivation.",
        "Unlock your creativity and learn innovative brainstorming techniques that will help you approach problems and challenges in new and exciting ways.",
        "Master the basics of coding and learn how to use programming languages to develop software, applications, and websites.",
        "Develop your research skills and learn how to analyze and interpret data to draw informed conclusions.",
        "Explore effective strategies for delivering engaging and memorable lectures that help students retain knowledge and skills.",
        "Discover the excitement and learn how to design and conduct experiments that yield meaningful results.",
        "Develop your writing skills and learn how to communicate your ideas and experiences through various forms of writing.",
        "Train your brain and improve your cognitive skills through a variety of exercises and techniques that promote lifelong learning."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        cell.configure(picture: pictures[indexPath.row], title: titles[indexPath.row], description: descriptions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CardCell
        let title = titles[indexPath.row]
        let alertCon = UIAlertController(title: "Cell Tapped !", message: "You tapped on \"\(title)\"", preferredStyle: .alert)
        let OkAct = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertCon.addAction(OkAct)
        present(alertCon, animated: true) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    cell.transform = .identity
                }
            }
        }
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
        let alert = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { (action) in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let logOut = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! LoginScreen
            logOut.modalPresentationStyle = .fullScreen
            logOut.modalTransitionStyle = .crossDissolve
            self.present(logOut, animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
