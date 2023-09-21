--[[
    TODO: This is way too expensive to run four times on every single wheel item.
]]

NXCachedGroupAreas = {}

function LoadFromSelectionBG(group, so)
	local selectedGroupFile = SONGMAN:GetSongGroupBannerPath(group)
    -- local GradesRegexMatch = 
    local shortcutNames = {
        -- BPMS
        ['000-019'] = {'bpm',"000"},
        ['020-039'] = {'bpm',"020"},
        ['040-059'] = {'bpm',"040"},
        ['060-079'] = {'bpm',"060"},
        ['080-099'] = {'bpm',"080"},
        ['100-119'] = {'bpm',"100"},
        ['120-139'] = {'bpm',"120"},
        ['140-159'] = {'bpm',"140"},
        ['160-179'] = {'bpm',"160"},
        ['180-199'] = {'bpm',"180"},
        ['200-219'] = {'bpm',"200"},
        ['220-239'] = {'bpm',"220"},
        ['240-259'] = {'bpm',"240"},
        ['260-279'] = {'bpm',"260"},
        ['280-299'] = {'bpm',"280"},
        ['300-319'] = {'bpm',"300"},
        ['320-339'] = {'bpm',"320"},
        ['340-359'] = {'bpm',"340"},
        ['360-379'] = {'bpm',"360"},
        ['380-399'] = {'bpm',"380"},
        ['400-419'] = {'bpm',"400"},
        ['420-439'] = {'bpm',"420"},
        ['440-459'] = {'bpm',"440"},
        ['460-479'] = {'bpm',"460"},
        ['480-499'] = {'bpm',"480"},
        ['500-519'] = {'bpm',"500"},
        ['520-539'] = {'bpm',"520"},
        ['540-559'] = {'bpm',"540"},
        ['560-579'] = {'bpm',"560"},
        ['580-599'] = {'bpm',"580"},
        ['600-619'] = {'bpm',"600"},
        ['620-639'] = {'bpm',"620"},
        ['640-659'] = {'bpm',"640"},
        ['660-679'] = {'bpm',"660"},
        ['680-699'] = {'bpm',"680"},
        ['700-719'] = {'bpm',"700"},
        ['720-739'] = {'bpm',"720"},
        ['740-759'] = {'bpm',"740"},
        ['760-779'] = {'bpm',"760"},
        ['780-799'] = {'bpm',"780"},
        ['800-819'] = {'bpm',"800"},
        ['820-839'] = {'bpm',"820"},
        ['840-859'] = {'bpm',"840"},
        ['860-879'] = {'bpm',"860"},
        ['880-899'] = {'bpm',"880"},
        ['900-919'] = {'bpm',"900"},
        ['920-939'] = {'bpm',"920"},
        ['940-959'] = {'bpm',"940"},
        ['960-979'] = {'bpm',"960"},
        ['980-999'] = {'bpm',"980"},
        ['1000-1019'] = {'bpm','a1000'},

        -- Alphabetical
        ['A'] = {'title','A'},
        ['B'] = {'title','B'},
        ['C'] = {'title','C'},
        ['D'] = {'title','D'},
        ['E'] = {'title','E'},
        ['F'] = {'title','F'},
        ['G'] = {'title','G'},
        ['H'] = {'title','H'},
        ['I'] = {'title','I'},
        ['J'] = {'title','J'},
        ['K'] = {'title','K'},
        ['L'] = {'title','L'},
        ['M'] = {'title','M'},
        ['N'] = {'title','N'},
        ['O'] = {'title','O'},
        ['P'] = {'title','P'},
        ['Q'] = {'title','Q'},
        ['R'] = {'title','R'},
        ['S'] = {'title','S'},
        ['T'] = {'title','T'},
        ['U'] = {'title','U'},
        ['V'] = {'title','V'},
        ['W'] = {'title','W'},
        ['X'] = {'title','X'},
        ['Y'] = {'title','Y'},
        ['Z'] = {'title','Z'},
        ['0-9'] = {'title','0-9'}
    }
	if so =="SortOrder_Genre" then
		if group == "Pop" or group == "POP"  or group == "Pop" then
			selectedGroupFile = THEME:GetPathG("group jacket","Pop")
		elseif group == "Anime/Game"  or group == "AnimeGame"  or group == "Anime"  or group == "Game" then
			selectedGroupFile = THEME:GetPathG("group jacket","AnimeGame")
		elseif group == "Variety" then
			selectedGroupFile = THEME:GetPathG("group jacket","Variety")
		elseif group == "GUMI 5th anniversary"  or group == "GUMI" then
			selectedGroupFile = THEME:GetPathG("group jacket","GUMI")
		elseif group == "U.M.U. x BEMANI" or group == "UMU" then
			selectedGroupFile = THEME:GetPathG("group jacket","UMU")
		elseif group == "KONAMI originals" or group == "KONAMI" then
			selectedGroupFile = THEME:GetPathG("group jacket","KONAMI")
			
		elseif group == "beatmania IIDX" or group == "beatmaniaIIDX" then
			selectedGroupFile = THEME:GetPathG("group jacket series","IIDX")
		elseif group == "pop'n music" or group == "popn music" then
			selectedGroupFile = THEME:GetPathG("group jacket series","popn")
		elseif group == "GITADORA" then
			selectedGroupFile = THEME:GetPathG("group jacket series","GITADORA")
		elseif group == "jubeat" then
			selectedGroupFile = THEME:GetPathG("group jacket series","jubeat")
		elseif group == "REFLEC BEAT" then
			selectedGroupFile = THEME:GetPathG("group jacket series","RB")
		elseif group == "Dance Evolution" then
			selectedGroupFile = THEME:GetPathG("group jacket series","DanceEvolution")
		elseif group == "SOUND VOLTEX" or group == "SDVX" then
			selectedGroupFile = THEME:GetPathG("group jacket series","SDVX")
		elseif group == "FutureTomTom" then
			selectedGroupFile = THEME:GetPathG("group jacket series","FutureTomTom")
		elseif group == "DDR" then
			selectedGroupFile = THEME:GetPathG("group jacket series","DDR")
		elseif group == "BEMANI Academy" then
			selectedGroupFile = THEME:GetPathG("group jacket series","BEMANI Academy")
		elseif group == "BEMANI STADIUM" or group == "BEMANI Stadium" then
			selectedGroupFile = THEME:GetPathG("group jacket series","BEMANI STADIUM")
		elseif group == "HinaBitter" then
			selectedGroupFile = THEME:GetPathG("group jacket series","HinaBitter")
		elseif group == "BEMANI x TOHO project" or group == "BEMANI x TOHO" then
			selectedGroupFile = THEME:GetPathG("group jacket series","BEMANI x TOHO project")
		elseif group == "Dancemania" then
			selectedGroupFile = THEME:GetPathG("group jacket series","Dancemania")
		elseif group == "Electronic" or group == "Electronics" then
			selectedGroupFile = THEME:GetPathG("group jacket series","Electronic")
		elseif group=='N/A' or group=='- EMPTY -'then
			selectedGroupFile = THEME:GetPathG("group global","NA")
		elseif FILEMAN:DoesFileExist("Themes/Genres/"..group..".png") then
			selectedGroupFile = THEME:GetPathG("","../../Genres/"..group..".png")
		elseif FILEMAN:DoesFileExist("Themes/Genres/"..group..".jpg") then
			selectedGroupFile = THEME:GetPathG("","../../Genres/"..group..".jpg")
		else
			selectedGroupFile = THEME:GetPathG("group jacket","NA") 
		end
	elseif string.find(so,"Meter") then
		if group=='01' then
			selectedGroupFile = THEME:GetPathG("group diff","01")
		elseif group=='02' then
			selectedGroupFile = THEME:GetPathG("group diff","02")
		elseif group=='03' then
			selectedGroupFile = THEME:GetPathG("group diff","03")
		elseif group=='04' then
			selectedGroupFile = THEME:GetPathG("group diff","04")
		elseif group=='05' then
			selectedGroupFile = THEME:GetPathG("group diff","05")
		elseif group=='06' then
			selectedGroupFile = THEME:GetPathG("group diff","06")
		elseif group=='07' then
			selectedGroupFile = THEME:GetPathG("group diff","07")
		elseif group=='08' then
			selectedGroupFile = THEME:GetPathG("group diff","08")
		elseif group=='09' then
			selectedGroupFile = THEME:GetPathG("group diff","09")
		elseif group=='10' then
			selectedGroupFile = THEME:GetPathG("group diff","10")
		elseif group=='11' then
			selectedGroupFile = THEME:GetPathG("group diff","11")
		elseif group=='12' then
			selectedGroupFile = THEME:GetPathG("group diff","12")
		elseif group=='13' then
			selectedGroupFile = THEME:GetPathG("group diff","13")
		elseif group=='14' then
			selectedGroupFile = THEME:GetPathG("group diff","14")
		elseif group=='15' then
			selectedGroupFile = THEME:GetPathG("group diff","15")
		elseif group=='16' then
			selectedGroupFile = THEME:GetPathG("group diff","16")
		elseif group=='17' then
			selectedGroupFile = THEME:GetPathG("group diff","17")
		elseif group=='18' then
			selectedGroupFile = THEME:GetPathG("group diff","18")
		elseif group=='19' then
			selectedGroupFile = THEME:GetPathG("group diff","19")
		elseif group=='20' then
			selectedGroupFile = THEME:GetPathG("group diff","20")
		else
			selectedGroupFile =  THEME:GetPathG("group diff","NA") 
		end
	else
			
        local matchGroup = shortcutNames[group]
		if matchGroup then
            selectedGroupFile = THEME:GetPathG("group ".. matchGroup[1],matchGroup[2])
        -- TODO: Could be optimized with some regex
		elseif group=="AAAA x 9" or group=="AAAA x 8" or group=="AAAA x 7" or group=="AAAA x 6" or group=="AAAA x 5" or group=="AAAA x 4" or group=="AAAA x 3" or group=="AAAA x 2" or group=="AAAA x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","3A")
		elseif group==" AAA x 9" or group==" AAA x 8" or group==" AAA x 7" or group==" AAA x 6" or group==" AAA x 5" or group==" AAA x 4" or group==" AAA x 3" or group==" AAA x 2" or group==" AAA x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","2A")
		elseif group=="  AA x 9" or group=="  AA x 8" or group=="  AA x 7" or group=="  AA x 6" or group=="  AA x 5" or group=="  AA x 4" or group=="  AA x 3" or group=="  AA x 2" or group=="  AA x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","A")
		elseif group=="   A x 9" or group=="   A x 8" or group=="   A x 7" or group=="   A x 6" or group=="   A x 5" or group=="   A x 4" or group=="   A x 3" or group=="   A x 2" or group=="   A x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","B")
		elseif group=="   B x 9" or group=="   B x 8" or group=="   B x 7" or group=="   B x 6" or group=="   B x 5" or group=="   B x 4" or group=="   B x 3" or group=="   B x 2" or group=="   B x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","C")
		elseif group=="   C x 9" or group=="   C x 8" or group=="   C x 7" or group=="   C x 6" or group=="   C x 5" or group=="   C x 4" or group=="   C x 3" or group=="   C x 2" or group=="   C x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","D")
		elseif group=="   D x 9" or group=="   D x 8" or group=="   D x 7" or group=="   D x 6" or group=="   D x 5" or group=="   D x 4" or group=="   D x 3" or group=="   D x 2" or group=="   D x 1" then
			selectedGroupFile = THEME:GetPathG("group grade","D")
			
			
		elseif group=="???" then
			if so == "SortOrder_TopGrades" then
				selectedGroupFile = THEME:GetPathG("group cleared rank","unplayed")
			end;
		elseif group=='N/A' or group=='- EMPTY -'then
			selectedGroupFile = THEME:GetPathG("group global","NA")
		
		elseif group=='Nonstop'then
			selectedGroupFile = THEME:GetPathG("group COURSE","NORMAL")
		elseif group=='Oni'then
			selectedGroupFile = THEME:GetPathG("group COURSE","CHALLENGE")
		
		elseif group=='DanceDanceRevolution 1stMIX' or group=='01 - DDR 1st' then
		    selectedGroupFile = THEME:GetPathG("group","001 DDR")
		elseif group=='DanceDanceRevolution 2ndMIX' or group=='02 - DDR 2ndMIX' then
		    selectedGroupFile = THEME:GetPathG("group","002 DDR 2ndMIX")
		elseif group=='DanceDanceRevolution 3rdMIX' or group=='03 - DDR 3rdMIX' then
		    selectedGroupFile = THEME:GetPathG("group","003 DDR 3rdMIX")
		elseif group=='DanceDanceRevolution 4thMIX' or group=='04 - DDR 4thMIX'  then
            selectedGroupFile = THEME:GetPathG("group","004 DDR 4thMIX")
		elseif group=='DanceDanceRevolution 5thMIX' or group=='05 - DDR 5thMIX'  then
		    selectedGroupFile = THEME:GetPathG("group","005 DDR 5thMIX")
		elseif group=='DanceDanceRevolution 6thMIX MAX' or group=='06 - DDR MAX'  then
		    selectedGroupFile = THEME:GetPathG("group","006 DDRMAX")
		elseif group=='DanceDanceRevolution 7thMIX MAX2' or group=='07 - DDR MAX2'  then
		    selectedGroupFile = THEME:GetPathG("group","007 DDRMAX2")
		elseif group=='DanceDanceRevolution 8thMIX EXTREME' or group=='08 - DDR EXTREME'  then
		    selectedGroupFile = THEME:GetPathG("group","008 DDR EXTREME")
		elseif group=='DanceDanceRevolution SuperNOVA' or group=='09 - DDR SuperNOVA'  then
		    selectedGroupFile = THEME:GetPathG("group","009 DDR SuperNOVA")
		elseif group=='DanceDanceRevolution SuperNOVA2' or group=='10 - DDR SuperNOVA2'  then
		    selectedGroupFile = THEME:GetPathG("group","010 DDR SuperNOVA2")
		elseif group=='DanceDanceRevolution X' or group=='11 - DDR X'  then
		    selectedGroupFile = THEME:GetPathG("group","011 DDR X")
		elseif group=='DanceDanceRevolution X2' or group=='12 - DDR X2'  then		
		    selectedGroupFile = THEME:GetPathG("group","012 DDR X2")
		elseif group=='DanceDanceRevolution X3' or group=='13 - DDR X3 vs 2ndMIX'  then
		    selectedGroupFile = THEME:GetPathG("group","013 DDR X3 vs 2ndMIX")
		elseif group=='DDR 2013' or group=='14 - DDR 2013'  then
		    selectedGroupFile = THEME:GetPathG("group","014 DDR 2013")
		elseif group=='DDR 2014' or group=='15 - DDR 2014'  then
		    selectedGroupFile = THEME:GetPathG("group","015 DDR 2014")
		end
	end

	if selectedGroupFile == "" then
		selectedGroupFile = THEME:GetPathG("","_No banner")
	end

	return selectedGroupFile
end

-- Generate the group banner data.
for _,group in ipairs(SONGMAN:GetSongGroupNames()) do
	NXCachedGroupAreas[group] = LoadFromSelectionBG(group,"")
end