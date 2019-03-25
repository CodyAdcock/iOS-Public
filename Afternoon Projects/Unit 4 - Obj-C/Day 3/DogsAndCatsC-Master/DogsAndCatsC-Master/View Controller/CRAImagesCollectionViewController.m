//
//  ImagesCollectionViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAImagesCollectionViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "CRAImageCollectionViewCell.h"
#import "CRABreedNetworkClient.h"
#import "CRADetailViewController.h"

@interface CRAImagesCollectionViewController ()

@end

@implementation CRAImagesCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.breed.name.capitalizedString;
    if(_subBreed){
        self.title = self.subBreed.name.capitalizedString;
    }
    [self fetchImageURLs];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%li", _imageURLs.count);
    return _imageURLs.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CRAImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSURL *imageURL = [NSURL URLWithString:_imageURLs[indexPath.row]];
    
    cell.imageURL = imageURL;
    
    return cell;
}


-(void)fetchImageURLs
{
    
    if(_subBreed){
        [CRABreedNetworkClient.sharedController fetchSubBreedImageURLs:_subBreed breed:_breed completion:^(NSArray *fetchedURLs) {
            self->_imageURLs = fetchedURLs;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self collectionView] reloadData];
            });
        }];
    }else{
        [CRABreedNetworkClient.sharedController fetchBreedImageURLs: _breed completion:^(NSArray *fetchedURLs) {
            self->_imageURLs = fetchedURLs;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self collectionView] reloadData];
            });
        }];
    }
}

@end
