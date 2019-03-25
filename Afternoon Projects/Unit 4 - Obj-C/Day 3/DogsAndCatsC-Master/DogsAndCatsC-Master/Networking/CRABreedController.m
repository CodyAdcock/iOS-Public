
//
//  CRABreedController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/21/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRABreedController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"

static NSString * const baseURLString = @"https://dog.ceo/api";

@implementation CRABreedController

//Shared instance
+ (CRABreedController *)sharedController
{
    static CRABreedController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [CRABreedController new];
    });
    return sharedController;
}

- (void)fetchAllBreeds: (void (^) (NSArray *))completion
{
    //https://dog.ceo/api
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //https://dog.ceo/api/breeds/list/all
    NSURL *breedURL = [[[baseURL URLByAppendingPathComponent: @"breeds"] URLByAppendingPathComponent:@"list"] URLByAppendingPathComponent:@"all"];
    
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            completion(nil);
            return;
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary|| ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        NSDictionary *messageDictionary = jsonDictionary[@"message"];
        NSMutableArray *breeds = [[NSMutableArray alloc] init];
        //FOR KEY VALUE
        //How to loop through a dictionary
        for (id key in messageDictionary)
        {
            //create subBreeds Array
            NSMutableArray *subBreeds = [[NSMutableArray alloc] init];
            //create subbreeds from values
            for (NSString *name in messageDictionary[key] )
            {
                CRASubBreed *subBreed = [[CRASubBreed alloc] initWithName:name imageURLs:[[NSMutableArray alloc] init]];
                [subBreeds addObject:subBreed];
            }
            //create breeds from keys on dictionary
            CRABreed * breed = [[CRABreed alloc] initWithName: key subBreeds: subBreeds imageURLs:[[NSMutableArray alloc] init] ];
            [breeds addObject:breed];
        }
        completion(breeds);
    }]resume];
}

//fetch breed image URLs
- (void)fetchBreedImageURLs:(CRABreed *)breed completion:(void (^) (NSArray *))completion;
{
    //https://dog.ceo/api
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //https://dog.ceo/api/breed/hound/images
    NSURL *breedURL = [[[baseURL URLByAppendingPathComponent: @"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:@"images"];
    NSLog(@"%@", breedURL);
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            completion(nil);
            return;
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary|| ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        NSMutableArray *images = jsonDictionary[@"message"];
        completion(images);
        
    }]resume];
}

//fetch subbreed image URLs
//https://dog.ceo/api/breed/hound/basset/images
- (void)fetchSubBreedImageURLs:(CRASubBreed *)subBreed breed:(CRABreed *)breed completion:(void (^) (NSArray *))completion;
{
    //https://dog.ceo/api
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    //https://dog.ceo/api/breed/hound/images
    NSURL *breedURL = [[[[baseURL URLByAppendingPathComponent: @"breed"] URLByAppendingPathComponent:breed.name] URLByAppendingPathComponent:subBreed.name] URLByAppendingPathComponent:@"images"];
    NSLog(@"%@🤮", breedURL);
    [[[NSURLSession sharedSession]dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            completion(nil);
            return;
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            completion(nil);
            return;
        }
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!jsonDictionary|| ![jsonDictionary isKindOfClass:[NSDictionary class]]){
            NSLog(@"Error fetching json dictionary %@", error);
            completion(nil);
            return;
        }
        NSMutableArray *images = jsonDictionary[@"message"];
        completion(images);
        
    }]resume];
}

- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion
{
    //Fetch image with provided URL
    [[[NSURLSession sharedSession]dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error fetching breeds from search term: %@", error);
            return completion(nil, error);
        }
        if(!data){
            NSLog(@"Error fetching breeds DATA from search term: %@", error);
            return completion(nil, error);
        }
        completion(data, nil);
    }]resume];
}

@end

