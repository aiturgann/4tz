//
//  SecondViewController.swift
//  4tz
//
//  Created by Aiturgan Kurmanbekova on 26/2/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var tableView = UITableView()
    
    var contacts: [Contact] = [Contact(userImage: UIImage(named: "image1")!,
                                       commentLabel: "Jane Cooper has published a new recipe!",
                                       dateLabel: "Today | 09:24 AM",
                                       foodImage: UIImage(named: "food1")!),
    Contact(userImage: UIImage(named: "image2")!,
            commentLabel: "Rochel has commented on your recipe",
            dateLabel: "1 day ago | 14:43 PM",
            foodImage: UIImage(named: "food2")!),
                               Contact(userImage: UIImage(named: "image3")!,
                                       commentLabel: "Brad Wigington liked your comment",
                                       dateLabel: "1 day ago | 09:29 AM",
                                       foodImage: UIImage(named: "food3")!),
    Contact(userImage: UIImage(named: "image4")!,
            commentLabel: "Tyra Ballentine has published a new recipe!",
            dateLabel: "2 days ago | 10:29 AM",
            foodImage: UIImage(named: "food4")!),
                               Contact(userImage: UIImage(named: "image5")!,
                                       commentLabel: "Marci Winkles has published a new recipe!",
                                       dateLabel: "3 days ago | 16:52 PM",
                                       foodImage: UIImage(named: "food5")!),
    Contact(userImage: UIImage(named: "image6")!,
            commentLabel: "Aileen has commented on your recipe",
            dateLabel: "4 days ago | 14:27 PM",
            foodImage: UIImage(named: "food6")!),
                               Contact(userImage: UIImage(named: "image7")!,
                                       commentLabel: "George has commented on your recipe",
                                       dateLabel: "5 days ago | 09:20 AM",
                                       foodImage: UIImage(named: "food7")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()

    }
    
    private func setupUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
             tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
             tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
             tableView.heightAnchor.constraint(equalToConstant: 500)
            ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension SecondViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.setData(contacts: contacts[indexPath.row])
        return cell
    }
    
    
}
