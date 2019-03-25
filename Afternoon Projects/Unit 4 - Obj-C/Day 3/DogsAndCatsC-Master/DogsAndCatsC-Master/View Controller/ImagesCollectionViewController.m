//
//  ImagesCollectionViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "ImagesCollectionViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "ImageCollectionViewCell.h"
#import "CRABreedController.h"
#import "CRADetailViewController.h"
//#import "DogsAndCatsC-Master-Bridging-Header.h"
//#import "DogsAndCatsC-Master-Swift.h"

@interface ImagesCollectionViewController ()

@end

@implementation ImagesCollectionViewController

static NSString * const reuseIdentifier = @"imageCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.breed.name.capitalizedString;
    if(_subBreed){
        self.title = self.subBreed.name.capitalizedString;
    }
    
    // Do any additional setup after loading the view.
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
    
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSURL *imageURL = [NSURL URLWithString:_imageURLs[indexPath.row]];
    
    cell.imageURL = imageURL;
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>

//- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
//    [self performSegueWithIdentifier:@"toDetailVC" sender:self];
//}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"toDetailVC"]){
        CRADetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems]firstObject];
        NSURL *dogURL = [NSURL URLWithString: _imageURLs[indexPath.row]];
//        destinationVC.dogImageURL = dogURL;
        NSLog(@"i'm helping");
    }
}


-(void)fetchImageURLs
{
    
    if(_subBreed){
        [CRABreedController.sharedController fetchSubBreedImageURLs:_subBreed breed:_breed completion:^(NSArray *fetchedURLs) {
            self->_imageURLs = fetchedURLs;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self collectionView] reloadData];
            });
        }];
    }else{
        [CRABreedController.sharedController fetchBreedImageURLs: _breed completion:^(NSArray *fetchedURLs) {
            self->_imageURLs = fetchedURLs;
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self collectionView] reloadData];
            });
        }];
    }
}

@end
