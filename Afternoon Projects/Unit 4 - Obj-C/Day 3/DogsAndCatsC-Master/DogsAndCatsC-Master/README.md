#  Dog

Please fork and clone this repository

Students will build an app to access different information and photos of Breeds of Dogs. This app will help students practice and solify the following concepts in Objective-C:
*Table Views
*Collection Views
*REST API calls

Please note and be aware that parts of these instructions are intentionally vague as this is Unit 4, and you have accrued a lot of experience thus far. A decent portion of this app is fairly simple, and you have done these things much time (Table Views, model objects, etc.), simply not in Objective-C. Remember the 20-minute rule, and try Googling, looking at Stack Overflow, and use the documentation before you ask a mentor. This is for your own benefit to help you acquire the skills to find solutions independently.

## Part One - Model Objects and Dog Client

Take the time to look through the documentation for the API [here](https://dog.ceo/api). It will be essential that you can navigate and know how to find the information needed from the API throughout the project, again as the instructions are intentionally vague.

Use what you learned from exploring the documentation to make various sample requests through a web browser or HTTP Client (e.g. Postman or Paw). The following endpoints may be helpful in searching the API.

*The Base API URL (returns no data on it's own): [https://dog.ceo/api](https://dog.ceo/api)
*The list of Dog Breeds and Sub-Breeds: [https://dog.ceo/api/breeds/list/all](https://dog.ceo/api/breeds/list/all)
*The list of images for a selected Breed [Example](https://dog.ceo/api/breed/hound/images)
The list of images for a selected Sub-Breed [Example](https://dog.ceo/api/breed/hound/basset/images)
*Image URL [example](https://images.dog.ceo/breeds/hound-afghan/n02088094_1430.jpg)

Each of these endpoints will provide you with the basis of one of your model objects. Each will require it's own fetch functions. You should familiarize yourself with the structure of the json of each query.

#### Model Objects:
You will need two model objects in this project. A model representing a dog breed and a dog sub-breed.

Create a new Cocoa Touch sublcess of `NSObject` for each of these three model objects.

*Add properties for the following model objects. Use the json trees above to determins the type of each property. Assume all properties should be nonatomic and readonly:

* **Breed**:
* Name
* An Array of Sub-Breeds
* An Array of Image URLs

* **SubBreed**:
* Name
* An Array of Image URLs

* Think about where we're getting the data from, and create an appropriate initializer for each model object.   *Hint: Everything returned in JSON is contained in an Array or a __Dictionary__. You will need to reference the JSON for each model's respective endpoint heavily to create these initializers.

### Breed Network Client

Create a new Cocoa Touch subclass of  `NSObject` called `BreedNetworkClient` with a three letter prefix at the start. This will be where we make the network calls to get the JSON from the Dog Api.

### BreedNetworkClient.h
In the header file, create four instance method signatures:

1.  `fetchAllBreeds` has a completion block as a parameter. It returns an array of Breeds.
2. `fetchBreedImageURLs` has a breed and a completion block as a parameter. It returns an Array of Image URLs as NSStrings.
3. `fetchBreedImageURLs` has a breed, subBreed, and a completion block as a parameter. It returns an Array of Image URLs as NSStrings.
4. `fetchImageData` has a NSURL and a completion block as a parameter that returns imageData in the form of NSData.

Create a shared instance as a private method.

### BreedNetworkClient.m
* Create a static constant NSString called baseURLString and set it as: "https://dog.ceo/api"

#### Instance methods:

You will now fill out the methods that you defined in the .h file. 
1.  `fetchAllBreeds` 
2. `fetchBreedImageURLs` 
3. `fetchBreedImageURLs` 
4. `fetchImageData` 

The following four methods will all use `NSURLSession`, and follow the same steps as in Swift to take a URL, get data from it, turn it into JSON, and then turn the JSON into our model objects. Since Objective-C does not have access to Swift's `Codable` protocol, we will need to follow the failable initializer method, using `[NSJSONSerialization JSONObjectWithData:]` to initialize a dictionary.  You will then need to call an initializer (which you should have written in each of your model objects) which takes in a dictionary (from the JSON) and returns an instance of the model.  Use the class methods we made above to generate the URLs necessary. Remember to look at what each method should return through the completion block for the end goal of the method.

## Contributions

Please refer to CONTRIBUTING.md.

## Copyright

© DevMountain LLC, 2015. Unauthorized use and/or duplication of this material without express and written permission from DevMountain, LLC is strictly prohibited. Excerpts and links may be used, provided that full and clear credit is given to DevMountain with appropriate and specific direction to the original content.
