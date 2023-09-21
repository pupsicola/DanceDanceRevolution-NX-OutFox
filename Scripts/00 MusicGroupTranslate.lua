function mySortGroupName(group)
	local ret="";
		if group == "DanceDanceRevolution 1stMIX" or group == "01 - DDR 1st" then
					ret="Version/DDR 1st";
				elseif group == "DanceDanceRevolution 2ndMIX" or group == "02 - DDR 2ndMIX" then
					ret="Version/2ndMIX";
				elseif group == "DanceDanceRevolution 3rdMIX + VER.Korea" or group == "DanceDanceRevolution 3rdMIX" or group == "03 - DDR 3rdMIX" then
					ret="Version/3rdMIX";
				elseif group == "DanceDanceRevolution 4thMIX" or group == "04 - DDR 4thMIX" then
					ret="Version/4thMIX";
				elseif group == "DanceDanceRevolution 5thMIX" or group == "05 - DDR 5thMIX" then
					ret="Version/5thMIX";
				elseif group == "DanceDanceRevolution 6thMIX MAX" or group == "06 - DDR MAX" then
					ret="Version/MAX";
				elseif group == "DanceDanceRevolution 7thMIX MAX2" or group == "07 - DDR MAX2" then
					ret="Version/MAX2";
				elseif group == "DanceDanceRevolution 8thMIX EXTREME" or group == "08 - DDR EXTREME" then
					ret="Version/EXTREME";
				elseif group == "DanceDanceRevolution SuperNOVA" or group == "09 - DDR SuperNOVA" then
					ret="Version/SuperNOVA";
				elseif group == "DanceDanceRevolution SuperNOVA2" or group == "10 - DDR SuperNOVA2" then
					ret="Version/SuperNOVA2";
				elseif group == "DanceDanceRevolution X" or group == "11 - DDR X" then
					ret="Version/X";
				elseif group == "DanceDanceRevolution X2" or group == "12 - DDR X2" then
					ret="Version/X2";
				elseif group == "DanceDanceRevolution X3" or group == "DanceDanceRevolution X3 VS 2ndMIX" or group == "13 - DDR X3 vs 2ndMIX" then
					ret="Version/X3 vs 2ndMIX";
				elseif group == "DDR 2013" or group == "14 - DDR 2013" then
					ret="Version/DDR 2013";
				elseif group == "DDR 2014" or group == "15 - DDR 2014" then
					ret="Version/DDR 2014";
				elseif group == "DDR A" or group == "16 - DDR A" then
					ret="Version/DDR A";
				elseif group == "00 - ORIGINAL SONG FILE"  then
					ret="Version/Edit"
				elseif group == "00A - DDR console Exclusive" then
					ret="Version/Consumer"
				else
					ret = group;
				end
	return ret;
end

