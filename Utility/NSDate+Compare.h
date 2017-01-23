//
//  NSDate+Compare.h
//  Navis
//
//  Created by  on 9/26/16.
//  Copyright © 2016 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Compare)

-(BOOL) isLaterThanOrEqualTo:(NSDate*)date;
-(BOOL) isEarlierThanOrEqualTo:(NSDate*)date;
-(BOOL) isLaterThan:(NSDate*)date;
-(BOOL) isEarlierThan:(NSDate*)date;

@end
