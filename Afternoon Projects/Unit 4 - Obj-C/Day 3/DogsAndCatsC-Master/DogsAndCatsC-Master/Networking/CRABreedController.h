//
//  CRABreedController.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/21/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CRABreed;
@class CRAImage;
@class CRASubBreed;

@interface CRABreedController : NSObject

- (void)fetchAllBreeds: (void (^) (NSArray *))completion;

//fetch breed image URLs
//https://dog.ceo/api/breed/hound/images
- (void)fetchBreedImageURLs:(CRABreed *)breed completion:(void (^) (NSArray *))completion;

//fetch subbreed image URLs
//https://dog.ceo/api/breed/hound/basset/images
- (void)fetchSubBreedImageURLs:(CRASubBreed *)subBreed breed:(CRABreed *)breed completion:(void (^) (NSArray *))completion;

//fetch image data
- (void)fetchImageData:(NSURL *)url completion:(void (^)(NSData *imageData, NSError *error))completion;

+ (CRABreedController *)sharedController;

@end

