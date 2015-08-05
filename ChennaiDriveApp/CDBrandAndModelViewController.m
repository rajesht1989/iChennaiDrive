//
//  CDBrandAndModelViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 4/14/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDBrandAndModelViewController.h"

#import "CDPickerComponent.h"

@interface CDBrandAndModelViewController ()

@end

@implementation CDBrandAndModelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Select model", @"Select model");
        [self.navigationItem setLeftBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Cancel" target:self action:@selector(closeButtonTapped:)]];
        [self.navigationItem setRightBarButtonItem:[self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"] title:@"Done" target:self action:@selector(doneTapped:)]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    brandArray = @[@"Bajaj",@"BMW",@"Ducati", @"Hero", @"Honda", @"Kawasaki", @"Mahindra", @"Suzuki", @"TVS", @"Yamaha"];
    
    vehiclesArray = @[@"bike",@"bike1",@"bike2",@"bike3",@"bike4"];
    
    [brandImageView setImage:[UIImage imageNamed:[brandArray objectAtIndex:0]]];
    [brandLabel setText:[brandArray objectAtIndex:0]];
    [modelLabel setText:[vehiclesArray objectAtIndex:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [brandArray count];
    }
    if (component == 1) {
        return [vehiclesArray count];
    }
    return 0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component == 0) {
        CDPickerComponent *pickerComponentView = [[CDPickerComponent alloc]init];//WithFrame:CGRectMake(0, 0, 180, 40)];
         [pickerComponentView.imageView setHidden:NO];
         [pickerComponentView.txtLable setHidden:NO];
        [pickerComponentView.imageView setImage:[UIImage imageNamed:[brandArray objectAtIndex:row]]];
        [pickerComponentView.txtLable setText:[brandArray objectAtIndex:row]];
        return pickerComponentView ;
    }
    else if (component == 1) {
        CDPickerComponent *pickerComponentView = [[CDPickerComponent alloc]init ];//WithFrame:CGRectMake(0, 0, 180, 40)];
        //[pickerComponentView.imageView setImage:[UIImage imageNamed:[vehiclesArray objectAtIndex:row]]];
         [pickerComponentView.vehicleLabel setHidden:NO];
        [pickerComponentView.vehicleLabel setText:[vehiclesArray objectAtIndex:row]];
        return pickerComponentView ;
    }
    return nil;
}

//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    int maxSize = 0;
//    for (NSString *brandStr in brandArray) {
//        CGSize zSize = [brandStr sizeWithFont:[UIFont boldSystemFontOfSize:15] constrainedToSize:CGSizeMake(200, 20)];
//        if (maxSize < zSize.width) {
//            maxSize = zSize.width +80;
//        }
//    }
//    
//    return maxSize;
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [modelLabel setHidden:YES];

        [brandImageView setHidden:NO];
        [brandLabel setHidden:NO];
        
        [brandImageView setImage:[UIImage imageNamed:[brandArray objectAtIndex:row]]];
        [brandLabel setText:[brandArray objectAtIndex:row]];
    }
    else if (component == 1){
        [modelLabel setHidden:NO];
        [modelLabel setText:[vehiclesArray objectAtIndex:row]];
    }
}

- (void)closeButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)doneTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidUnload {
    brandImageView = nil;
    brandLabel = nil;
    modelLabel = nil;
    [super viewDidUnload];
}
@end
