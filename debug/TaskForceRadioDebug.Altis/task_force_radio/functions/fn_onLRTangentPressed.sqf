private["_radio"];
if (!(TF_tangent_lr_pressed) and {alive player} and {call TFAR_fnc_haveLRRadio}) then {
	if (call TFAR_fnc_isAbleToUseRadio) then {
		call TFAR_fnc_unableToUseHint;
	} else {
		if ([player, player call TFAR_fnc_vehicleIsIsolatedAndInside, player call TFAR_fnc_eyeDepth] call TFAR_fnc_canUseLRRadio) then {
			_radio = call TFAR_fnc_activeLrRadio;
			
			[format[localize "STR_transmit",format ["%1<img size='1.5' image='%2'/>",[_radio select 0, "displayName"] call TFAR_fnc_getLrRadioProperty,
				getText(configFile >> "CfgVehicles"  >> typeof (_radio select 0) >> "picture")],(_radio call TFAR_fnc_getLrChannel) + 1, call TFAR_fnc_currentLRFrequency],
			format["TANGENT_LR	PRESSED	%1%2	%3	%4", call TFAR_fnc_currentLRFrequency, _radio call TFAR_fnc_getLrRadioCode, ([_radio select 0, "tf_range"] call TFAR_fnc_getLrRadioProperty)  * (call TFAR_fnc_getTransmittingDistanceMultiplicator), [_radio select 0, "tf_subtype"] call TFAR_fnc_getLrRadioProperty],
			-1
			] call TFAR_fnc_ProcessTangent;
			TF_tangent_lr_pressed = true;
		} else {
			call TFAR_fnc_inWaterHint;
		}
	};
};
true