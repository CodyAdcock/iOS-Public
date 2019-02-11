//
//  CRADog.h
//  DogsAndCatsC-Master
//
//  Created by Cody on 2/4/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CRAImage.h"

@interface CRABreed : NSObject
//ID, Name, CountryCode, BredFor, breedGroup, lifeSpan, temperment, id, url

//MARK: - Properties
@property (nonatomic, readonly) NSInteger *breedID;
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *countryCode;
@property (nonatomic, copy, readonly) NSString *bredFor;
@property (nonatomic, copy, readonly) NSString *breedGroup;
@property (nonatomic, copy, readonly) NSString *lifeSpan;
@property (nonatomic, copy, readonly) NSString *temperment;
@property (nonatomic, readonly) NSInteger *uuid;
@property (nonatomic, copy, readonly) NSString *imageURL;
@property (nonatomic, copy, readonly) CRAImage * image;

//MARK: - Initialization
- (instancetype) initWithName:(NSString *)name
                  identifier:(NSString *)identifier
                       image:(CRAImage*)images;

- (instancetype) initWithDictionary:(NSDictionary <NSString *,id>*)dictionary;

@end
