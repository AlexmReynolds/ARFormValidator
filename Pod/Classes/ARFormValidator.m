//
//  ARFormValidator.m
//  Pods
//
//  Created by Alex M Reynolds on 9/28/15.
//
//

#import "ARFormValidator.h"

@implementation ARFormValidator{
    NSMapTable *storedObjs;
}
- (instancetype)init
{
    self = [super init];
    storedObjs = [NSMapTable mapTableWithKeyOptions:NSMapTableWeakMemory valueOptions:NSMapTableCopyIn];
    return self;
}
- (void)addField:(id)field validationBlock:(validationBlock)block
{
    if(field){
        [storedObjs setObject:block forKey:field];
       // [items setObject:@{@"block" : handlerCopy, @"field" : field} forKey:UUID];
    }
}

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    __block BOOL valid = YES;
    NSEnumerator *enumorator =  [storedObjs keyEnumerator];
    id aKey;

    while (aKey = [enumorator nextObject]){
        BOOL (^block)(id, NSError**) = [storedObjs objectForKey:aKey];
        valid &= block(aKey, error);

    }
    return valid;
}
@end
