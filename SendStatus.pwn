CMD:sendstats(playerid)
{
if(admin_level[playerid] < 8 || !admin_logged[playerid]) return 1;
new string[250];
#define svip    		"5.42.223.240"// Enter Server IP
#define svport     		"7777" // Enter Server Port
#define svtoken     	"6200065625:AAGW8Gmmya-mqEdeh933YO06my_6j_KoG1c" // Enter Token Telegram Bot
#define svchannel     	"-1001754290192"// Enter Group Or Channel ID (example : @Telegram Or -1001754290192)
#define svmode          "2"//Mode Massage | Mode 1 = Text | Mode 2 = Inline Buttom
        format(string, sizeof string, "api.silosv.fun/samp/samp.php?ip=%s&port=%s&token=%s&channel=%s&mode=%s", svip, svport, svtoken, svchannel, svmode); //By ProPawno | https://github.com/ProPawno/SA-MP-StatusBot
	    HTTP(playerid, HTTP_GET, string, "", "statsbot");
SendClientMessage(playerid, 0xFFFFFFFF, string);
return 1;
}
forward  statsbot(index, response_code, data[],playerid);
public statsbot(index, response_code, data[],playerid)
{
    new
        buffer[128];
    if (response_code == 200)
    {
        //Yes
        format(buffer, sizeof(buffer), "%s", data);
        SendClientMessage(playerid, col_yellow, buffer);
    }
    else
    {
        //No
        format(buffer, sizeof(buffer), "%s", data);
        SendClientMessage(playerid, col_yellow, buffer);
    }
}
