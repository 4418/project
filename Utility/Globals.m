//
//  Globals.m
//  Rover
//
//  Created by   on 3/17/15.
//  Copyright (c) 2015  . All rights reserved.
//

#import "Globals.h"

@implementation Globals
@synthesize user;

+ (id)sharedManager {
    static Globals *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.user=[[Users alloc]init];
        self.strEmailId = [[NSMutableString alloc]init];
        self.dictRegister = [[NSMutableDictionary alloc] init];
        self.dictSheetList = [[NSMutableDictionary alloc] init];
        self.dictSheetData = [[NSMutableDictionary alloc] init];
        self.dictSearchData = [[NSMutableDictionary alloc] init];
        self.strSheetID = [[NSString alloc]init];
        self.strCalendarSheetID = [[NSString alloc]init];
        self.dictAddEventSheetData = [[NSMutableDictionary alloc]init];
        self.arrCalendarData = [[NSMutableArray alloc]init];
        self.strToken = [[NSString alloc]init];
        self.strUserID = [[NSMutableString alloc]init];
        self.strNavisPushSheetID = [[NSMutableString alloc]init];
        self.dictNavisPushSheet = [[NSMutableDictionary alloc]init];
        self.strFilePath = [[NSMutableString alloc]init];
        self.strRowIDProfile = [[NSMutableString alloc]init];
        self.arrTblDisplay = [[NSMutableArray alloc]init];
        self.arrRowIDList = [[NSMutableArray alloc]init];
    }
    return self;
}


-(void)setNavigationTitleAndBGImageName:(NSString *)strImageName navigationController:(UINavigationController *)navigationController
{
    navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:strImageName] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - NULL Object checking
- (BOOL) isNull:(NSObject*) object {
    if (!object)
        return YES;
    else if (object == [NSNull null])
        return YES;
    else if ([object isKindOfClass: [NSString class]]) {
        return ([((NSString*)object) isEqualToString:@""]
                || [((NSString*)object) isEqualToString:@"null"]
                || [((NSString*)object) isEqualToString:@"nil"]
                || [((NSString*)object) isEqualToString:@"(null)"]
                || [((NSString*)object) isEqualToString:@"<null>"]);
    }
    return NO;
}

- (BOOL) isNotNull:(NSObject*) object {
    return ![self isNull:object];
}

#pragma mark - TextField and TextView
-(void)makeTextFieldBorderRed:(UITextField*)textFieldForRedBorder
{
    textFieldForRedBorder.layer.cornerRadius=8.0f;
    textFieldForRedBorder.layer.masksToBounds=YES;
    textFieldForRedBorder.layer.borderColor=[[UIColor redColor]CGColor];
    textFieldForRedBorder.layer.borderWidth= 1.0f;
}

-(void)makeTextFieldNormal:(UITextField*)textFieldForNormal
{
    textFieldForNormal.layer.cornerRadius=1.0f;
    textFieldForNormal.layer.masksToBounds=YES;
    textFieldForNormal.layer.borderColor=[[UIColor clearColor]CGColor];
    textFieldForNormal.layer.borderWidth= 1.0f;
}

-(void)makeTextViewBorderRed:(UITextView *)textFieldForRedBorder{
    textFieldForRedBorder.layer.cornerRadius=8.0f;
    textFieldForRedBorder.layer.masksToBounds=YES;
    textFieldForRedBorder.layer.borderColor=[[UIColor redColor]CGColor];
    textFieldForRedBorder.layer.borderWidth= 1.0f;
}

-(void)makeTextViewNormal:(UITextView *)textFieldForNormal{
    textFieldForNormal.layer.cornerRadius=1.0f;
    textFieldForNormal.layer.masksToBounds=YES;
    textFieldForNormal.layer.borderColor=[[UIColor clearColor]CGColor];
    textFieldForNormal.layer.borderWidth= 1.0f;
}

#pragma mark - TextField White Space Checking
-(void)setTextFieldWithSpace:(UITextField*)txtField
{
    txtField.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,15, txtField.frame.size.height)];
    txtField.leftView = paddingView;
    
}

@end
