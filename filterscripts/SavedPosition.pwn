/*
    Filterscript desenvolvida por Nardex

    Esta filterscript serve para salvar a posicao
    do player e do veiculo.

    Comandos:
    /savepos
    /saveveh
*/

#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>

public OnFilterScriptInit()
{
    print("Filterscript 'SavedPosition' carregado com sucesso.");
    print("Creditos: Nardex");
    return 1;
}

public OnFilterScriptExit()
{
    print("Filterscript 'SavedPosition' descarregado.");
    return 1;
}

CMD:savepos(playerid, params[])
{
    new
        Float:PosX,
        Float:PosY,
        Float:PosZ,
        Float:PosA,
        AddPos[256];

    GetPlayerPos(playerid, PosX, PosY, PosZ);
    GetPlayerFacingAngle(playerid, PosA);

    if(isnull(params))
        format(AddPos, sizeof(AddPos), "%.4f, %.4f, %.4f, %.4f\r\n",
            PosX, PosY, PosZ, PosA);
    else
        format(AddPos, sizeof(AddPos), "%.4f, %.4f, %.4f, %.4f // %s\r\n",
            PosX, PosY, PosZ, PosA, params);

    new File:LogSave = fopen("SavesPlayers/Position.txt", io_append);
    if(LogSave)
    {
        fwrite(LogSave, AddPos);
        fclose(LogSave);
    }

    SendClientMessage(playerid, -1,
        "{3B7500}[ > ] {FFFFFF}Coordenadas salvas com sucesso no arquivo {FFFF00}'Position.txt'");
    return 1;
}

CMD:saveveh(playerid, params[])
{
    if(!IsPlayerInAnyVehicle(playerid))
        return SendClientMessage(playerid, 0xFF0000FF,
            "[ ERRO ] Para usar este comando voce precisa estar dentro de um veiculo.");

    new
        Float:VehX,
        Float:VehY,
        Float:VehZ,
        Float:VehA,
        AddVehicle[256];

    new vehicleid = GetPlayerVehicleID(playerid);

    GetVehiclePos(vehicleid, VehX, VehY, VehZ);
    GetVehicleZAngle(vehicleid, VehA);

    if(isnull(params))
        format(AddVehicle, sizeof(AddVehicle), "%.4f, %.4f, %.4f, %.4f\r\n",
            VehX, VehY, VehZ, VehA);
    else
        format(AddVehicle, sizeof(AddVehicle), "%.4f, %.4f, %.4f, %.4f // %s\r\n",
            VehX, VehY, VehZ, VehA, params);

    new File:LogVehicle = fopen("SavesPlayers/Vehicle.txt", io_append);
    if(LogVehicle)
    {
        fwrite(LogVehicle, AddVehicle);
        fclose(LogVehicle);
    }

    SendClientMessage(playerid, -1,
        "{3B7500}[ > ] {FFFFFF}Coordenadas do veiculo salvas com sucesso no arquivo {FFFF00}'Vehicle.txt'");
    return 1;
}