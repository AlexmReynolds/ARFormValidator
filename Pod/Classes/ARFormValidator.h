//
//  ARFormValidator.h
//  Pods
//
//  Created by Alex M Reynolds on 9/28/15.
//
//

#import <Foundation/Foundation.h>
typedef BOOL (^validationBlock)(id field, NSError** error);
@interface ARFormValidator : NSObject
/**
 *  @abstract adds a validator for an object. Uses ID so you can use validation on any obj
 *  @param id the item to be passed later into the validation block. Typically a UITextField
 *  @param block to call on the validate.
 */
- (void)addField:(id)field validationBlock:(validationBlock)block;

/**
 *  @abstract runs validators for all stored fields to see if things pass
 *  @param @c NSError reference to store any errors on
 *  @return BOOL indicating if validation passed or failed;
 */
- (BOOL)validate:(NSError**)error;

@end