function TranslateGroupName(group)

	
	local ret="";
	if group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
		ret = "DDR 1st";
	elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
		ret = "DDR 2ndMIX";
	elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
		ret = "DDR 3rdMIX";
	elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
		ret = "DDR 4thMIX";
	elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then
		ret = "DDR 5thMIX";
	elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then
		ret = "DDR MAX";
	elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then
		ret = "DDR MAX2";
	elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then
		ret = "DDR EXTREME";
	elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then
		ret = "DDR SuperNOVA";
	elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then
		ret = "DDR SuperNOVA2";
	elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then
		ret = "DDR X";
	elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then
		ret = "DDR X2";
	elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then
		ret = "DDR X3 vs 2ndMIX";
	elseif group=='DDR 2013' or group=='14 - DDR 2013'  then
		ret = "DanceDanceRevolution (2013)";
	elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
		ret = "DanceDanceRevolution";
	elseif group=='DDR A' or group=='16 - DDR A'  then
		ret = "DanceDanceRevolution A";
	elseif group=='00 - ORIGINAL SONG FILE'  then
		ret = "Original Edit";
	elseif group=='00A - DDR console Exclusive'  then
		ret = "Consumer Exclusive";	
	
	elseif group =='0-9' then
		ret = "Numbers & Symbols";
	elseif group=='000-019' then
		ret = "0";
	elseif group=='020-039' then
		ret = "20";
	elseif group=='040-059' then
		ret = "40";
	elseif group=='060-079' then
		ret = "60";	
	elseif group=='080-099' then
		ret = "80";
		
	elseif group=='100-119' then
		ret = "100";
	elseif group=='120-139' then
		ret = "120";
	elseif group=='140-159' then
		ret = "140";
	elseif group=='160-179' then
		ret = "160";	
	elseif group=='180-199' then
		ret = "180";
		
	elseif group=='200-219' then
		ret = "200";
	elseif group=='220-239' then
		ret = "220";
	elseif group=='240-259' then
		ret = "240";
	elseif group=='260-279' then
		ret = "260";
	elseif group=='280-299' then
		ret = "280";
		
	elseif group=='300-319' then
		ret = "300";
	elseif group=='320-339' then
		ret = "320";
	elseif group=='340-359' then
		ret = "340";
	elseif group=='360-379' then
		ret = "360";	
	elseif group=='380-399' then
		ret = "380";
		
	elseif group=='400-419' then
		ret = "400";
	elseif group=='420-439' then
		ret = "420";
	elseif group=='440-459' then
		ret = "440";
	elseif group=='460-479' then
		ret = "460";	
	elseif group=='480-499' then
		ret = "480";

	elseif group=='500-519' then
		ret = "500";
	elseif group=='520-539' then
		ret = "520";
	elseif group=='540-559' then
		ret = "540";
	elseif group=='560-579' then
		ret = "560";
	elseif group=='580-599' then
		ret = "580";

	elseif group=='600-619' then
		ret = "600";
	elseif group=='620-639' then
		ret = "620";
	elseif group=='640-659' then
		ret = "640";
	elseif group=='660-679' then
		ret = "660";
	elseif group=='680-699' then
		ret = "680";

	elseif group=='700-719' then
		ret = "700";
	elseif group=='720-739' then
		ret = "720";
	elseif group=='740-759' then
		ret = "740";
	elseif group=='760-779' then
		ret = "760";	
	elseif group=='780-799' then
		ret = "780";

	elseif group=='800-819' then
		ret = "800";
	elseif group=='820-839' then
		ret = "820";
	elseif group=='840-859' then
		ret = "840";
	elseif group=='860-879' then
		ret = "860";
	elseif group=='880-899' then
		ret = "880";

	elseif group=='900-919' then
		ret = "900";
	elseif group=='920-939' then
		ret = "920";
	elseif group=='940-959' then
		ret = "940";
	elseif group=='960-979' then
		ret = "960";
	elseif group=='980-999' then
		ret = "980";
		
	elseif group=='1000-1019' then
		ret = "1000";
	
	elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" then
		ret = "AAA";
	elseif group==" AAA x 9" or group==" AAA x 8" or group==" AAA x 7" or group==" AAA x 6" or group==" AAA x 5" or group==" AAA x 4" or group==" AAA x 3" or group==" AAA x 2" or group==" AAA x 1" then
		ret = "AA";
	elseif group=="  AA x 9" or group=="  AA x 8" or group=="  AA x 7" or group=="  AA x 6" or group=="  AA x 5" or group=="  AA x 4" or group=="  AA x 3" or group=="  AA x 2" or group=="  AA x 1" then
		ret = "A";
	elseif group=="   A x 9" or group=="   A x 8" or group=="   A x 7" or group=="   A x 6" or group=="   A x 5" or group=="   A x 4" or group=="   A x 3" or group=="   A x 2" or group=="   A x 1" then
		ret = "B";
	elseif group=="   B x 9" or group=="   B x 8" or group=="   B x 7" or group=="   B x 6" or group=="   B x 5" or group=="   B x 4" or group=="   B x 3" or group=="   B x 2" or group=="   B x 1" then
		ret = "C";
	elseif group=="   C x 9" or group=="   C x 8" or group=="   C x 7" or group=="   C x 6" or group=="   C x 5" or group=="   C x 4" or group=="   C x 3" or group=="   C x 2" or group=="   C x 1" then
		ret = "D";
	elseif group=="   D x 9" or group=="   D x 8" or group=="   D x 7" or group=="   D x 6" or group=="   D x 5" or group=="   D x 4" or group=="   D x 3" or group=="   D x 2" or group=="   D x 1" then
		ret = "D";
		
		
	elseif group == "GUMI" then
		ret = "GUMI 5th anniversary"
	elseif group=="HinaBitter" then
		ret = "HINA Bitter"
	
	
	else
		ret = group;
	end
	return ret;
