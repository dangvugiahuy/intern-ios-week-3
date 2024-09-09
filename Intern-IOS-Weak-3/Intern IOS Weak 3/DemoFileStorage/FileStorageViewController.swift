//
//  FileStorageViewController.swift
//  Dang Vu Gia Huy
//
//  Created by Huy Gia on 8/9/24.
//

import UIKit

class FileStorageViewController: UIViewController {
    
    private let fileName: String = "ToDoTask.txt"
    private var todoList: [Todo] = [Todo]()
    
    @IBOutlet weak var emptyTodoListView: UIView!
    @IBOutlet weak var todoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FileManager().checkFileExist(fileName: fileName)
        getTodoList(list: &todoList)
        setUpNavigationBar()
        setUpTableView()
        checkEmptyTodoList()
    }
    
    private func setUpNavigationBar() {
        let menuButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"), style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = menuButton
    }
    
    private func setUpTableView() {
        let nib = UINib(nibName: "TodoTableViewCell", bundle: .main)
        todoListTableView.register(nib, forCellReuseIdentifier: "todoCell")
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
    }
    
    private func getTodoList(list: inout [Todo]) {
        
    }
    
    private func checkEmptyTodoList() {
        switch todoList.isEmpty {
        case true:
            emptyTodoListView.isHidden = false
        default:
            emptyTodoListView.isHidden = true
        }
    }
    
    private func updateTodoTask(list: inout [Todo], index: Int, task: Todo) {
        list[index] =  task
    }
    
    private func dropTodoList(list: inout [Todo], index: Int) {
        list.remove(at: index)
    }
    
    @IBAction func newReminder(_ sender: Any) {
        if !emptyTodoListView.isHidden {
            emptyTodoListView.isHidden.toggle()
        }
        todoList.insert(Todo(), at: todoList.endIndex)
        let index = todoList.count - 1
        let indexPath = IndexPath(row: index, section: 0)
        todoListTableView.beginUpdates()
        todoListTableView.insertRows(at: [indexPath], with: .right)
        todoListTableView.endUpdates()
        todoListTableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
    }
}

extension FileStorageViewController: UITableViewDelegate, UITableViewDataSource, TodoTableViewCellDelegate {
    
    func updateTask(with task: Todo, at indexPath: IndexPath) {
        updateTodoTask(list: &todoList, index: indexPath.row, task: task)
        todoListTableView.reloadData()
    }
    
    func dropCell(with indexPath: IndexPath) {
        dropTodoList(list: &todoList, index: indexPath.row)
        todoListTableView.deleteRows(at: [indexPath], with: .fade)
        checkEmptyTodoList()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoListTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        cell.todoTask = todoList[indexPath.row]
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
