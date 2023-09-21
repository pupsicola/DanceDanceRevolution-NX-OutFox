local sort_wheel = setmetatable({disable_wrapping = false}, sick_wheel_mt)

local sort_orders={};
if GAMESTATE:GetSortOrder()=="SortOrder_Group" then
	
	sort_orders = {"Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity","Group",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_Title" then
	sort_orders = {"BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity","Group","Title",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_BPM" then
	sort_orders = {"BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity","Group","Title",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_BeginnerMeter" then
	sort_orders = {"EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity","Group","Title","BeginnerMeter",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_EasyMeter" then
	sort_orders = {"MediumMeter","HardMeter","ChallengeMeter","Popularity","Group","Title","BeginnerMeter","EasyMeter",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_MediumMeter" then
	sort_orders = {"HardMeter","ChallengeMeter","Popularity","Group","Title","BeginnerMeter","EasyMeter","MediumMeter",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_HardMeter" then
	sort_orders = {"ChallengeMeter","Popularity","Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_ChallengeMeter" then
	sort_orders = {"Popularity","Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_TopGrades" then
	sort_orders = {"Popularity","Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","TopGrades",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_Popularity" then
	sort_orders = {"Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity",}
elseif GAMESTATE:GetSortOrder()=="SortOrder_Genre" then
	sort_orders = {"Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity",}
else
	sort_orders = {"Group","Title","BeginnerMeter","EasyMeter","MediumMeter","HardMeter","ChallengeMeter","Popularity",}
end;
	
-- this handles user input
local function input(event)
	if not event.PlayerNumber or not event.button then
		return false
	end

	if event.type ~= "InputEventType_Release" then
		local overlay = SCREENMAN:GetTopScreen():GetChild("Overlay")

		if event.GameButton == "MenuRight" then
			sort_wheel:scroll_by_amount(1)
			overlay:GetChild("change_sound"):play()

		elseif event.GameButton == "MenuLeft" then
			sort_wheel:scroll_by_amount(-1)
			overlay:GetChild("change_sound"):play()

		elseif event.GameButton == "Start" then
			overlay:GetChild("start_sound"):play()
			MESSAGEMAN:Broadcast('Sort',{order=sort_wheel:get_actor_item_at_focus_pos().info})
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")

		elseif event.GameButton == "Back" then
			SCREENMAN:GetTopScreen():StartTransitioningScreen("SM_GoToNextScreen")
		end
	end

	return false
end


-- the metatable for an item in the sort_wheel
local wheel_item_mt = {
	__index = {
		create_actors = function(self, name)
			self.name=name

			local af = Def.ActorFrame{
				Name=name,

				InitCommand=function(subself)
					self.container = subself
					subself:MaskDest()
				end,
				OffCommand=cmd(linear,0.5;diffusealpha,0;);
				
				--LoadActor("cat_over");
			}
			af[#af+1] = LoadActor("cat_normal")..{
			OffCommand=cmd(linear,0.5;diffusealpha,0;);
			}
			
			
			af[#af+1] = LoadFont("Common Normal")..{
				Text="",
				InitCommand=function(subself)
					subself:diffusealpha(0)
					subself:horizalign(center)
					subself:zoom(0.6);
					subself:addx(0);
					subself:addy(0);
					self.text= subself
				end,
				OnCommand=function(self)
					self:addx(0);
					self:addy(0);
					self:zoom(0.6);
					self:sleep(0.13)
					self:horizalign(center)
					self:linear(0.05)
					self:diffusealpha(1)
				end,
				OffCommand=cmd(linear,0.5;diffusealpha,0;);
			}

			return af
		end,

		transform = function(self, item_index, num_items, has_focus)
			self.container:finishtweening()

			if has_focus then
				self.container:decelerate(0.25)
				self.container:zoom(1.5)
				self.container:thump():effectclock('beat'):effectmagnitude(1,1.03,1):effectoffset(0.20)
			else
				self.container:decelerate(0.25)
				self.container:zoom(1.2)
				self.container:thump():effectclock('beat'):effectmagnitude(1,1,1):effectoffset(0.20)
			end


			self.container:y(65+75 * (item_index - math.ceil(num_items/2)))
			self.container:x(math.abs(num_items-item_index))
			self.container:z(math.abs(num_items-item_index))

			if item_index <= 1 or  item_index >= num_items-3 then
				self.container:diffusealpha(0)
			else
				self.container:diffusealpha(1)
			end
		end,

		set = function(self, info)
			self.info= info
			if not info then self.text:settext("") return end
			self.text:settext(THEME:GetString("ScreenSortList", info))
		end
	}
}

local t = Def.ActorFrame {
	InitCommand=function(self)
		sort_wheel:set_info_set(sort_orders, 1)
		-- override sick_wheel's default focus_pos, which is math.floor(num_items / 2) 
		sort_wheel.focus_pos = 5
		-- "scroll" the wheel (0 positions) just so that the override takes immediate effect
		sort_wheel:scroll_by_amount(0)
		self:queuecommand("Capture")
	end,
	CaptureCommand=function(self)
		SCREENMAN:GetTopScreen():AddInputCallback(input)
	end,
	OffCommand=cmd(linear,0.5;diffusealpha,0;);

	-- BG of the sortlist box
	-- LoadActor("SortFrame")..{
		-- InitCommand=cmd(Center;y,350);
	-- },
	-- Def.Quad {
		-- InitCommand=cmd(Center; zoomto,300,_screen.h/2; y,30; MaskSource )
	-- },
	Def.Quad{
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;diffuse,color("0,0,0,0.7");diffusealpha,0;linear,0.2;diffusealpha,0.8;faderight,1/2;fadeleft,1/2;);
		OffCommand=cmd(diffusealpha,0.8;linear,0.2;diffusealpha,0;);
	};

	-- this returns an ActorFrame ( see: ./Scripts/Consensual-sick_wheel.lua )
	sort_wheel:create_actors( "sort_wheel", 12, wheel_item_mt, _screen.cx, _screen.cy )
}

t[#t+1] = LoadActor( THEME:GetPathS("ScreenSelectMaster", "change") )..{ Name="change_sound", SupportPan = false }
t[#t+1] = LoadActor( THEME:GetPathS("common", "start") )..{ Name="start_sound", SupportPan = false }

return t