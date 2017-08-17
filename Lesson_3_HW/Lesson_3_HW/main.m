//
//  main.m
//  Lesson_3_HW
//
//  Created by Nikita Vintonovich on 8/17/17.
//  Copyright © 2017 Nikita Vintonovich. All rights reserved.
//

/*
 
 
 Объявить переменные-константы для хранения ключей словарей: cityNameKey, carShopKey,  brandNameKey, modelsKey, carModelKey, carParametersKey, carColorKey, carPriceKey
 
 Пример объявления константы для строки:
 
 static NSString *const keyName = @"keyValue";
 
 Задание:
 
 1 Создать массив типа NSArray для хранения названий городов, например: Харьков, Киев, Винница, Ужгород и Суммы … (можно вынести также в константы)
 2 Создать массив типа NSArray для хранения названий автосалонов, например: Toyota, Nissan, Ford, Fiat, Honda, Dodge … (можно вынести также в константы)
 3 Создать массив типа NSArray для хранения названий цветов машин, например: желтый, синий, красный… (минимум 5 названий цветов)
 4 Создать массив типа NSArray для каждого авто бренда, который будет содержать названия моделей (от 3 до 10 моделей для каждого бренда), например для Toyota модельный ряд это: Carina, Camry, Corolla, Prius, Auris … (можно посмотреть в интернете)
 5 Создать словарь типа NSMutableDictionary с названием города и приставкой Auto (для каждого города), например kharkovAuto.
 5.1 Используя любый циклы (для решения текущего пункта нужно будет несколько циклов, можно использовать for или любой другой) заполнить словарь-город случайными количеством автосалонов (но не менее 2-х).
 5.2 Каждый автосалон должен содержать случайное количество моделей (не меньше 2-х моделей авто).
 5.3 Каждая модель авто должна содержать параметры: “цвет” и “цена”. Цвет выбрать случайный из ранее объявленного массива цветов. Цена каждой машины выставляется случайно в диапазоне от $10 000 до $30 000 для всех авто.
 
 Дополнительное задание:
 Если это одна и та же модель авто в разных городах - то цена такого авто должна отличаться не более, чем на $500.
 
 
 
 
 т.е. в результате, каждая модель авто будет содержать параметры авто и название модели:
 
 carParametersDictionary = @{carColorKey : @“синий”,
 carPriceKey : @(28 000.00)};
 
 carModelDictionary = @{carModelKey :  @“Camry”,
 carParametersKey : carParametersDictionary};
 
 
 каждый автосалон будет содержать бренды авто и имеющиеся в наличии модели авто со случайными параметрами:
 
 toyotaCarShopDictionary = @{ brandNameKey : @“Toyota”,
 modelsKey : @[toyotaCarModelDictionary1, toyotaCarModelDictionary2 …] }
 
 nissanCarShopDictionary = @{ brandNameKey : @“Nissan”,
 modelsKey : @[nissanCarModelDictionary1, nissanCarModelDictionary2 …] }
 …
 
 каждый город содержит автосалоны:
 
 cityDictionary = @{cityNameKey : @“Харьков”,
 carShopKey : @[toyotaCarShopDictionary, nissanCarShopDictionary], …}
 
 переменная ukraineCitiesArray должна хранить список городов:
 
 ukraineCitiesArray = @[cityDictionary1, cityDictionary2 …]
 
 
 Сначала можно попробовать воссоздать в коде вручную без циклов полную структуру ukraineCitiesArray, а затем воссоздать с помощью циклов. Либо, воссоздать структуру и затем внести изменения с помощью addObject и removeObject (array), setValue: forKey: и removeValue: forKey (dictionary)

 Допускается небольшие отклонения во вложенности результата
 
 */

#import <Foundation/Foundation.h>


