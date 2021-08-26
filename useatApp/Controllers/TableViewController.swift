
import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {
//    let data = ["a","b","c"]
    var restaurants = [Restaurant]()
    var filterRestaurants:[Restaurant]!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let img1 = UIImage(named: "./Assets.xcassets/burger.png") else { return }
        guard let img2 = UIImage(named: "./Assets.xcassets/chicken.png") else { return }

        let r1 = Restaurant(data: [ "id": "0" ,"name":"Burgers" ,"distance":1.5,"description":"burger and chips","image":img1])
        
        let r2 = Restaurant(data:["id":"1" ,"name":"chikcen" ,"distance":1.8,"description":"chicken meal","image":img2])
        
        searchBar.delegate = self

        restaurants.append(r1)
        restaurants.append(r2)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as! RestaurantTableViewCell
        
        let theRestaurant = restaurants[indexPath.row]
        cell.textLabel?.text = theRestaurant.name
        cell.imageView?.image = theRestaurant.image
      //  cell.distance?.text = theRestaurant.distance
        
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterRestaurants = []
        if searchText == "" {
            filterRestaurants = restaurants
        }else{
            for restaurant in restaurants{
                if restaurant.name.lowercased().contains(searchText.lowercased()){
                    filterRestaurants.append(restaurant)
               }
            }
        }
        self.tableView.reloadData()
    }
}

