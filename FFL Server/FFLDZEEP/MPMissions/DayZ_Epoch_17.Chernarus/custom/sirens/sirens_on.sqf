_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

If (!_inVehicle) then {
    sirensOn = 0;
};
if (isnil ("sirensOn")) then {
    sirensOn = 0;
};
if (sirensOn == 0) then {
	sirensOn = 1;
	dayz_addsirens removeAction s_player_sirens_on; //Remove ON option
        cutText ["Sirens ON!","PLAIN DOWN"];
};
while {sirensOn == 1} do {
	If (_inVehicle and (driver _vehicle == player)) then {
	_nul = [objNull, _vehicle, rSAY, "siren", 120] call RE;
	[_vehicle, 200, true, (getPosATL _vehicle)] spawn player_alertZombies;
	for "_i" from 1 to 12 do {
	player action ["lightOn", _vehicle];
	sleep 0.2;
	player action ["lightOff", _vehicle];
	sleep 0.2;
	};
	sleep 0.2;
	} else {
	sirensOn = 0;
	};
};