//
//  CDFirstViewController.m
//  ChennaiDriveApp
//
//  Created by Nagarajan on 3/24/13.
//  Copyright (c) 2013 ChennaiDrive. All rights reserved.
//

#import "CDVehiclesViewController.h"
#import "CDRegisteredVehInfo.h"
#import "CDVehicleConstants.h"
#import "CDStretchableButton.h"
#import "CDRegisteredVehInfoViewController.h"
#import "CDNewServiceViewController.h"
#import "CDNewVehicleViewController.h"
#import "UINavigationController+CDNavigationController.h"

#define ROWS_IN_SECTION     1
#define TEXTFIELD_TAG       1
#define ROW_HEIGHT          68.00
#define BIKE_TAB            0
#define CAR_TAB             1

@interface CDVehiclesViewController ()

@end


@implementation CDVehiclesViewController

@synthesize vehicles;
@synthesize tableRegisteredVehicles;
@synthesize segmentVehicleType;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Vehicles", @"Vehicles");
        //[self.navigationItem setTitleViewWithTitle:self.title];
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        
        
//        UIImage *bluelImage = [[UIImage imageNamed:@"btn_login.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:0];
//        UIButton *rightButton = [CDStretchableButton stretchableButtonWithImage:bluelImage
//                                                                          frame:CGRectMake(0, 0, 100, 30)
//                                                                localizedString:@"New"
//                                                                         target:self
//                                                                         action:@selector(addNewVehicleTapped:)];
//        
//        UIBarButtonItem *rightBarbutton = [[UIBarButtonItem alloc]initWithTitle:@"New" style:UIBarButtonItemStyleDone target:self action:@selector(addNewVehicleTapped:)];
        self.navigationItem.rightBarButtonItem = [self.navigationItem getBarButtonItemWithImage:[UIImage imageNamed:@"login_button"]  title:@"New" target:self action:@selector(addNewVehicleTapped:)];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSDate *now = [[NSDate alloc] init];
   
    
    NSMutableDictionary *vehicle1 = [[NSMutableDictionary alloc]init];
    [vehicle1 setObject:@"Yamaha" forKey:VEHICLE_BRAND_NAME];
    [vehicle1 setObject:@"FZ" forKey:VEHICLE_MODEL_NAME];
    [vehicle1 setObject:@"TN-74-H-6077" forKey:VEHICLE_REG_NO];
    [vehicle1 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [vehicle1 setObject:@"FZ8_B.png" forKey:VEHICLE_IMAGE_NAME];
    
    
    CDRegisteredVehInfo *info = [[CDRegisteredVehInfo alloc] initWithJsonDict:vehicle1];
    
    
    NSMutableDictionary *vehicle2 = [[NSMutableDictionary alloc]init];
    [vehicle2 setObject:@"Hero" forKey:VEHICLE_BRAND_NAME];
    [vehicle2 setObject:@"Karizma" forKey:VEHICLE_MODEL_NAME];
    [vehicle2 setObject:@"TN-74-J-4533" forKey:VEHICLE_REG_NO];
    [vehicle2 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [vehicle2 setObject:@"bike1.png" forKey:VEHICLE_IMAGE_NAME];
    
    CDRegisteredVehInfo *info1 = [[CDRegisteredVehInfo alloc]initWithJsonDict:vehicle2];
    
    NSMutableDictionary *vehicle3 = [[NSMutableDictionary alloc]init];
    [vehicle3 setObject:@"Bajaj" forKey:VEHICLE_BRAND_NAME];
    [vehicle3 setObject:@"Pulsar" forKey:VEHICLE_MODEL_NAME];
    [vehicle3 setObject:@"TN-74-J-355" forKey:VEHICLE_REG_NO];
    [vehicle3 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [vehicle3 setObject:@"bike2.png" forKey:VEHICLE_IMAGE_NAME];
    
    CDRegisteredVehInfo *info100 = [[CDRegisteredVehInfo alloc]initWithJsonDict:vehicle3];
    
    NSMutableDictionary *vehicle4 = [[NSMutableDictionary alloc]init];
    [vehicle4 setObject:@"TVS" forKey:VEHICLE_BRAND_NAME];
    [vehicle4 setObject:@"Apache" forKey:VEHICLE_MODEL_NAME];
    [vehicle4 setObject:@"TN-74-J-6732" forKey:VEHICLE_REG_NO];
    [vehicle4 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [vehicle4 setObject:@"bike3.png" forKey:VEHICLE_IMAGE_NAME];
    
    CDRegisteredVehInfo *info101 = [[CDRegisteredVehInfo alloc]initWithJsonDict:vehicle4];
    
    NSMutableDictionary *vehicle5 = [[NSMutableDictionary alloc]init];
    [vehicle5 setObject:@"Honda" forKey:VEHICLE_BRAND_NAME];
    [vehicle5 setObject:@"CBR 250 R" forKey:VEHICLE_MODEL_NAME];
    [vehicle5 setObject:@"TN-04-J-1111" forKey:VEHICLE_REG_NO];
    [vehicle5 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [vehicle5 setObject:@"bike4.png" forKey:VEHICLE_IMAGE_NAME];
    
    CDRegisteredVehInfo *info102 = [[CDRegisteredVehInfo alloc]initWithJsonDict:vehicle5];
    
    bikes = [[NSMutableArray alloc]init];
    
    [bikes addObject:info];
    [bikes addObject:info1];
    [bikes addObject:info100];
    [bikes addObject:info101];
    [bikes addObject:info102];
                                    
    
    
    NSMutableDictionary *car1 = [[NSMutableDictionary alloc]init];
    [car1 setObject:@"Mahindra" forKey:VEHICLE_BRAND_NAME];
    [car1 setObject:@"Scorpio" forKey:VEHICLE_MODEL_NAME];
    [car1 setObject:@"TN-75-7777" forKey:VEHICLE_REG_NO];
    [car1 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [car1 setObject:@"car1.png" forKey:VEHICLE_IMAGE_NAME];
    
    
    CDRegisteredVehInfo *info3 = [[CDRegisteredVehInfo alloc] initWithJsonDict:car1];
    
    
    NSMutableDictionary *car2 = [[NSMutableDictionary alloc]init];
    [car2 setObject:@"Maruti Suziki" forKey:VEHICLE_BRAND_NAME];
    [car2 setObject:@"Dzire" forKey:VEHICLE_MODEL_NAME];
    [car2 setObject:@"TN-04-AJ-9259" forKey:VEHICLE_REG_NO];
    [car2 setObject:now forKey:VEHICLE_SERVICE_DUE];
    [car2 setObject:@"car2.png" forKey:VEHICLE_IMAGE_NAME];
    
    CDRegisteredVehInfo *info4 = [[CDRegisteredVehInfo alloc]initWithJsonDict:car2];
    
    cars = [[NSMutableArray alloc]init];
    
    [cars addObject:info3];
    [cars addObject:info4];
    
    [self.segmentVehicleType setSelectedSegmentIndex:BIKE_TAB];
    [self configUI];
    
    [self segmenteVehicleTypeChanged:self.segmentVehicleType];
    
}

-(void)configUI
{
    segmentVehicleType.tintColor = [UIColor colorWithRed:0.70 green:0.171 blue:0.1 alpha:1.0];
}

/**************************************************************************************************/
#pragma mark - UITableViewDatasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableRegisteredVehicles)
    {
        return vehicles.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ROWS_IN_SECTION;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.tableRegisteredVehicles)
    {
        static NSString *CellIdentifier = @"Cell";
        
        CDRegisteredVehicleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [CDRegisteredVehicleCell getRegisteredVehicleCell];
            [cell.btnServiceMe addTarget:self action:@selector(serviceRequestedForVehicle:) forControlEvents:UIControlEventTouchUpInside];
            cell.selectionStyle = UITableViewCellEditingStyleNone;
        }
        
        [cell.btnServiceMe setTag:indexPath.section];
        
        
        [cell setRegisteredVehicleInfo:[vehicles objectAtIndex:indexPath.section]];
        
        return cell;

    }
    return nil;
}


-(CGFloat) tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return ROW_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];   
    CDRegisteredVehInfo *selectedVehInfo = (CDRegisteredVehInfo*) [vehicles objectAtIndex:indexPath.section];
    
    CDRegisteredVehInfoViewController *objVehicleInfoViewController = [[CDRegisteredVehInfoViewController alloc]initWithNibName:@"CDRegisteredVehInfoViewController" bundle:nil];
    [objVehicleInfoViewController setSelectedVehicle:selectedVehInfo];
    [self.navigationController pushViewController:objVehicleInfoViewController animated:YES];
    NSLog(@"Table Row Selected");
}

/**************************************************************************************************/

-(IBAction)segmenteVehicleTypeChanged:(id)sender
{
    if(self.segmentVehicleType.selectedSegmentIndex == BIKE_TAB)
    {
        [self setVehicles:bikes];
        [self.segmentVehicleType setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self.segmentVehicleType setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [self.segmentVehicleType setBackgroundImage:[UIImage imageNamed:@"left_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self.segmentVehicleType setBackgroundImage:[UIImage imageNamed:@"right_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    else if (self.segmentVehicleType.selectedSegmentIndex == CAR_TAB)
    {
        [self setVehicles:cars];
        
        [self.segmentVehicleType setBackgroundImage:nil forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self.segmentVehicleType setBackgroundImage:nil forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [self.segmentVehicleType setBackgroundImage:[UIImage imageNamed:@"right_s.png"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self.segmentVehicleType setBackgroundImage:[UIImage imageNamed:@"left_un.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    
    [self.tableRegisteredVehicles reloadData];
}

-(void)serviceRequestedForVehicle:(id)sender
{
    UIButton *btn = (UIButton*)sender;
    NSLog(@"Button Clicked at %d",btn.tag);
    
   CDRegisteredVehInfo *vehInfo = (CDRegisteredVehInfo*) [vehicles objectAtIndex:btn.tag];
    
    NSLog(@"Selected Vehicle Name: %@",vehInfo.vehicleBrandName);
    
    CDNewServiceViewController *newServiceVC = [[CDNewServiceViewController alloc]initWithNibName:@"CDNewServiceViewController" bundle: nil];
    [newServiceVC loadCloseButton];
    UINavigationController *newServiceNavigationController = [[UINavigationController alloc]initWithBlackNavigationBarAndRootViewController:newServiceVC];
    [self presentViewController:newServiceNavigationController animated:YES completion:nil];

}

-(void)addNewVehicleTapped:(id)sender
{
    CDNewVehicleViewController *newVehicleVC = [[CDNewVehicleViewController alloc]initWithNibName:@"CDNewVehicleViewController" bundle:nil];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
