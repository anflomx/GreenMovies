//
//  ViewController.swift
//  GreenMovies
//
//  Created by Antonio Flores on 05/03/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let movieListViewModel = MovieListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configCell()
        
        self.title = "Green Movies"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: Theme.mainFont, size: 20) ?? UIFont(), NSAttributedString.Key.foregroundColor: UIColor.white]

        self.view.backgroundColor = Theme.mainBackgroundColor
        
        self.showSpinner(onView: self.view)
        movieListViewModel.getMovieList()
        movieListViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.removeSpinner()
            }
        }
    }
    
    private func configCell() {
        let nibR = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nibR, forCellReuseIdentifier: "MovieTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell") as? MovieTableViewCell else {
            return UITableViewCell()
        }
        cell.movieViewModel = movieListViewModel.movieViewModel(at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movieListViewModel.movieViewModel(at: indexPath.row)
        let vc = DetailViewController(movieViewModel: movie)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottom = scrollView.contentOffset.y + scrollView.frame.height
        if bottom >= scrollView.contentSize.height {
            let currentPage = movieListViewModel.pageInfo.currentPage + 1
            self.showSpinner(onView: self.view)
            movieListViewModel.getMovieList(page: currentPage)
        }
    }
}