static NSString *const cityNameKey      = @"cityName";
static NSString *const carShopKey       = @"carShop";
static NSString *const brandNameKey     = @"brandName";
static NSString *const modelsKey        = @"models";
static NSString *const carModelKey      = @"carModel";
static NSString *const carParametersKey = @"carParameters";
static NSString *const carColorKey      = @"carColor";
static NSString *const carPriceKey      = @"carPrice";


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        // 1
        NSArray *cityNames = @[@"Kharkiv", @"Kiyv", @"Vinnica", @"Uzhgorod", @"Summy", @"Dnipropetrovsk", @"Zhitomyr", @"Lviv"];
        // 2
        NSArray *carShops = @[@"Toyota", @"Nissan", @"Ford", @"Fiat", @"Honda", @"Dodge", @"Mazda"];
        // 3
        NSArray *colors = @[@"Red", @"Green", @"Blue", @"Yellow", @"Black", @"White"];
        // 4
        NSArray *toyotaModels = @[@"Camry", @"Carina", @"Corolla", @"Prius", @"Celica"];
        NSArray *nissanModels = @[@"Almera", @"Tiida", @"Skyline", @"350-Z", @"Juke"];
        
        NSArray *fordModels = @[@"Fiesta", @"Focus", @"Mondeo", @"Galaxy", @"Ranger"];
        NSArray *fiatModels = @[@"124 Spider", @"500", @"Panda Cross", @"Punto", @"Doblo"];
        
        NSArray *hondaModels = @[@"Accord", @"Civic", @"2000", @"Fit", @"Odyssey", @"Ridgeline"];
        NSArray *dodgeModels = @[@"Charger", @"Durango", @"Dart", @"Viper", @"Challenger", @"Caliber"];
        NSArray *mazdaModels = @[@"2", @"3", @"5", @"6", @"MX-5", @"CX-3", @"CX-5", @"CX-9"];
        
        // в дальнейшем нам понядобиться использовать циклы и буджет удобно добавить все модели каждого бренда в томже порядке как carShops
        // для сравнения: carShops = @[@"Toyota", @"Nissan", @"Ford", @"Fiat", @"Honda", @"Dodge", @"Mazda"];
        NSArray *carModelsByShops = @[toyotaModels, nissanModels, fordModels, fiatModels, hondaModels, dodgeModels, mazdaModels];
        
        // Один из возможных авриантов пункта 5
        NSMutableDictionary *kharkovAuto = [NSMutableDictionary dictionary];
        
        [kharkovAuto setObject:[NSArray arrayWithObjects:toyotaModels[1], toyotaModels[3], nil] forKey:(NSString*)carShops[0]];
        [kharkovAuto setObject:[NSArray arrayWithObjects:nissanModels[0], toyotaModels[4], nil] forKey:(NSString*)carShops[1]];
        
        NSLog(@"%@", kharkovAuto);
        
        // 5.1 -- 5.3 используем циклы для заполнения городов, автосалонов, моделей...
        
        NSMutableArray *ukraineCitiesSet = [NSMutableArray array];
        
        // Первым циклом проходим по массиву городов
        for (NSInteger cityIndex = 0; cityIndex < cityNames.count; cityIndex++)
        {
            // предварительно нужно сформировать данные по городам и автосалонам
            
            // для хранения магазинов текущего города нужно создать массив. Названия магазинов совпадают с названиями брендов авто (Toyota, Nissan, ...)
            NSMutableArray *carShopsOfCurrentCity = [NSMutableArray array];
            
            // Затем создаем цикл для перебора автосалонов для текущего города
            for (NSInteger carShopIndex = 0; carShopIndex < carShops.count; carShopIndex++)
            {
                // достаем название магазина (бренда)
                NSString *carBrandName = (NSString *)[carShops objectAtIndex:carShopIndex];
                
                // для хранения списка случайных моделей со случайными параметрами нужен будет массив:
                NSMutableArray *availableCarModels = [NSMutableArray array];
                
                // достаем список моделй для текущего бренда
                NSArray *currentBrandModels = (NSArray *)[carModelsByShops objectAtIndex:carShopIndex];
                
                
                // создаем NSMutableSet для хранения случайных индексов модели авто
                NSMutableSet *indexes = [NSMutableSet set];
                for (NSInteger carModelsIndex = 0; carModelsIndex < currentBrandModels.count; carModelsIndex++)
                {
                    [indexes addObject:@(arc4random() % (currentBrandModels.count - 1))];
                }
                
                
                // теперь у нас есть список доступных машин - он представяет собой массив, который содержит случайные индексы.
                // По этим индексам будем доставать модели из списка всех моделей для текущего магазина/бренда
                NSArray *availableCarModelsIndexes = [indexes allObjects];
                
                // проходим циклом по массиву со случайными индексами
                for (NSInteger carModelsIndex = 0; carModelsIndex < availableCarModelsIndexes.count; carModelsIndex++)
                {
                    // достаем случайный индекс из массива
                    // и используем случайное значение по индексу для генерации парметров и модели авто
                    NSInteger index = [[availableCarModelsIndexes objectAtIndex:carModelsIndex] integerValue];
                    
                    // достаем название модели
                    NSString *currentModelName = (NSString*)[currentBrandModels objectAtIndex:index];
                    
                    // далее создаем параметры для текущего авто
                    
                    // достаем случайны цвет по индексу из массива названий цветов
                    NSInteger indexOfColor = arc4random() % (colors.count - 1);
                    NSString *color = [colors objectAtIndex:indexOfColor];
                    
                    // создаем случайную цену от 10 до 30 тыс.
                    NSInteger price = (100 + (CGFloat)(arc4random() % 200)) * 100;
                    
                    
                    // создаем словарь с параметрами
                    NSDictionary *carParameters = @{ carColorKey : color, carPriceKey : @(price) };
                    
                    // создаем модель авто с названием и параметрами
                    NSDictionary *carModel = @{ carModelKey : currentModelName, carParametersKey : carParameters };
                    
                    // добавляем созданную модель в randomCarmodelsArray (доступная модели текущего магазина/бренда)
                    [availableCarModels addObject:carModel];
                }
                
                // теперь у нас заполнен массив случайных моделей для текущего бренда,
                // можно его записать (добавить) в список всех брендов
                NSDictionary *carShopWithAvailableModels = @{ carShopKey : carBrandName,
                                                              modelsKey  : availableCarModels};
                
                // добавляем сформированный список (массив) моделей авто
                [carShopsOfCurrentCity addObject:carShopWithAvailableModels];
            }
            
            // достаем название города по индексу из массива и добавляем в cityDictionary
            NSString *currentCityName = (NSString *)[cityNames objectAtIndex:cityIndex];
            
            // создаем dictionary, который содержит название города и список (массив) автомагазинов
            NSDictionary *currentCityDictionary = @{ cityNameKey : currentCityName,
                                                     carShopKey  : carShopsOfCurrentCity};
            
            // добавляем получившийся ddictionary с названием города и авто магазинами в главный список
            [ukraineCitiesSet addObject:currentCityDictionary];
        }
        
        // В конце выводим в лог содержимое
        NSLog(@"%@", ukraineCitiesSet);
    }
    return 0;
}
