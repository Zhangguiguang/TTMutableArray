//
//  TTViewController.m
//  TTMutableArray
//
//  Created by GG on 12/24/2020.
//  Copyright (c) 2020 GG. All rights reserved.
//

#import "TTViewController.h"
#import <TTMutableArray/TTMutableArray.h>
#import <TTMutableArray/NSMutableArray+TTObserverable.h>

@interface TTViewController () <TTMutableArrayObserver>

@property (nonatomic, strong) TTMutableArray *ttMutableArray;
@property (nonatomic, strong) NSMutableArray *nsMutableArray;

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self testTTMutableArray];
//    [self testNSMutableArray];
}

- (void)testTTMutableArray {
    _ttMutableArray = [TTMutableArray arrayWithArray:@[@11, @22]];
    _ttMutableArray.observer = self;
    
    NSLog(@"TTMutableArray Observing...");
    [self testArray:_ttMutableArray];
}

- (void)testNSMutableArray {
    _nsMutableArray = [NSMutableArray arrayWithArray:@[@11, @22]];
    NSMutableArray *observerableArray = [_nsMutableArray tt_getObserverableArrayWithObserver:self];
    
    NSLog(@"NSMutableArray Observing...");
    // You must use the observerableArray, the original _nsMutableArray couldn't observerable.
    [self testArray:observerableArray];
}

- (void)testArray:(NSMutableArray *)array {
    [array addObject:@33]; // 11, 22, 33
    
    [array removeObject:@22]; // 11, 33
    
    [array addObjectsFromArray:@[@44, @55]]; // 11, 33, 44, 55
    
    [array replaceObjectAtIndex:1 withObject:@66]; // 11, 66, 44, 55
    
    [array removeLastObject]; // 11, 66, 44
    
    NSRange range = {0, 2};
    [array replaceObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:range]
                       withObjects:@[@77, @88]]; // 77, 88, 44
    
    [array removeObjectsInArray:@[@11, @77]]; // 88, 44
    
    NSMutableIndexSet *indexes = [NSMutableIndexSet indexSet];
    [indexes addIndex:0];
    [indexes addIndex:2];
    [array insertObjects:@[@99, @100] atIndexes:indexes]; // 99, 88, 100, 44
    
    [array removeAllObjects]; // ()
}

#pragma mark - TTMutableArrayObserver

- (void)mutableArray:(NSMutableArray *)array didInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    NSLog(@"========> did insert %@, %@ \n result %@", objects, indexes, array);
}

- (void)mutableArray:(NSMutableArray *)array didRemoveObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    NSLog(@"========> did remove %@, %@ \n result %@", objects, indexes, array);
}

- (void)mutableArray:(NSMutableArray *)array didReplaceObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    NSLog(@"========> did replace %@, %@ \n result %@", objects, indexes, array);
}

- (void)mutableArray:(NSMutableArray *)array beReplacedObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes {
    NSLog(@"========> be replaced %@, %@ \n result %@", objects, indexes, array);
}

@end
