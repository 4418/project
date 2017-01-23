//
//  Constant.h
//  Challenge Me

#import "Validations.h"
#import "MBProgressHUD.h"
#import "ApplicationData.h"
#import "Globals.h"
#import "AppDelegate.h"



#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4 (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_6      (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)667) < DBL_EPSILON)
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen]bounds].size.height - (double)736) < DBL_EPSILON)

#if DEBUG
#define DLOG(format, ...)     ///((@"%s:%d %s " format), \
strrchr ("/" __FILE__, '/') + 1, __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__)

#else
#define DLOG(format, ...)

#endif
#define DEVICE_FRAME [[ UIScreen mainScreen ] bounds ]
#define OS_VER [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES : NO)
#define DEVICE_ID [[[UIDevice currentDevice]identifierForVendor]UUIDString]

#define APPDATA [ApplicationData sharedInstance]

#define RGB(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RECT(x,y,w,h)  CGRectMake(x, y, w, h)
#define POINT(x,y)     CGPointMake(x, y)
#define SIZE(w,h)      CGSizeMake(w, h)
#define RANGE(loc,len) NSMakeRange(loc, len)

#define NAV_COLOR       RGB(3,143,113)
#define TEXT_COLOR      RGB(52,65,71)
#define BORDER_COLOR    RGB(122,145,158)
#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

#define SETOBJECT(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

#define SETBOOL(bool,key)[[NSUserDefaults standardUserDefaults] setBool:bool forKey:key]


#define UDSetObject(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDSetBool(value, key) [[NSUserDefaults standardUserDefaults] setBool:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDSetInteger(value, key) [[NSUserDefaults standardUserDefaults] setInteger:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDGetObject(key) [[NSUserDefaults standardUserDefaults] objectForKey:(key)]
#define UDGetBool(key) [[NSUserDefaults standardUserDefaults] boolForKey:(key)]
#define UDGetInteger(key) (int)[[NSUserDefaults standardUserDefaults] integerForKey:key]


#define GETOBJECT(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define GETBOOL(key)   [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define SYNCHRONIZE   [[NSUserDefaults standardUserDefaults] synchronize];

#define KEYBORAD_HEIGHT_IPHONE 216


#define BASE_URL        @"https://api.smartsheet.com/2.0/"
//#define BASE_PHPURL     @"http://216.55.169.45/~nevisapp/master/webservices/"
#define BASE_PHPURL       @"http://navislearning.com/pushlogin/webservices/"
#define API_LOGIN       (BASE_URL@"users/")
#define API_GETSHEET    (BASE_URL@"sheets/")
#define API_GETPARTICULARSHEET  (BASE_URL@"sheets/")
#define API_SEARCHDATA  (BASE_URL@"search/sheets/")
#define API_SEARCHDATAINROW (BASE_URL@"sheets/")
#define API_REGISTER    (BASE_URL@"sheets/")
#define API_UPDATEPROFILE  (BASE_URL@"sheets/")
#define API_FORGOTPASSWORDMAIL (BASE_URL@"sheets/")
#define API_PROFILEUPDATENOTIFICATION (BASE_URL@"sheets/")
#define API_ADDEVENTNOTIFICATION (BASE_URL@"sheets/")
#define API_ADDEVENT    (BASE_URL@"sheets/")
#define API_DELETEEVENT (BASE_URL@"sheets/")
#define API_UPLOADBIO (BASE_URL@"sheets/")
#define API_ADDDEVICEID (BASE_PHPURL@"adddeviceid.php")
#define API_NOTIFICATION_HISTORY (BASE_PHPURL@"notification_history.php")
#define API_NOTIFICATION_DELETE (BASE_PHPURL@"delete_notification.php")
#if DEBUG
#define DLOG(format, ...)     ///((@"%s:%d %s " format), \
strrchr ("/" __FILE__, '/') + 1, __LINE__, __PRETTY_FUNCTION__, ##__VA_ARGS__)

