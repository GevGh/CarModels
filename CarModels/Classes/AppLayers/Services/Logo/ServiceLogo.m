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
    modelAcura.identifier = @"acura_xiR9gRVS8C1oMW1";
    modelAcura.haveCategories = YES;
    
    ModelLogoInfo *modelAstonMartin = [[ModelLogoInfo alloc] init];
    modelAstonMartin.imageName = @"logo_astonmartin";
    modelAstonMartin.logoName = @"Aston Martin";
    modelAstonMartin.identifier = @"aston_martin_y9xG1HomNun5Hwn";
    modelAstonMartin.haveCategories = YES;
    
    ModelLogoInfo *modelAudi = [[ModelLogoInfo alloc] init];
    modelAudi.imageName = @"logo_audi";
    modelAudi.logoName = @"Audi";
    modelAudi.identifier = @"audi_vgEPzRrHFo1zN9Y";
    modelAudi.haveCategories = YES;
    
    ModelLogoInfo *modelBentley = [[ModelLogoInfo alloc] init];
    modelBentley.imageName = @"logo_bentley";
    modelBentley.logoName = @"Bentley";
    modelBentley.identifier = @"bentley_CdFYT1VQvgPjQfn";
    modelBentley.haveCategories = NO;
    
    ModelLogoInfo *modelBMW = [[ModelLogoInfo alloc] init];
    modelBMW.imageName = @"logo_bmw";
    modelBMW.logoName = @"BMW";
    modelBMW.identifier = @"bmw_bk5AXKpA5h5Eld1";
    modelBMW.haveCategories = YES;
    
    ModelLogoInfo *modelBugatti = [[ModelLogoInfo alloc] init];
    modelBugatti.imageName = @"logo_bugatti";
    modelBugatti.logoName = @"Bugatti";
    modelBugatti.identifier = @"bugatti_WmrGJuRXII3R96h";
    modelBugatti.haveCategories = NO;
    
    ModelLogoInfo *modelCadillac = [[ModelLogoInfo alloc] init];
    modelCadillac.imageName = @"logo_cadillac";
    modelCadillac.logoName = @"Cadillac";
    modelCadillac.identifier = @"cadillac_D6TpI8zZ3oLU2yt";
    modelCadillac.haveCategories = YES;
    
    ModelLogoInfo *modelChevrolet = [[ModelLogoInfo alloc] init];
    modelChevrolet.imageName = @"logo_chevrolet";
    modelChevrolet.logoName = @"Chevrolet";
    modelChevrolet.identifier = @"chevrolet_tgWKJxVC6bDdXCi";
    modelChevrolet.haveCategories = YES;
    
    ModelLogoInfo *modelDodge = [[ModelLogoInfo alloc] init];
    modelDodge.imageName = @"logo_dodge";
    modelDodge.logoName = @"Dodge";
    modelDodge.identifier = @"dodge_OLJh7FkigBlGdrR";
    modelDodge.haveCategories = YES;
    
    ModelLogoInfo *modelFerrari = [[ModelLogoInfo alloc] init];
    modelFerrari.imageName = @"logo_ferrari";
    modelFerrari.logoName = @"Ferrari";
    modelFerrari.identifier = @"ferrari_zlVAUW8n0jC84qO";
    modelFerrari.haveCategories = YES;
    
    ModelLogoInfo *modelFord = [[ModelLogoInfo alloc] init];
    modelFord.imageName = @"logo_ford";
    modelFord.logoName = @"Ford";
    modelFord.identifier = @"ford_Xu2s8LUUBvHBtZp";
    modelFord.haveCategories = YES;
    
    ModelLogoInfo *modelGreatWall = [[ModelLogoInfo alloc] init];
    modelGreatWall.imageName = @"logo_greatwall";
    modelGreatWall.logoName = @"Great Wall";
    modelGreatWall.identifier = @"great_wall_2zCuZGstrKQMEiO";
    modelGreatWall.haveCategories = YES;
    
    ModelLogoInfo *modelHonda = [[ModelLogoInfo alloc] init];
    modelHonda.imageName = @"logo_honda";
    modelHonda.logoName = @"Honda";
    modelHonda.identifier = @"honda_hpdmTXco8NN3Df2";
    modelHonda.haveCategories = YES;
    
    ModelLogoInfo *modelInfiniti = [[ModelLogoInfo alloc] init];
    modelInfiniti.imageName = @"logo_infiniti";
    modelInfiniti.logoName = @"Infiniti";
    modelInfiniti.identifier = @"infiniti_1KTlawIqPGtc1jk";
    modelInfiniti.haveCategories = YES;
    
    ModelLogoInfo *modelKia = [[ModelLogoInfo alloc] init];
    modelKia.imageName = @"logo_kia";
    modelKia.logoName = @"KIA";
    modelKia.identifier = @"kia_A7xc1QHfkG5OmXe";
    modelKia.haveCategories = YES;
    
    ModelLogoInfo *modelLada = [[ModelLogoInfo alloc] init];
    modelLada.imageName = @"logo_lada";
    modelLada.logoName = @"Lada";
    modelLada.identifier = @"lada_XWvBY6pEOR5VXlY";
    modelLada.haveCategories = YES;
    
    ModelLogoInfo *modelLamborghini = [[ModelLogoInfo alloc] init];
    modelLamborghini.imageName = @"logo_lamborghini";
    modelLamborghini.logoName = @"Lamborghini";
    modelLamborghini.identifier = @"lamborghini_CbzGIEqRlkh0uig";
    modelLamborghini.haveCategories = YES;
    
    ModelLogoInfo *modelLandRover = [[ModelLogoInfo alloc] init];
    modelLandRover.imageName = @"logo_land_rover";
    modelLandRover.logoName = @"Land Rover";
    modelLandRover.identifier = @"land_rover_7DrmpVJu4wDkr9k";
    modelLandRover.haveCategories = YES;
    
    ModelLogoInfo *modelLexus = [[ModelLogoInfo alloc] init];
    modelLexus.imageName = @"logo_lexus";
    modelLexus.logoName = @"Lexus";
    modelLexus.identifier = @"lexus_nlREgAsVABMnJBq";
    modelLexus.haveCategories = YES;
    
    ModelLogoInfo *modelLincoln = [[ModelLogoInfo alloc] init];
    modelLincoln.imageName = @"logo_lincoln";
    modelLincoln.logoName = @"Lincoln";
    modelLincoln.identifier = @"lincoln_WSfG4bnxQ2IWwTo";
    modelLincoln.haveCategories = YES;
    
    ModelLogoInfo *modelMazda = [[ModelLogoInfo alloc] init];
    modelMazda.imageName = @"logo_mazda";
    modelMazda.logoName = @"Mazda";
    modelMazda.identifier = @"mazda_ZdJk69XSBkB1ghv";
    modelMazda.haveCategories = YES;
    
    ModelLogoInfo *modelMercedesBenc = [[ModelLogoInfo alloc] init];
    modelMercedesBenc.imageName = @"logo_mercedes-benz";
    modelMercedesBenc.logoName = @"Mercedes Benc";
    modelMercedesBenc.identifier = @"mercedes_0rQ58MY8Uspa75F";
    modelMercedesBenc.haveCategories = YES;
    
    ModelLogoInfo *modelMitsubishi = [[ModelLogoInfo alloc] init];
    modelMitsubishi.imageName = @"logo_mitsubishi";
    modelMitsubishi.logoName = @"Mitsubishi";
    modelMitsubishi.identifier = @"mitsubishi_FpIHBNDrP9GAggQ";
    modelMitsubishi.haveCategories = YES;
    
    ModelLogoInfo *modelNissan = [[ModelLogoInfo alloc] init];
    modelNissan.imageName = @"logo_nissan";
    modelNissan.logoName = @"Nissan";
    modelNissan.identifier = @"nissan_kgRW0dPj8dsTe0z";
    modelNissan.haveCategories = YES;
    
    ModelLogoInfo *modelOpel = [[ModelLogoInfo alloc] init];
    modelOpel.imageName = @"logo_opel";
    modelOpel.logoName = @"Opel";
    modelOpel.identifier = @"opel_YOO4Gh9XYBz6M0d";
    modelOpel.haveCategories = YES;
    
    ModelLogoInfo *modelPorsche = [[ModelLogoInfo alloc] init];
    modelPorsche.imageName = @"logo_porsche";
    modelPorsche.logoName = @"Porsche";
    modelPorsche.identifier = @"porsche_TzyhMcbwahAnWEL";
    modelPorsche.haveCategories = YES;
    
    ModelLogoInfo *modelRollsRoyce = [[ModelLogoInfo alloc] init];
    modelRollsRoyce.imageName = @"logo_rolls-royce";
    modelRollsRoyce.logoName = @"Rolls Royce";
    modelRollsRoyce.identifier = @"rolls_royce_jtc9l6tGZy3NzXG";
    modelRollsRoyce.haveCategories = YES;
    
    ModelLogoInfo *modelSkoda = [[ModelLogoInfo alloc] init];
    modelSkoda.imageName = @"logo_skoda";
    modelSkoda.logoName = @"Skoda";
    modelSkoda.identifier = @"skoda_eqSn3QfJuaFMivk";
    modelSkoda.haveCategories = YES;
    
    ModelLogoInfo *modelSubaru = [[ModelLogoInfo alloc] init];
    modelSubaru.imageName = @"logo_subaru";
    modelSubaru.logoName = @"Subaru";
    modelSubaru.identifier = @"subaru_bKQ4WBWXVD695QR";
    modelSubaru.haveCategories = YES;
    
    ModelLogoInfo *modelTesla = [[ModelLogoInfo alloc] init];
    modelTesla.imageName = @"logo_tesla";
    modelTesla.logoName = @"Tesla";
    modelTesla.identifier = @"tesla_yGJ6EEuiGAhEu4U";
    modelTesla.haveCategories = YES;
    
    ModelLogoInfo *modelToyota = [[ModelLogoInfo alloc] init];
    modelToyota.imageName = @"logo_toyota";
    modelToyota.logoName = @"Toyota";
    modelToyota.identifier = @"toyota_LkGiggW0RoOQpNQ";
    modelToyota.haveCategories = YES;
    
    ModelLogoInfo *modelVolkswagen = [[ModelLogoInfo alloc] init];
    modelVolkswagen.imageName = @"logo_vw";
    modelVolkswagen.logoName = @"Volkswagen";
    modelVolkswagen.identifier = @"volkswagen_TZnAdfVDcEs6JAJ";
    modelVolkswagen.haveCategories = YES;
    
    ModelLogoInfo *modelVolvo = [[ModelLogoInfo alloc] init];
    modelVolvo.imageName = @"logo_volvo";
    modelVolvo.logoName = @"Volvo";
    modelVolvo.identifier = @"volvo_grpa8cHipyUxYyE";
    modelVolvo.haveCategories = YES;
    
    [models addObject:modelAcura];
    [models addObject:modelAstonMartin];
    [models addObject:modelAudi];
    [models addObject:modelBentley];
    [models addObject:modelBMW];
    [models addObject:modelBugatti];
    [models addObject:modelCadillac];
    [models addObject:modelChevrolet];
    [models addObject:modelDodge];
    [models addObject:modelFerrari];
    [models addObject:modelFord];
    [models addObject:modelGreatWall];
    [models addObject:modelHonda];
    [models addObject:modelInfiniti];
    [models addObject:modelKia];
    [models addObject:modelLada];
    [models addObject:modelLamborghini];
    [models addObject:modelLandRover];
    [models addObject:modelLexus];
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
    [models addObject:modelTesla];
    [models addObject:modelToyota];
    [models addObject:modelVolkswagen];
    [models addObject:modelVolvo];    
    
    return [NSArray arrayWithArray:models];
}

@end