end

function myLoadGroupJacket(group, self)
	local so = GAMESTATE:GetSortOrder();
	local seltype = SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedType();
	
	if so =="SortOrder_Genre" then
		if seltype == "WheelItemDataType_Roulette" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","roulette banner frame"));
		elseif seltype == "WheelItemDataType_Random" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","random banner frame"));
		elseif seltype == "WheelItemDataType_Portal" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","random banner frame"));
		elseif group=='beatmaniaIIDX' or group=='beatmania IIDX' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","beatmania IIDX"));
		elseif group=='jubeat' or group=='Jubeat' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","jubeat"));
		elseif group=='GITADORA' or group=='GFDM' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","GITADORA"));
		elseif group=='FutureTomTom'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","FutureTomTom"));
		elseif group == "pop'n music"  or group == "popn music" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","popn music"));
		elseif group=='REFLEC BEAT' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","REFLEC BEAT"));
		elseif group == "SOUND VOLTEX"  or group == "SDVX" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","SOUND VOLTEX"));
		elseif group=='Dance Evolution' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("genre jacket","Dance Evolution"));
		elseif group == "Pop"  or group == "POP"  or group == "Pop" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","Pop"));
		elseif group == "Anime/Game"  or group == "AnimeGame"  or group == "Anime"  or group == "Game" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","AnimeGame"));
		elseif group=='Variety' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","Variety"));
		elseif group == "U.M.U. x BEMANI"  or group == "UMU" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","UMU"));
		elseif group == "KONAMI originals"  or group == "KONAMI" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","KONAMI"));
		elseif group == "GUMI 5th anniversary" or group == "GUMI" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","GUMI"));
		elseif group=='BEMANI Academy' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","BEMANI Academy"));
		elseif group == "BEMANI STADIUM" or group == "BEMANI Stadium" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","BEMANI STADIUM"));
		elseif group=="HinaBitter" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","HinaBitter"));
		elseif group == "BEMANI x TOHO project" or group == "BEMANI x TOHO" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","BEMANI x TOHO project"));
		elseif group == "Dancemania"  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","Dancemania"));
		elseif group == "Electronic" or group == "Electronics" then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","Electronic"));
		elseif group=='DDR' or group=='DanceDanceRevolution' then
			if so=='SortOrder_Genre' then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("genre jacket","DDR"));
			elseif so=='SortOrder_Group' then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group jacket","DDR 1st"));
			end;
		elseif FILEMAN:DoesFileExist("Themes/Genres/genre jacket "..group..".png") then
			self:LoadBackground(THEME:GetPathG("","../../Genres/genre jacket "..group..".png"));
		elseif FILEMAN:DoesFileExist("Themes/Genres/genre jacket "..group..".jpg") then
			self:LoadBackground(THEME:GetPathG("","../../Genres/genre jacket "..group..".jpg"));
		else
			self:Load( THEME:GetPathG("","_No banner") );
		end
		self:diffusealpha(1);
	else
		if group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 1st"));
		elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 2ndMIX"));
		elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 3rdMIX"));
		elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 4thMIX"));	
		elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 5thMIX"));	
		elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR MAX1"));	
		elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR MAX2"));	
		elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR EXTREME"));	
		elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR SuperNOVA1"));
		elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR SuperNOVA2"));
		elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR X1"));
		elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR X2"));
		elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR X3vs2ndMIX"));
		elseif group=='DDR 2013' or group=='14 - DDR 2013'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 2013"));
		elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR 2014"));
		elseif group=='DDR A' or group=='16 - DDR A'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","DDR A"));
		elseif group=='00 - ORIGINAL SONG FILE'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","Edit"));
		elseif group=='00A - DDR console Exclusive'  then
		self:diffusealpha(1);
		self:Load(THEME:GetPathG("group jacket","CS"));

		elseif group=='DDR' or group=='DanceDanceRevolution' then
			if so=='SortOrder_Genre' then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("genre jacket","DDR"));
			elseif so=='SortOrder_Group' then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group jacket","DDR 1st"));
			end;
		elseif seltype == "WheelItemDataType_Roulette" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","roulette banner frame"));
		elseif seltype == "WheelItemDataType_Random" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","random banner frame"));
		elseif seltype == "WheelItemDataType_Portal" then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("__Ext","random banner frame"));
			
		elseif group =='0-9' or group=='000-019' or group=='020-039' or group=='040-059' or group=='060-079' or group=='080-099' or group=='100-119' or
			   group=='120-139' or group=='140-159' or group=='160-179' or group=='180-199' or group=='200-219' or group=='220-239' or group=='240-259' or
			   group=='260-279' or group=='280-299' or group=='300-319' or group=='320-339' or group=='340-359' or group=='360-379' or group=='380-399' or
			   group=='400-419' or group=='420-439' or group=='440-459' or group=='460-479' or group=='480-499' or group=='500-519' or group=='520-539' or
			   group=='540-559' or group=='560-579' or group=='580-599' or group=='600-619' or group=='620-639' or group=='640-659' or group=='660-679' or
			   group=='680-699' or group=='700-719' or group=='720-739' or group=='740-759' or group=='760-779' or group=='780-799' or group=='800-819' or
			   group=='820-839' or group=='840-859' or group=='860-879' or group=='880-899' or group=='900-919' or group=='920-939' or group=='940-959' or
			   group=='960-979' or group=='980-999' or group=='1000-1019' 
			   
				then
				if so == "SortOrder_BPM"then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group sort","BPM"));
				elseif so == "SortOrder_Title" then
				self:diffusealpha(1);
				self:Load(THEME:GetPathG("group sort","SongTitle"));
				end
		elseif so == "SortOrder_BeginnerMeter" or so == "SortOrder_EasyMeter" or so == "SortOrder_MediumMeter" or so == "SortOrder_HardMeter" or so == "SortOrder_ChallengeMeter"
		then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("group sort","Difficulty"));
		elseif so == "SortOrder_TopGrades"then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("group sort","Cleared Rank"));
		elseif so == "SortOrder_Title"then
			self:diffusealpha(1);
			self:Load(THEME:GetPathG("group sort","SongTitle"));
		elseif so == 'SortOrder_Group' then
			self:diffusealpha(1);
			self:LoadFromSongGroup(group);
		else
			self:Load(THEME:GetPathG("","Common fallback jacket"));
		end
	end
end;

function myLoadGroupNameGraphic(group, self)
	if group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","1st"));
	elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","2nd"));
	elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","3rd"));
	elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","4th"));	
	elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","5th"));	
	elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","MAX1"));	
	elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","MAX2"));	
	elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","Extreme"));	
	elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","SN1"));
	elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","SN2"));
	elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","X1"));
	elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","X2"));
	elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","X3"));
	elseif group=='DDR 2013' or group=='14 - DDR 2013'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","2013"));
	elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","DDR_word"));
	elseif group=='DDR A' or group=='16 - DDR A'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","DDR_A"));
	elseif group=='00 - ORIGINAL SONG FILE'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","Original"));
	elseif group=='00A - DDR console Exclusive'  then
	self:diffusealpha(1);
	self:Load(THEME:GetPathG("group name","CS"));
	else
	self:diffusealpha(0);
	end;
end;
