# DogsC

## Part Two - Storyboard and Table View Controllers

### Storyboard:
Implement the following view hierarchy in the Storyboard. As you create each scene in the storyboard, create the appropriate Cocoa Touch files for each scene. Follow standard file naming conventions.
* The project will have a `UITableViewController` as its initial View Controller embedded in a `UINavigationController`, with a basic cell. This will show a list of the Breeds.
* From the tableView, the project will go to either a new `UITableViewController` or a `UICollectionViewController`. Create both of these on the Storyboard. The new `UITableViewController` will be used to show Sub-Breeds of a selected breed, if they exist. The `UICollectionViewController` will show photos of the select Breed or Sub-Breed.
* From the initial `UITableViewController` create two segues. One to each of the new Controllers. This is done by making the connection from the Controller itself, not from the cell.
* Both the Breed `UITableViewController` and the Sub-Breed `UITableViewController` will use the basic cell to display the name of the Breed or Sub-Breed.
* The `UICollectionViewCell` will be custom and hold a single `UIImageView`.

If you haven't already, create Cocoa Touch Files for the views and view controllers you just made in the Storyboard.  Remember to subclass each of your storyboard View Controllers and Views with the proper CocoaTouchClass.

### BreedsListTableViewController
No other classes will reference properties or methods on the CRABreedsListTableViewController and therefore the .h file should be blank.

* In the implementation create a private array called `breeds` that will be the data source for the table view.
* In the `viewDidLoad` call the `fetchAllBreeds` method to fetch the Breeds available to display.
* Implement the `UITableViewDataSource` methods using the `breeds` array..
* Use the `didSelectRowAtIndexPath` method to determine which view controller is your destination.
* Use the `performSegueWithIdentifier:` method to select the view controller you sould like to segue to.
* Using the prepareForSegue method, pass the appropriate `Breed` object to the destination view controller. Make sure that the destination view controller has a **public** _(thing "landing pad")_ property that serves as a placeholder to put the information to.

### SubBreedsListTableViewController
* Implement the `UITableViewDataSource` methods. (hint: Use the passed Breed)
* Create a custom setter- `setBreed:` for the public breed property that checks if the breed being passed through the setter is the same as the current breed ( `_breed` ). If it isn't, then set the current breed to the one passed into the setter, and also reload the tableview. Remember that this setter is where we can do the Objective-C equivalent of a Swift `willSet` and `didSet`.
* In the prepareForSegue, you should pass two things to the destination view controller; the Breed that the SubBreedsListTableViewController got from the initial view controller's prepareForSegue, and the SubBreed from the cell that the user just tapped on. (Again, make sure to create public properties on the destination view controller to be placeholders for these two things- i.e. two separate "landing pads")

At this point, you should be able to run the app and be able to select a Breed with a SubBreed from the inital table view controller, and see a list of its SubBreeds. When selecting a Breed without SubBreeds or a SubBreed you should be brought to the Collection View Controller. Make sure this works before continuing.

## Part Three: Collection View Controller and Collection View Cell

### ImageCollectionViewCell:
* Create the IBOutlet for the imageView
* Create a landing pad for an image NSURL
* In the implementation of the cell file, call the `prepareForReuse` function.
* Create a `setImageURL` method that uses the `fetchImageData` method from the `BreedNetworkClient`
* Set the image on the main thread.

### ImagesCollectionViewController:
* In the implementation create a private array called `imageURLs` that will be the data source for the collection view.
* Implement the `UICollectionViewDataSource` methods. (hint: Fetch the image URLs of the passed Breed or SubBreed)
* Create a custom setter- `setImageURLs:`
* Pass the imageURL to the `UICollectionViewCell`

You should now be able to load an entire collection view of images of Breeds and SubBreeds.


## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.
