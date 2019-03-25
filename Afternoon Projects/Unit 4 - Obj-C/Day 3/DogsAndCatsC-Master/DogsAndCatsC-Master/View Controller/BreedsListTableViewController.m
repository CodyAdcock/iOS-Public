//
//  BreedsListTableViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/23/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "BreedsListTableViewController.h"
#import "CRABreed.h"
#import "CRABreedController.h"
#import "SubBreedsListTableViewController.h"
#import "ImagesCollectionViewController.h"


@interface BreedsListTableViewController ()
@property (nonatomic, copy) NSArray *breeds;

@end

@implementation BreedsListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_enter(group);
    
    [CRABreedController.sharedController fetchAllBreeds:^(NSArray *breeds) {
        self.breeds = breeds;
        dispatch_group_leave(group);
        [self.tableView reloadData];
    }];
    

    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _breeds.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"breedCell" forIndexPath:indexPath];
    //Capitalize all the names
    cell.textLabel.text = [[self.breeds[indexPath.row] name] capitalizedString];;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRABreed * breed = _breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if( [breed.subBreeds count] > 0){
        [self performSegueWithIdentifier:@"toSubBreedVC" sender:self];
    }else{
        [self performSegueWithIdentifier:@"toCollectionVC" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CRABreed * breed = _breeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"toSubBreedVC"])
    {
        SubBreedsListTableViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;

    }else if([segue.identifier  isEqualToString: @"toCollectionVC"]){
        ImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.breed = breed;
        
    }
}


@end
