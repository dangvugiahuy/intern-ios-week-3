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
        do {
            let data = FileManager().readDataFrom(file: fileName)
            list = try JSONDecoder().decode([Todo].self, from: data)
        } catch {
            return
        }
    }
    
    private func checkEmptyTodoList() {
        UIView.animate(withDuration: 1) {
            switch self.todoList.isEmpty {
            case true:
                self.emptyTodoListView.isHidden = false
            default:
                self.emptyTodoListView.isHidden = true
            }
        }
    }
    
    private func updateTodoTask(list: inout [Todo], index: Int, task: Todo) {
        list[index] = task
    }
    
    private func dropTodoList(list: inout [Todo], index: Int) {
        list.remove(at: index)
    }
    
    @IBAction func newReminder(_ sender: Any) {
        if !emptyTodoListView.isHidden {
            UIView.animate(withDuration: 0.2) {
                self.emptyTodoListView.isHidden.toggle()
            }
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
    
    func updateHeightTaskcell(_ cell: TodoTableViewCell, _ textView: UITextView) {
        let size = textView.bounds.size
        let newSize = todoListTableView.sizeThatFits(CGSize(width: cell.bounds.size.width, height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height {
            UIView.setAnimationsEnabled(false)
            todoListTableView?.beginUpdates()
            todoListTableView?.endUpdates()
            UIView.setAnimationsEnabled(true)
            if let indexPath = todoListTableView.indexPath(for: cell) {
                todoListTableView.scrollToRow(at: indexPath, at: .bottom, animated: false)
            }
        }
    }
    
    func updateTask(with task: Todo, at indexPath: IndexPath) {
        do {
            updateTodoTask(list: &todoList, index: indexPath.row, task: task)
            todoListTableView.reloadData()
            let data = try JSONEncoder().encode(todoList)
            if FileManager().writeDataTo(file: fileName, with: data) {
                print("Write Succsess")
            } else {
                print("write Fail")
            }
        } catch {
            print("update Task fail")
        }
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
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoListTableView.beginUpdates()
            todoList.remove(at: indexPath.row)
            todoListTableView.deleteRows(at: [indexPath], with: .fade)
            todoListTableView.endUpdates()
            checkEmptyTodoList()
            do {
                let data = try JSONEncoder().encode(todoList)
                if FileManager().writeDataTo(file: fileName, with: data) {
                    print("Write Succsess")
                } else {
                    print("write Fail")
                }
            } catch {
                print("update Task fail")
            }
        }
    }
}