#else
#define DLOG(format, ...)

#endif
#define DEVICE_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width
#define DEVICE_FRAME [[ UIScreen mainScreen ] bounds ]
#define OS_VER [[[UIDevice currentDevice] systemVersion] floatValue]
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES : NO)
#define DEVICE_ID [[[UIDevice currentDevice]identifierForVendor]UUIDString]

#define APPDATA [ApplicationData sharedInstance]

#define RGB(r,g,b)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RECT(x,y,w,h)  CGRectMake(x, y, w, h)
#define POINT(x,y)     CGPointMake(x, y)
#define SIZE(w,h)      CGSizeMake(w, h)
#define RANGE(loc,len) NSMakeRange(loc, len)


#define NAV_COLOR       RGB(3,143,113)
#define TEXT_COLOR      RGB(52,65,71)
#define BORDER_COLOR    RGB(122,145,158)
#define allTrim( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]

#define SETOBJECT(object,key) [[NSUserDefaults standardUserDefaults] setObject:object forKey:key]

#define SETBOOL(bool,key)[[NSUserDefaults standardUserDefaults] setBool:bool forKey:key]


#define UDSetObject(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDSetBool(value, key) [[NSUserDefaults standardUserDefaults] setBool:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDSetInteger(value, key) [[NSUserDefaults standardUserDefaults] setInteger:value forKey:(key)];[[NSUserDefaults standardUserDefaults] synchronize]
#define UDGetObject(key) [[NSUserDefaults standardUserDefaults] objectForKey:(key)]
#define UDGetBool(key) [[NSUserDefaults standardUserDefaults] boolForKey:(key)]
#define UDGetInteger(key) (int)[[NSUserDefaults standardUserDefaults] integerForKey:key]


#define GETOBJECT(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define GETBOOL(key)   [[NSUserDefaults standardUserDefaults] boolForKey:key]

#define SYNCHRONIZE   [[NSUserDefaults standardUserDefaults] synchronize];

#define KEYBORAD_HEIGHT_IPHONE 216



#define CommentCellFont  [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:14]
#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


#define ERROR_NAME @"Please enter Valid Name."
#define kMethod @"method"

#define ERROR_CNAME @"Please enter Contact Name"
#define ERROR_FNAME @"Please enter First Name."
#define ERROR_VALIDNAME @"Please enter alphabetic character only."
#define ERROR_VALIDFNAME @"Please enter valid First Name."
#define ERROR_VALIDLNAME @"Please enter valid Last Name."
#define ERROR_LNAME @"Please enter  Last Name."
#define ERROR_UNAME @"Username length should be at least 4 characters."
#define ERROR_EMAIL @"Please enter Valid Email Address or Username."
#define ERROR_EMAIL_ID @"Please enter  Email Address."
#define ERROR_PIN @"Please enter a 4 digit PIN"
#define ERROR_PASSWHITE @"Please remove whitespace from password."
#define ERROR_CONFIRMPIN @"Please enter a 4 digit Confirm PIN."
#define ERROR_PINCOMPARE @"Please check PIN and Confirm PIN."
#define ERROR_Number @"Contact Info length should be at least 10 characters."
#define ERROR_COMPAREDATE @"End date should not be earlier than start date."
#define ERROR_DATEISSUES @"Event date already exists. Please try another date."
#define ERROR_STARTDATE @"Please select start date."
#define ERROR_ENDDATE @"Please select end date."
#define ERROR_NOTE @"Please enter event note."
#define ERROR_CALENDARAVAILABILITY @"Please select availability."
#define ERROR_PINDIGIT @"PIN should be in digit only."
#define ERROR_CONTACTDIGIT @"Contact Info  should be in digit only."
typedef enum {
    jServerError = 0,
    jSuccess,
    jGeneralQuery,
    jInvalidResponse,
    jNetworkError,
    jFailResponse,
}ErrorCode;
