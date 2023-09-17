CMD:sendstatus(playerid, params[])
{
if(admin_level[playerid] < 8 || !admin_logged[playerid]) return 1;
   extract params -> new MODE; else return SendClientMessage(playerid, col_grey, !"Use: /sendstatus [Mode]");
new string[250];
#define svip    		"5.**.**.**"// Enter Server IP
#define svport     		"7777" // Enter Server Port
#define svtoken     	"6200065625:AAGW8GsddwdadwdYO06my_6j_KoG1c" // Enter Token Telegram Bot
#define svchannel     	"-1001754290452"// Enter Group Or Channel ID (example : @Telegram Or -1001754290192)
        format(string, sizeof string, "api.silosv.fun/samp/samp.php?ip=%s&port=%s&token=%s&channel=%s&mode=%d", svip, svport, svtoken, svchannel, MODE);
	HTTP(playerid, HTTP_GET, string, "", "SendStatus");

return 1;
}
forward  SendStatus(index, response_code, data[],playerid);
public SendStatus(index, response_code, data[],playerid)
{
    new
        buffer[128];
    if (response_code == 200)
    {
        //Yes!
        format(buffer, sizeof(buffer), "%s", data);
        SendClientMessage(playerid, col_yellow, buffer);
    }
    else
    {
        //No!
        format(buffer, sizeof(buffer), "%s", data);
        SendClientMessage(playerid, col_yellow, buffer);
    }
}// https://github.com/ProPawno/SA-MP-StatusBot //
