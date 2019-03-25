//
//  SubBreedsListTableViewController.m
//  DogsAndCatsC-Master
//
//  Created by Cody on 3/24/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import "SubBreedsListTableViewController.h"
#import "CRABreed.h"
#import "CRASubBreed.h"
#import "ImagesCollectionViewController.h"

@interface SubBreedsListTableViewController ()

@end

@implementation SubBreedsListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.breed.name;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_breed.subBreeds count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"subBreedCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.breed.subBreeds[indexPath.row] name] capitalizedString];
    
    return cell;
}

- (void)setBreed:(CRABreed *)breed
{
    if(breed != _breed){
        _breed = breed;
        [self.tableView reloadData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"fromSubBreedsToImages" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CRASubBreed * subBreed = _breed.subBreeds[[[[self tableView] indexPathForSelectedRow] row]];
    if([segue.identifier  isEqualToString: @"fromSubBreedsToImages"])
    {
        ImagesCollectionViewController *destinationVC = segue.destinationViewController;
        destinationVC.subBreed = subBreed;
        destinationVC.breed = _breed;
        
    }
}
@end
