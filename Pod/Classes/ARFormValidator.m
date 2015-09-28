//
//  ARFormValidator.m
//  Pods
//
//  Created by Alex M Reynolds on 9/28/15.
//
//

#import "ARFormValidator.h"

@implementation ARFormValidator{
    NSMutableDictionary *items;
}
- (instancetype)init
{
    self = [super init];
    items = [NSMutableDictionary dictionary];
    return self;
}
- (void)addField:(id)field validationBlock:(validationBlock)block
{
    if(field){
        BOOL (^handlerCopy)(id, NSError**) = [block copy];
        NSString *UUID = [[NSUUID UUID] UUIDString];

        [items setObject:@{@"block" : handlerCopy, @"field" : field} forKey:UUID];
    }
}

- (BOOL)validate:(NSError *__autoreleasing *)error
{
    __block BOOL valid = YES;
    [items enumerateKeysAndObjectsUsingBlock:^(NSString *UUID, NSDictionary *dict, BOOL *stop) {
        BOOL (^block)(id, NSError**) = dict[@"block"];

        valid = block(dict[@"field"], error);
    }];
    return valid;
}
@end
