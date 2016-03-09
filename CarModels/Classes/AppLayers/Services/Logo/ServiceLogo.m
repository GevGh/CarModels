//
//  ServiceLogo.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-08.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "ServiceLogo.h"
#import "ModelLogoInfo.h"

@implementation ServiceLogo

- (NSArray <__kindof ModelLogoInfo*> *)getAllLogoModels {
    
    NSMutableArray <__kindof ModelLogoInfo*> *models = [[NSMutableArray alloc] init];
    
    ModelLogoInfo *modelAcura = [[ModelLogoInfo alloc] init];
    modelAcura.imageName = @"logo_acura";
    modelAcura.logoName = @"Acura";
    
    ModelLogoInfo *modelAstonMartin = [[ModelLogoInfo alloc] init];
    modelAstonMartin.imageName = @"logo_astonmartin";
    modelAstonMartin.logoName = @"Aston Martin";
    
    ModelLogoInfo *modelAudi = [[ModelLogoInfo alloc] init];
    modelAudi.imageName = @"logo_audi";
    modelAudi.logoName = @"Audi";
    
    ModelLogoInfo *modelBentley = [[ModelLogoInfo alloc] init];
    modelBentley.imageName = @"logo_bentley";
    modelBentley.logoName = @"Bentley";
    
    ModelLogoInfo *modelBMW = [[ModelLogoInfo alloc] init];
    modelBMW.imageName = @"logo_BMW";
    modelBMW.logoName = @"BMW";
    
    ModelLogoInfo *modelCadillac = [[ModelLogoInfo alloc] init];
    modelCadillac.imageName = @"logo_cadillac";
    modelCadillac.logoName = @"Cadillac";
    
    ModelLogoInfo *modelDodge = [[ModelLogoInfo alloc] init];
    modelDodge.imageName = @"logo_dodge";
    modelDodge.logoName = @"Dodge";
    
    ModelLogoInfo *modelFerrari = [[ModelLogoInfo alloc] init];
    modelFerrari.imageName = @"logo_ferrari";
    modelFerrari.logoName = @"Ferrari";
    
    ModelLogoInfo *modelFord = [[ModelLogoInfo alloc] init];
    modelFord.imageName = @"logo_ford";
    modelFord.logoName = @"Ford";
    
    ModelLogoInfo *modelGreatWall = [[ModelLogoInfo alloc] init];
    modelGreatWall.imageName = @"logo_greatwall";
    modelGreatWall.logoName = @"Great Wall";
    
    ModelLogoInfo *modelHonda = [[ModelLogoInfo alloc] init];
    modelHonda.imageName = @"logo_honda";
    modelHonda.logoName = @"Honda";
    
    ModelLogoInfo *modelInfiniti = [[ModelLogoInfo alloc] init];
    modelInfiniti.imageName = @"logo_infiniti";
    modelInfiniti.logoName = @"Infiniti";
    
    ModelLogoInfo *modelLada = [[ModelLogoInfo alloc] init];
    modelLada.imageName = @"logo_lada";
    modelLada.logoName = @"Lada";
    
    ModelLogoInfo *modelLamborgini = [[ModelLogoInfo alloc] init];
    modelLamborgini.imageName = @"logo_l";
    modelLamborgini.logoName = @"Lamborgini";
    
    ModelLogoInfo *modelLincoln = [[ModelLogoInfo alloc] init];
    modelLincoln.imageName = @"logo_Lincoln";
    modelLincoln.logoName = @"Lincoln";
    
    ModelLogoInfo *modelMazda = [[ModelLogoInfo alloc] init];
    modelMazda.imageName = @"logo_mazda";
    modelMazda.logoName = @"Mazda";
    
    ModelLogoInfo *modelMercedesBenc = [[ModelLogoInfo alloc] init];
    modelMercedesBenc.imageName = @"logo_mercedes_benz";
    modelMercedesBenc.logoName = @"Mercedes Benc";
    
    ModelLogoInfo *modelMitsubishi = [[ModelLogoInfo alloc] init];
    modelMitsubishi.imageName = @"logo_mitsubishi";
    modelMitsubishi.logoName = @"Mitsubishi";
    
    ModelLogoInfo *modelNissan = [[ModelLogoInfo alloc] init];
    modelNissan.imageName = @"logo_nissan";
    modelNissan.logoName = @"Nissan";
    
    ModelLogoInfo *modelOpel = [[ModelLogoInfo alloc] init];
    modelOpel.imageName = @"logo_opel";
    modelOpel.logoName = @"Opel";
    
    ModelLogoInfo *modelPorsche = [[ModelLogoInfo alloc] init];
    modelPorsche.imageName = @"logo_porsche";
    modelPorsche.logoName = @"Porsche";
    
    ModelLogoInfo *modelRollsRoyce = [[ModelLogoInfo alloc] init];
    modelRollsRoyce.imageName = @"logo_Rolls-Royce";
    modelRollsRoyce.logoName = @"Rolls Royce";
    
    ModelLogoInfo *modelSkoda = [[ModelLogoInfo alloc] init];
    modelSkoda.imageName = @"logo_skoda";
    modelSkoda.logoName = @"Skoda";
    
    ModelLogoInfo *modelSubaru = [[ModelLogoInfo alloc] init];
    modelSubaru.imageName = @"logo_subaru";
    modelSubaru.logoName = @"Subaru";
    
    ModelLogoInfo *modelToyota = [[ModelLogoInfo alloc] init];
    modelToyota.imageName = @"logo_toyota";
    modelToyota.logoName = @"Toyota";
    
    ModelLogoInfo *modelVolkswagen = [[ModelLogoInfo alloc] init];
    modelVolkswagen.imageName = @"logo_volkswagen";
    modelVolkswagen.logoName = @"Volkswagen";
    
    ModelLogoInfo *modelVolvo = [[ModelLogoInfo alloc] init];
    modelVolvo.imageName = @"logo_volvo";
    modelVolvo.logoName = @"Volvo";
    
    [models addObject:modelAcura];
    [models addObject:modelAstonMartin];
    [models addObject:modelAudi];
    [models addObject:modelBentley];
    [models addObject:modelBMW];
    [models addObject:modelCadillac];
    [models addObject:modelDodge];
    [models addObject:modelFerrari];
    [models addObject:modelFord];
    [models addObject:modelGreatWall];
    [models addObject:modelHonda];
    [models addObject:modelInfiniti];
    [models addObject:modelLada];
    [models addObject:modelLamborgini];
    [models addObject:modelLincoln];
    [models addObject:modelMazda];
    [models addObject:modelMercedesBenc];
    [models addObject:modelMitsubishi];
    [models addObject:modelNissan];
    [models addObject:modelOpel];
    [models addObject:modelPorsche];
    [models addObject:modelRollsRoyce];
    [models addObject:modelSkoda];
    [models addObject:modelSubaru];
    [models addObject:modelToyota];
    [models addObject:modelVolkswagen];
    [models addObject:modelVolvo];    
    
    return [NSArray arrayWithArray:models];
}

@end
