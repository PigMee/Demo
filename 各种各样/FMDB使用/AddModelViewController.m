//
//  AddModelViewController.m
//  各种各样
//
//  Created by 董磊 on 2017/11/13.
//  Copyright © 2017年 董磊. All rights reserved.
//

#import "AddModelViewController.h"
#import "UserModel.h"

@interface AddModelViewController ()<UITextFieldDelegate>{
    NSString *NameStr;
    NSString *NumberStr;
}

@end

@implementation AddModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.NameTF.delegate = self;
    self.phoneTF.delegate = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView)];
    self.IconImage.userInteractionEnabled = YES;
    [self.IconImage addGestureRecognizer:tap];
}

-(void)tapImageView{
    NSLog(@"点击了照骗");
    
}


- (IBAction)SaveAcyion:(id)sender {
    if (!NameStr || !NumberStr) {
        NSLog(@"所填内容不能为空");
    }else{
        UserModel *model = [UserModel StudentWithName:NameStr phonenumber:NumberStr];
        [[DBManger ShareDBManger]insertUser:model];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (_NameTF == textField && _NameTF.text != nil) {
        NameStr = self.NameTF.text;
    }else if (_phoneTF == textField && _phoneTF.text != nil)
        NumberStr = self.phoneTF.text;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (_NameTF == textField && _NameTF.text != nil) {
        [_NameTF resignFirstResponder];
    }else if (_phoneTF == textField && _phoneTF.text != nil){
        [_phoneTF resignFirstResponder];
}
    return YES;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
