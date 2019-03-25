//
//  DetailViewController.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/25/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CRADetailViewController : UIViewController

@property (nonatomic, copy) NSURL * dogImageURL;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;


@end

NS_ASSUME_NONNULL_END
