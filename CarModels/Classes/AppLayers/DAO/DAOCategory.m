//
//  DAOCategory.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "DAOCategory.h"
#import "CoreDataCategory.h"
#import "CoreDataController.h"

@interface DAOCategory ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation DAOCategory

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _managedObjectContext = [[CoreDataController sharedInstance] managedObjectContext];
    }
    return self;
}

- (CoreDataCategory *)createOrUpdateCategoryData:(NSDictionary *)data {
    
    NSString *identifier = [data objectForKey:@"id"];
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"ERROR::: data isnt dictionary");
        return nil;
    }
    
    if (!identifier) {
        
        NSLog(@"ERROR::: category identifier is nil");
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        
        NSLog(@"ERROR::: cant fetch category");
        //... error handling code
    }
    CoreDataCategory *category;
    if (fetchedObjects.count == 0) {
        
        category = [self saveNewCategoryObjectWithID:identifier];
    } else {
        category = [fetchedObjects firstObject];
    }
    
    [category configureWithData:data];
    return category;
}

- (CoreDataCategory *)saveNewCategoryObjectWithID:(NSString *)identifier {
    
    CoreDataCategory *newCategory = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:self.managedObjectContext];
    newCategory.identifier = identifier;
    return newCategory;
}


@end
