
//
//  APICall.m
//  Rover
//
//  Created by letsnurture on 3/4/15.
//  Copyright (c) 2015 letsnurture. All rights reserved.
//

#import "APICall.h"

@implementation APICall

+(void)callPostWebService:(NSString *)urlStr andDictionary:(NSDictionary *)parameter completion:(completion_handler_t)completion
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Bearer 1pd01gzrk76dxz4enygxjusvoq" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [manager POST:urlStr parameters: parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST data JSON returned: %@", responseObject);
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
    }     ];
}


+(void)callPostWebServiceUploadBIO:(NSString *)urlStr andDictionary:(NSDictionary *)parameter filePath:(NSString *)strFilePath fileName:(NSString *)strFileName completion:(completion_handler_t)completion{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Bearer 1pd01gzrk76dxz4enygxjusvoq" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/msword/pdf/doc/rtf" forHTTPHeaderField:@"Content-Type"];
    NSData *dataTemp = [NSData dataWithContentsOfFile:strFilePath];
    
    [manager POST:urlStr parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:dataTemp name:@"file" fileName:strFileName mimeType:@"file/pdf/doc/rtf"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST data JSON returned: %@", responseObject);
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
    }];
    
}

+(void)callGetWebService:(NSString *)urlStr andDictionary:(NSDictionary *)parameter completion:(completion_handler_t)completion{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Bearer 1pd01gzrk76dxz4enygxjusvoq" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager GET:urlStr parameters: parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST data JSON returned: %@", responseObject);
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
    }
     ];
    
}

+(void)callDeleteWebService:(NSString *)urlStr andDictionary:(NSDictionary *)parameter completion:(completion_handler_t)completion {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer 1pd01gzrk76dxz4enygxjusvoq"] forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager DELETE:urlStr parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
        
    }
     ];
    
}


+(void)callPutWebService:(NSString *)urlStr andDictionary:(NSDictionary *)parameter completion:(completion_handler_t)completion  {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"Bearer 1pd01gzrk76dxz4enygxjusvoq" forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager PUT:urlStr parameters: parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST data JSON returned: %@", responseObject);
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
    }     ];
    
}


+(void)callPostWebServicePHP:(NSString *)urlStr andDictionary:(NSDictionary *)parameter completion:(completion_handler_t)completion
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [manager POST:urlStr parameters: parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"POST data JSON returned: %@", responseObject);
        if (completion) {
            long code=200;
            NSDictionary* json = responseObject;
            completion([json mutableCopy], nil,code);
        }
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) {
            long code=(long)[[[error userInfo] objectForKey:AFNetworkingOperationFailingURLResponseErrorKey] statusCode];
            completion([operation responseObject], error,code);
        }
    }     ];
}

@end
