//
//  ImageCollectionViewCell.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "CRAImageCollectionViewCell.h"
#import "CRABreedNetworkClient.h"

@implementation CRAImageCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.imageView.image = [UIImage imageNamed:@"dog"];
    [self setBackgroundColor:[UIColor grayColor]] ;
}

- (void)setImageURL:(NSURL *)imageURL
{
    [CRABreedNetworkClient.sharedController fetchImageData:imageURL completion:^(NSData *imageData, NSError *error) {
        if (error || !imageData) {
            NSLog(@"Error fetching image data %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:imageData];
            
        });
    }];
}

@end
