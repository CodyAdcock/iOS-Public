//
//  DetailViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/25/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRADetailViewController.h"
#import "ImagesCollectionViewController.h"
#import "CRABreedController.h"

@interface CRADetailViewController ()

@end

@implementation CRADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameLabel.text = (@"URL: %@");
}

//- (void)setDogImageURL:(NSURL *)_dogImageURL
//{
//    _imageView.image = [UIImage imageNamed:@"dog"];
//    [CRABreedController.sharedController fetchImageData:[NSURL URLWithString:_dogImageURL] completion:^(NSData *imageData, NSError *error) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self->_imageView.image = [UIImage imageWithData:imageData];
//        });
//    }];
//}



@end
