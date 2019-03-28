#include <YSI\y_hooks>

hook OnGameModeInit() {

	print("[Streamer] Loading Dynamic Static Vehicles...");

	//Shipment Vehicles
	TruckerVehicles[0] = AddStaticVehicleEx(414,2596.2043,-2213.7646,13.6406,180.0000,-1,-1,300); // mule1
	TruckerVehicles[1] = AddStaticVehicleEx(414,2599.5955,-2213.7766,13.6406,180.0000,-1,-1,300); // mule2
	TruckerVehicles[2] = AddStaticVehicleEx(414,2602.9255,-2213.7588,13.6364,180.0000,-1,-1,300); // mule3
	TruckerVehicles[3] = AddStaticVehicleEx(414,2606.3540,-2213.7612,13.6353,180.0000,-1,-1,300); // mule4
	TruckerVehicles[4] = AddStaticVehicleEx(456,2601.9871,-2241.5303,13.7135,0.0000,-1,-1,300); // yankee1
	TruckerVehicles[5] = AddStaticVehicleEx(456,2605.9016,-2241.5107,13.7207,0.0000,-1,-1,300); // yankee2
	TruckerVehicles[6] = AddStaticVehicleEx(456,2609.7720,-2241.5332,13.7170,0.0000,-1,-1,300); // yankee3
	TruckerVehicles[7] = AddStaticVehicleEx(456,2613.6501,-2241.5859,13.7156,0.0000,-1,-1,300); // yankee4
	TruckerVehicles[8] = AddStaticVehicleEx(440,2596.7534,-2240.8516,13.6456,0.0000,-1,-1,300); // rumpo1
	TruckerVehicles[9] = AddStaticVehicleEx(440,2593.5981,-2240.7231,13.6589,0.0000,-1,-1,300); // rumpo2
	TruckerVehicles[10] = AddStaticVehicleEx(413,2590.3972,-2240.8782,13.6267,0.0000,-1,-1,300); // pony1
	TruckerVehicles[11] = AddStaticVehicleEx(413,2587.3525,-2240.9431,13.6345,0.0000,-1,-1,300); // pony2
	TruckerVehicles[12] = AddStaticVehicleEx(482,2609.6497,-2213.9756,13.6663,180.0000,-1,-1,300); // burrito1
	TruckerVehicles[13] = AddStaticVehicleEx(482,2612.6580,-2214.0969,13.6635,180.0000,-1,-1,300); // burrito2
	TruckerVehicles[14] = AddStaticVehicleEx(482,2615.7678,-2214.0422,13.6642,180.0000,-1,-1,300); // burrito3
	TruckerVehicles[15] = AddStaticVehicleEx(482,2618.9319,-2213.9543,13.6630,180.0000,-1,-1,300); // burrito4
	TruckerVehicles[16] = AddStaticVehicleEx(443,2581.9980,-2239.6316,14.1766,0.0000,-1,-1,300); // packer2
	TruckerVehicles[17] = AddStaticVehicleEx(443,2577.5850,-2239.6763,14.1776,0.0000,-1,-1,300); // packer1
	TruckerVehicles[18] = AddStaticVehicleEx(514,2572.8584,-2241.4219,14.1317,0.0000,-1,-1,300); // tanker1
	TruckerVehicles[19] = AddStaticVehicleEx(514,2568.8115,-2241.4131,14.1313,0.0000,-1,-1,300); // tanker2
	TruckerVehicles[20] = AddStaticVehicleEx(452,2449.3938,-2254.8503,-0.3499,180.0000,-1,-1,300); // speeder7
	TruckerVehicles[21] = AddStaticVehicleEx(452,2454.8982,-2255.1169,-0.5745,180.0000,-1,-1,300); // speeder6
	TruckerVehicles[22] = AddStaticVehicleEx(452,2460.1023,-2255.3694,-0.2573,180.0000,-1,-1,300); // speeder5
	TruckerVehicles[23] = AddStaticVehicleEx(452,2465.2192,-2254.7239,-0.6703,180.0000,-1,-1,300); // speeder4
	TruckerVehicles[24] = AddStaticVehicleEx(452,2470.3125,-2254.4929,-0.4305,180.0000,-1,-1,300); // speeder3
	TruckerVehicles[25] = AddStaticVehicleEx(452,2475.3015,-2254.5535,-0.3805,180.0000,-1,-1,300); // speeder2
	TruckerVehicles[26] = AddStaticVehicleEx(452,2480.0503,-2253.9111,-0.3448,180.0000,-1,-1,300); // speeder1

	PizzaVehicles[0] = AddStaticVehicleEx(448, 2106.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[1] = AddStaticVehicleEx(448, 2107.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[2] = AddStaticVehicleEx(448, 2108.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[3] = AddStaticVehicleEx(448, 2109.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[4] = AddStaticVehicleEx(448, 2110.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[5] = AddStaticVehicleEx(448, 2111.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[6] = AddStaticVehicleEx(448, 2112.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[7] = AddStaticVehicleEx(448, 2113.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[8] = AddStaticVehicleEx(448, 2114.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[9] = AddStaticVehicleEx(448, 2115.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[10] = AddStaticVehicleEx(448, 2116.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[11] = AddStaticVehicleEx(448, 2117.4319, -1784.7222, 12.8745, 0.00000000 ,3,6,300); //Pizzaboy
	PizzaVehicles[12] =	AddStaticVehicleEx(448,-1702.81005859,1378.07958984,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[13] =	AddStaticVehicleEx(448,-1703.49853516,1377.28295898,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[14] =	AddStaticVehicleEx(448,-1704.31005859,1376.46240234,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[15] =	AddStaticVehicleEx(448,-1705.17895508,1375.72802734,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[16] =	AddStaticVehicleEx(448,-1709.15429688,1371.57226562,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[17] =	AddStaticVehicleEx(448,-1709.98718262,1370.84716797,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[18] =	AddStaticVehicleEx(448,-1710.77893066,1370.11706543,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[19] =	AddStaticVehicleEx(448,-1711.57092285,1369.38659668,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[20] =	AddStaticVehicleEx(448,-1712.32312012,1368.69396973,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[21] =	AddStaticVehicleEx(448,-1713.02709961,1367.94238281,6.85771942,45.00000000,3,6,300); //Pizzaboy
	PizzaVehicles[22] =	AddStaticVehicleEx(448,-1713.83740234,1367.19580078,6.85771942,45.00000000,3,6,300); //Pizzaboy

	/*
	AddStaticVehicleEx(593,382.5172,2536.9561,16.5338,179.7261,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(513,348.3660,2536.9792,16.7418,178.8195,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(487,365.4068,2537.0327,16.6645,181.9959,-1,-1,2000);//Flyschool
	AddStaticVehicleEx(593,-1429.2843,-505.8203,13.7824,205.7709,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(593,-1462.4779,-524.2803,13.7832,204.8137,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(593,1907.7614,-2624.4097,13.5416,53.1810,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(593,1887.0736,-2627.6543,13.5394,52.6116,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(513,-1354.3270,-466.5467,13.7827,162.0134,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(513,-1390.3510,-482.7985,13.7883,250.3124,-1,-1,2000);//Airport SF
	AddStaticVehicleEx(513,1835.3215,-2624.1938,13.5405,56.0569,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(513,1813.2893,-2625.6296,13.5394,53.2858,-1,-1,2000);//Airport LS
	AddStaticVehicleEx(487,1963.29,-2647.07,13.76,21.93,-1,-1, 2000); // Maverick
	AddStaticVehicleEx(487,1948.81,-2647.30,13.68,21.93,-1,-1, 2000); // Maverick
	*/


	// VIP garage
	VIPVehicles[0] = AddStaticVehicleEx(411,-4365.93212891,839.28680420,986.18029785,0.00000000,-1,-1,180); //Infernus
	VIPVehicles[1] = AddStaticVehicleEx(429,-4370.52832031,840.57843018,986.13031006,0.00000000,-1,-1,180); //Banshee
	VIPVehicles[2] = AddStaticVehicleEx(451,-4374.41894531,840.36810303,986.14465332,0.00000000,-1,-1,180); //Turismo
	VIPVehicles[3] = AddStaticVehicleEx(541,-4378.48046875,840.84783936,986.08032227,0.00000000,-1,-1,180); //Bullet
	VIPVehicles[4] = AddStaticVehicleEx(559,-4382.43701172,840.60235596,986.13439941,0.00000000,-1,-1,180); //Jester
	VIPVehicles[5] = AddStaticVehicleEx(560,-4386.68066406,841.29382324,986.18530273,0.00000000,-1,-1,180); //Sultan
	VIPVehicles[6] = AddStaticVehicleEx(603,-4390.54345703,841.60748291,986.38299561,0.00000000,-1,-1,180); //Phoenix
	VIPVehicles[7] = AddStaticVehicleEx(480,-4394.61035156,841.88873291,986.23028564,0.00000000,-1,-1,180); //Comet
	VIPVehicles[8] = AddStaticVehicleEx(506,-4399.16455078,842.31146240,986.17242432,0.00000000,-1,-1,180); //Super GT
	VIPVehicles[9] = AddStaticVehicleEx(587,-4402.89990234,842.34979248,986.19030762,0.00000000,-1,-1,180); //Euros
	VIPVehicles[10] = AddStaticVehicleEx(411,-4407.21337891,842.98492432,986.18029785,0.00000000,-1,-1,180); //Infernus
	VIPVehicles[11] = AddStaticVehicleEx(429,-4410.96923828,843.07391357,986.13031006,0.00000000,-1,-1,180); //Banshee
	VIPVehicles[12] = AddStaticVehicleEx(451,-4415.64257812,843.46972656,986.14465332,0.00000000,-1,-1,180); //Turismo
	VIPVehicles[13] = AddStaticVehicleEx(541,-4419.40478516,843.48645020,986.08032227,0.00000000,-1,-1,180); //Bullet
	VIPVehicles[14] = AddStaticVehicleEx(559,-4423.40332031,843.19854736,986.13439941,0.00000000,-1,-1,180); //Jester
	VIPVehicles[15] = AddStaticVehicleEx(560,-4427.88232422,843.82849121,986.18530273,0.00000000,-1,-1,180); //Sultan
	VIPVehicles[16] = AddStaticVehicleEx(603,-4431.95849609,844.09509277,986.38299561,0.00000000,-1,-1,180); //Phoenix
	VIPVehicles[17] = AddStaticVehicleEx(480,-4436.15429688,844.76721191,986.23028564,0.00000000,-1,-1,180); //Comet
	VIPVehicles[18] = AddStaticVehicleEx(506,-4441.21337891,850.94598389,986.17242432,270.00000000,-1,-1,180); //Super GT
	VIPVehicles[19] = AddStaticVehicleEx(587,-4441.05224609,854.70550537,986.19030762,270.00000000,-1,-1,180); //Euros
	VIPVehicles[20] = AddStaticVehicleEx(522,-4418.77490234,858.65576172,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[21] = AddStaticVehicleEx(522,-4414.77441406,858.50390625,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[22] = AddStaticVehicleEx(522,-4410.77441406,858.35253906,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[23] = AddStaticVehicleEx(522,-4406.30957031,857.78234863,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[24] = AddStaticVehicleEx(522,-4394.11425781,856.77416992,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[25] = AddStaticVehicleEx(522,-4390.35644531,856.70147705,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[26] = AddStaticVehicleEx(522,-4386.21923828,856.22369385,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[27] = AddStaticVehicleEx(522,-4382.18164062,855.81323242,986.04071045,180.00000000,-1,-1,180); //NRG-500
	VIPVehicles[28] = AddStaticVehicleEx(522,-4417.77832031,876.99304199,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[29] = AddStaticVehicleEx(522,-4414.06494141,876.46301270,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[30] = AddStaticVehicleEx(522,-4409.78320312,876.41296387,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[31] = AddStaticVehicleEx(522,-4405.26074219,876.33081055,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[32] = AddStaticVehicleEx(522,-4393.28417969,875.69360352,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[33] = AddStaticVehicleEx(522,-4389.04248047,875.41735840,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[34] = AddStaticVehicleEx(522,-4385.04980469,875.21435547,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[35] = AddStaticVehicleEx(522,-4381.05761719,875.00488281,986.04071045,0.00000000,-1,-1,180); //NRG-500
	VIPVehicles[36] = AddStaticVehicleEx(411,-4407.94287109,891.34375000,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[37] = AddStaticVehicleEx(411,-4403.66748047,891.17761230,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[38] = AddStaticVehicleEx(411,-4399.91601562,891.28747559,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[39] = AddStaticVehicleEx(411,-4395.91601562,891.31347656,986.18029785,180.00000000,-1,-1,180); //Infernus
	VIPVehicles[40] = AddStaticVehicleEx(451,-4391.23242188,891.03985596,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[41] = AddStaticVehicleEx(451,-4387.48339844,891.00421143,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[42] = AddStaticVehicleEx(451,-4383.49218750,890.44665527,986.14465332,180.00000000,-1,-1,180); //Turismo
	VIPVehicles[43] = AddStaticVehicleEx(429,-4374.92187500,890.17211914,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[44] = AddStaticVehicleEx(429,-4370.80273438,889.91503906,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[45] = AddStaticVehicleEx(429,-4379.33349609,890.09112549,986.13031006,180.00000000,-1,-1,180); //Banshee
	VIPVehicles[46] = AddStaticVehicleEx(560,-4366.63867188,889.44537354,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[47] = AddStaticVehicleEx(560,-4358.66015625,888.96386719,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[48] = AddStaticVehicleEx(560,-4354.67675781,888.44500732,986.18530273,180.00000000,-1,-1,180); //Sultan
	VIPVehicles[49] = AddStaticVehicleEx(560,-4362.83789062,889.30908203,986.18530273,180.00000000,-1,-1,180); //Sultan
	
	//Sultan
	FamedVehicles[0] = AddStaticVehicleEx(560,2515.6797,2381.6501,3.9175,90.5219,-1,-1,180);
	FamedVehicles[1] = AddStaticVehicleEx(560,2515.9753,2372.6431,3.9167,89.3516,-1,-1,180);
	FamedVehicles[2] = AddStaticVehicleEx(560,2515.2947,2363.1985,3.9228,89.3915,-1,-1,180);
	//Cheetah
	FamedVehicles[3] = AddStaticVehicleEx(415,2515.2170,2377.3411,3.9823,90.2256,-1,-1,180);
	FamedVehicles[4] = AddStaticVehicleEx(415,2515.2529,2368.2183,3.9826,90.2256,-1,-1,180);
	//NRG
	FamedVehicles[5] = AddStaticVehicleEx(522,2498.9292,2363.5708,3.7897,242.9848,-1,-1,180);
	FamedVehicles[6] = AddStaticVehicleEx(522,2499.3206,2366.6091,3.8081,242.9848,-1,-1,180);
	FamedVehicles[7] = AddStaticVehicleEx(522,2499.4883,2370.2681,3.8290,242.9847,-1,-1,180);
	FamedVehicles[8] = AddStaticVehicleEx(522,2499.3398,2382.6699,3.8842,242.9847,-1,-1,180);
	FamedVehicles[9] = AddStaticVehicleEx(522,2499.2588,2385.4790,3.7989,242.9847,-1,-1,180);
	FamedVehicles[10] = AddStaticVehicleEx(522,2499.0728,2390.9985,3.8373,242.9846,-1,-1,180);
	//PCJ
	FamedVehicles[11] = AddStaticVehicleEx(461,2494.5908,2353.1921,3.7971,328.9557,-1,-1,180);
	FamedVehicles[12] = AddStaticVehicleEx(461,2497.6455,2352.8145,3.7880,328.9523,-1,-1,180);
	FamedVehicles[13] = AddStaticVehicleEx(461,2501.5059,2352.7971,3.7973,328.9482,-1,-1,180);
	FamedVehicles[14] = AddStaticVehicleEx(461,2506.0073,2352.9568,3.7935,328.9489,-1,-1,180);
	//Comets
	FamedVehicles[15] = AddStaticVehicleEx(480,2524.4268,2381.5957,3.9851,269.3853,-1,-1,180);
	FamedVehicles[16] = AddStaticVehicleEx(480,2524.3342,2372.9875,3.9898,269.3844,-1,-1,180);
	FamedVehicles[17] = AddStaticVehicleEx(480,2524.2336,2363.5969,3.9947,269.3852,-1,-1,180);
	//Bullet
	FamedVehicles[18] = AddStaticVehicleEx(541,2524.1758,2377.0989,3.8359,269.6020,-1,-1,180);
	FamedVehicles[19] = AddStaticVehicleEx(541,2524.1130,2368.1453,3.8404,269.6032,-1,-1,180);
	//Jester
	FamedVehicles[20] = AddStaticVehicleEx(559,2542.2134,2381.6531,3.8673,89.7158,-1,-1,180);
	FamedVehicles[21] = AddStaticVehicleEx(559,2541.9707,2372.5603,3.8675,89.7158,-1,-1,180);
	//SuperGT
	FamedVehicles[22] = AddStaticVehicleEx(506,2541.7937,2367.7646,3.9154,89.7431,-1,-1,180);
	FamedVehicles[23] = AddStaticVehicleEx(506,2541.8357,2377.2507,3.9155,89.7431,-1,-1,180);
	//Banshee
	FamedVehicles[24] = AddStaticVehicleEx(429,2542.5437,2363.3955,3.8906,90.2345,-1,-1,180);
	//Infernus
	FamedVehicles[25] = AddStaticVehicleEx(411,2510.7610,2397.8477,3.9380,180.5807,-1,-1,180);
	FamedVehicles[26] = AddStaticVehicleEx(411,2519.9934,2397.9417,3.9424,180.5807,-1,-1,180);
	//Uranus
	FamedVehicles[27] = AddStaticVehicleEx(558,2515.1958,2398.0537,3.8412,179.9306,-1,-1,180);
	FamedVehicles[28] = AddStaticVehicleEx(558,2524.5942,2397.4172,3.8415,179.9293,-1,-1,180);
	//Huntley
	FamedVehicles[31] = AddStaticVehicleEx(579,2528.9141,2397.9255,4.1505,179.4067,-1,-1,180);
	FamedVehicles[32] = AddStaticVehicleEx(579,2537.8970,2397.8325,4.1541,179.4066,-1,-1,180);
	//Premier
	FamedVehicles[33] = AddStaticVehicleEx(426,2533.3384,2397.8184,3.9538,179.7989,-1,-1,180);
	FamedVehicles[34] = AddStaticVehicleEx(426,2542.4468,2397.7859,3.9583,179.8030,-1,-1,180);
	//Sanchez
	FamedVehicles[35] = AddStaticVehicleEx(468,2508.5623,2352.0640,3.8801,327.8297,-1,-1,180);
	FamedVehicles[36] = AddStaticVehicleEx(468,2512.6743,2352.0581,3.8747,327.8297,-1,-1,180);
	FamedVehicles[37] = AddStaticVehicleEx(468,2513.9478,2351.9365,3.8822,327.8291,-1,-1,180);
	FamedVehicles[38] = AddStaticVehicleEx(468,2516.2051,2352.1504,3.8789,327.8291,-1,-1,180);
	

	/*AddStaticVehicleEx(593,1402.44238281,-2428.44042969,14.10486984,180.00000000,-1,-1,2000); Dodo - 255
	AddStaticVehicleEx(593,1418.70190430,-2427.98681641,14.10486984,180.00000000,-1,-1,2000); Dodo
	AddStaticVehicleEx(593,1433.76721191,-2427.92626953,14.10486984,180.00000000,-1,-1,2000); Dodo*/
	AddStaticVehicleEx(509,1702.7448,-1884.2257,13.0817,291.3965,-1,-1,2000); // BIKENEWBIESPAWN1
	AddStaticVehicleEx(509,1702.6656,-1882.6167,13.0815,298.5609,-1,-1,2000); // BIKENEWBIESPAWN2
	AddStaticVehicleEx(509,1702.5789,-1881.3337,13.0545,289.8956,-1,-1,2000); // BIKENEWBIESPAWN3
	AddStaticVehicleEx(509,1702.5829,-1879.5234,13.0822,296.3651,-1,-1,2000); // BIKENEWBIESPAWN4
	AddStaticVehicleEx(509,1702.6434,-1877.2375,13.0821,302.0038,-1,-1,2000); // BIKENEWBIESPAWN5
	AddStaticVehicleEx(481,1727.4503,-1885.0702,13.0807,65.2583,-1,-1,2000); // BIKENEWBIESPAWN6
	AddStaticVehicleEx(481,1727.5376,-1882.7361,13.0772,66.9472,-1,-1,2000); // BIKENEWBIESPAWN7
	AddStaticVehicleEx(481,1727.2814,-1880.4712,13.0770,65.2958,-1,-1,2000); // BIKENEWBIESPAWN8
	AddStaticVehicleEx(481,1727.7151,-1877.8586,13.0783,65.9359,-1,-1,2000); // BIKENEWBIESPAWN9
	AddStaticVehicleEx(481,1727.5710,-1875.3071,13.0782,70.6519,-1,-1,2000); // BIKENEWBIESPAWN10

	AddStaticVehicleEx(538,1700.7551,-1953.6531,14.8756,200.0,-1,-1,2000); //LS passenger
	print("[Streamer] Dynamic Static Vehicles have been loaded.");
	return 1;
}