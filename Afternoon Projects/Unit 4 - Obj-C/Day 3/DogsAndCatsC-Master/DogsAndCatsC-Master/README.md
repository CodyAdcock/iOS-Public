#  Dog

Please fork and clone this repository

Students will build an app to access different information and photos of Breeds of Dogs. This app will help students practice and solify the following concepts in Objective-C:
*Table Views
*Collection Views
*REST API calls
*Caching data
*Bridging Objective-C files so they are usable in Swift code.

Please note and be aware that parts of these instructions are intentionally vague as this is Unit 5, and you have accrued a lot of experience thus far. A decent portion of this app is fairly simple, and you have done these things much time (Table Views, model objects, etc.), simply not in Objective-C. Remember the 20-minute rule, and try Googling, looking at Stack Overflow, and use the documentation before you ask a mentor. This is for your own benefit to help you acquire the skills to find solutions independently.

## Part One - Model Objects and Dog Client

Take the time to look through the documentation for the API [here](https://docs.thedogapi.com). It will be essential that you can navigate and know how to find the information needed from the API throughout the project, again as the instructions are intentionally vague.

(?)If you are just accessing the api for breeds and photos, an API key is not needed, however, if you wish to increase the functionality of this app to have a user that can vote on photos and breeds one will be required.

Use what you learned from exploring the documentation to make various sample requests through a web browser or HTTP Client (e.g. Postman or Paw). The following endpoints may be helpful in searching the API. (You may need an API key to use some of these API calls in order to receive data.)

*The Base API URL (returns no data on it's own): [https://api.thedogapi.com/v1/](https://api.thedogapi.com/v1/)
*The list of Dog Breeds: [https://api.thedogapi.com/v1/breeds]()
*Information and a randomized Image URL of a selected dog breed https://api.thedogapi.com/v1/images/search?breed_ids={BREED ID} [Example](https://api.thedogapi.com/v1/images/search?breed_ids=14)
*Image URL [example](https://cdn2.thedogapi.com/images/qBYpfkZr1.jpg)

Each of these endpoints will provide you with the basis of one of your model objects. Each will require it's own fetch functions. You should familiarize yourself with the structure of the json of each query.

#### Model Objects:
You will need two model objects in this project. A model representing a dog breed and a photo of the dog breed.

Create a new Cocoa Touch sublcess of `NSObject` for each of these three model objects.

*Add properties for the following model objects. Use the json trees above to determins the type of each property. Assume all properties should be nonatomic and readonly:

* **Breed**:
* The Breed's ID
* The Name 
* The Country Code
* A description of what the dog is bred for
* Breed Group
* Lifespan
* temperment
* UUID
* ImageURL
* Image

* **Image**:
