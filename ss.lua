--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

if _G.MasaRunning then
	return;
end;
_G.MasaRunning = true;
repeat
	task.wait();
until game:IsLoaded();
local g = game:GetService("Players");
local u = game:GetService("UserInputService");
local B = game:GetService("TweenService");
local a = game:GetService("RunService");
local H = game:GetService("HttpService");
local i = game:GetService("Lighting");
local R = game:GetService("Workspace");
local O = game:GetService("Stats");
local c = game:GetService("MaterialService");
local h = game:GetService("ReplicatedStorage");
local Q = game:GetService("SoundService");
local e = g.LocalPlayer;
local P = e:WaitForChild("PlayerGui");
local m = P;
do
	local g, u = pcall(function()
			if type(gethui) == "function" then
				return gethui();
			end;
			if type(get_hidden_gui) == "function" then
				return get_hidden_gui();
			end;
			return game:GetService("CoreGui");
		end);
	if g and typeof(u) == "Instance" then
		m = u;
	end;
end;
_G.MasaGuiParent = m;
local Z = {};
function _G._MasaWaitCharReady(g, u)
	g = g or e.Character;
	if not g then
		return false;
	end;
	local B = os.clock() + ((tonumber(u) or 5));
	while os.clock() < B do
		if not g.Parent then
			return false;
		end;
		if e.Character and e.Character ~= g then
			return false;
		end;
		if g:FindFirstChild("Head") and (g:FindFirstChild("HumanoidRootPart") and g:FindFirstChildOfClass("Humanoid")) then
			return true;
		end;
		task.wait(.05);
	end;
	return false;
end;
_G.MasaIsMobile = true;
for g, u in ipairs({ "MasaHub", "MasaHub", "MasaHub" }) do
	local B = m:FindFirstChild(u);
	if B then
		B:Destroy();
	end;
	B = P:FindFirstChild(u);
	if B then
		B:Destroy();
	end;
end;
local F = 59.5;
local S = 28.8;
local r = 29;
local U = 15;
local I = "Normal";
autoCarrySpeedEnabled = false;
setAutoCarrySpeedVisual = nil;
_G.MasaAutoCarryWasCarrying = false;
_G.MasaAutoCarrySavedMode = nil;
_G._MasaAutoCarryMode = _G._MasaAutoCarryMode or "NORMAL";
_G._MasaAutoCarrySoft = _G._MasaAutoCarrySoft or {
		radius = 9.5,
		animals = {},
		lastScan = 0,
		scanInterval = 2,
	};
_G._MasaAS = _G._MasaAS or {
		interval = 0,
		wasLow = false,
		locked = false,
		savedMode = nil,
		restoring = false,
	};
local X = false;
local w = "Normal";
local k = "V1";
local t = 62;
_G.MasaStealRadii = _G.MasaStealRadii or {
		Normal = 62,
		Semi = 60,
		SemiV2Radius = 60,
		SemiV2SemiRadius = 8,
	};
local E = nil;
_G._MasaSyncAfterHit = {
		enabled = false,
		conn = nil,
		setVisual = nil,
		gen = 0,
		wasRagdoll = false,
	};
local N = "V1";
local n = 58;
local A = 40;
_G.MasaBatAimbotV2Speed = _G.MasaBatAimbotV2Speed or 58;
if _G.MasaBatAimbotV2LaggerSpeed == nil or tonumber(_G.MasaBatAimbotV2LaggerSpeed) == 58 then
	_G.MasaBatAimbotV2LaggerSpeed = 40;
end;
local d = false;
local C = false;
do
	local u = {
			MinX = -535.7,
			MaxX = -422,
			MinY = -7.9,
			MaxY = 115,
			MinZ = -72,
			MaxZ = 193.3,
		};
	local B = 150;
	local H = 100;
	local i = .07;
	local R = 15;
	local O = 50;
	local function c()
		return _G.MasaAntiVoidEnabled == true;
	end;
	local h = setmetatable({}, { __mode = "k" });
	local Q = setmetatable({}, { __mode = "k" });
	local P = setmetatable({}, { __mode = "k" });
	local m = setmetatable({}, { __mode = "k" });
	local function Z(g)
		if typeof(g) ~= "Vector3" then
			return false;
		end;
		return g.X >= u.MinX and (g.X <= u.MaxX and (g.Y >= u.MinY and (g.Y <= u.MaxY and (g.Z >= u.MinZ and g.Z <= u.MaxZ))));
	end;
	local function F(g, u)
		P[g] = true;
		Q[g] = u;
		h[g] = u.Position;
	end;
	local S = nil;
	local r = nil;
	local U = 0;
	local I = 0;
	local X = .1;
	local w = 0;
	local function k()
		local g = e.Character;
		local u = g and g:FindFirstChild("HumanoidRootPart");
		local B = g and g:FindFirstChildOfClass("Humanoid");
		if not ((u and B)) then
			return;
		end;
		local a = os.clock();
		if a - w < X then
			return;
		end;
		w = a;
		local H = u.Position;
		if not r and Z(H) then
			r = H;
		end;
		if B.FloorMaterial ~= Enum.Material.Air and Z(H) then
			S = H;
		end;
	end;
	local function t()
		local g = e.Character;
		local u = g and g:FindFirstChild("HumanoidRootPart");
		if not ((u and u.Parent)) then
			return;
		end;
		if Z(u.Position) then
			return;
		end;
		local B = os.clock();
		if B - U < I then
			return;
		end;
		U = B;
		local a = S or r;
		if a and Z(a) then
			pcall(function()
				u.AssemblyLinearVelocity = Vector3.zero;
				u.AssemblyAngularVelocity = Vector3.zero;
				u.CFrame = CFrame.new(a + Vector3.new(0, 3, 0));
			end);
		end;
	end;
	a.Heartbeat:Connect(function()
		if not c() then
			return;
		end;
		k();
		t();
	end);
	e.CharacterAdded:Connect(function()
		S = nil;
		r = nil;
		U = 0;
		w = 0;
	end);
	local function V(g)
		if g == e then
			return;
		end;
		if m[g] then
			return;
		end;
		m[g] = true;
		local u = {};
		local S = 0;
		local r = nil;
		task.spawn(function()
			while g and g.Parent do
				if not c() then
					P[g] = false;
					u = {};
					S = 0;
					r = nil;
					task.wait(.5);
				else
					local c = g.Character;
					local e = c and c:FindFirstChild("HumanoidRootPart");
					local m = c and c:FindFirstChildOfClass("Humanoid");
					if e and (m and m.Health > 0) then
						local a = tick();
						local c = e.CFrame;
						local m = c.Position;
						if P[g] then
							if r then
								local g = m - r;
								local u = (Vector3.new(g.X, 0, g.Z)).Magnitude;
								if u < O and Z(m) then
									S = S + u;
								end;
							end;
							r = m;
							if S >= R then
								P[g] = false;
								h[g] = m;
								Q[g] = c;
								u = {};
								S = 0;
								r = nil;
							end;
						else
							S = 0;
							r = m;
							h[g] = m;
							Q[g] = c;
							table.insert(u, { time = a, cframe = c });
							while #u > 0 and (a - u[1].time) > i do
								table.remove(u, 1);
							end;
							local R = u[1];
							if R then
								local a = ((m - R.cframe.Position)).Magnitude;
								local i = math.abs(m.Y - R.cframe.Position.Y);
								if a >= B or i >= H then
									local B = R.cframe;
									local a = B.Position;
									local H = m - a;
									local i = m - H;
									local O = CFrame.new(i) * ((B - B.Position));
									if Z(i) then
										F(g, O);
									end;
									u = {};
								end;
							end;
						end;
					else
						P[g] = false;
						u = {};
						S = 0;
						r = nil;
					end;
					a.Heartbeat:Wait();
				end;
			end;
			m[g] = nil;
		end);
	end;
	g.PlayerAdded:Connect(V);
	local function E()
		for g, u in ipairs(g:GetPlayers()) do
			V(u);
		end;
	end;
	local function N()
		for g in pairs(P) do
			P[g] = false;
		end;
	end;
	local function n(g, u)
		if not g or not c() then
			return u, false;
		end;
		if P[g] then
			local u = h[g];
			if u then
				return u, true;
			end;
		end;
		return u, false;
	end;
	local function A(u, B)
		if not u then
			return B, false;
		end;
		local a = u:FindFirstAncestorOfClass("Model");
		local H = a and g:GetPlayerFromCharacter(a);
		return n(H, B or u.Position);
	end;
	_G.MasaAntiVoidEnabled = _G.MasaAntiVoidEnabled == true;
	E();
	_G.MasaAntiVoid = {
			setEnabled = function(g)
				g = g and true or false;
				local u = _G.MasaAntiVoidEnabled == true;
				_G.MasaAntiVoidEnabled = g;
				if g and not u then
					E();
				elseif (not g) and u then
					N();
				end;
			end,
			isEnabled = function()
				return _G.MasaAntiVoidEnabled == true;
			end,
			bounds = u,
			posFor = n,
			posForPart = A,
			isOut = function(g)
				return g and P[g] == true;
			end,
			ghostOf = function(g)
				return g and h[g] or nil;
			end,
		};
	local d = {};
	local C = nil;
	local function j()
		if C and C.Parent then
			return C;
		end;
		C = Instance.new("Folder");
		C.Name = "MasaAntiVoid";
		C.Parent = workspace;
		return C;
	end;
	local function q(g, u)
		if not g then
			return;
		end;
		local B = g:FindFirstChild("MasaHubESP");
		if B then
			pcall(function()
				B.Enabled = u;
			end);
		end;
		local a = g:FindFirstChild("Head");
		local H = a and a:FindFirstChild("MasaHubESPTag");
		if H then
			pcall(function()
				H.Enabled = u;
			end);
		end;
	end;
	local function p(g)
		local u = d[g];
		if u then
			pcall(function()
				u:Destroy();
			end);
		end;
		d[g] = nil;
	end;
	local function L(g, u, B)
		p(g);
		if not u:FindFirstChild("MasaHubESP") then
			return;
		end;
		local a, H = pcall(function()
				u.Archivable = true;
				return u:Clone();
			end);
		if not a or not H then
			return;
		end;
		for g, u in ipairs(H:GetDescendants()) do
			if u:IsA("Script") or u:IsA("LocalScript") or u:IsA("Humanoid") then
				pcall(function()
					u:Destroy();
				end);
			elseif u:IsA("BasePart") then
				u.Anchored = true;
				u.CanCollide = false;
				u.CanQuery = false;
				u.CanTouch = false;
			end;
		end;
		H.Name = "GhostReplica_" .. tostring(g.Name);
		H.Parent = j();
		pcall(function()
			H:PivotTo(B);
		end);
		local i = H:FindFirstChild("MasaHubESP");
		if i then
			pcall(function()
				i.Enabled = true;
			end);
		end;
		local R = H:FindFirstChild("Head");
		local O = R and R:FindFirstChild("MasaHubESPTag");
		if O then
			pcall(function()
				O.Enabled = true;
			end);
			local g = O:FindFirstChildOfClass("Frame") or O;
			local u = Instance.new("TextLabel");
			u.Name = "VoidTag";
			u.Size = UDim2.new(1, -10, 0, 16);
			u.Position = UDim2.new(0, 5, 0, 19);
			u.BackgroundTransparency = 1;
			u.TextColor3 = Color3.fromRGB(255, 255, 255);
			u.Font = Enum.Font.GothamBlack;
			u.TextSize = 16;
			u.TextStrokeTransparency = .4;
			u.Text = "VOID";
			u.Parent = g;
		end;
		d[g] = H;
	end;
	local b = 0;
	a.Heartbeat:Connect(function()
		local u = os.clock();
		if u - b < .1 then
			return;
		end;
		b = u;
		for g, u in ipairs(g:GetPlayers()) do
			if u ~= e then
				local g = u.Character;
				local B = g and g:FindFirstChild("HumanoidRootPart");
				local a = g and g:FindFirstChildOfClass("Humanoid");
				local H = c() and ((B ~= nil) and ((a ~= nil) and (a.Health > 0 and P[u] == true)));
				if H and Q[u] then
					q(g, false);
					if not d[u] or not d[u].Parent then
						L(u, g, Q[u]);
					end;
				else
					if d[u] then
						p(u);
						q(g, true);
					end;
				end;
			end;
		end;
	end);
	g.PlayerRemoving:Connect(function(g)
		h[g] = nil;
		P[g] = nil;
		Q[g] = nil;
		m[g] = nil;
		p(g);
	end);
end;
_G.MasaNormalAimbotOn = _G.MasaNormalAimbotOn or false;
_G.MasaBatAimbotV2On = _G.MasaBatAimbotV2On or false;
_G._MasaAimbotChase = _G._MasaAimbotChase or { V1 = "NORMAL", V2 = "NORMAL" };
local j = false;
_G.MasaTPBatVersion = _G.MasaTPBatVersion or 1;
_G.MasaRadiusCircleColor = _G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230);
_G.MasaTPBatOn = _G.MasaTPBatOn or false;
_G.MasaTPBatSilent = false;
function _G.MasaTPBatMobileActive()
	if _G.MasaTPBatOn ~= true then
		return false;
	end;
	if _G.MasaTPBatSilent == true then
		return false;
	end;
	if _G.MasaBatAimbotV2On == true then
		return false;
	end;
	return true;
end;
local q = 58;
local p = false;
local L = "V1";
local b = false;
local T = false;
local W = false;
local D = false;
local K = false;
local o = false;
local x = false;
local l = false;
local M = false;
do
	local g = 16;
	local u = Vector3.zero;
	local B = { HumanoidRootPart = true };
	local function H(g)
		if typeof(g) ~= "Instance" then
			return false;
		end;
		if not g:IsA("BasePart") then
			return false;
		end;
		if not B[g.Name] then
			return false;
		end;
		local u = e.Character;
		return u ~= nil and g:IsDescendantOf(u);
	end;
	pcall(function()
		if not ((getrawmetatable and (setreadonly and (newcclosure and checkcaller)))) then
			return;
		end;
		local g = getrawmetatable(game);
		setreadonly(g, false);
		local B = g.__index;
		g.__index = newcclosure(function(g, a)
				if not checkcaller() and ((a == "AssemblyLinearVelocity" or a == "Velocity")) then
					if H(g) then
						return u;
					end;
				end;
				return B(g, a);
			end);
		local a = g.__newindex;
		g.__newindex = newcclosure(function(g, B, i)
				if not checkcaller() and ((B == "AssemblyLinearVelocity" or B == "Velocity")) then
					if H(g) then
						u = i;
						return;
					end;
				end;
				return a(g, B, i);
			end);
		setreadonly(g, true);
	end);
	local function i()
		local B = e.Character;
		local a = B and B:FindFirstChildOfClass("Humanoid");
		local H = B and B:FindFirstChild("HumanoidRootPart");
		if not B or not a or not H or a.Health <= 0 then
			return;
		end;
		local i = a.MoveDirection;
		if i.Magnitude > .05 then
			pcall(function()
				if H.SetNetworkOwner then
					H:SetNetworkOwner(e);
				end;
			end);
			local B = i.Unit;
			u = Vector3.new(B.X * g, H.Velocity.Y, B.Z * g);
		else
			u = Vector3.new(0, H.Velocity.Y, 0);
		end;
	end;
	local R = a.PreSimulation or a.Stepped;
	R:Connect(i);
end;
do
	local g = nil;
	local u = 10000;
	local B = 0;
	local H = 1;
	local function i()
		if g then
			pcall(function()
				g:Disconnect();
			end);
			g = nil;
		end;
		u = 10000;
		B = 0;
		H = 1;
		_G._MasaAntiBatDesiredXZ = nil;
		_G._MasaAntiBatSpiking = false;
	end;
	local function R()
		i();
		g = a.Heartbeat:Connect(function()
				if not _G.MasaAntiBatEnabled then
					return;
				end;
				local g = e.Character;
				local i = g and g:FindFirstChild("HumanoidRootPart");
				if not i or not i.Parent then
					return;
				end;
				local R = Vector3.new(i.Velocity.X, 0, i.Velocity.Z);
				u = u + (50 * H);
				if u >= 20000 then
					u = 20000;
					H = -1;
				elseif u <= 10000 then
					u = 10000;
					H = 1;
				end;
				B = B + (math.random() * .5);
				local O = u + math.random(-5000, 5000);
				local c = math.cos(B) * O;
				local h = math.sin(B) * O;
				_G._MasaAntiBatSpiking = true;
				i.Velocity = Vector3.new(c, i.Velocity.Y, h);
				a.RenderStepped:Wait();
				if i.Parent then
					local g = _G._MasaAntiBatDesiredXZ;
					if g then
						i.Velocity = Vector3.new(g.X, i.Velocity.Y, g.Z);
					else
						i.Velocity = Vector3.new(R.X, i.Velocity.Y, R.Z);
					end;
				end;
				_G._MasaAntiBatSpiking = false;
			end);
	end;
	_G.MasaAntiBatEnabled = _G.MasaAntiBatEnabled == true;
	local function O(g, u)
		pcall(u);
	end;
	_G.MasaAntiBat = { setEnabled = function(g)
				g = g and true or false;
				_G.MasaAntiBatEnabled = g;
				if g then
					O("startAntiBat", R);
				else
					O("stopAntiBat", i);
				end;
			end, isEnabled = function()
				return _G.MasaAntiBatEnabled == true;
			end };
	task.spawn(function()
		while true do
			task.wait(.5);
			if _G.MasaAntiBatEnabled then
				if not g then
					O("watchdog:start", R);
				end;
			elseif g then
				O("watchdog:stop", i);
			end;
		end;
	end);
	e.CharacterAdded:Connect(function(g)
		if _G._MasaWaitCharReady then
			_G._MasaWaitCharReady(g, 10);
		end;
		if _G.MasaAntiBatEnabled then
			R();
		else
			i();
		end;
	end);
end;
((function()
	local u = false;
	local B = nil;
	local H = nil;
	local i = false;
	local R = nil;
	local O = nil;
	local c = nil;
	local h = nil;
	local Q = nil;
	local P = nil;
	_G.MasaAntiTPBatEnabled = _G.MasaAntiTPBatEnabled == true;
	_G.MasaAntiTPBatSpam = _G.MasaAntiTPBatSpam == true;
	_G.MasaAntiTPBatVersion = math.clamp(tonumber(_G.MasaAntiTPBatVersion) or 1, 1, 4);
	local function m()
		local g = e.Character;
		if not g then
			return nil, nil;
		end;
		return g:FindFirstChild("HumanoidRootPart"), g:FindFirstChildOfClass("Humanoid");
	end;
	local function Z(g, u)
		local B, a;
		if u == 1 then
			B, a = Color3.fromRGB(255, 50, 50), .5;
		elseif u == 2 then
			B, a = Color3.fromRGB(50, 100, 255), .5;
		elseif u == 3 then
			B, a = Color3.fromRGB(50, 255, 50), .5;
		elseif u == 4 then
			B, a = Color3.fromRGB(200, 50, 200), .5;
		else
			B, a = Color3.fromRGB(255, 255, 255), 1;
		end;
		pcall(function()
			g.Color = B;
			g.Transparency = a;
		end);
	end;
	local function F(g)
		local u = m();
		if u and (sethiddenproperty and g) then
			pcall(function()
				sethiddenproperty(u, "PhysicsRepRootPart", g);
			end);
		end;
	end;
	local function S()
		if B then
			local g = m();
			if g then
				F(g);
			end;
			pcall(function()
				B:Destroy();
			end);
			B = nil;
		end;
	end;
	local function r(g, u)
		local B = Instance.new("Part");
		B.Name = "DesyncTrapPart";
		B.Size = Vector3.new(1, 1, 1);
		B.CanCollide = false;
		B.Anchored = true;
		B.Position = u;
		Z(B, g);
		B.Parent = workspace;
		return B;
	end;
	local function U()
		if B then
			pcall(function()
				B:Destroy();
			end);
			B = nil;
		end;
		local g = _G.MasaAntiTPBatVersion or 1;
		local u;
		if g == 4 then
			u = Vector3.new(400, 0, 400);
		elseif g == 3 then
			local g, B = math.random(-300, 300), math.random(-300, 300);
			if g == 0 and B == 0 then
				g, B = 1, 1;
			end;
			u = Vector3.new(g, 0, B);
		elseif g == 2 then
			u = Vector3.new(0, -120, 0);
		else
			u = Vector3.new(99999999999, 99999999999, 99999999999);
		end;
		B = r(g, u);
	end;
	local function I()
		i = false;
		if H then
			pcall(task.cancel, H);
			H = nil;
		end;
	end;
	local function X()
		I();
		i = true;
		H = task.spawn(function()
				while i and (u and _G.MasaAntiTPBatVersion == 3) do
					local g, u;
					repeat
						g = math.random(-300, 300);
						u = math.random(-300, 300);
					until not ((g == 0 and u == 0));
					if B then
						pcall(function()
							B:Destroy();
						end);
						B = nil;
					end;
					B = r(3, Vector3.new(g, 0, u));
					F(B);
					task.wait(0);
				end;
			end);
	end;
	local w = {
			RISE = 17,
			RATE = 55,
			CYCLE = 2.5,
			PAUSE = .5,
			conn = nil,
			thread = nil,
			running = false,
			locked = false,
			targetY = nil,
		};
	function w.startLoop()
		if w.conn then
			return;
		end;
		w.locked = false;
		w.targetY = nil;
		local g, u = m();
		if u then
			pcall(function()
				u:ChangeState(Enum.HumanoidStateType.Freefall);
			end);
		end;
		w.conn = a.Heartbeat:Connect(function(g)
				local u = m();
				if not u then
					return;
				end;
				local B = u.Position;
				local a = u.Velocity;
				local H = u.CFrame - u.CFrame.Position;
				if not w.targetY then
					w.targetY = B.Y + w.RISE;
				end;
				if not w.locked then
					local i = math.min(B.Y + w.RATE * g, w.targetY);
					u.CFrame = CFrame.new(B.X, i, B.Z) * H;
					u.Velocity = Vector3.new(a.X, 0, a.Z);
					if i >= w.targetY then
						w.locked = true;
					end;
					return;
				end;
				u.CFrame = CFrame.new(B.X, w.targetY, B.Z) * H;
				u.Velocity = Vector3.new(a.X, 0, a.Z);
			end);
	end;
	function w.stopLoop(g)
		if w.conn then
			pcall(function()
				w.conn:Disconnect();
			end);
			w.conn = nil;
		end;
		if g and _G.MasaRunTPDown then
			pcall(_G.MasaRunTPDown, true);
		end;
	end;
	function w.waitGrounded(g)
		local u = os.clock() + ((g or 3));
		while os.clock() < u do
			if not w.running then
				return;
			end;
			local g, u = m();
			if not g or not u then
				return;
			end;
			if u.Health <= 0 then
				return;
			end;
			if u.FloorMaterial ~= Enum.Material.Air then
				task.wait(w.PAUSE);
				return;
			end;
			a.Heartbeat:Wait();
		end;
	end;
	function w.enable()
		if w.running then
			return;
		end;
		w.running = true;
		w.startLoop();
		w.thread = task.spawn(function()
				while w.running do
					local g = os.clock();
					while w.running and (os.clock() - g) < w.CYCLE do
						task.wait(.1);
					end;
					if not w.running then
						break;
					end;
					w.stopLoop(true);
					w.waitGrounded(3);
					if not w.running then
						break;
					end;
					w.startLoop();
				end;
			end);
	end;
	function w.disable()
		if not w.running then
			return;
		end;
		w.running = false;
		if w.thread then
			pcall(task.cancel, w.thread);
			w.thread = nil;
		end;
		w.stopLoop(true);
	end;
	_G.MasaFloatOn = false;
	local function k()
		_G.MasaFloatOn = w.running == true;
		if _G.MasaRefreshMobileButtonStates then
			pcall(_G.MasaRefreshMobileButtonStates);
		end;
	end;
	function _G.MasaFloatStart()
		if w.running then
			return;
		end;
		if _G.MasaAntiDieArmNow then
			pcall(_G.MasaAntiDieArmNow);
		end;
		w.enable();
		k();
	end;
	function _G.MasaFloatStop()
		if not w.running then
			return;
		end;
		w.disable();
		k();
	end;
	function _G.MasaFloatToggle()
		if w.running then
			_G.MasaFloatStop();
		else
			_G.MasaFloatStart();
		end;
	end;
	_G.MasaFloat = {
			start = function()
				_G.MasaFloatStart();
			end,
			stop = function()
				_G.MasaFloatStop();
			end,
			toggle = function()
				_G.MasaFloatToggle();
			end,
			isEnabled = function()
				return w.running == true;
			end,
		};
	local function t()
		local g, u = m();
		if not g then
			return;
		end;
		c = g.CFrame;
		if u then
			h = u.WalkSpeed;
			Q = u.JumpPower;
			P = u.AutoRotate;
			pcall(function()
				u.WalkSpeed = 0;
				u.JumpPower = 0;
				u.AutoRotate = false;
			end);
		end;
		if O then
			pcall(function()
				O:Disconnect();
			end);
		end;
		O = a.RenderStepped:Connect(function()
				local g = m();
				if c and (g and g.Parent) then
					g.CFrame = c;
				end;
			end);
	end;
	local function V()
		local g, u = m();
		if u then
			pcall(function()
				u.WalkSpeed = h or 16;
				u.JumpPower = Q or 50;
				if P == nil then
					u.AutoRotate = true;
				else
					u.AutoRotate = P;
				end;
			end);
		end;
		h, Q, P = nil, nil, nil;
		if O then
			pcall(function()
				O:Disconnect();
			end);
			O = nil;
		end;
		c = nil;
	end;
	local function E()
		if u then
			return;
		end;
		u = true;
		if _G.MasaAntiDieArmNow then
			pcall(_G.MasaAntiDieArmNow);
		end;
		U();
		F(B);
		t();
		if _G.MasaAntiTPBatVersion == 3 then
			X();
		end;
	end;
	local function N()
		if not u then
			return;
		end;
		u = false;
		I();
		V();
		S();
	end;
	local function n()
		if not u then
			return;
		end;
		if _G.MasaAntiTPBatVersion == 3 then
			return;
		end;
		if not B or not B.Parent then
			U();
		end;
		F(B);
	end;
	a.Heartbeat:Connect(n);
	a.Stepped:Connect(n);
	local function A()
		if R then
			pcall(task.cancel, R);
			R = nil;
		end;
	end;
	local function d()
		A();
		R = task.spawn(function()
				E();
				while _G.MasaAntiTPBatSpam and _G.MasaAntiTPBatEnabled do
					task.wait(.5);
					if not ((_G.MasaAntiTPBatSpam and _G.MasaAntiTPBatEnabled)) then
						break;
					end;
					N();
					task.wait(.5);
					if not ((_G.MasaAntiTPBatSpam and _G.MasaAntiTPBatEnabled)) then
						break;
					end;
					E();
				end;
				if _G.MasaAntiTPBatEnabled then
					E();
				else
					N();
				end;
			end);
	end;
	local function C()
		pcall(function()
			if _G._MasaAntiTPBatSetRowVisual then
				_G._MasaAntiTPBatSetRowVisual(_G.MasaAntiTPBatEnabled == true);
			end;
			if _G._MasaAntiTPBatSetSpamVisual then
				_G._MasaAntiTPBatSetSpamVisual(_G.MasaAntiTPBatSpam == true);
			end;
			if _G._MasaAntiTPBatSetVersionVisual then
				_G._MasaAntiTPBatSetVersionVisual(_G.MasaAntiTPBatVersion or 1);
			end;
			if _G.MasaRefreshMobileButtonStates then
				_G.MasaRefreshMobileButtonStates();
			end;
			if _G.MasaAntiDieAutoSync then
				_G.MasaAntiDieAutoSync();
			end;
		end);
	end;
	_G._MasaAntiTPBatRefreshUI = C;
	local function j()
		if type(saveMasaConfig) == "function" then
			pcall(saveMasaConfig);
		end;
	end;
	local function q(g, u)
		g = g and true or false;
		_G.MasaAntiTPBatEnabled = g;
		if g then
			if _G.MasaAntiTPBatSpam then
				d();
			else
				A();
				E();
			end;
		else
			A();
			N();
		end;
		C();
		if not u then
			j();
		end;
	end;
	local function p(g, u)
		g = g and true or false;
		_G.MasaAntiTPBatSpam = g;
		if _G.MasaAntiTPBatEnabled then
			if g then
				d();
			else
				A();
				E();
			end;
		else
			A();
		end;
		C();
		if not u then
			j();
		end;
	end;
	local function L(g, u)
		g = math.clamp(tonumber(g) or 1, 1, 4);
		local B = (g ~= _G.MasaAntiTPBatVersion);
		if B then
			A();
			N();
			_G.MasaAntiTPBatVersion = g;
			if _G.MasaAntiTPBatEnabled then
				if _G.MasaAntiTPBatSpam then
					d();
				else
					E();
				end;
			end;
		end;
		C();
		if B and not u then
			j();
		end;
	end;
	local function b()
		if not ((u or _G.MasaAntiTPBatEnabled)) then
			return;
		end;
		_G.MasaAntiTPBatEnabled = false;
		A();
		N();
		C();
		j();
	end;
	local function T()
		if u or _G.MasaAntiTPBatEnabled then
			b();
		end;
	end;
	local W = {};
	local function D(g)
		local u = W[g];
		if u then
			for g, u in ipairs(u) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			W[g] = nil;
		end;
	end;
	local function K(g, u)
		D(g);
		if not u then
			return;
		end;
		local B = {};
		local a = u:FindFirstChildOfClass("Humanoid");
		if a then
			table.insert(B, a.Died:Connect(T));
			table.insert(B, a.HealthChanged:Connect(function(g)
				if g <= 0 then
					T();
				end;
			end));
		end;
		table.insert(B, u.AncestryChanged:Connect(function(g, u)
			if not u then
				T();
			end;
		end));
		W[g] = B;
	end;
	local function o(g)
		if g == e then
			return;
		end;
		if g.Character then
			K(g, g.Character);
		end;
		g.CharacterAdded:Connect(function(u)
			K(g, u);
		end);
	end;
	for g, u in ipairs(g:GetPlayers()) do
		pcall(o, u);
	end;
	g.PlayerAdded:Connect(function(g)
		pcall(o, g);
	end);
	g.PlayerRemoving:Connect(function(g)
		pcall(D, g);
	end);
	local x = {};
	local l = false;
	local function M()
		for g, u in ipairs(x) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		x = {};
	end;
	local function z(g)
		M();
		l = false;
		if not g then
			return;
		end;
		local u = g:FindFirstChildOfClass("Humanoid");
		if u then
			table.insert(x, u.Died:Connect(T));
			table.insert(x, u.HealthChanged:Connect(function(g)
				if g <= 0 then
					T();
				end;
			end));
			table.insert(x, u.StateChanged:Connect(function(g, u)
				local B = (u == Enum.HumanoidStateType.Physics);
				pcall(function()
					if u == Enum.HumanoidStateType.Ragdoll then
						B = true;
					end;
				end);
				if B and not l then
					l = true;
					T();
				elseif not B then
					l = false;
				end;
			end));
		end;
		table.insert(x, g.AncestryChanged:Connect(function(g, u)
			if not u then
				T();
			end;
		end));
	end;
	if e.Character then
		z(e.Character);
	end;
	e.CharacterAdded:Connect(function(g)
		if _G._MasaWaitCharReady then
			pcall(_G._MasaWaitCharReady, g, 10);
		end;
		z(g);
		_G.MasaAntiTPBatEnabled = false;
		A();
		N();
		C();
	end);
	_G.MasaAntiTPBat = {
			setEnabled = function(g, u)
				q(g, u);
			end,
			isEnabled = function()
				return _G.MasaAntiTPBatEnabled == true;
			end,
			toggle = function()
				q(not ((_G.MasaAntiTPBatEnabled == true)));
			end,
			setSpam = function(g, u)
				p(g, u);
			end,
			getSpam = function()
				return _G.MasaAntiTPBatSpam == true;
			end,
			setVersion = function(g, u)
				L(g, u);
			end,
			getVersion = function()
				return _G.MasaAntiTPBatVersion or 1;
			end,
			hardStop = b,
		};
	_G.MasaToggleAntiTPBat = function()
			q(not ((_G.MasaAntiTPBatEnabled == true)));
		end;
	task.spawn(function()
		while true do
			task.wait(.5);
			if _G.MasaAntiTPBatEnabled then
				if not _G.MasaAntiTPBatSpam and not u then
					pcall(E);
				end;
			elseif u then
				pcall(N);
			end;
		end;
	end);
end))();
do
	local g = game:GetService("Players");
	local u = game:GetService("RunService");
	local B = g.LocalPlayer;
	local a = { { key = "Bat", match = function(g)
					g = g:lower();
					return g:find("bat") ~= nil or g:find("slap") ~= nil;
				end }, { key = "Medusa", match = function(g)
					return (g:lower()):find("medusa") ~= nil;
				end } };
	local function H(g)
		if not ((g:IsA("Tool") or g:IsA("Model") or g:IsA("Accessory") or g:IsA("BasePart"))) then
			return nil;
		end;
		for u, B in ipairs(a) do
			if B.match(g.Name) then
				return B;
			end;
		end;
		return nil;
	end;
	local function i(g)
		if g.Name == "LocalReplica" then
			return true;
		end;
		return g:FindFirstAncestor("LocalReplica") ~= nil;
	end;
	local R = {};
	do
		local g = { "custom", "rainbow", "transparent" };
		local u = setmetatable({}, { __mode = "k" });
		local B = setmetatable({}, { __mode = "k" });
		local a = setmetatable({}, { __mode = "k" });
		function R.getBaseline(g)
			local B = u[g];
			if B ~= nil then
				return B;
			end;
			local a, H = pcall(function()
					return g.Transparency;
				end);
			if not a then
				return nil;
			end;
			u[g] = H;
			return H;
		end;
		local function H(u)
			local a = B[u];
			if not a then
				return nil;
			end;
			for g, u in ipairs(g) do
				if a[u] ~= nil then
					return a[u];
				end;
			end;
			return nil;
		end;
		local function i(g, u)
			local B, a = pcall(function()
					return g.Transparency;
				end);
			if B and (a ~= nil and math.abs(a - u) <= .001) then
				return;
			end;
			pcall(function()
				g.Transparency = u;
			end);
		end;
		local function O(g)
			local B = H(g);
			if B ~= nil then
				i(g, B);
				return;
			end;
			local a = u[g];
			if a ~= nil then
				i(g, a);
			end;
		end;
		local function c(g)
			if a[g] then
				return;
			end;
			local u, B = pcall(function()
					return (g:GetPropertyChangedSignal("Transparency")):Connect(function()
						local u = H(g);
						if u == nil then
							return;
						end;
						local B, a = pcall(function()
								return g.Transparency;
							end);
						if B and (a ~= nil and math.abs(a - u) > .001) then
							pcall(function()
								g.Transparency = u;
							end);
						end;
					end);
				end);
			if u and B then
				a[g] = B;
			end;
		end;
		local function h(g)
			local u = a[g];
			if u then
				pcall(function()
					u:Disconnect();
				end);
				a[g] = nil;
			end;
		end;
		function R.enforce()
			for g, u in pairs(B) do
				if g.Parent then
					local u = H(g);
					if u ~= nil then
						local B, a = pcall(function()
								return g.Transparency;
							end);
						if B and (a ~= nil and math.abs(a - u) > .001) then
							pcall(function()
								g.Transparency = u;
							end);
						end;
					end;
				end;
			end;
		end;
		function R.claim(g, u, a)
			if not g then
				return;
			end;
			if R.getBaseline(g) == nil then
				return;
			end;
			local H = B[g];
			if not H then
				H = {};
				B[g] = H;
			end;
			H[u] = a;
			c(g);
			O(g);
		end;
		function R.release(g, u)
			if not g then
				return;
			end;
			local a = B[g];
			if not a then
				return;
			end;
			a[u] = nil;
			if next(a) == nil then
				B[g] = nil;
				h(g);
			end;
			if g.Parent then
				O(g);
			end;
		end;
	end;
	local O = {};
	task.spawn(function()
		while true do
			task.wait(10);
			for g, u in ipairs(O) do
				pcall(u);
			end;
		end;
	end);
	task.spawn(function()
		while true do
			task.wait(.25);
			if _G.MasaCustomToolsEnabled == true or _G.MasaTransparentToolsEnabled == true or _G.MasaRainbowToolsEnabled == true then
				pcall(R.enforce);
			end;
		end;
	end);
	do
		local g = .35;
		local a = .035;
		local i = .025;
		local c = false;
		local h = setmetatable({}, { __mode = "k" });
		local Q = setmetatable({}, { __mode = "k" });
		local e;
		local function P(g)
			if g:IsA("MeshPart") then
				return {
					obj = g,
					kind = "part",
					props = { "Color", "Material", "TextureID" },
					clearTexture = "TextureID",
				};
			elseif g:IsA("BasePart") then
				return { obj = g, kind = "part", props = { "Color", "Material" } };
			elseif g:IsA("SurfaceAppearance") then
				return { obj = g, kind = "surface", props = { "Parent" } };
			elseif g:IsA("Decal") or g:IsA("Texture") then
				return { obj = g, kind = "decal", props = {} };
			elseif g:IsA("SpecialMesh") then
				return {
					obj = g,
					kind = "vector",
					prop = "VertexColor",
					props = { "VertexColor", "TextureId" },
					clearTexture = "TextureId",
				};
			elseif g:IsA("ParticleEmitter") or g:IsA("Beam") or g:IsA("Trail") then
				return {
					obj = g,
					kind = "sequence",
					prop = "Color",
					props = { "Color" },
				};
			elseif g:IsA("PointLight") or g:IsA("SpotLight") or g:IsA("SurfaceLight") then
				return {
					obj = g,
					kind = "color",
					prop = "Color",
					props = { "Color" },
				};
			elseif g:IsA("Highlight") then
				return {
					obj = g,
					kind = "color",
					prop = "FillColor",
					props = { "FillColor" },
				};
			end;
			return nil;
		end;
		local function m(g)
			g.original = {};
			for u, B in ipairs(g.props) do
				local a, H = pcall(function()
						return g.obj[B];
					end);
				if a then
					g.original[B] = H;
				end;
			end;
		end;
		local function Z(g)
			if g.kind == "decal" then
				R.release(g.obj, "rainbow");
			end;
			if not g.original then
				return;
			end;
			for u, B in pairs(g.original) do
				pcall(function()
					g.obj[u] = B;
				end);
			end;
		end;
		local function F(g)
			if g.kind == "surface" then
				pcall(function()
					g.obj.Parent = nil;
				end);
			elseif g.kind == "decal" then
				R.claim(g.obj, "rainbow", 1);
			elseif g.clearTexture then
				pcall(function()
					g.obj[g.clearTexture] = "";
				end);
			end;
		end;
		local function S(g, u)
			local B = P(u);
			if not B then
				return;
			end;
			m(B);
			F(B);
			if B.kind == "part" then
				table.insert(g.parts, B);
			elseif B.kind == "surface" or B.kind == "decal" then
				table.insert(g.statics, B);
			else
				table.insert(g.effects, B);
			end;
		end;
		local function r(g)
			if h[g] then
				return;
			end;
			local u = {
					parts = {},
					effects = {},
					statics = {},
					conns = {},
				};
			h[g] = u;
			for g, B in ipairs(g:GetDescendants()) do
				S(u, B);
			end;
			if g:IsA("BasePart") then
				S(u, g);
			end;
			table.insert(u.conns, g.DescendantAdded:Connect(function(g)
				S(u, g);
			end));
			table.insert(u.conns, g.AncestryChanged:Connect(function(u, B)
				if not B then
					e(g, false);
				end;
			end));
		end;
		function e(g, u)
			local B = h[g];
			if not B then
				return;
			end;
			for g, u in ipairs(B.conns) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			if u then
				for g, u in ipairs(B.parts) do
					Z(u);
				end;
				for g, u in ipairs(B.effects) do
					Z(u);
				end;
				for g, u in ipairs(B.statics) do
					Z(u);
				end;
			end;
			h[g] = nil;
		end;
		local function U(g)
			if not c then
				return;
			end;
			if H(g) then
				r(g);
			end;
		end;
		local function I(g)
			local u = Q[g];
			if not u then
				return;
			end;
			for g, u in ipairs(u) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			Q[g] = nil;
		end;
		local function X(g)
			if not g or Q[g] then
				return;
			end;
			Q[g] = { g.ChildAdded:Connect(U) };
			for g, u in ipairs(g:GetChildren()) do
				U(u);
			end;
		end;
		local function w()
			X(B:FindFirstChildOfClass("Backpack"));
			X(B.Character);
		end;
		B.ChildAdded:Connect(function(g)
			if c and g:IsA("Backpack") then
				X(g);
			end;
		end);
		B.CharacterAdded:Connect(function(g)
			for g in pairs(h) do
				e(g, false);
			end;
			for g in pairs(Q) do
				I(g);
			end;
			if not c then
				return;
			end;
			X(g);
			task.defer(function()
				if c then
					w();
				end;
			end);
		end);
		local k = 0;
		u.Heartbeat:Connect(function(u)
			if not c then
				return;
			end;
			if next(h) == nil then
				return;
			end;
			k = k + u;
			if k < i then
				return;
			end;
			k = 0;
			local B = ((tick() * g)) % 1;
			for g, u in pairs(h) do
				for g, u in ipairs(u.parts) do
					local H = u.obj;
					if H.Parent then
						pcall(function()
							H.Color = Color3.fromHSV(((B + ((g - 1)) * a)) % 1, 1, 1);
						end);
					end;
				end;
				for g, u in ipairs(u.effects) do
					if u.obj.Parent then
						local H = Color3.fromHSV(((B + ((g - 1)) * a)) % 1, 1, 1);
						if u.kind == "sequence" then
							pcall(function()
								u.obj[u.prop] = ColorSequence.new(H);
							end);
						elseif u.kind == "vector" then
							pcall(function()
								u.obj[u.prop] = Vector3.new(H.R, H.G, H.B);
							end);
						else
							pcall(function()
								u.obj[u.prop] = H;
							end);
						end;
					end;
				end;
			end;
		end);
		table.insert(O, function()
			for g in pairs(h) do
				if not g.Parent then
					e(g, false);
				end;
			end;
			for g in pairs(Q) do
				if g ~= workspace and not g.Parent then
					I(g);
				end;
			end;
		end);
		_G.MasaRainbowTools = { setEnabled = function(g)
					g = g and true or false;
					c = g;
					_G.MasaRainbowToolsEnabled = g;
					if g then
						w();
					else
						for g in pairs(h) do
							e(g, true);
						end;
						for g in pairs(Q) do
							I(g);
						end;
					end;
				end, isEnabled = function()
					return c;
				end };
	end;
	do
		local g = .5;
		local u = false;
		local a = setmetatable({}, { __mode = "k" });
		local i = setmetatable({}, { __mode = "k" });
		local c;
		local function h(g)
			if not g:IsA("BasePart") then
				return false;
			end;
			local u = R.getBaseline(g);
			if u == nil or u >= 1 then
				return false;
			end;
			return true;
		end;
		local function Q(u, B)
			if not h(B) then
				return;
			end;
			if u.seen[B] then
				return;
			end;
			u.seen[B] = true;
			local a = { obj = B };
			table.insert(u.parts, a);
			R.claim(B, "transparent", g);
		end;
		local function e(g)
			if a[g] then
				return;
			end;
			local u = { parts = {}, seen = {}, conns = {} };
			a[g] = u;
			for g, B in ipairs(g:GetDescendants()) do
				Q(u, B);
			end;
			if g:IsA("BasePart") then
				Q(u, g);
			end;
			table.insert(u.conns, g.DescendantAdded:Connect(function(g)
				Q(u, g);
			end));
			table.insert(u.conns, g.AncestryChanged:Connect(function(u, B)
				if not B then
					c(g, false);
				end;
			end));
		end;
		function c(g, u)
			local B = a[g];
			if not B then
				return;
			end;
			for g, u in ipairs(B.conns) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			for g, u in ipairs(B.parts) do
				R.release(u.obj, "transparent");
			end;
			a[g] = nil;
		end;
		local function P(g)
			if not u then
				return;
			end;
			if H(g) then
				e(g);
			end;
		end;
		local function m(g)
			local u = i[g];
			if not u then
				return;
			end;
			for g, u in ipairs(u) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			i[g] = nil;
		end;
		local function Z(g)
			if not g or i[g] then
				return;
			end;
			i[g] = { g.ChildAdded:Connect(P) };
			for g, u in ipairs(g:GetChildren()) do
				P(u);
			end;
		end;
		local function F()
			Z(B:FindFirstChildOfClass("Backpack"));
			Z(B.Character);
		end;
		B.ChildAdded:Connect(function(g)
			if u and g:IsA("Backpack") then
				Z(g);
			end;
		end);
		B.CharacterAdded:Connect(function(g)
			for g in pairs(a) do
				c(g, false);
			end;
			for g in pairs(i) do
				m(g);
			end;
			if not u then
				return;
			end;
			Z(g);
			task.defer(function()
				if u then
					F();
				end;
			end);
		end);
		table.insert(O, function()
			for g in pairs(a) do
				if not g.Parent then
					c(g, false);
				end;
			end;
			for g in pairs(i) do
				if not g.Parent then
					m(g);
				end;
			end;
		end);
		_G.MasaTransparentTools = { setEnabled = function(g)
					g = g and true or false;
					u = g;
					_G.MasaTransparentToolsEnabled = g;
					if g then
						F();
					else
						for g in pairs(a) do
							c(g, true);
						end;
						for g in pairs(i) do
							m(g);
						end;
					end;
				end, isEnabled = function()
					return u;
				end };
	end;
	do
		local g = {
				DiamondSword = {
					cat = "Bat",
					label = "Diamond Sword",
					mesh = "rbxassetid://8827558932",
					tex = "rbxassetid://8827558969",
					scale = Vector3.new(.2, .2, .2),
					c0 = CFrame.new(-0.05, -0.1, -0.12) * CFrame.Angles(math.rad(90), math.rad(180), 300),
					view = 4.9,
				},
				Katana = {
					cat = "Bat",
					label = "Katana",
					mesh = "rbxassetid://13528902482",
					tex = "rbxassetid://13528902373",
					scale = Vector3.new(1.4, 1.4, 1.4),
					c0 = CFrame.new(0, .6, 0) * CFrame.Angles(math.rad(270), math.rad(180), math.rad(180)),
					view = 6.6,
				},
				Skull = {
					cat = "Medusa",
					label = "Skull",
					mesh = "rbxassetid://2050312704",
					tex = "rbxassetid://2050313393",
					scale = Vector3.new(1, 1, 1),
					c0 = CFrame.new(0, .65, -0.4) * CFrame.Angles(math.rad(330), 0, 0),
					view = 4.2,
				},
				GoldenDesertEagle = {
					cat = "Medusa",
					label = "Golden Desert Eagle",
					mesh = "rbxassetid://430251413",
					tex = "rbxassetid://435840335",
					scale = Vector3.new(.01, .01, .01),
					c0 = CFrame.new(0, 0, -0.8) * CFrame.Angles(math.rad(330), math.rad(180), 0),
					view = 3,
				},
			};
		_G.MasaCustomToolAssets = g;
		_G.MasaCustomToolSkins = _G.MasaCustomToolSkins or { Bat = "DiamondSword", Medusa = "GoldenDesertEagle" };
		local function u(u)
			local B = _G.MasaCustomToolSkins[u];
			if B and (g[B] and g[B].cat == u) then
				return B;
			end;
			return (u == "Bat") and "DiamondSword" or "GoldenDesertEagle";
		end;
		local a = false;
		local c = setmetatable({}, { __mode = "k" });
		local h = setmetatable({}, { __mode = "k" });
		local Q = setmetatable({}, { __mode = "k" });
		local e;
		local function P(u, B)
			local a = u:FindFirstChild("LocalReplica");
			if a then
				a:Destroy();
			end;
			local H = g[B] or g.DiamondSword;
			local i = Instance.new("Model");
			i.Name = "LocalReplica";
			local R = Instance.new("Part");
			R.Name = "MainPart";
			R.CanCollide = false;
			R.CanQuery = false;
			R.CanTouch = false;
			R.Massless = true;
			R.Size = Vector3.new(1, 1, 1);
			R.Transparency = 0;
			R.Anchored = false;
			R.Parent = i;
			local O = Instance.new("SpecialMesh");
			O.MeshType = Enum.MeshType.FileMesh;
			O.MeshId = H.mesh;
			O.TextureId = H.tex;
			O.Parent = R;
			local c = Instance.new("Motor6D");
			c.Part0 = u;
			c.Part1 = R;
			O.Scale = H.scale;
			c.C0 = H.c0;
			c.Parent = R;
			i.Parent = u;
			return i;
		end;
		local function m(g, u)
			if i(u) then
				return;
			end;
			if u:IsA("BasePart") or u:IsA("Decal") or u:IsA("Texture") then
				g.hidden[u] = true;
				R.claim(u, "custom", 1);
			end;
		end;
		local function Z(g)
			if c[g] then
				return;
			end;
			local B = g:FindFirstChild("Handle");
			if not B then
				if Q[g] then
					return;
				end;
				local u;
				u = g.ChildAdded:Connect(function(B)
						if B.Name == "Handle" then
							pcall(function()
								u:Disconnect();
							end);
							Q[g] = nil;
							if a then
								Z(g);
							end;
						end;
					end);
				Q[g] = u;
				return;
			end;
			local i = { hidden = {}, conns = {} };
			c[g] = i;
			for g, u in ipairs(g:GetDescendants()) do
				m(i, u);
			end;
			local R = H(g);
			local O = u(((R and R.key == "Bat")) and "Bat" or "Medusa");
			i.cat = ((R and R.key == "Bat")) and "Bat" or "Medusa";
			P(B, O);
			table.insert(i.conns, g.DescendantAdded:Connect(function(u)
				task.defer(function()
					if c[g] then
						m(i, u);
					end;
				end);
			end));
			table.insert(i.conns, g.AncestryChanged:Connect(function(u, B)
				if not B then
					e(g, false);
				end;
			end));
		end;
		function e(g, u)
			local B = c[g];
			if not B then
				return;
			end;
			for g, u in ipairs(B.conns) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			local a = g:FindFirstChild("Handle");
			if a then
				local g = a:FindFirstChild("LocalReplica");
				if g then
					pcall(function()
						g:Destroy();
					end);
				end;
			end;
			for g in pairs(B.hidden) do
				R.release(g, "custom");
			end;
			B.hidden = {};
			c[g] = nil;
		end;
		local function F(g)
			if not a then
				return;
			end;
			if g:IsA("Tool") and H(g) then
				Z(g);
			end;
		end;
		local function S(g)
			local u = h[g];
			if not u then
				return;
			end;
			for g, u in ipairs(u) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			h[g] = nil;
		end;
		local function r(g)
			if not g or h[g] then
				return;
			end;
			h[g] = { g.ChildAdded:Connect(F) };
			for g, u in ipairs(g:GetChildren()) do
				F(u);
			end;
		end;
		local function U()
			r(B:FindFirstChildOfClass("Backpack"));
			r(B.Character);
		end;
		B.ChildAdded:Connect(function(g)
			if a and g:IsA("Backpack") then
				r(g);
			end;
		end);
		B.CharacterAdded:Connect(function(g)
			for g in pairs(c) do
				e(g, false);
			end;
			for g, u in pairs(Q) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			table.clear(Q);
			for g in pairs(h) do
				S(g);
			end;
			if not a then
				return;
			end;
			r(g);
			task.defer(function()
				if a then
					U();
				end;
			end);
		end);
		table.insert(O, function()
			for g in pairs(c) do
				if not g.Parent then
					e(g, false);
				end;
			end;
			for g, u in pairs(Q) do
				if not g.Parent then
					pcall(function()
						u:Disconnect();
					end);
					Q[g] = nil;
				end;
			end;
			for g in pairs(h) do
				if not g.Parent then
					S(g);
				end;
			end;
		end);
		local function I(g, B, a)
			local i = g:FindFirstChild("Handle");
			if not i then
				return;
			end;
			local R = i:FindFirstChild("LocalReplica");
			local O = R and R:FindFirstChild("MainPart");
			local c = O and O:FindFirstChildOfClass("Motor6D");
			local h = (not R) or (not O) or (not c) or c.Part0 ~= i;
			if h then
				local B = H(g);
				P(i, u(((B and B.key == "Bat")) and "Bat" or "Medusa"));
			end;
			if h or a then
				for g, u in ipairs(g:GetDescendants()) do
					m(B, u);
				end;
			end;
		end;
		local function X(g)
			if not a then
				return;
			end;
			U();
			local u = B:FindFirstChildOfClass("Backpack");
			if u then
				for g, u in ipairs(u:GetChildren()) do
					F(u);
				end;
			end;
			local H = B.Character;
			if H then
				for g, u in ipairs(H:GetChildren()) do
					F(u);
				end;
			end;
			for u, B in pairs(c) do
				if not u.Parent then
					e(u, false);
				else
					I(u, B, g);
				end;
			end;
		end;
		_G.MasaCustomToolsRecheck = function()
				pcall(X, true);
			end;
		_G.MasaSetCustomToolSkin = function(u, B)
				if not g[B] or g[B].cat ~= u then
					return;
				end;
				_G.MasaCustomToolSkins[u] = B;
				for g, a in pairs(c) do
					if g.Parent and a.cat == u then
						local u = g:FindFirstChild("Handle");
						if u then
							pcall(P, u, B);
						end;
					end;
				end;
				if saveMasaConfig then
					pcall(saveMasaConfig);
				end;
			end;
		task.spawn(function()
			local g = 0;
			while true do
				task.wait(.4);
				if a then
					g = g + 1;
					pcall(X, (g % 5) == 0);
				end;
			end;
		end);
		B.CharacterAdded:Connect(function()
			task.delay(.6, function()
				if a then
					pcall(X, true);
				end;
			end);
		end);
		_G.MasaCustomTools = { setEnabled = function(g)
					g = g and true or false;
					a = g;
					_G.MasaCustomToolsEnabled = g;
					if g then
						U();
						pcall(X, true);
					else
						for g in pairs(c) do
							e(g, true);
						end;
						for g, u in pairs(Q) do
							pcall(function()
								u:Disconnect();
							end);
						end;
						table.clear(Q);
						for g in pairs(h) do
							S(g);
						end;
					end;
				end, isEnabled = function()
					return a;
				end };
	end;
	do
		local g = { Bat = { id = "rbxassetid://5713085119", skip = .2 }, Medusa = { id = "rbxassetid://3102797479", doublePlay = true, delay = .5 } };
		local u = setmetatable({}, { __mode = "k" });
		local a = false;
		local i = setmetatable({}, { __mode = "k" });
		local R = setmetatable({}, { __mode = "k" });
		local c = setmetatable({}, { __mode = "k" });
		local h;
		local function Q(g)
			local u = g.sound;
			if not u or not u.Parent then
				return;
			end;
			local B = g.data;
			if g.timer then
				pcall(task.cancel, g.timer);
				g.timer = nil;
			end;
			pcall(function()
				u:Stop();
				u.TimePosition = B.skip or 0;
				u.Volume = 1;
				u:Play();
			end);
			if B.doublePlay and B.delay then
				g.timer = task.delay(B.delay, function()
						g.timer = nil;
						if not a then
							return;
						end;
						if u and u.Parent then
							pcall(function()
								u:Stop();
								u.TimePosition = B.skip or 0;
								u.Volume = 1;
								u:Play();
							end);
						end;
					end);
			end;
		end;
		local function e(g, B)
			if not B:IsA("Sound") then
				return;
			end;
			if B.Name == "CustomSound" then
				return;
			end;
			if u[B] then
				return;
			end;
			if g.muted[B] ~= nil then
				return;
			end;
			g.muted[B] = B.Volume;
			u[B] = true;
			local function H()
				if not a then
					return;
				end;
				if B.Playing or B.TimePosition > 0 then
					pcall(function()
						B.Volume = 0;
						B:Stop();
					end);
					Q(g);
				end;
			end;
			local i = (B:GetPropertyChangedSignal("Playing")):Connect(H);
			local R = (B:GetPropertyChangedSignal("TimePosition")):Connect(H);
			table.insert(g.conns, i);
			table.insert(g.conns, R);
			local O;
			O = B.AncestryChanged:Connect(function(a, H)
					if H then
						return;
					end;
					pcall(function()
						i:Disconnect();
					end);
					pcall(function()
						R:Disconnect();
					end);
					pcall(function()
						O:Disconnect();
					end);
					u[B] = nil;
					g.muted[B] = nil;
					if g.timer then
						pcall(task.cancel, g.timer);
						g.timer = nil;
					end;
				end);
			table.insert(g.conns, O);
			if B.Playing then
				H();
			end;
		end;
		local function P(u)
			if i[u] then
				return;
			end;
			local B = H(u);
			if not B then
				return;
			end;
			local R = g[B.key];
			if not R then
				return;
			end;
			local O = u:FindFirstChild("Handle");
			if not O then
				if c[u] then
					return;
				end;
				local g;
				g = u.ChildAdded:Connect(function(B)
						if B.Name == "Handle" then
							pcall(function()
								g:Disconnect();
							end);
							c[u] = nil;
							if a then
								P(u);
							end;
						end;
					end);
				c[u] = g;
				return;
			end;
			local Q = O:FindFirstChild("CustomSound");
			if Q then
				pcall(function()
					Q:Destroy();
				end);
			end;
			local m = Instance.new("Sound");
			m.Name = "CustomSound";
			m.SoundId = R.id;
			m.Volume = 1;
			m.Looped = false;
			m.RollOffMode = Enum.RollOffMode.Inverse;
			m.MaxDistance = 1000;
			m.MinDistance = 1000;
			m.Parent = O;
			local Z = {
					sound = m,
					data = R,
					conns = {},
					muted = {},
				};
			i[u] = Z;
			for g, u in ipairs(u:GetDescendants()) do
				e(Z, u);
			end;
			table.insert(Z.conns, u.DescendantAdded:Connect(function(g)
				if i[u] then
					e(Z, g);
				end;
			end));
			table.insert(Z.conns, u.AncestryChanged:Connect(function(g, B)
				if not B then
					h(u);
				end;
			end));
		end;
		function h(g)
			local B = i[g];
			if not B then
				return;
			end;
			if B.timer then
				pcall(task.cancel, B.timer);
				B.timer = nil;
			end;
			for g, u in ipairs(B.conns) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			if B.sound then
				pcall(function()
					B.sound:Destroy();
				end);
			end;
			for g, B in pairs(B.muted) do
				u[g] = nil;
				if g and g.Parent then
					pcall(function()
						g.Volume = B;
					end);
				end;
			end;
			i[g] = nil;
		end;
		local function m(g)
			if not a then
				return;
			end;
			if g:IsA("Tool") and H(g) then
				P(g);
			end;
		end;
		local function Z(g)
			local u = R[g];
			if not u then
				return;
			end;
			for g, u in ipairs(u) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			R[g] = nil;
		end;
		local function F(g)
			if not g or R[g] then
				return;
			end;
			R[g] = { g.ChildAdded:Connect(m) };
			for g, u in ipairs(g:GetChildren()) do
				m(u);
			end;
		end;
		local function S()
			F(B:FindFirstChildOfClass("Backpack"));
			F(B.Character);
		end;
		B.ChildAdded:Connect(function(g)
			if a and g:IsA("Backpack") then
				F(g);
			end;
		end);
		B.CharacterAdded:Connect(function(g)
			for g in pairs(i) do
				h(g);
			end;
			for g, u in pairs(c) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			table.clear(c);
			for g in pairs(R) do
				Z(g);
			end;
			if not a then
				return;
			end;
			F(g);
			task.defer(function()
				if a then
					S();
				end;
			end);
		end);
		table.insert(O, function()
			for g in pairs(i) do
				if not g.Parent then
					h(g);
				end;
			end;
			for g, u in pairs(c) do
				if not g.Parent then
					pcall(function()
						u:Disconnect();
					end);
					c[g] = nil;
				end;
			end;
			for g in pairs(R) do
				if not g.Parent then
					Z(g);
				end;
			end;
		end);
		_G.MasaCustomSounds = { setEnabled = function(g)
					g = g and true or false;
					a = g;
					_G.MasaCustomSoundsEnabled = g;
					if g then
						S();
					else
						for g in pairs(i) do
							h(g);
						end;
						for g, u in pairs(c) do
							pcall(function()
								u:Disconnect();
							end);
						end;
						table.clear(c);
						for g in pairs(R) do
							Z(g);
						end;
					end;
				end, isEnabled = function()
					return a;
				end };
	end;
	_G.MasaRainbowToolsEnabled = false;
	_G.MasaTransparentToolsEnabled = false;
	_G.MasaCustomToolsEnabled = false;
	_G.MasaCustomSoundsEnabled = false;
end;
local z = {};
local f = {};
local G = nil;
local s = false;
local Y = nil;
_G._MasaVivid = _G._MasaVivid or {
		pickerGui = nil,
		saturation = .6,
		bloomIntensity = .8,
		bloomSize = 24,
		dofFocus = 25,
		sunIntensity = .2,
	};
local v = false;
local y = false;
_G._MasaKickWarn = _G._MasaKickWarn or {
		enabled = false,
		wasLow = false,
		active = false,
		gen = 0,
	};
_G._MasaHPWNextAllowed = _G._MasaHPWNextAllowed or 0;
local J = false;
_G._MasaDefLightBrightness = _G._MasaDefLightBrightness or nil;
_G._MasaDefLightClock = _G._MasaDefLightClock or nil;
_G._MasaDefLightAmbient = _G._MasaDefLightAmbient or nil;
_G._masaStretchUILock = false;
_G.MasaTrackerActive = false;
_G.MasaTrackerSavedStretchIndex = nil;
local gl = false;
local ul = 70;
local Bl = false;
local al = false;
local Hl = nil;
local il = nil;
local Rl = 0;
_G.MasaNoPlayerCollisionEnabled = _G.MasaNoPlayerCollisionEnabled or false;
local Ol = false;
local cl = 1;
_G.MasaCustomAnimIds = _G.MasaCustomAnimIds or {
		idle = "",
		walk = "",
		run = "",
		jump = "",
		fall = "",
		climb = "",
	};
_G.MasaCustomAnimSlots = {
		"idle",
		"walk",
		"run",
		"jump",
		"fall",
		"climb",
	};
_G.MasaCustomAnimLabels = {
		idle = "IDLE",
		walk = "WALK",
		run = "RUN",
		jump = "JUMP",
		fall = "FALL",
		climb = "CLIMB",
	};
function _G.MasaHasCustomAnim()
	for g, u in ipairs(_G.MasaCustomAnimSlots) do
		local B = _G.MasaCustomAnimIds[u];
		if B and B ~= "" then
			return true;
		end;
	end;
	return false;
end;
local hl = false;
local Ql = 1;
local el = false;
local Pl = nil;
local ml = {};
local Zl = "idle";
local Fl = nil;
local Sl = "Off";
local rl = {};
local Ul = {};
_G.MasaSetNoPlayerCollisionVisual = _G.MasaSetNoPlayerCollisionVisual or nil;
local Il = nil;
local Xl = false;
local wl = false;
local kl = {
		SpeedToggle = Enum.KeyCode.Q,
		LaggerToggle = Enum.KeyCode.R,
		DropBrainrot = Enum.KeyCode.X,
		Aimbot = Enum.KeyCode.E,
		TPBat = Enum.KeyCode.V,
		AutoPlay = Enum.KeyCode.Z,
		InstantReset = Enum.KeyCode.G,
		AntiTPBat = Enum.KeyCode.T,
		Float = Enum.KeyCode.B,
		ToggleUI = Enum.KeyCode.LeftControl,
	};
local tl = Enum.KeyCode.F;
local Vl = {
		SpeedToggle = kl.SpeedToggle,
		LaggerToggle = kl.LaggerToggle,
		DropBrainrot = kl.DropBrainrot,
		Aimbot = kl.Aimbot,
		TPBat = kl.TPBat,
		AutoPlay = kl.AutoPlay,
		InstantReset = kl.InstantReset,
		AntiTPBat = kl.AntiTPBat,
		Float = kl.Float,
		ToggleUI = kl.ToggleUI,
	};
local El = {};
local Nl = nil;
local nl = false;
local Al = 20;
local dl = nil;
local Cl = 0;
local jl = false;
local ql = Enum.KeyCode.F;
local pl = nil;
local Ll = false;
local bl = 0;
do
	local u = -7;
	local B = 4000;
	local a = 12;
	local H = ((function()
			local g, u = pcall(function()
					return Enum.RaycastFilterType.Exclude;
				end);
			if g and u then
				return u;
			end;
			local B, a = pcall(function()
					return Enum.RaycastFilterType.Blacklist;
				end);
			if B then
				return a;
			end;
			return nil;
		end))();
	local function i(g, u)
		local B = 1;
		pcall(function()
			B = u.Size.Y * .5;
		end);
		if B <= 0 then
			B = 1;
		end;
		local a = B * 3;
		pcall(function()
			if g and g.RigType == Enum.HumanoidRigType.R6 then
				a = B * 3;
			elseif g then
				a = B + ((g.HipHeight or (B * 2)));
			end;
		end);
		if a ~= a or a < 1 or a > 12 then
			a = B * 3;
		end;
		return a + .15;
	end;
	local function O(g, u, a, i)
		local O = RaycastParams.new();
		O.FilterDescendantsInstances = i;
		if H then
			O.FilterType = H;
		end;
		O.IgnoreWater = true;
		pcall(function()
			O.RespectCanCollide = true;
		end);
		local c;
		pcall(function()
			c = R:Raycast(Vector3.new(u, g, a), Vector3.new(0, -B, 0), O);
		end);
		return c;
	end;
	function _G.MasaGetGroundTPY(u, B, H)
		u = u or e.Character;
		if not u then
			return nil;
		end;
		B = B or u:FindFirstChild("HumanoidRootPart");
		if not B then
			return nil;
		end;
		H = H or u:FindFirstChildOfClass("Humanoid");
		local R = { u };
		pcall(function()
			for g, u in ipairs(g:GetPlayers()) do
				if u ~= e and u.Character then
					table.insert(R, u.Character);
				end;
			end;
		end);
		local c = B.Position;
		local h = 1;
		pcall(function()
			h = B.Size.Y * .5;
		end);
		local Q = (c.Y - h) - .1;
		local P = nil;
		for g = 1, a, 1 do
			local u = O(Q, c.X, c.Z, R);
			if not u then
				break;
			end;
			local B = u.Instance;
			local a = false;
			if B then
				pcall(function()
					if B:IsA("BasePart") and B.CanCollide == false then
						a = true;
					end;
					local g = B:FindFirstAncestorOfClass("Model");
					if g and g:FindFirstChildOfClass("Humanoid") then
						a = true;
					end;
				end);
			else
				a = true;
			end;
			if a then
				if B then
					table.insert(R, B);
				end;
				Q = u.Position.Y - .05;
			else
				P = u.Position.Y;
				break;
			end;
		end;
		if not P then
			return nil;
		end;
		local m = P + i(H, B);
		return m, P, (c.Y - P);
	end;
	function _G.MasaResolveTPDownY(g, B, a)
		local H, i = pcall(_G.MasaGetGroundTPY, g, B, a);
		if H and type(i) == "number" then
			return i, true;
		end;
		return u, false;
	end;
end;
_G._MasaTPDownMethod = _G._MasaTPDownMethod or "NORMAL";
_G._MasaZigZagSide = _G._MasaZigZagSide or 1;
_G._MasaSlowFallActive = false;
_G._MasaTPDownJumpLocked = false;
function _G.MasaSlowFallDown(g, u)
	if _G._MasaSlowFallActive then
		return;
	end;
	_G._MasaSlowFallActive = true;
	_G._MasaTPDownJumpLocked = true;
	local B = nil;
	_G._MasaZigZagFalling = false;
	if u then
		_G._MasaZigZagSide = (_G._MasaZigZagSide == -1) and 1 or -1;
		local g = e.Character;
		local u = g and g:FindFirstChild("HumanoidRootPart");
		if u then
			local g = u.CFrame.RightVector;
			local a = Vector3.new(g.X, 0, g.Z);
			if a.Magnitude > .001 then
				local g = (_G.MasaGetCurrentSpeedValue and _G.MasaGetCurrentSpeedValue()) or 16;
				B = (a.Unit * g) * _G._MasaZigZagSide;
				_G._MasaZigZagFalling = true;
			end;
		end;
	end;
	task.spawn(function()
		local g = B and 50 or 115;
		local u = os.clock() + 6;
		local H = false;
		while os.clock() < u do
			local u = e.Character;
			local i = u and u:FindFirstChild("HumanoidRootPart");
			local R = u and u:FindFirstChildOfClass("Humanoid");
			if not i or not R or R.Health <= 0 then
				break;
			end;
			if R.FloorMaterial ~= Enum.Material.Air then
				H = true;
				break;
			end;
			local O = _G._jumpEnsureProxy and _G._jumpEnsureProxy() or nil;
			local c = O or i;
			local h = c.Velocity;
			if B then
				c.Velocity = Vector3.new(B.X, -g, B.Z);
			else
				c.Velocity = Vector3.new(h.X, -g, h.Z);
			end;
			a.Heartbeat:Wait();
		end;
		if not H then
			local g = e.Character;
			local u = g and g:FindFirstChild("HumanoidRootPart");
			local B = _G._jumpEnsureProxy and _G._jumpEnsureProxy() or nil;
			if B then
				local g = B.Velocity;
				pcall(function()
					B.Velocity = Vector3.new(g.X, 0, g.Z);
				end);
			elseif u then
				local g = u.Velocity;
				pcall(function()
					u.Velocity = Vector3.new(g.X, 0, g.Z);
				end);
			end;
		end;
		_G._MasaSlowFallActive = false;
		_G._MasaZigZagFalling = false;
		local i = os.clock() + 8;
		while os.clock() < i do
			local g = e.Character;
			local u = g and g:FindFirstChildOfClass("Humanoid");
			if not u or u.Health <= 0 then
				break;
			end;
			if u.FloorMaterial ~= Enum.Material.Air then
				break;
			end;
			a.Heartbeat:Wait();
		end;
		_G._MasaTPDownJumpLocked = false;
	end);
end;
local function Tl(g)
	local u = e.Character;
	if not u then
		return;
	end;
	local B = u:FindFirstChild("HumanoidRootPart");
	if not B then
		return;
	end;
	local H = u:FindFirstChildOfClass("Humanoid");
	if not H then
		return;
	end;
	if not g then
		if H.FloorMaterial ~= Enum.Material.Air then
			return;
		end;
		if B.Position.Y < Al then
			return;
		end;
	end;
	local i = _G.MasaResolveTPDownY(u, B, H);
	if not g and (B.Position.Y - i) < .75 then
		return;
	end;
	if _G._MasaTPDownMethod == "SLOW" or _G._MasaTPDownMethod == "ZIGZAG" then
		if _G.MasaSlowFallDown then
			_G.MasaSlowFallDown(i, _G._MasaTPDownMethod == "ZIGZAG");
		end;
		return;
	end;
	B.CFrame = CFrame.new(B.Position.X, i, B.Position.Z) * CFrame.Angles(0, select(2, B.CFrame:ToEulerAnglesYXZ()), 0);
	B.AssemblyLinearVelocity = Vector3.zero;
	_G._MasaTPDownJumpLocked = true;
	task.spawn(function()
		local g = os.clock() + 8;
		while os.clock() < g do
			local g = e.Character;
			local u = g and g:FindFirstChildOfClass("Humanoid");
			if not u or u.Health <= 0 then
				break;
			end;
			if u.FloorMaterial ~= Enum.Material.Air then
				break;
			end;
			a.Heartbeat:Wait();
		end;
		_G._MasaTPDownJumpLocked = false;
	end);
end;
local function Wl()
	if dl then
		pcall(function()
			dl:Disconnect();
		end);
		pcall(function()
			task.cancel(dl);
		end);
		dl = nil;
	end;
end;
local function Dl()
	nl = true;
	Wl();
	Cl = 0;
	dl = a.Heartbeat:Connect(function()
			if not nl then
				Wl();
				return;
			end;
			local g = tick();
			if g - Cl < .1 then
				return;
			end;
			Cl = g;
			pcall(function()
				Tl(false);
			end);
		end);
	if Z.setAutoTPVisual then
		Z.setAutoTPVisual(true);
	end;
end;
local function Kl()
	nl = false;
	Wl();
	if Z.setAutoTPVisual then
		Z.setAutoTPVisual(false);
	end;
end;
local function ol()
	pcall(function()
		Tl(true);
	end);
end;
function _G.MasaRunTPDown(g)
	if not g then
		pcall(ol);
		return;
	end;
	local u = _G._MasaTPDownMethod;
	_G._MasaTPDownMethod = "NORMAL";
	pcall(ol);
	_G._MasaTPDownMethod = u;
end;
local function xl(g)
	if g then
		Dl();
	else
		Kl();
	end;
	saveMasaConfig();
end;
function _G.MasaStopAutoTPForAction()
	if nl then
		Kl();
		pcall(function()
			if Z.setAutoTPVisual then
				Z.setAutoTPVisual(false);
			end;
		end);
		pcall(saveMasaConfig);
	end;
end;
local ll = false;
local Ml = .2;
local zl = 150;
_G.MasaAfterDrop = _G.MasaAfterDrop or {};
_G.MasaAfterDrop.enabled = _G.MasaAfterDrop.enabled == true;
_G.MasaAfterDrop.action = _G.MasaAfterDrop.action or "AIMBOT";
_G.MasaAfterDrop.THRESHOLD = 25;
_G.MasaAfterDrop.SETTLE = .15;
_G.MasaAfterDrop.TIMEOUT = 3;
function _G.MasaAfterDrop.walkSpeed()
	local g = e.Character;
	local u = g and g:FindFirstChildOfClass("Humanoid");
	return u and u.WalkSpeed or nil;
end;
function _G.MasaAfterDrop.fire()
	local g = _G.MasaAfterDrop;
	if g.action == "TPBAT" then
		if _G.MasaTPBatOn == true then
			return;
		end;
		if _G.MasaStartTPBat then
			pcall(_G.MasaStartTPBat);
		end;
		if _G.MasaRefreshMobileButtonStates then
			pcall(_G.MasaRefreshMobileButtonStates);
		end;
		return;
	end;
	if _G.MasaNormalAimbotOn == true or _G.MasaBatAimbotV2On == true then
		return;
	end;
	if _G.MasaToggleSelectedAimbot then
		pcall(_G.MasaToggleSelectedAimbot);
	end;
	if _G.MasaRefreshAimbotVisual then
		pcall(_G.MasaRefreshAimbotVisual);
	end;
end;
function _G.MasaAfterDrop.onDrop(g, u)
	local B = _G.MasaAfterDrop;
	if B.enabled ~= true then
		return;
	end;
	local H = B.walkSpeed();
	if not H then
		return;
	end;
	if H >= B.THRESHOLD then
		return;
	end;
	task.spawn(function()
		local H = os.clock() + B.TIMEOUT;
		while os.clock() < H do
			if type(g) ~= "function" or not g() then
				break;
			end;
			a.Heartbeat:Wait();
		end;
		if u then
			local g = os.clock() + B.TIMEOUT;
			while os.clock() < g do
				local g = e.Character;
				local u = g and g:FindFirstChildOfClass("Humanoid");
				if not u or u.Health <= 0 then
					break;
				end;
				if u.FloorMaterial ~= Enum.Material.Air then
					break;
				end;
				a.Heartbeat:Wait();
			end;
		end;
		task.wait(B.SETTLE);
		local i = B.walkSpeed();
		if not i then
			return;
		end;
		if i < B.THRESHOLD then
			return;
		end;
		B.fire();
	end);
end;
local function fl()
	if ll then
		return;
	end;
	if _G.MasaStopAutoTPForAction then
		_G.MasaStopAutoTPForAction();
	end;
	local g = e.Character;
	if not g then
		return;
	end;
	local u = g:FindFirstChild("HumanoidRootPart");
	if not u then
		return;
	end;
	ll = true;
	if _G.MasaAfterDrop then
		_G.MasaAfterDrop.onDrop(function()
			return ll;
		end, true);
	end;
	local B = tick();
	local H;
	H = a.Heartbeat:Connect(function()
			local g = e.Character;
			local u = g and g:FindFirstChild("HumanoidRootPart");
			if not g or not u then
				if H then
					H:Disconnect();
				end;
				ll = false;
				return;
			end;
			if tick() - B >= Ml then
				if H then
					H:Disconnect();
				end;
				u.AssemblyLinearVelocity = Vector3.zero;
				u.AssemblyAngularVelocity = Vector3.zero;
				if _G.MasaRunTPDown then
					pcall(_G.MasaRunTPDown, true);
				end;
				ll = false;
				return;
			end;
			local a = _G._jumpEnsureProxy();
			if a then
				local g = a.Velocity;
				a.Velocity = Vector3.new(g.X, zl, g.Z);
			else
				u.Velocity = Vector3.new(u.Velocity.X, zl, u.Velocity.Z);
			end;
		end);
end;
local Gl = false;
local sl = {};
local Yl = "TP UP";
local function vl()
	if Gl then
		return;
	end;
	if autoBatEnabled then
		autoBatEnabled = false;
		if resetAutoBatMotion then
			resetAutoBatMotion();
		end;
		if autoBatSetVisual then
			autoBatSetVisual(false);
		end;
	end;
	Gl = true;
	if _G.MasaAfterDrop then
		_G.MasaAfterDrop.onDrop(function()
			return Gl;
		end);
	end;
	local u = a.Stepped:Connect(function()
			if not Gl then
				return;
			end;
			for g, u in ipairs(g:GetPlayers()) do
				if u ~= e and u.Character then
					for g, u in ipairs(u.Character:GetChildren()) do
						if u:IsA("BasePart") then
							u.CanCollide = false;
						end;
					end;
				end;
			end;
		end);
	table.insert(sl, u);
	local B = coroutine.create(function()
			while Gl do
				a.Heartbeat:Wait();
				local g = e.Character;
				local u = g and g:FindFirstChild("HumanoidRootPart");
				if not u then
					break;
				end;
				local B = u.Velocity;
				u.Velocity = B * 10000 + Vector3.new(0, 10000, 0);
				a.RenderStepped:Wait();
				if u and u.Parent then
					u.Velocity = B;
				end;
				a.Stepped:Wait();
				if u and u.Parent then
					u.Velocity = B + Vector3.new(0, .1, 0);
				end;
			end;
		end);
	table.insert(sl, B);
	coroutine.resume(B);
	task.delay(.1, function()
		Gl = false;
		for g, u in ipairs(sl) do
			if typeof(u) == "RBXScriptConnection" then
				pcall(function()
					u:Disconnect();
				end);
			elseif type(u) == "thread" then
				pcall(coroutine.close, u);
			end;
		end;
		sl = {};
	end);
end;
local yl = false;
local Jl = "HOLD";
local gj = false;
local uj = nil;
_G._MasaAntiRagdollMode = _G._MasaAntiRagdollMode or "V1";
_G._MasaARV2 = _G._MasaARV2 or { conn = nil, cached = {} };
do
	local g = _G._MasaARV2;
	local u = workspace.CurrentCamera;
	local function B()
		local B = e.Character;
		if not B then
			return false;
		end;
		local a = B:FindFirstChildOfClass("Humanoid");
		local H = B:FindFirstChild("HumanoidRootPart");
		if not a or not H then
			return false;
		end;
		g.cached = { character = B, humanoid = a, root = H };
		u.CameraSubject = a;
		return true;
	end;
	local function H()
		local u = g.cached.humanoid;
		if not u then
			return false;
		end;
		local B = u:GetState();
		if B == Enum.HumanoidStateType.Physics or B == Enum.HumanoidStateType.Ragdoll or B == Enum.HumanoidStateType.FallingDown then
			return true;
		end;
		local a = e:GetAttribute("RagdollEndTime");
		if a then
			if (a - workspace:GetServerTimeNow()) > 0 then
				return true;
			end;
		end;
		return false;
	end;
	local function i()
		local u = g.cached.character;
		if not u then
			return;
		end;
		for g, u in ipairs(u:GetDescendants()) do
			if u:IsA("BallSocketConstraint") or (u:IsA("Attachment") and u.Name:find("RagdollAttachment")) then
				pcall(function()
					u:Destroy();
				end);
			end;
		end;
	end;
	local function R()
		local B = g.cached.humanoid;
		local a = g.cached.root;
		if not B or not a then
			return;
		end;
		pcall(function()
			e:SetAttribute("RagdollEndTime", workspace:GetServerTimeNow());
		end);
		if B.Health > 0 then
			B:ChangeState(Enum.HumanoidStateType.Running);
		end;
		a.Anchored = false;
		a.AssemblyLinearVelocity = Vector3.zero;
		a.AssemblyAngularVelocity = Vector3.zero;
		a.CFrame = CFrame.new(a.Position) * CFrame.Angles(0, math.rad(a.Orientation.Y), 0);
		if u.CameraSubject ~= B then
			u.CameraSubject = B;
		end;
	end;
	function _G._MasaStartARV2()
		if g.conn then
			return;
		end;
		if not B() then
			return;
		end;
		g.conn = a.RenderStepped:Connect(function()
				if not g.cached.humanoid or not g.cached.humanoid.Parent then
					return;
				end;
				if H() then
					i();
					R();
				end;
			end);
	end;
	function _G._MasaStopARV2()
		if g.conn then
			g.conn:Disconnect();
			g.conn = nil;
		end;
		g.cached = {};
	end;
	function _G._MasaRestartARV2()
		_G._MasaStopARV2();
		task.wait(.5);
		if gj and _G._MasaAntiRagdollMode == "V2" then
			B();
			_G._MasaStartARV2();
		end;
	end;
end;
local Bj = false;
_G._MasaAntiDieUserWanted = false;
local aj = {};
local Hj = nil;
local function ij(g)
	local u = g:FindFirstChildOfClass("Humanoid");
	local B = g:FindFirstChild("HumanoidRootPart");
	if not u or not B or u.Health <= 0 then
		return;
	end;
	pcall(function()
		u:ChangeState(Enum.HumanoidStateType.GettingUp);
		u:ChangeState(Enum.HumanoidStateType.Running);
		B.Velocity = Vector3.zero;
		B.RotVelocity = Vector3.zero;
		B.AssemblyLinearVelocity = Vector3.zero;
		B.AssemblyAngularVelocity = Vector3.zero;
		u.PlatformStand = false;
		u.Sit = false;
		u.AutoRotate = true;
		u.JumpPower = u.JumpPower > 0 and u.JumpPower or 50;
		u.WalkSpeed = u.WalkSpeed > 0 and u.WalkSpeed or 16;
		for g, u in ipairs(g:GetDescendants()) do
			if u:IsA("Motor6D") then
				u.Enabled = true;
			elseif u:IsA("Constraint") or u:IsA("BallSocketConstraint") or u:IsA("HingeConstraint") then
				u.Enabled = true;
			elseif u:IsA("BasePart") then
				u.CanCollide = true;
				u.AssemblyLinearVelocity = Vector3.zero;
				u.AssemblyAngularVelocity = Vector3.zero;
			end;
		end;
		workspace.CurrentCamera.CameraSubject = u;
		local a = e.PlayerScripts:FindFirstChild("PlayerModule");
		if a then
			local g = a:FindFirstChild("ControlModule");
			if g then
				local u, B = pcall(require, g);
				if u and (B and B.Enable) then
					B:Enable();
				end;
			end;
		end;
	end);
end;
local function Rj()
	if uj then
		return;
	end;
	uj = a.Heartbeat:Connect(function()
			if not gj then
				return;
			end;
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChildOfClass("Humanoid");
			if not u then
				return;
			end;
			local B = u:GetState();
			if B == Enum.HumanoidStateType.Physics or B == Enum.HumanoidStateType.Ragdoll or B == Enum.HumanoidStateType.FallingDown or B == Enum.HumanoidStateType.Dead or u.PlatformStand == true or u.Sit == true then
				ij(g);
			end;
		end);
end;
local function Oj()
	gj = true;
	if _G._MasaAntiRagdollMode == "V2" then
		if _G._MasaStartARV2 then
			_G._MasaStartARV2();
		end;
	else
		Rj();
	end;
end;
local function cj()
	gj = false;
	if uj then
		uj:Disconnect();
		uj = nil;
	end;
	if _G._MasaStopARV2 then
		_G._MasaStopARV2();
	end;
end;
local function hj(g)
	gj = g and true or false;
	if gj then
		Oj();
	else
		cj();
	end;
end;
local Qj = {
		healthThreshold = 25,
		invincibilityFrames = .5,
		blockDeadState = true,
		blockDamageEvents = true,
		autoRepairCharacter = true,
	};
local ej = 0;
local Pj = nil;
local function mj(g)
	if not g or not g.Parent then
		return;
	end;
	if tick() < ej then
		return;
	end;
	local u = g.MaxHealth or 100;
	g.Health = u;
	ej = tick() + Qj.invincibilityFrames;
	pcall(function()
		local B = g.Parent;
		if not B then
			return;
		end;
		for g, B in ipairs(B:GetChildren()) do
			if B:IsA("NumberValue") then
				local g = B.Name:lower();
				if g:find("health") or g:find("hp") or g:find("life") then
					B.Value = u;
				end;
			end;
			if B:IsA("BoolValue") and (B.Name:lower()):find("dead") then
				B.Value = false;
			end;
		end;
	end);
end;
local function Zj(g)
	if not g then
		return;
	end;
	local u = g:FindFirstChildOfClass("Humanoid");
	local B = g:FindFirstChild("HumanoidRootPart");
	if not u or not B then
		return;
	end;
	local a = {
			"Head",
			"Torso",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
		};
	for u, a in ipairs(a) do
		if not g:FindFirstChild(a) then
			local u = Instance.new("Part");
			u.Name = a;
			u.Size = Vector3.new(2, 1, 1);
			u.Transparency = 1;
			u.CanCollide = false;
			u.Anchored = false;
			u.Material = Enum.Material.SmoothPlastic;
			u.CFrame = B.CFrame + Vector3.new(0, 2, 0);
			u.Parent = g;
			local H = Instance.new("Motor6D");
			H.Part0 = B;
			H.Part1 = u;
			H.Parent = u;
		end;
	end;
end;
local function Fj(g, u)
	pcall(function()
		local u = g.TakeDamage;
		g.TakeDamage = function(B, a)
				if a and a > 0 then
					mj(g);
					return;
				end;
				return u(B, a);
			end;
	end);
	pcall(function()
		table.insert(u, g.Damage:Connect(function(u)
			if u and u > 0 then
				mj(g);
			end;
		end));
	end);
end;
local function Sj(g)
	local u = g:FindFirstChildOfClass("Humanoid");
	if not u then
		u = g:WaitForChild("Humanoid", 5);
		if not u then
			return;
		end;
	end;
	local B = {};
	local H = {};
	local function i(g)
		local u = task.spawn(g);
		table.insert(H, u);
	end;
	local function R(g)
		table.insert(B, g);
		return g;
	end;
	local O = g:FindFirstChild("HumanoidRootPart");
	if not O then
		O = Instance.new("Part");
		O.Name = "HumanoidRootPart";
		O.Size = Vector3.new(2, 1, 1);
		O.Transparency = 1;
		O.CanCollide = false;
		O.Anchored = false;
		O.Parent = g;
		pcall(function()
			u:SetRootPart(O);
		end);
	end;
	u.BreakJointsOnDeath = false;
	u.RequiresNeck = false;
	local c = g:FindFirstChild("Health");
	if c then
		c:Destroy();
	end;
	if not g:FindFirstChild("ForceField") then
		local u = Instance.new("ForceField");
		u.Visible = false;
		u.Parent = g;
	end;
	if Qj.blockDeadState then
		u:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
	end;
	u:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
	u:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
	pcall(function()
		u:SetStateEnabled(Enum.HumanoidStateType.GettingUp, false);
	end);
	R(u.StateChanged:Connect(function(g, B)
		if B == Enum.HumanoidStateType.Dead or B == Enum.HumanoidStateType.Ragdoll or B == Enum.HumanoidStateType.FallingDown then
			u:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end));
	R((u:GetPropertyChangedSignal("Health")):Connect(function()
		if u.Health <= 0 or u.Health <= Qj.healthThreshold then
			mj(u);
		end;
		if u.Health > u.MaxHealth then
			u.Health = u.MaxHealth;
		end;
	end));
	R(u.Died:Connect(function()
		task.wait(.05);
		if u and u.Parent then
			mj(u);
		end;
	end));
	R((u:GetPropertyChangedSignal("MaxHealth")):Connect(function()
		if u.MaxHealth < 100 then
			u.MaxHealth = math.huge;
		end;
		if u.Health > u.MaxHealth then
			u.Health = u.MaxHealth;
		end;
		if u.Health <= 0 then
			mj(u);
		end;
	end));
	if Qj.blockDamageEvents then
		Fj(u, B);
	end;
	R((u:GetPropertyChangedSignal("BreakJointsOnDeath")):Connect(function()
		if u.BreakJointsOnDeath == true then
			u.BreakJointsOnDeath = false;
		end;
	end));
	pcall(function()
		u.BreakJoints = function()
 
			end;
	end);
	pcall(function()
		g.BreakJoints = function()
 
			end;
	end);
	local function h(g)
		if g:IsA("Motor6D") or g:IsA("Weld") then
			R(g.AncestryChanged:Connect(function(u, B)
				if not B and (g.Part0 and g.Part1) then
					pcall(function()
						local u = g:Clone();
						u.Parent = g.Part0;
					end);
				end;
			end));
		end;
	end;
	for g, u in pairs(g:GetDescendants()) do
		h(u);
	end;
	R(g.DescendantAdded:Connect(h));
	for g, u in pairs(g:GetDescendants()) do
		if u:IsA("BasePart") then
			R(u.Touched:Connect(function(g)
				if g and g.Parent then
					local u = string.lower(g.Name);
					if u:find("kill") or u:find("damage") or u:find("lava") or u:find("hit") or u:find("fire") or u:find("spike") then
						pcall(function()
							g.CanTouch = false;
							local u = g:FindFirstChild("TouchInterest");
							if u then
								u:Destroy();
							end;
						end);
					end;
				end;
			end));
		end;
	end;
	R(g.ChildAdded:Connect(function(g)
		a.RenderStepped:Wait();
		if g:IsA("Explosion") or g:IsA("Fire") or g:IsA("Smoke") then
			g:Destroy();
		end;
		if g:IsA("Tool") then
			for g, u in pairs(g:GetDescendants()) do
				if u:IsA("BasePart") then
					u.CanTouch = false;
					local g = u:FindFirstChild("TouchInterest");
					if g then
						g:Destroy();
					end;
				end;
			end;
		end;
	end));
	local Q = {
			"Head",
			"UpperTorso",
			"Torso",
			"HumanoidRootPart",
			"LeftArm",
			"RightArm",
			"LeftLeg",
			"RightLeg",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
		};
	R(g.ChildRemoved:Connect(function(B)
		if B.Name == "HumanoidRootPart" then
			local B = Instance.new("Part");
			B.Name = "HumanoidRootPart";
			B.Size = Vector3.new(2, 1, 1);
			B.Transparency = 1;
			B.CanCollide = false;
			B.Anchored = false;
			B.CFrame = CFrame.new((g:GetPivot()).Position);
			B.Parent = g;
			O = B;
			pcall(function()
				u.RootPart = O;
			end);
		end;
		for a, H in ipairs(Q) do
			if B.Name == H then
				task.wait(.05);
				mj(u);
				Zj(g);
				break;
			end;
		end;
	end));
	if Qj.autoRepairCharacter then
		Zj(g);
	end;
	i(function()
		while g and (g.Parent and Bj) do
			task.wait(2);
			if not Bj then
				break;
			end;
			pcall(function()
				u.RequiresNeck = false;
				u.BreakJointsOnDeath = false;
				if Qj.blockDeadState then
					u:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
				end;
				u:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false);
				u:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false);
				if not g:FindFirstChild("ForceField") then
					local u = Instance.new("ForceField");
					u.Visible = false;
					u.Parent = g;
				end;
				if Qj.autoRepairCharacter then
					Zj(g);
				end;
			end);
		end;
	end);
	i(function()
		while g and (g.Parent and Bj) do
			task.wait(.1);
			if not Bj then
				break;
			end;
			pcall(function()
				if u.Health < u.MaxHealth then
					mj(u);
				end;
				if u.BreakJointsOnDeath == true then
					u.BreakJointsOnDeath = false;
				end;
				if u.RequiresNeck == true then
					u.RequiresNeck = false;
				end;
				if Qj.blockDeadState then
					u:SetStateEnabled(Enum.HumanoidStateType.Dead, false);
				end;
			end);
		end;
	end);
	i(function()
		while g and (g.Parent and Bj) do
			task.wait(1);
			if not Bj then
				break;
			end;
			if not g:FindFirstChild("ForceField") then
				local u = Instance.new("ForceField");
				u.Visible = false;
				u.Parent = g;
			end;
		end;
	end);
	mj(u);
	aj[g] = { conns = B, tasks = H };
end;
local function rj(g)
	if next(aj) ~= nil or Hj then
		Bj = true;
		return;
	end;
	Bj = true;
	if not Pj then
		Pj = a.Heartbeat:Connect(function()
				if not Bj then
					return;
				end;
				local g = e.Character;
				if not g then
					return;
				end;
				local u = g:FindFirstChildOfClass("Humanoid");
				if not u then
					return;
				end;
				if u.Health <= 0 or u.Health <= Qj.healthThreshold then
					mj(u);
				end;
			end);
	end;
	if e.Character then
		Sj(e.Character);
	end;
	Hj = e.CharacterAdded:Connect(function(g)
			task.wait(.1);
			if Bj then
				Sj(g);
			end;
		end);
	if not g then
		if Z.setAntiDieVisual then
			Z.setAntiDieVisual(true);
		end;
		saveMasaConfig();
	end;
end;
local function Uj(g)
	Bj = false;
	if Pj then
		Pj:Disconnect();
		Pj = nil;
	end;
	for g, u in pairs(aj) do
		local B = (type(u) == "table" and u.conns) or u;
		if B then
			for g, u in ipairs(B) do
				pcall(function()
					u:Disconnect();
				end);
			end;
		end;
		if type(u) == "table" and u.tasks then
			for g, u in ipairs(u.tasks) do
				pcall(function()
					task.cancel(u);
				end);
			end;
		end;
		pcall(function()
			local u = g:FindFirstChildOfClass("Humanoid");
			if u then
				u:SetStateEnabled(Enum.HumanoidStateType.Dead, true);
				u:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true);
				u:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
				pcall(function()
					u:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true);
				end);
				u.BreakJointsOnDeath = true;
				u.RequiresNeck = true;
			end;
		end);
		pcall(function()
			local u = g:FindFirstChildOfClass("ForceField");
			if u then
				u:Destroy();
			end;
		end);
	end;
	aj = {};
	if Hj then
		Hj:Disconnect();
		Hj = nil;
	end;
	local u = e.Character;
	if u then
		local g = u:FindFirstChildOfClass("Humanoid");
		if g then
			pcall(function()
				g:SetStateEnabled(Enum.HumanoidStateType.Dead, true);
				g:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, true);
				g:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true);
				pcall(function()
					g:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true);
				end);
				g.BreakJointsOnDeath = true;
				g.RequiresNeck = true;
			end);
		end;
		pcall(function()
			local g = u:FindFirstChildOfClass("ForceField");
			if g then
				g:Destroy();
			end;
		end);
	end;
	ej = 0;
	if not g then
		if Z.setAntiDieVisual then
			Z.setAntiDieVisual(false);
		end;
		saveMasaConfig();
	end;
end;
local function Ij(g)
	if _G.MasaAntiDieUserOverride then
		_G.MasaAntiDieUserOverride();
	end;
	Bj = g and true or false;
	_G._MasaAntiDieUserWanted = Bj;
	if Bj then
		rj();
	else
		Uj();
	end;
end;
do
	_G._MasaAntiDieAutoOn = false;
	local function g()
		if _G.MasaTPBatOn == true then
			return true;
		end;
		if _G.MasaBatCounterV2On == true then
			return true;
		end;
		if _G.MasaNormalAimbotOn == true then
			return true;
		end;
		if _G.MasaBatAimbotV2On == true then
			return true;
		end;
		if _G.MasaAntiTPBatEnabled == true then
			return true;
		end;
		if _G.MasaFloatOn == true then
			return true;
		end;
		return false;
	end;
	function _G.MasaAntiDieLocked()
		return g();
	end;
	function _G.MasaAntiDieAutoSync()
		local u = g();
		if u and not Bj then
			_G._MasaAntiDieAutoOn = true;
			pcall(rj, true);
		elseif not u and _G._MasaAntiDieAutoOn then
			local g = _G._MasaAntiDieHoldUntil or 0;
			if os.clock() < g then
				if not _G._MasaAntiDieHoldPending then
					_G._MasaAntiDieHoldPending = true;
					task.delay(((g - os.clock())) + .05, function()
						_G._MasaAntiDieHoldPending = false;
						if _G.MasaAntiDieAutoSync then
							pcall(_G.MasaAntiDieAutoSync);
						end;
					end);
				end;
			else
				_G._MasaAntiDieAutoOn = false;
				pcall(Uj, true);
			end;
		elseif u and (Bj and not _G._MasaAntiDieAutoOn) then
			_G._MasaAntiDieAutoOn = false;
		end;
	end;
	function _G.MasaAntiDieUserOverride()
		_G._MasaAntiDieAutoOn = false;
	end;
	function _G.MasaAntiDieArmNow(g)
		local function u()
			if not Bj then
				return false;
			end;
			local g = e.Character;
			if not g then
				return true;
			end;
			return aj[g] ~= nil;
		end;
		if u() then
			return true;
		end;
		_G._MasaAntiDieHoldUntil = os.clock() + .5;
		if not Bj then
			_G._MasaAntiDieAutoOn = true;
			pcall(rj, true);
		elseif e.Character then
			pcall(Sj, e.Character);
		end;
		local B = os.clock() + ((tonumber(g) or .5));
		while os.clock() < B do
			if u() then
				return true;
			end;
			a.Heartbeat:Wait();
		end;
		return false;
	end;
	function _G.MasaAntiDieStatus()
		local u = e.Character;
		return (("AntiDie acceso=%s | applicato=%s | auto=%s | moduli=%s")):format(tostring(Bj), tostring(u ~= nil and aj[u] ~= nil), tostring(_G._MasaAntiDieAutoOn == true), tostring(g()));
	end;
end;
_G._MasaInstantResetBusy = false;
_G.MasaInstantResetVersion = math.clamp(tonumber(_G.MasaInstantResetVersion) or 1, 1, 2);
_G._MasaDoInstantResetV2 = function()
		_G._MasaResetGaveUp = false;
		local g = e.Character;
		if not g then
			_G._MasaResetGaveUp = true;
			return;
		end;
		local u = g:FindFirstChildOfClass("Humanoid");
		local B = g:FindFirstChild("HumanoidRootPart");
		if not u or not B then
			_G._MasaResetGaveUp = true;
			return;
		end;
		local H = u.PlatformStand;
		local i = u.BreakJointsOnDeath;
		local R, O = 500, .3;
		local c = 1000000000;
		local function h(g, u)
			g.BreakJointsOnDeath = true;
			g.PlatformStand = true;
			g:ChangeState(Enum.HumanoidStateType.Physics);
			u.AssemblyAngularVelocity = Vector3.new(0, 0, 0);
			u.AssemblyLinearVelocity = Vector3.new(0, c, 0);
		end;
		local function Q()
			local u = e.Character;
			if u ~= g or not g.Parent then
				return false;
			end;
			local B = u and u:FindFirstChildOfClass("Humanoid");
			if not B or B.Health <= 0 then
				return false;
			end;
			local a = u:FindFirstChild("HumanoidRootPart");
			if a then
				pcall(h, B, a);
			end;
			return true;
		end;
		local P = os.clock();
		for g = 1, R, 1 do
			if not Q() then
				return;
			end;
		end;
		while (os.clock() - P) < O do
			a.Heartbeat:Wait();
			if not Q() then
				return;
			end;
		end;
		if not g.Parent or e.Character ~= g then
			return;
		end;
		if u.Health <= 0 then
			return;
		end;
		_G._MasaResetGaveUp = true;
		pcall(function()
			u.PlatformStand = H;
			u.BreakJointsOnDeath = i;
			u:ChangeState(Enum.HumanoidStateType.GettingUp);
			B.AssemblyLinearVelocity = Vector3.new(0, 0, 0);
		end);
	end;
_G._MasaDoInstantResetV1 = function()
		_G._MasaResetGaveUp = false;
		local g = e.Character;
		if not g then
			_G._MasaResetGaveUp = true;
			return;
		end;
		local u = g:FindFirstChildOfClass("Humanoid");
		if not u then
			_G._MasaResetGaveUp = true;
			return;
		end;
		local B = u.HipHeight;
		local a = 0;
		local H = false;
		while g and (g.Parent and (u and (u.Health > 0 and (e.Character == g and a < 40)))) do
			pcall(function()
				u.HipHeight = 1e+30;
				u.AutoRotate = true;
				for g, u in ipairs(g:GetChildren()) do
					if u:IsA("BasePart") then
						u.CanCollide = false;
					end;
				end;
			end);
			if not g.Parent or u.Health <= 0 or e.Character ~= g then
				H = true;
				break;
			end;
			a = a + 1;
			task.wait(.05);
		end;
		if not H and (g and (g.Parent and (u and u.Health > 0))) then
			pcall(function()
				u.Health = 0;
			end);
			task.wait(.1);
			if not g.Parent or u.Health <= 0 then
				H = true;
			end;
		end;
		if not H then
			_G._MasaResetGaveUp = true;
			if g and (g.Parent and u) then
				pcall(function()
					u.HipHeight = B;
					for g, u in ipairs(g:GetChildren()) do
						if u:IsA("BasePart") then
							u.CanCollide = true;
						end;
					end;
				end);
			end;
		end;
	end;
_G._MasaDoInstantReset = function()
		if ((tonumber(_G.MasaInstantResetVersion) or 1)) == 2 then
			_G._MasaDoInstantResetV2();
		else
			_G._MasaDoInstantResetV1();
		end;
	end;
_G._MasaResetCamConn = nil;
_G._MasaResetCamSaved = nil;
_G._MasaLockResetCamera = function()
		local g = workspace.CurrentCamera;
		if not g then
			return;
		end;
		_G._MasaUnlockResetCamera();
		_G._MasaResetCamSaved = { cframe = g.CFrame, type = g.CameraType, subject = g.CameraSubject };
		g.CameraType = Enum.CameraType.Scriptable;
		_G._MasaResetCamConn = a.RenderStepped:Connect(function()
				local g = workspace.CurrentCamera;
				local u = _G._MasaResetCamSaved;
				if not g or not u then
					return;
				end;
				if g.CameraType ~= Enum.CameraType.Scriptable then
					g.CameraType = Enum.CameraType.Scriptable;
				end;
				g.CFrame = u.cframe;
			end);
	end;
_G._MasaUnlockResetCamera = function()
		if _G._MasaResetCamConn then
			pcall(function()
				_G._MasaResetCamConn:Disconnect();
			end);
			_G._MasaResetCamConn = nil;
		end;
		local g = _G._MasaResetCamSaved;
		_G._MasaResetCamSaved = nil;
		if not g then
			return;
		end;
		local u = workspace.CurrentCamera;
		if not u then
			return;
		end;
		pcall(function()
			local B = e.Character;
			local a = B and B:FindFirstChildOfClass("Humanoid");
			u.CameraType = (g.type == Enum.CameraType.Scriptable) and Enum.CameraType.Custom or g.type;
			u.CameraSubject = a or g.subject;
		end);
	end;
_G.MasaInstantReset = function()
		if _G._MasaInstantResetBusy then
			return;
		end;
		_G._MasaInstantResetBusy = true;
		local g = (Bj == true);
		local u = (_G.MasaAntiVoidEnabled == true);
		_G._MasaResetOldChar = e.Character;
		_G._MasaResetGaveUp = false;
		if u then
			_G._MasaAntiVoidPaused = true;
			if _G.MasaAntiVoid then
				pcall(_G.MasaAntiVoid.setEnabled, false);
			end;
			if Z.setAntiVoidVisual then
				pcall(Z.setAntiVoidVisual, true);
			end;
		end;
		if g then
			pcall(Uj, true);
			Bj = true;
			if Z.setAntiDieVisual then
				pcall(Z.setAntiDieVisual, true);
			end;
		end;
		pcall(_G._MasaLockResetCamera);
		task.spawn(function()
			pcall(_G._MasaDoInstantReset);
		end);
		task.spawn(function()
			local g = _G._MasaResetOldChar;
			local B = tick() + 25;
			while tick() < B do
				if _G._MasaResetGaveUp then
					break;
				end;
				local u = e.Character;
				if u and (u.Parent and u ~= g) then
					if _G._MasaWaitCharReady then
						pcall(_G._MasaWaitCharReady, u, 10);
					end;
					local g = u:FindFirstChildOfClass("Humanoid");
					local B = u:FindFirstChild("HumanoidRootPart");
					if g and (B and g.Health > 0) then
						break;
					end;
				end;
				task.wait(.05);
			end;
			pcall(_G._MasaUnlockResetCamera);
			if u then
				if _G.MasaAntiVoid then
					pcall(_G.MasaAntiVoid.setEnabled, true);
				end;
				_G._MasaAntiVoidPaused = false;
				if Z.setAntiVoidVisual then
					pcall(Z.setAntiVoidVisual, true);
				end;
			end;
		end);
		task.delay(.5, function()
			if not g then
				_G._MasaInstantResetBusy = false;
				return;
			end;
			task.spawn(function()
				local g = tick() + 20;
				while tick() < g do
					local g = e.Character;
					local u = g and g:FindFirstChildOfClass("Humanoid");
					if g and (g.Parent and (u and u.Health > 0)) then
						break;
					end;
					task.wait(.1);
				end;
				Bj = false;
				pcall(Ij, true);
				if Z.setAntiDieVisual then
					pcall(Z.setAntiDieVisual, true);
				end;
				_G._MasaInstantResetBusy = false;
			end);
		end);
	end;
_G.MasaNormalInfJump = _G.MasaNormalInfJump or {
		holdPressed = false,
		holdActive = false,
		controllerActive = false,
		mobilePressed = false,
		mobileActive = false,
		hooked = {},
	};
_G.MasaNormalInfJump = _G.MasaNormalInfJump or {
		holdPressed = false,
		holdActive = false,
		controllerActive = false,
		mobilePressed = false,
		mobileActive = false,
		hooked = {},
	};
local Xj = nil;
local wj = nil;
function _G._jumpEnsureProxy()
	local g = e.Character;
	if not g then
		return nil;
	end;
	return g:FindFirstChild("HumanoidRootPart");
end;
function _G.MasaApplyNormalInfJumpBoost(g)
	if not yl then
		return;
	end;
	if _G._MasaTPDownJumpLocked then
		return;
	end;
	local u = e.Character;
	if not u then
		return;
	end;
	local B = u:FindFirstChildOfClass("Humanoid");
	if not B or B.Health <= 0 then
		return;
	end;
	local a = _G._jumpEnsureProxy();
	if not a then
		return;
	end;
	local H = a.Velocity;
	a.Velocity = Vector3.new(H.X, g or 50, H.Z);
end;
function _G.MasaStopNormalInfJumpHoldState()
	local g = _G.MasaNormalInfJump;
	g.holdPressed = false;
	g.holdActive = false;
	g.controllerActive = false;
	g.mobilePressed = false;
	g.mobileActive = false;
end;
u.JumpRequest:Connect(function()
	_G.MasaApplyNormalInfJumpBoost(50);
end);
u.InputBegan:Connect(function(g)
	if u:GetFocusedTextBox() then
		return;
	end;
	local B = _G.MasaNormalInfJump;
	if g.UserInputType == Enum.UserInputType.Keyboard and g.KeyCode == Enum.KeyCode.Space then
		if Jl == "MANUAL" then
			return;
		end;
		B.holdPressed = true;
		task.delay(.12, function()
			if _G.MasaNormalInfJump.holdPressed and yl then
				_G.MasaNormalInfJump.holdActive = true;
				_G.MasaApplyNormalInfJumpBoost(50);
			end;
		end);
	elseif g.KeyCode == Enum.KeyCode.ButtonA and g.UserInputType.Name:match("^Gamepad") then
		if Jl ~= "MANUAL" then
			B.controllerActive = true;
		end;
	end;
end);
u.InputEnded:Connect(function(g)
	local u = _G.MasaNormalInfJump;
	if g.UserInputType == Enum.UserInputType.Keyboard and g.KeyCode == Enum.KeyCode.Space then
		u.holdPressed = false;
		u.holdActive = false;
	end;
	if g.KeyCode == Enum.KeyCode.ButtonA and g.UserInputType.Name:match("^Gamepad") then
		u.controllerActive = false;
	end;
end);
function _G.MasaHookNormalInfMobileJumpButton(g)
	local u = _G.MasaNormalInfJump;
	if not g or g.Name ~= "JumpButton" or not g:IsA("GuiButton") or u.hooked[g] then
		return;
	end;
	u.hooked[g] = true;
	g.InputBegan:Connect(function(g)
		if g.UserInputType ~= Enum.UserInputType.Touch or not yl then
			return;
		end;
		if Jl == "MANUAL" then
			return;
		end;
		_G.MasaNormalInfJump.mobilePressed = true;
		task.delay(.12, function()
			if _G.MasaNormalInfJump.mobilePressed and yl then
				_G.MasaNormalInfJump.mobileActive = true;
				_G.MasaApplyNormalInfJumpBoost(50);
			end;
		end);
	end);
	g.InputEnded:Connect(function(g)
		if g.UserInputType == Enum.UserInputType.Touch then
			_G.MasaNormalInfJump.mobilePressed = false;
			_G.MasaNormalInfJump.mobileActive = false;
		end;
	end);
	g.AncestryChanged:Connect(function(u, B)
		if not B then
			_G.MasaNormalInfJump.hooked[g] = nil;
			_G.MasaNormalInfJump.mobilePressed = false;
			_G.MasaNormalInfJump.mobileActive = false;
		end;
	end);
end;
for g, u in ipairs(P:GetDescendants()) do
	_G.MasaHookNormalInfMobileJumpButton(u);
end;
P.DescendantAdded:Connect(function(g)
	task.defer(_G.MasaHookNormalInfMobileJumpButton, g);
end);
a.Heartbeat:Connect(function()
	local g = _G.MasaNormalInfJump;
	if yl and (Jl == "HOLD" and ((g.holdActive or g.mobileActive or g.controllerActive))) then
		_G.MasaApplyNormalInfJumpBoost(50);
	end;
end);
setInfJumpInternal = function(g)
		yl = g and true or false;
		if not yl then
			_G.MasaStopNormalInfJumpHoldState();
			local g = e.Character;
			local u = g and g:FindFirstChild("HumanoidRootPart");
			if u then
				pcall(function()
					u.Velocity = Vector3.zero;
				end);
			end;
		end;
	end;
e.CharacterAdded:Connect(function(g)
	_G._MasaWaitCharReady(g, 10);
	Xj = nil;
	wj = nil;
	if yl then
		_G._jumpEnsureProxy();
	end;
end);
e.CharacterAdded:Connect(function(g)
	_G._MasaWaitCharReady(g, 10);
	if gj then
		if uj then
			uj:Disconnect();
			uj = nil;
		end;
		if _G._MasaStopARV2 then
			_G._MasaStopARV2();
		end;
		Oj();
	end;
end);
if e.Character then
	task.wait(.1);
	if yl then
		_G._jumpEnsureProxy();
	end;
end;
local kj = 1;
local tj = {};
local Vj = nil;
_G._MasaTabPosition = "Up";
function _G.MasaValidTabPosition(g)
	return "Up";
end;
local Ej = .75;
local Nj = .9;
CONFIG_FILE = "MASAG.json";
KEYBINDS_CONFIG_FILE = "MASA_Keybinds.json";
_masa_isfile = isfile or (syn and syn.isfile) or function(g)
		local u, B = pcall(function()
				return readfile(g);
			end);
		return u and B ~= nil;
	end;
_masa_readfile = readfile or (syn and syn.readfile);
_masa_writefile = writefile or (syn and syn.writefile);
canSaveConfig = (type(_masa_readfile) == "function" and type(_masa_writefile) == "function");
selectedIntroMusic = selectedIntroMusic or 1;
_introEnabled = (_introEnabled ~= false);
setIntroVisual = nil;
setIntroSongVisual = nil;
INTRO_MUSIC_OPTIONS = INTRO_MUSIC_OPTIONS or {
		{ name = "Song 1", url = "https://files.catbox.moe/4inuat.mp3", file = "MasaHubIntroSong1.mp3" },
		{ name = "Song 2", url = "https://files.catbox.moe/nyyijv.mp3", file = "MasaHubIntroSong2.mp3" },
		{ name = "Song 3", url = "https://files.catbox.moe/bumu1r.mp3", file = "MasaHubIntroSong3.mp3" },
		{ name = "Song 4", url = "https://files.catbox.moe/fvms23.mp3", file = "MasaHubIntroSong4.mp3" },
		{ name = "Song 5", url = "https://files.catbox.moe/jkbi33.mp3", file = "MasaHubIntroSong5.mp3" },
		{ name = "Song 6", url = "https://files.catbox.moe/rweyqn.mp3", file = "MasaHubIntroSong6.mp3" },
		{ name = "Song 7", url = "https://files.catbox.moe/m735rs.mp3", file = "MasaHubIntroSong7.mp3" },
	};
function getIntroSongName()
	local g = INTRO_MUSIC_OPTIONS[selectedIntroMusic];
	return g and g.name or "No Songs Added";
end;
introPreviewSound = nil;
introPlaybackSound = nil;
introPreviewToken = 0;
introPlaybackToken = 0;
introSongCache = introSongCache or {};
introSongDownloading = introSongDownloading or {};
function stopIntroPreview()
	introPreviewToken = introPreviewToken + 1;
	if introPreviewSound then
		local g = introPreviewSound;
		local u = B:Create(g, TweenInfo.new(1.5, Enum.EasingStyle.Linear), { Volume = 0 });
		u:Play();
		task.delay(1.6, function()
			pcall(function()
				if g and g.Parent then
					g:Stop();
					g:Destroy();
				end;
			end);
		end);
		introPreviewSound = nil;
	end;
end;
function stopIntroPlayback()
	introPlaybackToken = introPlaybackToken + 1;
	if introPlaybackSound then
		local g = introPlaybackSound;
		local u = g.Volume;
		local a = B:Create(g, TweenInfo.new(1.5, Enum.EasingStyle.Linear), { Volume = 0 });
		a:Play();
		task.delay(1.6, function()
			pcall(function()
				if g and g.Parent then
					g:Stop();
					g:Destroy();
				end;
			end);
		end);
		introPlaybackSound = nil;
	end;
end;
function _safeNotify(g)
	if showActionNotification then
		pcall(function()
			showActionNotification(g);
		end);
	end;
end;
function cacheIntroSong(g, u)
	if not g or not g.url or g.url == "" then
		return nil;
	end;
	if not ((writefile and getcustomasset)) then
		return nil;
	end;
	local B = g.file or ("MasaHubIntroSong_" .. (tostring(g.name or "song") .. ".mp3"));
	local function a()
		if introSongCache[B] then
			return introSongCache[B];
		end;
		local g = false;
		pcall(function()
			g = isfile and isfile(B);
		end);
		if g then
			local g = pcall(function()
					introSongCache[B] = getcustomasset(B);
				end);
			if g and introSongCache[B] then
				return introSongCache[B];
			end;
		end;
		return nil;
	end;
	local H = a();
	if H then
		return H;
	end;
	if u == false then
		return nil;
	end;
	if introSongDownloading[B] then
		local g = tick();
		while introSongDownloading[B] and tick() - g < 12 do
			task.wait(.05);
		end;
		H = a();
		if H then
			return H;
		end;
	end;
	introSongDownloading[B] = true;
	local i = pcall(function()
			local u = game:HttpGet(g.url);
			if u and #u > 0 then
				writefile(B, u);
				introSongCache[B] = getcustomasset(B);
			end;
		end);
	introSongDownloading[B] = nil;
	if i and introSongCache[B] then
		return introSongCache[B];
	end;
	return a();
end;
function preloadIntroSongs()
	task.spawn(function()
		cacheIntroSong(INTRO_MUSIC_OPTIONS[selectedIntroMusic], true);
		for g, u in ipairs(INTRO_MUSIC_OPTIONS) do
			if u ~= INTRO_MUSIC_OPTIONS[selectedIntroMusic] then
				cacheIntroSong(u, true);
				task.wait(.05);
			end;
		end;
	end);
end;
function makeIntroSoundFromId(g, u, B)
	if not g then
		return nil;
	end;
	local a = Instance.new("Sound");
	a.Name = u or "MasaHubIntroMusic";
	a.Volume = .65;
	a.Looped = false;
	a.SoundId = g;
	a.Parent = B or Q;
	return a;
end;
function createIntroSound(g, u, B, a)
	if not g then
		return nil;
	end;
	local H = cacheIntroSong(g, a);
	if not H then
		return nil;
	end;
	return makeIntroSoundFromId(H, u, B);
end;
function previewIntroMusic(g)
	stopIntroPreview();
	stopIntroPlayback();
	if not INTRO_MUSIC_OPTIONS[g] then
		_safeNotify("ADD SONG LINKS");
		return;
	end;
	local u = introPreviewToken;
	task.spawn(function()
		local B = INTRO_MUSIC_OPTIONS[g];
		local a = createIntroSound(B, "MasaHubIntroPreview_" .. tostring(u), Q, true);
		if u ~= introPreviewToken then
			if a then
				a:Destroy();
			end;
			return;
		end;
		introPreviewSound = a;
		if not a then
			_safeNotify("SONG LOADING...");
			return;
		end;
		a.TimePosition = 0;
		pcall(function()
			a:Play();
		end);
		task.delay(13, function()
			if u == introPreviewToken then
				stopIntroPreview();
			end;
		end);
	end);
end;
function playIntroMusic()
	stopIntroPreview();
	stopIntroPlayback();
	if not _introEnabled then
		return;
	end;
	local g = INTRO_MUSIC_OPTIONS[selectedIntroMusic];
	if not g then
		return;
	end;
	local u = introPlaybackToken;
	task.spawn(function()
		local B = createIntroSound(g, "MasaDuelsIntroMusic_" .. tostring(u), Q, true);
		if u ~= introPlaybackToken or not _introEnabled then
			if B then
				pcall(function()
					B:Destroy();
				end);
			end;
			return;
		end;
		introPlaybackSound = B;
		if not B then
			_safeNotify("SONG FAILED");
			return;
		end;
		B.TimePosition = 0;
		local a = tick();
		while B and (not B.IsLoaded and tick() - a < 10) do
			task.wait(.05);
		end;
		pcall(function()
			B:Play();
		end);
		task.delay(13, function()
			if u == introPlaybackToken then
				stopIntroPlayback();
			end;
		end);
	end);
end;
preloadIntroSongs();
MUSIC_PLAYER_OPTIONS = MUSIC_PLAYER_OPTIONS or {
		{ name = "Gelato", url = "https://files.catbox.moe/sospih.mp3", file = "MasaHubMusic1.mp3" },
		{ name = "Meant To Be", url = "https://files.catbox.moe/smt6l8.mp3", file = "MasaHubMusic2.mp3" },
		{ name = "Beccaria San Vittore RMX", url = "https://files.catbox.moe/2r8auq.mp3", file = "MasaHubMusic3.mp3" },
		{ name = "The Box", url = "https://files.catbox.moe/yumqjl.mp3", file = "MasaHubMusic4.mp3" },
		{ name = "Mu Ammar Gheddafi RMX", url = "https://files.catbox.moe/qcuden.mp3", file = "MasaHubMusic5.mp3" },
		{ name = "Marocchino RMX", url = "https://files.catbox.moe/iyav31.mp3", file = "MasaHubMusic6.mp3" },
		{ name = "Gotham Mashup", url = "https://files.catbox.moe/7eof36.mp3", file = "MasaHubMusic7.mp3" },
		{ name = "Goosebumps", url = "https://files.catbox.moe/6wqcck.mp3", file = "MasaHubMusic8.mp3" },
		{ name = "Houdini", url = "https://files.catbox.moe/gsuxur.mp3", file = "MasaHubMusic9.mp3" },
		{ name = "Magnolia", url = "https://files.catbox.moe/ursllw.mp3", file = "MasaHubMusic10.mp3" },
		{ name = "Redemption RMX", url = "https://files.catbox.moe/kjxkv7.mp3", file = "MasaHubMusic11.mp3" },
		{ name = "Evicted RMX", url = "https://files.catbox.moe/s28bh5.mp3", file = "MasaHubMusic12.mp3" },
		{ name = "Lyfe RMX", url = "https://files.catbox.moe/8hciqx.mp3", file = "MasaHubMusic13.mp3" },
		{ name = "No Refunds RMX", url = "https://files.catbox.moe/uz9hot.mp3", file = "MasaHubMusic14.mp3" },
		{ name = "8 AM In Manny RMX", url = "https://files.catbox.moe/xh4t0r.mp3", file = "MasaHubMusic15.mp3" },
		{ name = "Us Vs Them RMX", url = "https://files.catbox.moe/po5fbj.mp3", file = "MasaHubMusic16.mp3" },
		{ name = "Reflection 2 RMX", url = "https://files.catbox.moe/kcst57.mp3", file = "MasaHubMusic17.mp3" },
		{ name = "I Know You Care RMX", url = "https://files.catbox.moe/c2en1v.mp3", file = "MasaHubMusic18.mp3" },
		{ name = "Bubblegum RMX", url = "https://files.catbox.moe/8xf15k.mp3", file = "MasaHubMusic19.mp3" },
		{ name = "Cream RMX", url = "https://files.catbox.moe/yfhgqz.mp3", file = "MasaHubMusic20.mp3" },
		{ name = "Panzerknacker.wav", url = "https://files.catbox.moe/izcvhm.mp3", file = "MasaHubMusic21.mp3" },
		{ name = "Freaked Out", url = "https://files.catbox.moe/dyt2ja.mp3", file = "MasaHubMusic22.mp3" },
		{ name = "Scam Likely", url = "https://files.catbox.moe/pr85mz.mp3", file = "MasaHubMusic23.mp3" },
		{ name = "Pure Cocaine", url = "https://files.catbox.moe/dvjtjk.mp3", file = "MasaHubMusic24.mp3" },
		{ name = "Tesla", url = "https://files.catbox.moe/n85fch.mp3", file = "MasaHubMusic25.mp3" },
		{ name = "Piazza Di Spaccio 2 RMX", url = "https://files.catbox.moe/0ompvn.mp3", file = "MasaHubMusic26.mp3" },
		{ name = "Benef RMX", url = "https://files.catbox.moe/swcqe5.mp3", file = "MasaHubMusic27.mp3" },
		{ name = "Accavallato RMX", url = "https://files.catbox.moe/pme01q.mp3", file = "MasaHubMusic28.mp3" },
		{ name = "Hd RMX", url = "https://files.catbox.moe/oa3ylr.mp3", file = "MasaHubMusic29.mp3" },
		{ name = "Vyzee", url = "https://files.catbox.moe/gmxz02.mp3", file = "MasaHubMusic30.mp3" },
		{ name = "Addiction", url = "https://files.catbox.moe/unkq06.mp3", file = "MasaHubMusic31.mp3" },
		{ name = "America RMX", url = "https://files.catbox.moe/k09ioc.mp3", file = "MasaHubMusic32.mp3" },
		{ name = "Sprinter", url = "https://files.catbox.moe/0gyb73.mp3", file = "MasaHubMusic33.mp3" },
		{ name = "Band4Band", url = "https://files.catbox.moe/47dehm.mp3", file = "MasaHubMusic34.mp3" },
		{ name = "Doja RMX", url = "https://files.catbox.moe/8ze5d8.mp3", file = "MasaHubMusic35.mp3" },
		{ name = "Opinel RMX", url = "https://files.catbox.moe/hf6pdq.mp3", file = "MasaHubMusic36.mp3" },
		{ name = "Vrp RMX", url = "https://files.catbox.moe/hjzkbu.mp3", file = "MasaHubMusic37.mp3" },
		{ name = "Tarantelle RMX", url = "https://files.catbox.moe/0e9jwg.mp3", file = "MasaHubMusic38.mp3" },
		{ name = "Hood RMX", url = "https://files.catbox.moe/raewna.mp3", file = "MasaHubMusic39.mp3" },
		{ name = "Mask RMX", url = "https://files.catbox.moe/ghqz2q.mp3", file = "MasaHubMusic40.mp3" },
		{ name = "Spinnin RMX", url = "https://files.catbox.moe/r9achz.mp3", file = "MasaHubMusic41.mp3" },
		{ name = "Dnd RMX", url = "https://files.catbox.moe/1d83ju.mp3", file = "MasaHubMusic42.mp3" },
		{ name = "Xnx RMX", url = "https://files.catbox.moe/a2e54o.mp3", file = "MasaHubMusic43.mp3" },
		{ name = "Hypebae RMX", url = "https://files.catbox.moe/oj6hix.mp3", file = "MasaHubMusic44.mp3" },
		{
			name = "Mercedes Nero RMX",
			url = "https://h.uguu.se/dCgHArHt.mp3",
			file = "MasaHubMusic45.mp3",
			rev = 2,
		},
		{ name = "Dissenatori RMX", url = "https://files.catbox.moe/fbjq0w.mp3", file = "MasaHubMusic46.mp3" },
		{ name = "British RMX", url = "https://files.catbox.moe/jn9mmr.mp3", file = "MasaHubMusic47.mp3" },
		{ name = "Go Go Jack RMX", url = "https://files.catbox.moe/u31krk.mp3", file = "MasaHubMusic48.mp3" },
		{ name = "Darkmoney RMX", url = "https://files.catbox.moe/rz4mzu.mp3", file = "MasaHubMusic49.mp3" },
		{ name = "Ghetto RMX", url = "https://files.catbox.moe/omj56p.mp3", file = "MasaHubMusic50.mp3" },
		{ name = "Copacabana RMX", url = "https://files.catbox.moe/g43412.mp3", file = "MasaHubMusic51.mp3" },
	};
selectedMusicSong = selectedMusicSong or 1;
musicPlayerVolume = musicPlayerVolume or 1;
musicPlayerSpeed = musicPlayerSpeed or 1;
musicAutoPlayNext = musicAutoPlayNext == true;
musicShuffleEnabled = musicShuffleEnabled == true;
musicLoopEnabled = musicLoopEnabled == true;
_musicPlayerSound = nil;
_musicPlayerToken = 0;
musicSongCache = musicSongCache or {};
musicSongDownloading = musicSongDownloading or {};
musicRevCleaned = musicRevCleaned or {};
_G.MasaMusicRefreshUI = nil;
_G.MasaMusicCloseUI = nil;
function getMusicSongName()
	local g = MUSIC_PLAYER_OPTIONS[selectedMusicSong];
	return g and g.name or "No Song";
end;
function musicRandomIndex()
	local g = #MUSIC_PLAYER_OPTIONS;
	if g <= 1 then
		return 1;
	end;
	local u = math.random(1, g - 1);
	if u >= selectedMusicSong then
		u = u + 1;
	end;
	return u;
end;
function _musicRefreshUI()
	if _G.MasaMusicRefreshUI then
		pcall(_G.MasaMusicRefreshUI);
	end;
end;
function cacheMusicSong(g, u)
	if not g or not g.url or g.url == "" then
		return nil;
	end;
	if not ((writefile and getcustomasset)) then
		return nil;
	end;
	local B = g.file or ("MasaHubMusic_" .. (tostring(g.name or "song") .. ".mp3"));
	local a = math.max(math.floor(tonumber(g.rev) or 1), 1);
	local H = B:gsub("%.mp3$", "");
	local i = (a > 1) and (H .. ("_r" .. (a .. ".mp3"))) or B;
	if a > 1 and not musicRevCleaned[B] then
		musicRevCleaned[B] = true;
		for g = 1, a - 1, 1 do
			local u = (g > 1) and (H .. ("_r" .. (g .. ".mp3"))) or B;
			musicSongCache[u] = nil;
			pcall(function()
				if isfile and (isfile(u) and delfile) then
					delfile(u);
				end;
			end);
		end;
	end;
	local function R()
		if musicSongCache[i] then
			return musicSongCache[i];
		end;
		local g = false;
		pcall(function()
			g = isfile and isfile(i);
		end);
		if g then
			local g = pcall(function()
					musicSongCache[i] = getcustomasset(i);
				end);
			if g and musicSongCache[i] then
				return musicSongCache[i];
			end;
		end;
		return nil;
	end;
	local O = R();
	if O then
		return O;
	end;
	if u == false then
		return nil;
	end;
	if musicSongDownloading[i] then
		local g = tick();
		while musicSongDownloading[i] and tick() - g < 15 do
			task.wait(.05);
		end;
		O = R();
		if O then
			return O;
		end;
	end;
	musicSongDownloading[i] = true;
	local c = pcall(function()
			local u = game:HttpGet(g.url);
			if u and #u > 0 then
				writefile(i, u);
				musicSongCache[i] = getcustomasset(i);
			end;
		end);
	musicSongDownloading[i] = nil;
	if c and musicSongCache[i] then
		return musicSongCache[i];
	end;
	return R();
end;
function createMusicSound(g, u)
	if not g then
		return nil;
	end;
	local B = cacheMusicSong(g, true);
	if not B then
		return nil;
	end;
	local a = Instance.new("Sound");
	a.Name = u or "MasaHubMusicPlayer";
	a.Volume = musicPlayerVolume;
	a.PlaybackSpeed = musicPlayerSpeed;
	a.Looped = false;
	a.SoundId = B;
	a.Parent = Q;
	return a;
end;
function fadeOutMusicSound(g, u)
	if not g then
		return;
	end;
	u = u or 1.5;
	pcall(function()
		(B:Create(g, TweenInfo.new(u, Enum.EasingStyle.Linear), { Volume = 0 })):Play();
	end);
	task.delay(u + .1, function()
		pcall(function()
			if g and g.Parent then
				g:Stop();
				g:Destroy();
			end;
		end);
	end);
end;
function stopMusicPlayback(g)
	_musicPlayerToken = _musicPlayerToken + 1;
	local u = _musicPlayerSound;
	_musicPlayerSound = nil;
	if u then
		if g == false then
			pcall(function()
				u:Stop();
				u:Destroy();
			end);
		else
			fadeOutMusicSound(u, 1.5);
		end;
	end;
	_musicRefreshUI();
end;
function playMusicSong(g)
	g = tonumber(g) or selectedMusicSong;
	local u = #MUSIC_PLAYER_OPTIONS;
	if u <= 0 then
		return;
	end;
	if g < 1 then
		g = u;
	end;
	if g > u then
		g = 1;
	end;
	if not MUSIC_PLAYER_OPTIONS[g] then
		return;
	end;
	selectedMusicSong = g;
	stopMusicPlayback(true);
	local a = _musicPlayerToken;
	_musicRefreshUI();
	task.spawn(function()
		local u = MUSIC_PLAYER_OPTIONS[g];
		local H = createMusicSound(u, "MasaHubMusicPlayer_" .. tostring(a));
		if a ~= _musicPlayerToken then
			if H then
				pcall(function()
					H:Destroy();
				end);
			end;
			return;
		end;
		if not H then
			_safeNotify("SONG FAILED");
			return;
		end;
		H.Volume = musicPlayerVolume;
		H.PlaybackSpeed = musicPlayerSpeed;
		H.TimePosition = 0;
		_musicPlayerSound = H;
		local i = tick();
		while H and (H.Parent and (not H.IsLoaded and tick() - i < 15)) do
			task.wait(.05);
		end;
		if a ~= _musicPlayerToken then
			pcall(function()
				if H and H.Parent then
					H:Destroy();
				end;
			end);
			return;
		end;
		pcall(function()
			H:Play();
		end);
		_musicRefreshUI();
		local R;
		R = H.Ended:Connect(function()
				if R then
					pcall(function()
						R:Disconnect();
					end);
				end;
				if a ~= _musicPlayerToken then
					return;
				end;
				if musicLoopEnabled then
					playMusicSong(selectedMusicSong);
				elseif musicShuffleEnabled then
					playMusicSong(musicRandomIndex());
				elseif musicAutoPlayNext then
					playMusicSong(selectedMusicSong + 1);
				else
					stopMusicPlayback(false);
				end;
			end);
		task.spawn(function()
			while a == _musicPlayerToken and (H and H.Parent) do
				local g = H.TimeLength;
				if g and g > 1 then
					local u = g - H.TimePosition;
					if u <= 1.6 and (H.IsPlaying and H:GetAttribute("_amFaded") ~= true) then
						H:SetAttribute("_amFaded", true);
						local g = math.clamp(u - .05, .2, 1.5);
						pcall(function()
							(B:Create(H, TweenInfo.new(g, Enum.EasingStyle.Linear), { Volume = 0 })):Play();
						end);
					end;
				end;
				task.wait(.1);
			end;
		end);
	end);
end;
function toggleMusicPause()
	local g = _musicPlayerSound;
	if not g or not g.Parent then
		playMusicSong(selectedMusicSong);
		return;
	end;
	if g.IsPlaying then
		pcall(function()
			g:Pause();
		end);
	else
		pcall(function()
			g:Resume();
		end);
	end;
	_musicRefreshUI();
end;
function musicNextSong()
	if musicShuffleEnabled then
		playMusicSong(musicRandomIndex());
	else
		playMusicSong(selectedMusicSong + 1);
	end;
	saveMasaConfig();
end;
function musicPrevSong()
	if musicShuffleEnabled then
		playMusicSong(musicRandomIndex());
	else
		playMusicSong(selectedMusicSong - 1);
	end;
	saveMasaConfig();
end;
function musicSeek(g)
	local u = _musicPlayerSound;
	if not u or not u.Parent then
		return;
	end;
	local B = u.TimeLength or 0;
	local a = tonumber(musicPlayerSpeed) or 1;
	if a <= 0 then
		a = 1;
	end;
	local H = u.TimePosition + (((tonumber(g) or 0)) * a);
	if H < 0 then
		H = 0;
	end;
	if B > 0 and H > (B - .2) then
		H = math.max(B - .2, 0);
	end;
	pcall(function()
		u.TimePosition = H;
	end);
	if B > 0 and (B - H) > 1.8 then
		pcall(function()
			u:SetAttribute("_amFaded", false);
			u.Volume = musicPlayerVolume;
		end);
	end;
	_musicRefreshUI();
end;
function setMusicSpeed(g)
	g = math.clamp(math.floor(((tonumber(g) or 1)) * 10 + .5) / 10, .1, 2);
	musicPlayerSpeed = g;
	local u = _musicPlayerSound;
	if u and u.Parent then
		pcall(function()
			u.PlaybackSpeed = g;
		end);
	end;
	if saveMasaConfig then
		pcall(saveMasaConfig);
	end;
	_musicRefreshUI();
end;
function setMusicVolume(g)
	g = math.clamp(math.floor(((tonumber(g) or 1)) * 100 + .5) / 100, 0, 2);
	musicPlayerVolume = g;
	local u = _musicPlayerSound;
	if u and (u.Parent and u:GetAttribute("_amFaded") ~= true) then
		pcall(function()
			u.Volume = g;
		end);
	end;
	if saveMasaConfig then
		pcall(saveMasaConfig);
	end;
	_musicRefreshUI();
end;
savedConfig = {};
_G.MasaGuiLocked = _G.MasaGuiLocked == true;
_G.MasaHideMobileButtons = _G.MasaHideMobileButtons == true;
_G.MasaButtonShape = _G.MasaButtonShape or "Rectangle";
_G.MasaApplyButtonShape = function()
		local g = _G.MasaButtonShape or "Rectangle";
		local u = _G.MasaHalloweenTheme == true;
		local B = _G.MasaMobileButtonRefs or {};
		for B, a in pairs(B) do
			local H = a and a.btn;
			if H then
				local B = H:FindFirstChildOfClass("UICorner");
				if not B then
					B = Instance.new("UICorner", H);
				end;
				local i = a.holder;
				if u then
					B.CornerRadius = UDim.new(1, 0);
					H.Size = UDim2.new(1, 0, 1, 0);
					H.Position = UDim2.new(0, 0, 0, 0);
					if i then
						i.Size = UDim2.new(0, 58, 0, 72);
					end;
					local g = H:FindFirstChild("HwGhostDeco");
					if not g then
						g = Instance.new("TextLabel");
						g.Name = "HwGhostDeco";
						g.BackgroundTransparency = 1;
						g.Size = UDim2.new(1, 0, 0, 18);
						g.Position = UDim2.new(0, 0, 0, 2);
						g.Text = "\240\159\145\187";
						g.TextSize = 14;
						g.Font = Enum.Font.GothamBlack;
						g.TextXAlignment = Enum.TextXAlignment.Center;
						g.ZIndex = ((H.ZIndex or 1)) + 2;
						g.Parent = H;
					end;
					g.Visible = true;
					local u = i and i:FindFirstChild("HwGhostScallop");
					if i and not u then
						u = Instance.new("Frame");
						u.Name = "HwGhostScallop";
						u.BackgroundTransparency = 1;
						u.Size = UDim2.new(1, 0, 0, 14);
						u.Position = UDim2.new(0, 0, 1, -10);
						u.ZIndex = ((H.ZIndex or 1)) + 1;
						u.Parent = i;
						for g = 0, 3, 1 do
							local B = Instance.new("Frame");
							B.Name = "Bump" .. g;
							B.AnchorPoint = Vector2.new(.5, 0);
							B.Size = UDim2.new(0, 16, 0, 16);
							B.Position = UDim2.new(.12 + g * .25, 0, 0, 0);
							B.BackgroundColor3 = H.BackgroundColor3;
							B.BorderSizePixel = 0;
							B.ZIndex = u.ZIndex;
							B.Parent = u;
							local a = Instance.new("UICorner");
							a.CornerRadius = UDim.new(1, 0);
							a.Parent = B;
						end;
					end;
					if u then
						u.Visible = true;
						for g, u in ipairs(u:GetChildren()) do
							if u:IsA("Frame") then
								u.BackgroundColor3 = H.BackgroundColor3;
							end;
						end;
					end;
				else
					local u = H:FindFirstChild("HwGhostDeco");
					if u then
						u.Visible = false;
					end;
					if i then
						local g = i:FindFirstChild("HwGhostScallop");
						if g then
							g.Visible = false;
						end;
					end;
					if g == "Rectangle" then
						B.CornerRadius = UDim.new(0, 10);
						H.Size = UDim2.new(1, 0, 1, 0);
						H.Position = UDim2.new(0, 0, 0, 0);
						if i then
							i.Size = UDim2.new(0, 72, 0, 44);
						end;
					elseif g == "Circle" then
						B.CornerRadius = UDim.new(1, 0);
						H.Size = UDim2.new(1, 0, 1, 0);
						H.Position = UDim2.new(0, 0, 0, 0);
						if i then
							i.Size = UDim2.new(0, 64, 0, 64);
						end;
					elseif g == "Rounded" then
						B.CornerRadius = UDim.new(0, 14);
						H.Size = UDim2.new(1, 0, 1, 0);
						H.Position = UDim2.new(0, 0, 0, 0);
						if i then
							i.Size = UDim2.new(0, 64, 0, 64);
						end;
					elseif g == "Pill" then
						B.CornerRadius = UDim.new(0, 10);
						if i then
							i.Size = UDim2.new(0, 72, 0, 48);
						end;
						H.Size = UDim2.new(1, 0, 1, 0);
						H.Position = UDim2.new(0, 0, 0, 0);
					end;
				end;
				if i then
					local B = i:FindFirstChild("Glow");
					if B then
						local a = B:FindFirstChildOfClass("UICorner");
						if not a then
							a = Instance.new("UICorner", B);
						end;
						if u then
							a.CornerRadius = UDim.new(1, 0);
							B.Size = UDim2.new(1, 6, 1, 6);
							B.Position = UDim2.new(0, -3, 0, -3);
						else
							a.CornerRadius = (g == "Rectangle") and UDim.new(0, 10) or (g == "Circle") and UDim.new(1, 0) or (g == "Rounded") and UDim.new(0, 16) or UDim.new(0, 12);
						end;
					end;
				end;
			end;
		end;
	end;
_G.MasaMobileHideList = _G.MasaMobileHideList or {};
_G.MasaMobileHideIncluded = function(g)
		local u = _G.MasaMobileHideList[g];
		if u == nil then
			return true;
		end;
		return u == true;
	end;
_G.MasaMobileButtonScale = .75;
_G.MasaMobileButtonPositions = _G.MasaMobileButtonPositions or {};
savedMainPositionTable = nil;
savedMiniPositionTable = nil;
savedStealBarPositionTable = nil;
function udim2ToTable(g)
	return {
		xs = g.X.Scale,
		xo = g.X.Offset,
		ys = g.Y.Scale,
		yo = g.Y.Offset,
	};
end;
function tableToUDim2(g, u)
	if type(g) == "table" then
		return UDim2.new(tonumber(g.xs) or 0, tonumber(g.xo) or 0, tonumber(g.ys) or 0, tonumber(g.yo) or 0);
	end;
	return u;
end;
function collectMasaMobileButtonPositions()
	local g = {};
	for u, B in pairs(_G.MasaMobileButtonRefs or {}) do
		local a = B and B.holder;
		if a then
			g[u] = udim2ToTable(a.Position);
		end;
	end;
	if next(g) == nil and type(_G.MasaMobileButtonPositions) == "table" then
		return _G.MasaMobileButtonPositions;
	end;
	_G.MasaMobileButtonPositions = g;
	return g;
end;
function keyToString(g)
	if not g then
		return "None";
	end;
	if g == "MB3" then
		return "MB3";
	end;
	return (tostring(g)):gsub("Enum.KeyCode.", "");
end;
function stringToKeyCode(g)
	if type(g) ~= "string" or g == "" or g == "None" then
		return nil;
	end;
	if g == "MB3" then
		return "MB3";
	end;
	return Enum.KeyCode[g];
end;
function keybindsToTable()
	local g = {};
	for u in pairs(kl) do
		g[u] = keyToString(Vl[u]);
	end;
	for u, B in pairs(Vl) do
		g[u] = keyToString(B);
	end;
	return g;
end;
function collectMasaKeybindConfig()
	return { keybinds = keybindsToTable(), tpDownKeybind = keyToString(ql) };
end;
function applySavedKeybinds(g)
	if type(g) ~= "table" then
		return;
	end;
	for u in pairs(Vl) do
		if g[u] ~= nil then
			Vl[u] = stringToKeyCode(g[u]);
		end;
	end;
end;
function applyDefaultMasaKeybinds()
	for g, u in pairs(kl) do
		Vl[g] = u;
	end;
	ql = tl;
end;
_G.MasaLookAtEnabled = false;
_G.MasaLookAtRadius = _G.MasaLookAtRadius or 20;
_G._MasaLookAt = _G._MasaLookAt or {};
do
	local u = _G._MasaLookAt;
	local B = workspace:FindFirstChild("Terrain") or workspace;
	u.externalPart = nil;
	u.alignObj = nil;
	u.alignConn = nil;
	u.diedConn = nil;
	local function H()
		local u = e.Character;
		local B = u and u:FindFirstChild("HumanoidRootPart");
		if not B then
			return nil;
		end;
		local a = tonumber(_G.MasaLookAtRadius) or 20;
		local H, i = nil, math.huge;
		for g, u in ipairs(g:GetPlayers()) do
			if u ~= e then
				local g = u.Character;
				if g then
					local u = g:FindFirstChild("HumanoidRootPart");
					local R = g:FindFirstChildOfClass("Humanoid");
					if u and (R and R.Health > 0) then
						local g = u.Position;
						if _G.MasaAntiVoid then
							g = _G.MasaAntiVoid.posForPart(u, g);
						end;
						local R = ((B.Position - g)).Magnitude;
						if R <= a and R < i then
							i = R;
							H = u;
						end;
					end;
				end;
			end;
		end;
		return H;
	end;
	local function i()
		if u.alignConn then
			u.alignConn:Disconnect();
			u.alignConn = nil;
		end;
		if u.diedConn then
			u.diedConn:Disconnect();
			u.diedConn = nil;
		end;
		for g, u in ipairs(B:GetChildren()) do
			if u.Name:find("LAEAnchor_") or u.Name == "LAEOrientation" then
				u:Destroy();
			end;
		end;
		u.externalPart = nil;
		u.alignObj = nil;
		local g = e.Character;
		if g then
			local u = g:FindFirstChildOfClass("Humanoid");
			if u then
				u.AutoRotate = true;
			end;
		end;
	end;
	local function R()
		i();
		local g = e.Character;
		if not g then
			return;
		end;
		local R = g:FindFirstChild("HumanoidRootPart");
		local O = g:FindFirstChildOfClass("Humanoid");
		if not R or not O or O.Health <= 0 then
			return;
		end;
		u.diedConn = O.Died:Connect(function()
				i();
			end);
		local c = Instance.new("Part");
		c.Name = "LAEAnchor_" .. tostring(math.random(1000, 9999));
		c.Size = Vector3.new(1, 1, 1);
		c.Transparency = 1;
		c.CanCollide = false;
		c.Anchored = true;
		c.CFrame = R.CFrame;
		c.Parent = B;
		u.externalPart = c;
		local h = Instance.new("Attachment", c);
		local Q = R:FindFirstChild("RootAttachment");
		if not Q then
			Q = Instance.new("Attachment");
			Q.Name = "RootAttachment";
			Q.Parent = R;
		end;
		local P = Instance.new("AlignOrientation");
		P.Name = "LAEOrientation";
		P.Mode = Enum.OrientationAlignmentMode.TwoAttachment;
		P.Attachment0 = Q;
		P.Attachment1 = h;
		P.MaxTorque = 999999;
		P.MaxAngularVelocity = 999999;
		P.Responsiveness = 200;
		P.Enabled = false;
		P.Parent = B;
		u.alignObj = P;
		u.alignConn = a.Heartbeat:Connect(function()
				local g = e.Character;
				local B = g and g:FindFirstChild("HumanoidRootPart");
				local a = g and g:FindFirstChildOfClass("Humanoid");
				if not B or not a or a.Health <= 0 then
					i();
					return;
				end;
				local R = H();
				if R and (u.externalPart and u.alignObj) then
					a.AutoRotate = false;
					u.alignObj.Enabled = true;
					local g = R.Position;
					if _G.MasaAntiVoid then
						g = _G.MasaAntiVoid.posForPart(R, g);
					end;
					local H = Vector3.new(g.X, B.Position.Y, g.Z);
					u.externalPart.CFrame = CFrame.lookAt(B.Position, H);
				else
					a.AutoRotate = true;
					if u.alignObj then
						u.alignObj.Enabled = false;
					end;
				end;
			end);
	end;
	function _G.MasaToggleLookAt(g)
		if g ~= nil then
			_G.MasaLookAtEnabled = g;
		else
			_G.MasaLookAtEnabled = not _G.MasaLookAtEnabled;
		end;
		if _G.MasaLookAtEnabled then
			if _G.MasaNormalAimbotOn == true or _G.MasaBatAimbotV2On == true then
				i();
			else
				R();
			end;
		else
			i();
		end;
	end;
	function _G.MasaStopLookAt()
		i();
	end;
	function _G.MasaStartLookAt()
		if _G.MasaNormalAimbotOn == true or _G.MasaBatAimbotV2On == true then
			return;
		end;
		R();
	end;
	e.CharacterAdded:Connect(function(g)
		i();
		if _G.MasaLookAtEnabled then
			local u = g:WaitForChild("HumanoidRootPart", 5);
			local B = g:WaitForChild("Humanoid", 5);
			if u and B then
				task.wait(.1);
				if _G.MasaStartLookAt then
					pcall(_G.MasaStartLookAt);
				else
					R();
				end;
			end;
		end;
	end);
	e.CharacterRemoving:Connect(function()
		i();
	end);
end;
function collectMasaConfig()
	local g = stretchCurrentIndex;
	local u = stretchEnabled;
	if _G.MasaTrackerActive and _G.MasaTrackerSavedStretchIndex then
		g = _G.MasaTrackerSavedStretchIndex;
		u = g ~= 1;
	end;
	return {
		mainPosition = savedMainPositionTable,
		miniPosition = savedMiniPositionTable,
		stealBarPosition = savedStealBarPositionTable,
		keybinds = keybindsToTable(),
		tpDownKeybind = keyToString(ql),
		trackerColor = BoxedESPOptions and (BoxedESPOptions.trackerColor and { r = math.floor(BoxedESPOptions.trackerColor.R * 255 + .5), g = math.floor(BoxedESPOptions.trackerColor.G * 255 + .5), b = math.floor(BoxedESPOptions.trackerColor.B * 255 + .5) }) or nil,
		NS = F,
		CS = S,
		LAGGER_SPEED = r,
		LAGGER_CARRY_SPEED = U,
		currentSpeedMode = I,
		autoCarrySpeedEnabled = autoCarrySpeedEnabled == true,
		autoCarryMode = (_G._MasaAutoCarryMode == "SOFT") and "SOFT" or "NORMAL",
		autoTPEnabled = nl,
		autoTPHeight = Al,
		tpDownMethod = _G._MasaTPDownMethod or "NORMAL",
		infJumpEnabled = yl,
		infJumpMode = Jl,
		lookAtEnabled = _G.MasaLookAtEnabled == true,
		lookAtRadius = tonumber(_G.MasaLookAtRadius) or 20,
		antiRagdollEnabled = gj,
		antiRagdollMode = _G._MasaAntiRagdollMode or "V1",
		tpRagdollEnabled = _G.MasaTPRagdollEnabled == true,
		antiDieEnabled = _G._MasaAntiDieUserWanted == true,
		selectedDropMode = Yl,
		instantResetVersion = tonumber(_G.MasaInstantResetVersion) or 1,
		afterDropEnabled = _G.MasaAfterDrop and _G.MasaAfterDrop.enabled == true,
		afterDropAction = (_G.MasaAfterDrop and _G.MasaAfterDrop.action) or "AIMBOT",
		selectedStealMode = w,
		selectedSemiMode = k,
		autoStealEnabled = X,
		autoStealRadius = t,
		syncAfterHitEnabled = _G._MasaSyncAfterHit.enabled,
		masaStealRadii = _G.MasaStealRadii,
		semiAutoGrabStopTime = _G.MasaSemiSteal and _G.MasaSemiSteal.autoGrabStopTime or 1.29,
		semiAutoGrabStopPercent = _G.MasaSemiSteal and _G.MasaSemiSteal.autoGrabStopPercent or 75,
		semiAutoGrabDelayRadius = _G.MasaSemiSteal and _G.MasaSemiSteal.autoGrabSetDelayRadius or 8,
		radiusCircleEnabled = _G.MasaRadiusCircleEnabled == true,
		radiusCircleColor = { math.floor((((_G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230))).R * 255) + .5), math.floor((((_G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230))).G * 255) + .5), math.floor((((_G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230))).B * 255) + .5) },
		selectedAimbotMode = N,
		AIMBOT_SPEED = n,
		LAGGER_AIMBOT_SPEED = A,
		BAT_AIMBOT_V2_SPEED = _G.MasaBatAimbotV2Speed,
		BAT_AIMBOT_V2_LAGGER_SPEED = _G.MasaBatAimbotV2LaggerSpeed,
		TP_BAT_SPEED = q,
		autoSwingEnabled = d,
		mirrorTPDownEnabled = C,
		normalAimbotEnabled = _G.MasaNormalAimbotOn == true,
		batAimbotV2Enabled = _G.MasaBatAimbotV2On == true,
		aimbotChaseV1 = (_G._MasaAimbotChase and _G._MasaAimbotChase.V1) or "NORMAL",
		aimbotChaseV2 = (_G._MasaAimbotChase and _G._MasaAimbotChase.V2) or "NORMAL",
		tpBatAutoSwingEnabled = j,
		tpBatCameraLockEnabled = _G._MasaGetTPBatCameraLock and _G._MasaGetTPBatCameraLock() or false,
		tpBatEnabled = _G.MasaTPBatOn == true,
		tpBatVersion = _G.MasaTPBatVersion or 1,
		batCounterEnabled = p,
		batCounterMode = L,
		medCounterEnabled = b,
		antiBatEnabled = _G.MasaAntiBatEnabled == true,
		antiTPBatEnabled = _G.MasaAntiTPBatEnabled == true,
		antiTPBatSpam = _G.MasaAntiTPBatSpam == true,
		antiTPBatVersion = _G.MasaAntiTPBatVersion or 1,
		antiVoidEnabled = (_G.MasaAntiVoidEnabled == true) or (_G._MasaAntiVoidPaused == true),
		rainbowJoystickEnabled = _G.MasaRainbowJoystickEnabled == true,
		safeMode = T == true,
		espEnabled = W,
		showTrackerEnabled = D,
		ragdollCountdownEnabled = K,
		fpsBoostEnabled = o,
		antiLagVisualEnabled = x,
		vividGraphicsEnabled = s,
		vividSaturation = _G._MasaVivid.saturation,
		vividBloomIntensity = _G._MasaVivid.bloomIntensity,
		vividBloomSize = _G._MasaVivid.bloomSize,
		vividDofFocus = _G._MasaVivid.dofFocus,
		vividSunIntensity = _G._MasaVivid.sunIntensity,
		xrayEnabled = v,
		brainrotXRayEnabled = _G.MasaBrainrotXRayEnabled == true,
		highPingWarningEnabled = y,
		kickWarningEnabled = _G._MasaKickWarn.enabled == true,
		ultimateAntiKick = _G.MasaUAKEnabled == true,
		fovEnabled = gl,
		fovValue = ul,
		noCamCollisionEnabled = Bl,
		motionBlurEnabled = al,
		noPlayerCollisionEnabled = _G.MasaNoPlayerCollisionEnabled,
		unwalkEnabled = Ol,
		skyTheme = Sl,
		autoLeftEnabled = Xl,
		autoRightEnabled = wl,
		autoPlayJob = _G.MasaAutoPlay and _G.MasaAutoPlay.saveJob or nil,
		autoPlaySide = _G.MasaAutoPlay and _G.MasaAutoPlay.saveSide or nil,
		currentBackground = kj,
		customBgIds = tj,
		customBgSelected = Vj,
		tabPosition = _G._MasaTabPosition,
		floatUiVisible = _G.MasaFloatUiVisible ~= false,
		buttonShape = _G.MasaButtonShape or "Rectangle",
		customFont = _G.MasaFontChoice or "Default",
		titleStyle = _G.MasaTitleStyle,
		masaGuiScaleValue = Ej,
		masaProgressBarScaleValue = Nj,
		introEnabled = _introEnabled == true,
		selectedIntroMusic = selectedIntroMusic,
		musicSelectedSong = selectedMusicSong,
		musicVolume = musicPlayerVolume,
		musicSpeed = musicPlayerSpeed,
		musicAutoPlayNext = musicAutoPlayNext == true,
		musicShuffleEnabled = musicShuffleEnabled == true,
		musicLoopEnabled = musicLoopEnabled == true,
		guiLocked = _G.MasaGuiLocked == true,
		halloweenTheme = _G.MasaHalloweenTheme == true,
		hideMobileButtons = _G.MasaHideMobileButtons == true,
		mobileHideList = _G.MasaMobileHideList,
		masaMobileButtonScale = _G.MasaMobileButtonScale,
		mobileButtonPositions = collectMasaMobileButtonPositions(),
		stretchCurrentIndex = g,
		stretchEnabled = u,
		headlessEnabled = l == true,
		korbloxEnabled = M == true,
		rainbowToolsEnabled = _G.MasaRainbowToolsEnabled == true,
		transparentToolsEnabled = _G.MasaTransparentToolsEnabled == true,
		customToolsEnabled = _G.MasaCustomToolsEnabled == true,
		customToolSkinBat = (_G.MasaCustomToolSkins and _G.MasaCustomToolSkins.Bat) or "DiamondSword",
		customToolSkinMedusa = (_G.MasaCustomToolSkins and _G.MasaCustomToolSkins.Medusa) or "GoldenDesertEagle",
		customSoundsEnabled = _G.MasaCustomSoundsEnabled == true,
		selectedAnimPackIndex = cl or 1,
		customAnimIds = _G.MasaCustomAnimIds,
		animPackSavedIndex = Ql or 1,
		avatarChanger = ((function()
			local g = _G._MasaAvatarChanger;
			if not g then
				return nil;
			end;
			local u = {};
			for g, B in pairs(g) do
				u[g] = { enabled = B.enabled, savedId = B.savedId, savedName = B.savedName };
			end;
			return u;
		end))(),
	};
end;
function saveMasaConfig()
	if not canSaveConfig then
		return;
	end;
	pcall(function()
		_masa_writefile(CONFIG_FILE, H:JSONEncode(collectMasaConfig()));
		_masa_writefile(KEYBINDS_CONFIG_FILE, H:JSONEncode(collectMasaKeybindConfig()));
	end);
end;
local nj = { ["0.8"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, .45, 0, 0, 0, 1), ["1.0"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, .65, 0, 0, 0, 1), ["1.2"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, .82, 0, 0, 0, 1) };
local Aj = {
		X1 = nil,
		["X1.5"] = "1.2",
		X2 = "1.0",
		X3 = "0.8",
	};
local dj = {
		"X1",
		"X1.5",
		"X2",
		"X3",
	};
stretchCurrentIndex = 1;
stretchEnabled = false;
currentStretch = nil;
stretchRezConn = nil;
local function Cj(g)
	if not _G._masaStretchUILock and _G.MasaTrackerActive then
		_G.MasaTrackerSavedStretchIndex = g;
	end;
	stretchCurrentIndex = g;
	local u = dj[g];
	local B = Aj[u];
	if B then
		currentStretch = nj[B];
		stretchEnabled = true;
	else
		currentStretch = nil;
		stretchEnabled = false;
	end;
	if stretchRezConn then
		stretchRezConn:Disconnect();
		stretchRezConn = nil;
	end;
	if stretchEnabled then
		stretchRezConn = a.RenderStepped:Connect(function()
				if not stretchEnabled or not currentStretch then
					if stretchRezConn then
						stretchRezConn:Disconnect();
						stretchRezConn = nil;
					end;
					return;
				end;
				local g = workspace.CurrentCamera;
				if g and currentStretch then
					g.CFrame = g.CFrame * currentStretch;
				end;
			end);
	end;
	if not _G._masaStretchUILock and _G.MasaRefreshStretchSelector then
		_G.MasaRefreshStretchSelector();
	end;
end;
local function jj(g)
	local u = stretchCurrentIndex + g;
	if u < 1 then
		u = #dj;
	end;
	if u > #dj then
		u = 1;
	end;
	Cj(u);
end;
local function qj(g)
	if g then
		Cj(stretchCurrentIndex == 1 and 2 or stretchCurrentIndex);
	else
		Cj(1);
	end;
end;
_G.StretchRez = {
		apply = Cj,
		cycle = jj,
		setEnabled = qj,
		getIndex = function()
			return stretchCurrentIndex;
		end,
		isEnabled = function()
			return stretchEnabled;
		end,
		getOrder = function()
			return dj;
		end,
	};
function loadMasaConfig()
	if not canSaveConfig or not _masa_isfile(CONFIG_FILE) then
		return;
	end;
	local g, u = pcall(function()
			return H:JSONDecode(_masa_readfile(CONFIG_FILE));
		end);
	if not g or type(u) ~= "table" then
		return;
	end;
	savedConfig = u;
	local B = u;
	pcall(function()
		if _masa_isfile(KEYBINDS_CONFIG_FILE) then
			local g = H:JSONDecode(_masa_readfile(KEYBINDS_CONFIG_FILE));
			if type(g) == "table" then
				B = g;
			end;
		end;
	end);
	savedMainPositionTable = u.mainPosition;
	savedMiniPositionTable = type(u.miniPosition) == "table" and u.miniPosition or nil;
	savedStealBarPositionTable = type(u.stealBarPosition) == "table" and u.stealBarPosition or nil;
	_G.MasaGuiLocked = u.guiLocked == true;
	_G.MasaHalloweenTheme = u.halloweenTheme == true;
	_G.MasaHideMobileButtons = u.hideMobileButtons == true;
	_G.MasaMobileHideList = (type(u.mobileHideList) == "table") and u.mobileHideList or {};
	_G.MasaMobileButtonScale = math.clamp(tonumber(u.masaMobileButtonScale) or tonumber(_G.MasaMobileButtonScale) or .75, .3, 1.35);
	_G.MasaMobileButtonPositions = type(u.mobileButtonPositions) == "table" and u.mobileButtonPositions or {};
	applySavedKeybinds(B.keybinds);
	if B.tpDownKeybind ~= nil then
		if tostring(B.tpDownKeybind) == "None" then
			ql = nil;
		else
			ql = stringToKeyCode(B.tpDownKeybind) or tl;
		end;
	end;
	for g, u in pairs(kl) do
		local a = B and B.keybinds;
		if ((not a or a[g] == nil)) and Vl[g] == nil then
			Vl[g] = u;
		end;
	end;
	F = tonumber(u.NS) or F;
	S = tonumber(u.CS) or S;
	r = tonumber(u.LAGGER_SPEED) or r;
	U = tonumber(u.LAGGER_CARRY_SPEED) or U;
	I = u.currentSpeedMode or I;
	if I ~= "Normal" and (I ~= "Carry" and (I ~= "Lagger" and I ~= "Lagger Carry")) then
		I = "Normal";
	end;
	autoCarrySpeedEnabled = u.autoCarrySpeedEnabled == true;
	_G._MasaAutoCarryMode = (u.autoCarryMode == "SOFT") and "SOFT" or "NORMAL";
	nl = u.autoTPEnabled == true;
	Al = tonumber(u.autoTPHeight) or Al;
	local a = u.tpDownMethod;
	_G._MasaTPDownMethod = ((a == "SLOW" or a == "ZIGZAG")) and a or "NORMAL";
	yl = u.infJumpEnabled == true;
	if u.infJumpMode == "MANUAL" then
		Jl = "MANUAL";
	else
		Jl = "HOLD";
	end;
	_G.MasaLookAtEnabled = u.lookAtEnabled == true;
	_G.MasaLookAtRadius = math.clamp(tonumber(u.lookAtRadius) or 20, 1, 200);
	gj = u.antiRagdollEnabled == true;
	_G._MasaAntiRagdollMode = (u.antiRagdollMode == "V2") and "V2" or "V1";
	if _G.MasaTPRagdoll and _G.MasaTPRagdoll.set then
		pcall(_G.MasaTPRagdoll.set, u.tpRagdollEnabled == true);
	else
		_G.MasaTPRagdollEnabled = u.tpRagdollEnabled == true;
	end;
	Bj = u.antiDieEnabled == true;
	_G._MasaAntiDieUserWanted = Bj;
	Yl = u.selectedDropMode or Yl;
	_G.MasaInstantResetVersion = math.clamp(tonumber(u.instantResetVersion) or 1, 1, 2);
	if _G.MasaAfterDrop then
		_G.MasaAfterDrop.enabled = u.afterDropEnabled == true;
		_G.MasaAfterDrop.action = (u.afterDropAction == "TPBAT") and "TPBAT" or "AIMBOT";
	end;
	if Yl ~= "Stand Still" then
		Yl = "TP UP";
	end;
	w = u.selectedStealMode or w;
	if w ~= "Semi" then
		w = "Normal";
	end;
	_G.MasaRadiusCircleEnabled = u.radiusCircleEnabled == true;
	if type(u.radiusCircleColor) == "table" then
		_G.MasaRadiusCircleColor = Color3.fromRGB(math.clamp(tonumber(u.radiusCircleColor[1]) or 230, 0, 255), math.clamp(tonumber(u.radiusCircleColor[2]) or 230, 0, 255), math.clamp(tonumber(u.radiusCircleColor[3]) or 230, 0, 255));
	end;
	k = u.selectedSemiMode or k;
	if k ~= "V2" and k ~= "V3" then
		k = "V1";
	end;
	X = u.autoStealEnabled == true;
	_G._MasaSyncAfterHit.enabled = u.syncAfterHitEnabled == true;
	if type(u.masaStealRadii) == "table" then
		_G.MasaStealRadii.Normal = tonumber(u.masaStealRadii.Normal) or _G.MasaStealRadii.Normal or 62;
		_G.MasaStealRadii.Semi = tonumber(u.masaStealRadii.Semi) or _G.MasaStealRadii.Semi or 60;
		_G.MasaStealRadii.SemiV2Radius = tonumber(u.masaStealRadii.SemiV2Radius) or _G.MasaStealRadii.SemiV2Radius or 60;
		_G.MasaStealRadii.SemiV2SemiRadius = tonumber(u.masaStealRadii.SemiV2SemiRadius) or _G.MasaStealRadii.SemiV2SemiRadius or 8;
	end;
	local i = tonumber(u.autoStealRadius) or t;
	if not ((type(u.masaStealRadii) == "table")) then
		if w == "Semi" then
			_G.MasaStealRadii.Semi = i;
		else
			_G.MasaStealRadii.Normal = i;
		end;
	end;
	t = i;
	_G._MasaSemiStealPending = { autoGrabStopTime = math.clamp(tonumber(u.semiAutoGrabStopTime) or 1.29, .01, 1.29), autoGrabStopPercent = math.clamp(tonumber(u.semiAutoGrabStopPercent) or 75, 1, 100), autoGrabSetDelayRadius = tonumber(u.semiAutoGrabDelayRadius) or 8 };
	if _G.MasaSemiSteal then
		local g = _G.MasaSemiSteal;
		g.autoGrabStopTime = _G._MasaSemiStealPending.autoGrabStopTime;
		g.autoGrabStopPercent = _G._MasaSemiStealPending.autoGrabStopPercent;
		g.autoGrabSetDelayRadius = _G._MasaSemiStealPending.autoGrabSetDelayRadius;
		g.autoGrabStopEnabled = true;
	end;
	if _G.MasaSemiV2Steal then
		local g = _G.MasaSemiV2Steal;
		g.radius = _G.MasaStealRadii.SemiV2Radius or g.radius or 60;
		g.semiRadius = _G.MasaStealRadii.SemiV2SemiRadius or g.semiRadius or 8;
	end;
	if w == "Normal" then
		_G.MasaStealRadii.Normal = _G.MasaStealRadii.Normal or t or 62;
		t = _G.MasaStealRadii.Normal;
	elseif k == "V2" then
		_G.MasaStealRadii.SemiV2Radius = _G.MasaStealRadii.SemiV2Radius or 60;
		t = _G.MasaStealRadii.SemiV2Radius;
	else
		_G.MasaStealRadii.Semi = _G.MasaStealRadii.Semi or t or 60;
		t = _G.MasaStealRadii.Semi;
	end;
	N = u.selectedAimbotMode or N;
	if N == "Anti Bypass" or N == "Bypass" then
		N = "V2";
	elseif N ~= "V2" then
		N = "V1";
	end;
	n = tonumber(u.AIMBOT_SPEED) or n;
	A = tonumber(u.LAGGER_AIMBOT_SPEED) or A;
	local R = u.BAT_AIMBOT_V2_SPEED or u.ANTI_BYPASS_AIMBOT_SPEED;
	local O = u.BAT_AIMBOT_V2_LAGGER_SPEED or u.ANTI_BYPASS_LAGGER_AIMBOT_SPEED;
	_G.MasaBatAimbotV2Speed = tonumber(R) or _G.MasaBatAimbotV2Speed or 58;
	if O == nil or tonumber(O) == 58 then
		_G.MasaBatAimbotV2LaggerSpeed = 40;
	else
		_G.MasaBatAimbotV2LaggerSpeed = tonumber(O) or 40;
	end;
	q = tonumber(u.TP_BAT_SPEED) or q or 58;
	d = u.autoSwingEnabled == true;
	C = u.mirrorTPDownEnabled == true;
	_G.MasaNormalAimbotOn = u.normalAimbotEnabled == true;
	_G.MasaBatAimbotV2On = (u.batAimbotV2Enabled == true) or (u.antiBypassAimbotEnabled == true);
	_G._MasaAimbotChase = _G._MasaAimbotChase or { V1 = "NORMAL", V2 = "NORMAL" };
	_G._MasaAimbotChase.V1 = (u.aimbotChaseV1 == "BYPASS") and "BYPASS" or "NORMAL";
	_G._MasaAimbotChase.V2 = (u.aimbotChaseV2 == "BYPASS") and "BYPASS" or "NORMAL";
	j = u.tpBatAutoSwingEnabled == true;
	if _G._MasaSetTPBatCameraLock then
		_G._MasaSetTPBatCameraLock(u.tpBatCameraLockEnabled == true);
	else
		_G._MasaTPBatCameraLockPending = u.tpBatCameraLockEnabled == true;
	end;
	_G.MasaTPBatOn = u.tpBatEnabled == true;
	_G.MasaTPBatVersion = math.clamp(tonumber(u.tpBatVersion) or 1, 1, 3);
	p = u.batCounterEnabled == true;
	if u.batCounterMode == "V2" then
		L = "V2";
	else
		L = "V1";
	end;
	b = u.medCounterEnabled == true;
	_G.MasaAntiBatEnabled = u.antiBatEnabled == true;
	T = u.safeMode == true;
	W = u.espEnabled == true;
	_G.MasaESPOn = W;
	D = u.showTrackerEnabled == true;
	K = u.ragdollCountdownEnabled == true;
	o = u.fpsBoostEnabled == true;
	x = u.antiLagVisualEnabled == true;
	s = u.vividGraphicsEnabled == true;
	if u.vividSaturation then
		_G._MasaVivid.saturation = math.clamp(tonumber(u.vividSaturation) or .6, 0, 2);
	end;
	if u.vividBloomIntensity then
		_G._MasaVivid.bloomIntensity = math.clamp(tonumber(u.vividBloomIntensity) or .8, 0, 3);
	end;
	if u.vividBloomSize then
		_G._MasaVivid.bloomSize = math.clamp(tonumber(u.vividBloomSize) or 24, 1, 56);
	end;
	if u.vividDofFocus then
		_G._MasaVivid.dofFocus = math.clamp(tonumber(u.vividDofFocus) or 25, 1, 100);
	end;
	if u.vividSunIntensity then
		_G._MasaVivid.sunIntensity = math.clamp(tonumber(u.vividSunIntensity) or .2, 0, 1);
	end;
	v = u.xrayEnabled == true;
	_G.MasaBrainrotXRayEnabled = u.brainrotXRayEnabled == true;
	y = u.highPingWarningEnabled == true;
	_G._MasaKickWarn.enabled = u.kickWarningEnabled == true;
	_G.MasaUAKEnabled = u.ultimateAntiKick == true;
	gl = u.fovEnabled == true;
	ul = tonumber(u.fovValue) or ul;
	Bl = u.noCamCollisionEnabled == true;
	al = u.motionBlurEnabled == true;
	_G.MasaNoPlayerCollisionEnabled = u.noPlayerCollisionEnabled == true;
	Ol = u.unwalkEnabled == true;
	Sl = (type(u.skyTheme) == "string" and u.skyTheme) or Sl;
	if Sl == "Tech" then
		Sl = "Cyber";
	end;
	do
		local g = u.stretchCurrentIndex and math.max(1, math.min(u.stretchCurrentIndex, #dj)) or 1;
		local B = u.stretchEnabled == true;
		_G.MasaStretchPick = (g > 1) and g or 2;
		if B and g ~= 1 then
			Cj(g);
		else
			stretchCurrentIndex = g;
			stretchEnabled = false;
		end;
	end;
	Xl = false;
	wl = false;
	_G._AmbAutoPlaySavedJob = ((type(u.autoPlayJob) == "string" and u.autoPlayJob ~= "")) and u.autoPlayJob or nil;
	_G._AmbAutoPlaySavedSide = ((u.autoPlaySide == "L" or u.autoPlaySide == "R")) and u.autoPlaySide or nil;
	if _G.MasaAutoPlay and _G.MasaAutoPlay.restore then
		pcall(_G.MasaAutoPlay.restore);
	end;
	l = u.headlessEnabled == true;
	M = u.korbloxEnabled == true;
	_G.MasaAntiTPBatEnabled = u.antiTPBatEnabled == true;
	_G.MasaAntiTPBatSpam = u.antiTPBatSpam == true;
	_G.MasaAntiTPBatVersion = math.clamp(tonumber(u.antiTPBatVersion) or 1, 1, 4);
	_G.MasaAntiVoidEnabled = u.antiVoidEnabled == true;
	_G.MasaRainbowJoystickEnabled = u.rainbowJoystickEnabled == true;
	_G.MasaRainbowToolsEnabled = u.rainbowToolsEnabled == true;
	_G.MasaTransparentToolsEnabled = u.transparentToolsEnabled == true;
	_G.MasaCustomToolsEnabled = u.customToolsEnabled == true;
	_G.MasaCustomToolSkins = _G.MasaCustomToolSkins or {};
	_G.MasaCustomToolSkins.Bat = u.customToolSkinBat or "DiamondSword";
	_G.MasaCustomToolSkins.Medusa = u.customToolSkinMedusa or "GoldenDesertEagle";
	_G.MasaCustomSoundsEnabled = u.customSoundsEnabled == true;
	if type(u.avatarChanger) == "table" then
		_G._MasaAvatarChangerPending = u.avatarChanger;
	end;
	cl = math.clamp(tonumber(u.selectedAnimPackIndex) or 1, 1, 7);
	Ql = math.clamp(tonumber(u.animPackSavedIndex) or 1, 1, 7);
	if type(u.customAnimIds) == "table" then
		for g, B in ipairs(_G.MasaCustomAnimSlots) do
			local a = u.customAnimIds[B];
			_G.MasaCustomAnimIds[B] = ((type(a) == "string" and a:match("^%d+$"))) and a or "";
		end;
	end;
	if u.introEnabled ~= nil then
		_introEnabled = u.introEnabled == true;
	end;
	if u.selectedIntroMusic and INTRO_MUSIC_OPTIONS[u.selectedIntroMusic] then
		selectedIntroMusic = u.selectedIntroMusic;
	end;
	if u.musicSelectedSong and (MUSIC_PLAYER_OPTIONS and MUSIC_PLAYER_OPTIONS[u.musicSelectedSong]) then
		selectedMusicSong = u.musicSelectedSong;
	end;
	if u.musicVolume ~= nil then
		musicPlayerVolume = math.clamp(tonumber(u.musicVolume) or 1, 0, 2);
	end;
	if u.musicSpeed ~= nil then
		musicPlayerSpeed = math.clamp(tonumber(u.musicSpeed) or 1, .1, 2);
	end;
	if u.musicAutoPlayNext ~= nil then
		musicAutoPlayNext = u.musicAutoPlayNext == true;
	end;
	if u.musicShuffleEnabled ~= nil then
		musicShuffleEnabled = u.musicShuffleEnabled == true;
	end;
	if u.musicLoopEnabled ~= nil then
		musicLoopEnabled = u.musicLoopEnabled == true;
	end;
	if Xl and wl then
		wl = false;
	end;
	if u.trackerColor then
		BoxedESPOptions = BoxedESPOptions or {};
		if typeof(u.trackerColor) == "Color3" then
			BoxedESPOptions.trackerColor = u.trackerColor;
		elseif type(u.trackerColor) == "table" then
			local g = tonumber(u.trackerColor.r) or tonumber(u.trackerColor.R) or 230;
			local B = tonumber(u.trackerColor.g) or tonumber(u.trackerColor.G) or 230;
			local a = tonumber(u.trackerColor.b) or tonumber(u.trackerColor.B) or 230;
			BoxedESPOptions.trackerColor = Color3.fromRGB(g, B, a);
		end;
	end;
end;
loadMasaConfig();
_G.MasaCounterState = _G.MasaCounterState or {};
_G.MasaCounterState.batConn = nil;
_G.MasaCounterState.batDebounce = false;
_G.MasaCounterState.medConns = _G.MasaCounterState.medConns or {};
_G.MasaCounterState.medDebounce = false;
_G.MasaCounterState.medLastUsed = _G.MasaCounterState.medLastUsed or 0;
_G.MasaMedusaCooldown = 25;
function _G.MasaFindMedusa()
	local g = e.Character;
	if not g then
		return nil;
	end;
	for g, u in ipairs(g:GetChildren()) do
		if u:IsA("Tool") then
			local g = u.Name:lower();
			if g:find("medusa") or g:find("head") or g:find("stone") then
				return u;
			end;
		end;
	end;
	local u = e:FindFirstChild("Backpack") or e:FindFirstChildOfClass("Backpack");
	if u then
		for g, u in ipairs(u:GetChildren()) do
			if u:IsA("Tool") then
				local g = u.Name:lower();
				if g:find("medusa") or g:find("head") or g:find("stone") then
					return u;
				end;
			end;
		end;
	end;
	return nil;
end;
function _G.MasaUseMedusaCounter()
	if not b then
		return;
	end;
	if _G.MasaCounterState.medDebounce then
		return;
	end;
	if tick() - ((_G.MasaCounterState.medLastUsed or 0)) < _G.MasaMedusaCooldown then
		return;
	end;
	local g = e.Character;
	if not g then
		return;
	end;
	_G.MasaCounterState.medDebounce = true;
	local u = _G.MasaFindMedusa();
	if not u then
		_G.MasaCounterState.medDebounce = false;
		return;
	end;
	if u.Parent ~= g then
		local B = g:FindFirstChildOfClass("Humanoid");
		if B then
			pcall(function()
				B:EquipTool(u);
			end);
		end;
		task.wait(.05);
	end;
	pcall(function()
		u:Activate();
	end);
	_G.MasaCounterState.medLastUsed = tick();
	_G.MasaCounterState.medDebounce = false;
end;
function _G.MasaOnMedusaAnchorChanged(g)
	return (g:GetPropertyChangedSignal("Anchored")):Connect(function()
		if g.Anchored and g.Transparency == 1 then
			if b then
				_G.MasaUseMedusaCounter();
			end;
		end;
	end);
end;
function _G.MasaStartMedCounter(g)
	_G.MasaStopMedCounter();
	g = g or e.Character;
	if not g then
		return;
	end;
	for g, u in ipairs(g:GetDescendants()) do
		if u:IsA("BasePart") then
			table.insert(_G.MasaCounterState.medConns, _G.MasaOnMedusaAnchorChanged(u));
		end;
	end;
	table.insert(_G.MasaCounterState.medConns, g.DescendantAdded:Connect(function(g)
		if g:IsA("BasePart") then
			table.insert(_G.MasaCounterState.medConns, _G.MasaOnMedusaAnchorChanged(g));
		end;
	end));
end;
function _G.MasaStopMedCounter()
	for g, u in pairs(_G.MasaCounterState.medConns or {}) do
		pcall(function()
			u:Disconnect();
		end);
	end;
	_G.MasaCounterState.medConns = {};
	_G.MasaCounterState.medDebounce = false;
end;
_G.MasaBatCounterV2On = false;
_G.MasaBatCounterSlapList = {
		"Bat",
		"Slap",
		"Iron Slap",
		"Gold Slap",
		"Diamond Slap",
		"Emerald Slap",
		"Ruby Slap",
		"Dark Matter Slap",
		"Flame Slap",
		"Nuclear Slap",
		"Galaxy Slap",
		"Glitched Slap",
	};
function _G.MasaFindBatForCounter()
	local g = e.Character;
	if not g then
		return nil;
	end;
	local u = e:FindFirstChildOfClass("Backpack") or e:FindFirstChild("Backpack");
	for B, a in ipairs(_G.MasaBatCounterSlapList) do
		local H = g:FindFirstChild(a) or (u and u:FindFirstChild(a));
		if H then
			return H;
		end;
	end;
	for g, u in ipairs(g:GetChildren()) do
		if u:IsA("Tool") and (u.Name:lower()):find("bat") then
			return u;
		end;
	end;
	if u then
		for g, u in ipairs(u:GetChildren()) do
			if u:IsA("Tool") and (u.Name:lower()):find("bat") then
				return u;
			end;
		end;
	end;
	return nil;
end;
function _G.MasaSwingBatForCounter(g, u)
	if not g or not u then
		return;
	end;
	local B = u:FindFirstChildOfClass("Humanoid");
	if g.Parent ~= u then
		if B then
			pcall(function()
				B:EquipTool(g);
			end);
		end;
		task.wait(.05);
	end;
	local a = g:FindFirstChildOfClass("RemoteEvent") or g:FindFirstChildOfClass("RemoteFunction");
	if a and a:IsA("RemoteEvent") then
		pcall(function()
			a:FireServer();
		end);
		task.wait(.15);
		pcall(function()
			a:FireServer();
		end);
	else
		pcall(function()
			g:Activate();
		end);
		task.wait(.15);
		pcall(function()
			g:Activate();
		end);
	end;
end;
function _G.MasaCounterIsRagdoll(g)
	if not g then
		return false;
	end;
	local u = g:GetState();
	return u == Enum.HumanoidStateType.Physics or u == Enum.HumanoidStateType.Ragdoll or u == Enum.HumanoidStateType.FallingDown or g.PlatformStand == true;
end;
function _G.MasaCounterIsRagdollForBat(g)
	if not g then
		return false;
	end;
	local u = g:GetState();
	return u == Enum.HumanoidStateType.Physics or u == Enum.HumanoidStateType.Ragdoll or g.PlatformStand == true;
end;
_G.MasaBatCounterRagdollSeconds = _G.MasaBatCounterRagdollSeconds or 2.6;
_G.MasaBatCounterEnemyLock = _G.MasaBatCounterEnemyLock or {};
_G.MasaBatCounterWatchConns = _G.MasaBatCounterWatchConns or {};
function _G.MasaBCMarkEnemyRagdoll(g)
	if not g or g == e then
		return;
	end;
	local u = tonumber(_G.MasaBatCounterRagdollSeconds) or 2.6;
	_G.MasaBatCounterEnemyLock[g] = tick() + u;
end;
function _G.MasaStopBatCounterWatcher()
	local g = _G.MasaBatCounterWatchConns;
	for u, B in pairs(g) do
		pcall(function()
			B:Disconnect();
		end);
		g[u] = nil;
	end;
	for g in pairs(_G.MasaBatCounterEnemyLock) do
		_G.MasaBatCounterEnemyLock[g] = nil;
	end;
end;
function _G.MasaStartBatCounterWatcher()
	_G.MasaStopBatCounterWatcher();
	local u = _G.MasaBatCounterWatchConns;
	local function B(g, B)
		if not B then
			return;
		end;
		local a = tostring(g.UserId) .. "_char";
		if u[a] then
			pcall(function()
				u[a]:Disconnect();
			end);
		end;
		u[a] = B.DescendantAdded:Connect(function(u)
				if u:IsA("BallSocketConstraint") then
					_G.MasaBCMarkEnemyRagdoll(g);
				end;
			end);
	end;
	local function a(g)
		if g == e then
			return;
		end;
		local a = tostring(g.UserId) .. "_added";
		if u[a] then
			pcall(function()
				u[a]:Disconnect();
			end);
		end;
		u[a] = g.CharacterAdded:Connect(function(u)
				B(g, u);
			end);
		if g.Character then
			B(g, g.Character);
		end;
	end;
	u._playerAdded = g.PlayerAdded:Connect(a);
	u._playerRemoving = g.PlayerRemoving:Connect(function(g)
			_G.MasaBatCounterEnemyLock[g] = nil;
			local B = tostring(g.UserId) .. "_added";
			local a = tostring(g.UserId) .. "_char";
			if u[B] then
				pcall(function()
					u[B]:Disconnect();
				end);
				u[B] = nil;
			end;
			if u[a] then
				pcall(function()
					u[a]:Disconnect();
				end);
				u[a] = nil;
			end;
		end);
	for g, u in ipairs(g:GetPlayers()) do
		a(u);
	end;
end;
function _G.MasaGetNearestEnemy()
	local u = e.Character;
	local B = u and u:FindFirstChild("HumanoidRootPart");
	if not B then
		return nil;
	end;
	local a = B.Position;
	local H, i = nil, math.huge;
	for g, u in ipairs(g:GetPlayers()) do
		if u ~= e then
			local g = u.Character;
			local B = g and g:FindFirstChild("HumanoidRootPart");
			local R = g and g:FindFirstChildOfClass("Humanoid");
			if B and (R and R.Health > 0) then
				local g = ((B.Position - a)).Magnitude;
				if g < i then
					i = g;
					H = u;
				end;
			end;
		end;
	end;
	return H;
end;
function _G.MasaIsNearestEnemyRagdolled()
	local g = _G.MasaGetNearestEnemy();
	if not g then
		return false;
	end;
	local u = _G.MasaBatCounterEnemyLock[g];
	return u ~= nil and u > tick();
end;
function _G.MasaStartBatCounter()
	if _G.MasaCounterState.batConn then
		return;
	end;
	_G.MasaCounterState.batDebounce = false;
	if _G.MasaStartBatCounterWatcher then
		pcall(_G.MasaStartBatCounterWatcher);
	end;
	_G.MasaCounterState.batConn = a.Heartbeat:Connect(function()
			if not p then
				return;
			end;
			if _G.MasaCounterState.batDebounce then
				return;
			end;
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChildOfClass("Humanoid");
			if not u then
				return;
			end;
			if u.Health <= 0 then
				return;
			end;
			if _G._MasaInstantResetBusy then
				return;
			end;
			if _G.MasaCounterIsRagdollForBat(u) then
				_G.MasaCounterState.batDebounce = true;
				if _G.MasaAntiDieArmNow then
					pcall(_G.MasaAntiDieArmNow);
				end;
				if L == "V2" then
					if _G.MasaIsNearestEnemyRagdolled then
						local g, u = pcall(_G.MasaIsNearestEnemyRagdolled);
						if g and u then
							task.spawn(function()
								local g = tick();
								while tick() - g < 10 do
									local g = e.Character;
									local u = g and g:FindFirstChildOfClass("Humanoid");
									if not u or not _G.MasaCounterIsRagdollForBat(u) then
										break;
									end;
									task.wait(.1);
								end;
								task.wait(.2);
								_G.MasaCounterState.batDebounce = false;
							end);
							return;
						end;
					end;
					task.spawn(function()
						task.wait(.05);
						local u = _G.MasaTPBatOn == true;
						local B = g and g:FindFirstChild("HumanoidRootPart");
						local H = B and B.CFrame or nil;
						_G.MasaBatCounterV2On = true;
						if _G.MasaAntiDieAutoSync then
							_G.MasaAntiDieAutoSync();
						end;
						if not u then
							_G.MasaTPBatSilent = true;
							if _G.MasaStartTPBat then
								pcall(_G.MasaStartTPBat);
							end;
							if _G.MasaRefreshMobileButtonStates then
								pcall(_G.MasaRefreshMobileButtonStates);
							end;
						end;
						local i = _G.MasaFindBatForCounter();
						if i then
							task.spawn(function()
								_G.MasaSwingBatForCounter(i, g);
							end);
						end;
						local R;
						R = a.Heartbeat:Connect(function()
								local g = e.Character;
								local u = g and g:FindFirstChild("HumanoidRootPart");
								local B = g and g:FindFirstChildOfClass("Humanoid");
								if not u or not B or B.Health <= 0 then
									return;
								end;
								local a = _G.MasaGetNearestEnemy and _G.MasaGetNearestEnemy() or nil;
								local H = a and a.Character;
								local i = H and H:FindFirstChild("HumanoidRootPart");
								if not i then
									return;
								end;
								local R = i.Position;
								if _G.MasaAntiVoid then
									R = _G.MasaAntiVoid.posForPart(i, R);
								end;
								pcall(function()
									u.CFrame = CFrame.new(R + Vector3.new(0, .9, 0));
									u.AssemblyLinearVelocity = Vector3.zero;
									u.AssemblyAngularVelocity = Vector3.zero;
								end);
							end);
						task.wait(.4);
						if R then
							pcall(function()
								R:Disconnect();
							end);
							R = nil;
						end;
						_G.MasaBatCounterV2On = false;
						if _G.MasaAntiDieAutoSync then
							_G.MasaAntiDieAutoSync();
						end;
						if not u then
							if _G.MasaStopTPBat then
								pcall(_G.MasaStopTPBat);
							end;
							_G.MasaTPBatSilent = false;
							if _G.MasaRefreshMobileButtonStates then
								pcall(_G.MasaRefreshMobileButtonStates);
							end;
						end;
						if H then
							local u = g and g:FindFirstChild("HumanoidRootPart");
							if u then
								pcall(function()
									u.CFrame = H;
									u.AssemblyLinearVelocity = Vector3.zero;
								end);
							end;
						end;
						task.wait(.5);
						_G.MasaCounterState.batDebounce = false;
					end);
				else
					task.spawn(function()
						local u = _G.MasaLookAtEnabled;
						local B = _G.MasaLookAtRadius;
						_G.MasaLookAtRadius = math.huge;
						if _G.MasaStartLookAt then
							pcall(_G.MasaStartLookAt);
						end;
						local a = _G.MasaFindBatForCounter();
						if a then
							task.spawn(function()
								_G.MasaSwingBatForCounter(a, g);
							end);
						end;
						task.wait(.7);
						_G.MasaLookAtRadius = B;
						if u then
							if _G.MasaStartLookAt then
								pcall(_G.MasaStartLookAt);
							end;
						else
							if _G.MasaStopLookAt then
								pcall(_G.MasaStopLookAt);
							end;
						end;
						task.wait(.5);
						_G.MasaCounterState.batDebounce = false;
					end);
				end;
			end;
		end);
end;
function _G.MasaStopBatCounter()
	if _G.MasaCounterState.batConn then
		_G.MasaCounterState.batConn:Disconnect();
		_G.MasaCounterState.batConn = nil;
	end;
	_G.MasaCounterState.batDebounce = false;
	_G.MasaBatCounterV2On = false;
	if not _G.MasaTPRagdollEnabled then
		if _G.MasaStopBatCounterWatcher then
			pcall(_G.MasaStopBatCounterWatcher);
		end;
	end;
end;
startBatCounter = _G.MasaStartBatCounter;
stopBatCounter = _G.MasaStopBatCounter;
setupMedusaCounter = _G.MasaStartMedCounter;
stopMedusaCounter = _G.MasaStopMedCounter;
_G.MasaNoPlayerCollisionState = _G.MasaNoPlayerCollisionState or {};
do
	local u = _G.MasaNoPlayerCollisionState;
	u.connections = u.connections or {};
	u.parts = u.parts or {};
	u.charConns = u.charConns or {};
	u.holders = u.holders or {};
	u.running = u.running or false;
	local B = {
			HumanoidRootPart = true,
			Head = true,
			Torso = true,
			UpperTorso = true,
			LowerTorso = true,
			["Left Arm"] = true,
			["Right Arm"] = true,
			["Left Leg"] = true,
			["Right Leg"] = true,
			LeftUpperArm = true,
			LeftLowerArm = true,
			LeftHand = true,
			RightUpperArm = true,
			RightLowerArm = true,
			RightHand = true,
			LeftUpperLeg = true,
			LeftLowerLeg = true,
			LeftFoot = true,
			RightUpperLeg = true,
			RightLowerLeg = true,
			RightFoot = true,
		};
	local function H()
		return u.running == true;
	end;
	local i = 1;
	local function O(g, B)
		if not g or not g:IsA("BasePart") then
			return;
		end;
		if u.parts[g] then
			return;
		end;
		local a = { cc = g.CanCollide, ct = g.CanTouch };
		u.parts[g] = a;
		pcall(function()
			g.CanCollide = false;
		end);
		if B then
			pcall(function()
				g.CanTouch = false;
			end);
		end;
		a.conn = (g:GetPropertyChangedSignal("CanCollide")):Connect(function()
				if not H() then
					return;
				end;
				if g.CanCollide then
					pcall(function()
						g.CanCollide = false;
					end);
				end;
			end);
		a.destroy = g.AncestryChanged:Connect(function()
				if g:IsDescendantOf(game) then
					return;
				end;
				if a.conn then
					pcall(function()
						a.conn:Disconnect();
					end);
				end;
				if a.destroy then
					pcall(function()
						a.destroy:Disconnect();
					end);
				end;
				u.parts[g] = nil;
			end);
	end;
	local function c(g)
		local B = u.parts[g];
		if not B then
			return;
		end;
		if B.conn then
			pcall(function()
				B.conn:Disconnect();
			end);
		end;
		if B.destroy then
			pcall(function()
				B.destroy:Disconnect();
			end);
		end;
		u.parts[g] = nil;
		if g and g.Parent then
			pcall(function()
				g.CanCollide = B.cc;
			end);
			pcall(function()
				g.CanTouch = B.ct;
			end);
		end;
	end;
	local h;
	local function Q(g, B)
		if not g then
			return;
		end;
		for g, a in ipairs(g:GetDescendants()) do
			if a:IsA("BasePart") and u.parts[a] then
				if not ((B and a.Name == "HumanoidRootPart")) then
					if a.CanCollide then
						pcall(function()
							a.CanCollide = false;
						end);
					end;
				end;
			end;
		end;
	end;
	h = function(g, B, a)
			if not u.charConns[B] then
				u.charConns[B] = {};
			end;
			table.insert(u.charConns[B], g.StateChanged:Connect(function()
				if not H() then
					return;
				end;
				task.defer(function()
					if H() and B.Parent then
						Q(B, a);
					end;
				end);
			end));
			table.insert(u.charConns[B], (g:GetPropertyChangedSignal("FloorMaterial")):Connect(function()
				if not H() then
					return;
				end;
				task.defer(function()
					if H() and B.Parent then
						Q(B, a);
					end;
				end);
			end));
		end;
	local function P(g, B)
		if not g then
			return;
		end;
		if u.charConns[g] then
			return;
		end;
		u.charConns[g] = {};
		local function a(g)
			if not H() then
				return;
			end;
			if not g:IsA("BasePart") then
				return;
			end;
			if B and g.Name == "HumanoidRootPart" then
				return;
			end;
			O(g, not B);
		end;
		for g, u in ipairs(g:GetDescendants()) do
			a(u);
		end;
		table.insert(u.charConns[g], g.DescendantAdded:Connect(a));
		local i = g:FindFirstChildOfClass("Humanoid");
		if not i then
			local a;
			a = g.ChildAdded:Connect(function(u)
					if u:IsA("Humanoid") then
						a:Disconnect();
						h(u, g, B);
					end;
				end);
			table.insert(u.charConns[g], a);
		else
			h(i, g, B);
		end;
		table.insert(u.charConns[g], g.AncestryChanged:Connect(function(B, a)
			if a == nil then
				for g, u in ipairs(u.charConns[g] or {}) do
					pcall(function()
						u:Disconnect();
					end);
				end;
				u.charConns[g] = nil;
			end;
		end));
	end;
	local function m(u)
		local B = u.AssemblyRootPart;
		if not B then
			return false;
		end;
		local a = B:FindFirstAncestorOfClass("Model");
		if not a then
			return false;
		end;
		local H = g:GetPlayerFromCharacter(a);
		return H ~= nil and H ~= e;
	end;
	local function Z(g)
		if not H() then
			return;
		end;
		if not g:IsA("BasePart") then
			return;
		end;
		if u.parts[g] then
			return;
		end;
		task.defer(function()
			if not H() then
				return;
			end;
			if not g.Parent then
				return;
			end;
			if m(g) then
				O(g, true);
			end;
		end);
	end;
	local function F()
		if u.running then
			return;
		end;
		u.running = true;
		for g, u in ipairs(u.connections or {}) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		u.connections = {};
		local function B(g)
			table.insert(u.connections, g);
		end;
		local function c(g)
			if g == e then
				return;
			end;
			if g.Character then
				P(g.Character, false);
			end;
			B(g.CharacterAdded:Connect(function(g)
				if H() then
					P(g, false);
				end;
			end));
		end;
		for g, u in ipairs(g:GetPlayers()) do
			c(u);
		end;
		B(g.PlayerAdded:Connect(c));
		if e.Character then
			P(e.Character, true);
		end;
		B(e.CharacterAdded:Connect(function(g)
			if H() then
				P(g, true);
			end;
		end));
		for g, u in ipairs(R:GetChildren()) do
			Z(u);
		end;
		B(R.DescendantAdded:Connect(Z));
		if i > 0 then
			local R = 0;
			B(a.Heartbeat:Connect(function(B)
				if not H() then
					return;
				end;
				R = R + ((B or 0));
				if R < i then
					return;
				end;
				R = 0;
				for g, B in ipairs(g:GetPlayers()) do
					local a = B.Character;
					if a then
						local g = (B == e);
						Q(a, g);
						for B, a in ipairs(a:GetDescendants()) do
							if a:IsA("BasePart") and not u.parts[a] then
								if not ((g and a.Name == "HumanoidRootPart")) then
									O(a, not g);
								end;
							end;
						end;
					end;
				end;
			end));
		end;
	end;
	local function S()
		if not u.running then
			return;
		end;
		u.running = false;
		for g, u in ipairs(u.connections or {}) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		u.connections = {};
		for g, B in pairs(u.charConns) do
			for g, u in ipairs(B) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			u.charConns[g] = nil;
		end;
		for g in pairs(u.parts) do
			c(g);
		end;
		u.parts = {};
	end;
	local function r()
		if not H() then
			return;
		end;
		for g, u in ipairs(g:GetPlayers()) do
			local B = u.Character;
			if B then
				if u == e then
					for g, u in ipairs(B:GetDescendants()) do
						if u:IsA("BasePart") and u.Name ~= "HumanoidRootPart" then
							O(u, false);
						end;
					end;
				else
					for g, u in ipairs(B:GetDescendants()) do
						if u:IsA("BasePart") then
							O(u, true);
						end;
					end;
				end;
				P(B, u == e);
			end;
		end;
	end;
	function _G.MasaNoCollisionAcquire(g)
		u.holders[g or "default"] = true;
		F();
	end;
	function _G.MasaNoCollisionRelease(g)
		u.holders[g or "default"] = nil;
		if _G.MasaNoPlayerCollisionEnabled == true then
			u.holders.user = true;
			r();
			return;
		end;
		if next(u.holders) == nil then
			S();
		end;
	end;
end;
function enableNoPlayerCollision()
	_G.MasaNoPlayerCollisionEnabled = true;
	_G.MasaNoCollisionAcquire("user");
end;
function disableNoPlayerCollision()
	_G.MasaNoPlayerCollisionEnabled = false;
	_G.MasaNoCollisionRelease("user");
end;
function _G.MasaSetOtherPlayerCollision(g)
	if g == false then
		_G.MasaNoCollisionAcquire("legacy");
	else
		_G.MasaNoCollisionRelease("legacy");
	end;
end;
local pj, Lj;
do
	local g = nil;
	local function u(g)
		if not g then
			return;
		end;
		local u = g:FindFirstChildOfClass("Humanoid");
		if not u then
			return;
		end;
		local B = u:FindFirstChildOfClass("Animator");
		if B then
			for g, u in pairs(B:GetPlayingAnimationTracks()) do
				pcall(function()
					u:Stop();
				end);
			end;
		end;
		local a = g:FindFirstChild("Animate");
		if a and a:IsA("LocalScript") then
			a.Disabled = true;
		end;
		if u and u:GetState() ~= Enum.HumanoidStateType.Running then
			pcall(function()
				u:ChangeState(Enum.HumanoidStateType.Running);
			end);
		end;
	end;
	local function B(g)
		if not g then
			return;
		end;
		local u = g:FindFirstChild("Animate");
		if u and u:IsA("LocalScript") then
			u.Disabled = false;
		end;
		local B = g:FindFirstChildOfClass("Humanoid");
		if B then
			task.wait();
			pcall(function()
				B:ChangeState(Enum.HumanoidStateType.GettingUp);
			end);
		end;
	end;
	local function H()
		if g then
			return;
		end;
		g = a.Heartbeat:Connect(function()
				if not Ol then
					return;
				end;
				local g = e.Character;
				if not g then
					return;
				end;
				local u = g:FindFirstChildOfClass("Humanoid");
				if not u then
					return;
				end;
				local B = false;
				local a = u:FindFirstChildOfClass("Animator");
				if a then
					local g = a:GetPlayingAnimationTracks();
					if #g > 0 then
						B = true;
						for g, u in pairs(g) do
							pcall(function()
								u:Stop();
							end);
						end;
					end;
				end;
				local H = g:FindFirstChild("Animate");
				if H and (H:IsA("LocalScript") and not H.Disabled) then
					H.Disabled = true;
					B = true;
				end;
				if B then
					pcall(function()
						u:ChangeState(Enum.HumanoidStateType.Running);
					end);
				end;
			end);
	end;
	local function i()
		if g then
			g:Disconnect();
			g = nil;
		end;
		local u = e.Character;
		if u then
			B(u);
		end;
	end;
	pj = function()
			if Ol then
				return;
			end;
			Ol = true;
			local g = e.Character;
			if g then
				u(g);
			end;
			H();
		end;
	Lj = function()
			if not Ol then
				return;
			end;
			Ol = false;
			i();
			local g = e.Character;
			if g then
				B(g);
			end;
		end;
	e.CharacterAdded:Connect(function(g)
		_G._MasaWaitCharReady(g, 10);
		pcall(function()
			g:WaitForChild("Animate", 3);
		end);
		if Ol then
			u(g);
		else
			B(g);
		end;
	end);
end;
do
	local g = {
			[1] = nil,
			[2] = {
				idle = "rbxassetid://619542203",
				walk = "rbxassetid://619544080",
				run = "rbxassetid://619543231",
				jump = "rbxassetid://619542888",
				fall = "rbxassetid://619541867",
			},
			[3] = {
				idle = "rbxassetid://754637456",
				walk = "rbxassetid://754636298",
				run = "rbxassetid://754635032",
				jump = "rbxassetid://754637084",
				fall = "rbxassetid://754636589",
			},
			[4] = {
				idle = "rbxassetid://1113742618",
				walk = "rbxassetid://1113741192",
				run = "rbxassetid://1113740510",
				jump = "rbxassetid://1113742359",
				fall = "rbxassetid://1113742092",
			},
			[5] = {
				idle = "rbxassetid://126354114956642",
				walk = "rbxassetid://106810508343012",
				run = "rbxassetid://124765145869332",
				jump = "rbxassetid://115715495289805",
				fall = "rbxassetid://93993406355955",
			},
			[6] = {
				idle = "rbxassetid://619535834",
				walk = "rbxassetid://619537468",
				run = "rbxassetid://619536621",
				jump = "rbxassetid://619536283",
				fall = "rbxassetid://619535616",
			},
		};
	local function u(g, u)
		local B = Instance.new("Animation");
		local a, H = pcall(function()
				local g = game:GetObjects(u);
				for g, u in pairs(g) do
					if u:IsA("Animation") then
						return u.AnimationId;
					end;
					local B = u:FindFirstChildWhichIsA("Animation", true);
					if B then
						return B.AnimationId;
					end;
				end;
			end);
		B.AnimationId = ((a and H)) and H or u;
		return g:LoadAnimation(B);
	end;
	_G._MasaAnimPackConns = _G._MasaAnimPackConns or {};
	local function B()
		for g, u in pairs(ml) do
			pcall(function()
				u:Stop(0);
			end);
		end;
		ml = {};
		for g, u in ipairs(_G._MasaAnimPackConns) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		_G._MasaAnimPackConns = {};
	end;
	local function a()
		local g, u = {}, false;
		for B, a in ipairs(_G.MasaCustomAnimSlots) do
			local H = _G.MasaCustomAnimIds[a];
			if H and H ~= "" then
				g[a] = "rbxassetid://" .. H;
				u = true;
			end;
		end;
		if not u then
			return nil;
		end;
		return g;
	end;
	local function H(H)
		B();
		if not el then
			return;
		end;
		local i;
		if cl == 7 then
			i = a();
			if not i then
				return;
			end;
		else
			i = g[cl];
		end;
		if not i then
			return;
		end;
		local R = H:WaitForChild("Humanoid");
		local O = R:WaitForChild("Animator");
		local c = H:FindFirstChild("Animate");
		local h = false;
		if cl == 7 then
			for g, u in ipairs({
				"idle",
				"walk",
				"run",
				"jump",
				"fall",
			}) do
				if not i[u] then
					h = true;
					break;
				end;
			end;
		end;
		if not h then
			if c then
				c.Disabled = true;
			end;
		elseif c then
			c.Disabled = false;
		end;
		task.wait(.1);
		if not h then
			for g, u in pairs(O:GetPlayingAnimationTracks()) do
				pcall(function()
					u:Stop(0);
				end);
			end;
		end;
		for g, B in pairs(i) do
			local a = u(O, B);
			a.Looped = (g == "idle" or g == "walk" or g == "run" or g == "fall");
			if h then
				a.Priority = Enum.AnimationPriority.Action;
			elseif g == "idle" then
				a.Priority = Enum.AnimationPriority.Idle;
			elseif g == "walk" or g == "run" then
				a.Priority = Enum.AnimationPriority.Movement;
			else
				a.Priority = Enum.AnimationPriority.Action;
			end;
			ml[g] = a;
		end;
		local function Q(g, u)
			if not el then
				return;
			end;
			if not ml[g] then
				local u = ml[Zl];
				if u then
					pcall(function()
						u:Stop(.15);
					end);
				end;
				Zl = g;
				return;
			end;
			if Zl == g and not u then
				return;
			end;
			if ml[Zl] and Zl ~= g then
				pcall(function()
					ml[Zl]:Stop(.15);
				end);
			end;
			Zl = g;
			if u then
				ml[g]:Stop();
			end;
			ml[g]:Play(.15);
		end;
		local e = _G._MasaAnimPackConns;
		table.insert(e, R.Running:Connect(function(g)
			if not el then
				return;
			end;
			local u = R:GetState();
			if u == Enum.HumanoidStateType.Freefall or u == Enum.HumanoidStateType.Jumping then
				return;
			end;
			if g > 14 then
				Q("run");
			elseif g > .5 then
				Q("walk");
			else
				Q("idle");
			end;
		end));
		table.insert(e, R.Jumping:Connect(function(g)
			if not el or not g then
				return;
			end;
			Q("jump", true);
		end));
		table.insert(e, R.FreeFalling:Connect(function(g)
			if not el or not g then
				return;
			end;
			Q("fall");
		end));
		table.insert(e, R.StateChanged:Connect(function(g, u)
			if not el then
				return;
			end;
			if u == Enum.HumanoidStateType.Landed then
				if R.MoveDirection.Magnitude > 0 then
					if R.WalkSpeed > 14 then
						Q("run");
					else
						Q("walk");
					end;
				else
					Q("idle");
				end;
			end;
		end));
		local P = R:GetState();
		if P == Enum.HumanoidStateType.Jumping then
			Zl = "jump";
			if ml.jump then
				ml.jump:Play(.15);
			end;
		elseif P == Enum.HumanoidStateType.Freefall then
			Zl = "fall";
			if ml.fall then
				ml.fall:Play(.15);
			end;
		elseif R.MoveDirection.Magnitude > .1 then
			if R.WalkSpeed > 14 then
				Zl = "run";
				if ml.run then
					ml.run:Play(.15);
				end;
			else
				Zl = "walk";
				if ml.walk then
					ml.walk:Play(.15);
				end;
			end;
		else
			Zl = "idle";
			if ml.idle then
				ml.idle:Play(.15);
			end;
		end;
	end;
	local function i()
		B();
		local g = e.Character;
		if g then
			local u = g:FindFirstChild("Animate");
			if u then
				u.Disabled = false;
			end;
			local B = g:FindFirstChild("Humanoid");
			if B then
				local g = B:FindFirstChild("Animator");
				if g then
					for g, u in pairs(g:GetPlayingAnimationTracks()) do
						u:Stop(0);
					end;
				end;
			end;
		end;
	end;
	local R = false;
	_G.MasaSetAnimPack = function(g)
			g = math.clamp(tonumber(g) or 1, 1, 7);
			if g == 1 then
				el = false;
				i();
				cl = 1;
				if Ol then
					Ql = 1;
					hl = false;
				else
					if hl then
						hl = false;
						Ql = 1;
						pj();
						if Z.setUnwalkVisual then
							Z.setUnwalkVisual(true);
						end;
					end;
				end;
			else
				if Ol then
					Ql = g;
					hl = true;
					R = true;
					Lj();
					if Z.setUnwalkVisual then
						Z.setUnwalkVisual(false);
					end;
				end;
				cl = g;
				el = true;
				local u = e.Character;
				if u then
					task.spawn(function()
						H(u);
					end);
				end;
			end;
			if Fl then
				Fl(cl);
			end;
			if _G.MasaCustomAnimSetRowVisible then
				_G.MasaCustomAnimSetRowVisible(cl == 7, true);
			end;
			saveMasaConfig();
		end;
	local O = pj;
	local c = Lj;
	pj = function()
			if cl ~= 1 then
				Ql = cl;
				hl = true;
				el = false;
				i();
				cl = 1;
				if Fl then
					Fl(1);
				end;
			end;
			O();
		end;
	Lj = function()
			c();
			if R then
				R = false;
				return;
			end;
			if Ql ~= 1 then
				local g = Ql;
				Ql = 1;
				hl = false;
				task.delay(.25, function()
					if not Ol and _G.MasaSetAnimPack then
						_G.MasaSetAnimPack(g);
					end;
				end);
			end;
		end;
	function _G.MasaReloadCustomAnimPack()
		if cl ~= 7 then
			return;
		end;
		local g = e.Character;
		if not g then
			return;
		end;
		if _G.MasaHasCustomAnim() then
			el = true;
			task.spawn(function()
				H(g);
			end);
		else
			el = false;
			i();
		end;
	end;
	e.CharacterAdded:Connect(function(g)
		_G._MasaWaitCharReady(g, 10);
		pcall(function()
			g:WaitForChild("Animate", 3);
		end);
		if el and cl ~= 1 then
			task.spawn(function()
				H(g);
			end);
		end;
	end);
	if e.Character and (el and cl ~= 1) then
		task.spawn(function()
			H(e.Character);
		end);
	end;
end;
function _G.MasaSafeModeGetCountdownLabel()
	local g, u = pcall(function()
			return e.PlayerGui and (e.PlayerGui:FindFirstChild("DuelsMachineTopFrame") and (e.PlayerGui.DuelsMachineTopFrame:FindFirstChild("DuelsMachineTopFrame") and (e.PlayerGui.DuelsMachineTopFrame.DuelsMachineTopFrame:FindFirstChild("Timer") and e.PlayerGui.DuelsMachineTopFrame.DuelsMachineTopFrame.Timer:FindFirstChild("Label"))));
		end);
	return (g and u) or nil;
end;
function _G.MasaSafeModeCountdownNumber(g)
	local u = (((tostring(g or "")):upper()):gsub("^%s+", "")):gsub("%s+$", "");
	if u == "GO" or u == "START" or u == "READY" then
		return true;
	end;
	local B = tonumber(u);
	return B ~= nil and (B >= 0 and B <= 10);
end;
function _G.MasaSafeModeCountdownValue()
	local g = _G.MasaSafeModeGetCountdownLabel();
	if not g then
		return nil;
	end;
	local u = (((tostring(g.Text or "")):upper()):gsub("^%s+", "")):gsub("%s+$", "");
	if u == "GO" or u == "START" or u == "READY" then
		return 0;
	end;
	local B = tonumber(u);
	if B ~= nil and (B >= 0 and B <= 10) then
		return B;
	end;
	return nil;
end;
function _G.MasaSafeModeInDuelCountdown()
	local g = _G.MasaSafeModeGetCountdownLabel();
	return g and _G.MasaSafeModeCountdownNumber(g.Text) or false;
end;
_G.MasaSafeModeBlockedTools = {
		bat = true,
		slap = true,
		sword = true,
		gun = true,
		pistol = true,
		rifle = true,
		medusa = true,
		hammer = true,
		axe = true,
		knife = true,
		katana = true,
		blade = true,
		fist = true,
	};
function _G.MasaSafeModeIsCarryableTool(g)
	if not g or not g:IsA("Tool") then
		return false;
	end;
	local u = g.Name:lower();
	for g in pairs(_G.MasaSafeModeBlockedTools) do
		if u:find(g, 1, true) then
			return false;
		end;
	end;
	return true;
end;
function _G.MasaSafeModeHoldingBrainrot()
	local g, u = pcall(function()
			return e:GetAttribute("Stealing");
		end);
	if g and u == true then
		return true;
	end;
	local B, a = pcall(function()
			return e:GetAttribute("AntiKick");
		end);
	if B and a == true then
		return true;
	end;
	local H = e.Character;
	if not H then
		return false;
	end;
	local i, R = pcall(function()
			return H:GetAttribute("Stealing");
		end);
	if i and R == true then
		return true;
	end;
	if _G.AutoCarrySpeed and type(_G.AutoCarrySpeed.IsCarryingBrainrot) == "function" then
		local g, u = pcall(function()
				return _G.AutoCarrySpeed.IsCarryingBrainrot(H);
			end);
		if g and u then
			return true;
		end;
	end;
	for g, u in ipairs({
		"Carrying",
		"IsCarrying",
		"Grabbed",
		"Holding",
		"StealHold",
		"HasGrab",
	}) do
		local B = H:FindFirstChild(u, true);
		if B then
			if B:IsA("BoolValue") and B.Value then
				return true;
			end;
			if B:IsA("ObjectValue") and B.Value then
				return true;
			end;
			if B:IsA("StringValue") and B.Value ~= "" then
				return true;
			end;
		end;
	end;
	for g, u in ipairs(H:GetChildren()) do
		if u:IsA("Model") and u:FindFirstChildWhichIsA("BasePart", true) then
			local g = u.Name:lower();
			if g:find("brainrot") or g:find("animal") or g:find("carry") or g:find("grab") or g:find("steal") or g:find("hold") then
				return true;
			end;
		end;
	end;
	return false;
end;
function _G.MasaSafeModeIsLocked()
	if _G.MasaTPRagdollBusy == true then
		return true;
	end;
	if not T then
		return false;
	end;
	return _G.MasaSafeModeInDuelCountdown() or _G.MasaSafeModeHoldingBrainrot();
end;
function _G.MasaSafeModeForceStop(g)
	local u = false;
	if _G.MasaNormalAimbotOn and _G.MasaStopNormalAimbot then
		_G.MasaStopNormalAimbot();
		u = true;
	end;
	if _G.MasaBatAimbotV2On and _G.MasaStopBatAimbotV2 then
		_G.MasaStopBatAimbotV2(false);
		u = true;
	end;
	if _G.MasaTPBatOn and _G.MasaStopTPBat then
		_G.MasaStopTPBat();
		u = true;
	end;
	if Xl then
		Xl = false;
		if _G.MasaSetAutoLeftVisual then
			_G.MasaSetAutoLeftVisual(false);
		end;
		if _G.MasaStopAutoLeft then
			_G.MasaStopAutoLeft();
		end;
		u = true;
	end;
	if wl then
		wl = false;
		if _G.MasaSetAutoRightVisual then
			_G.MasaSetAutoRightVisual(false);
		end;
		if _G.MasaStopAutoRight then
			_G.MasaStopAutoRight();
		end;
		u = true;
	end;
	if u and showActionNotification then
		pcall(function()
			showActionNotification(g or "SAFE MODE LOCK");
		end);
	end;
end;
function _G.MasaSafeModeTryStart()
	if _G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked() then
		_G.MasaSafeModeForceStop("SAFE MODE LOCK");
		return false;
	end;
	return true;
end;
_G.MasaSafeModeMonitorStarted = _G.MasaSafeModeMonitorStarted or false;
if not _G.MasaSafeModeMonitorStarted then
	_G.MasaSafeModeMonitorStarted = true;
	a.Heartbeat:Connect(function()
		if T and (_G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked()) then
			_G.MasaSafeModeForceStop("SAFE MODE LOCK");
		end;
	end);
end;
e.CharacterAdded:Connect(function(g)
	_G._MasaWaitCharReady(g, 10);
	if b then
		_G.MasaStartMedCounter(g);
	end;
	if p then
		_G.MasaStartBatCounter();
	end;
end);
_G.MasaNormalAimbot = _G.MasaNormalAimbot or { conn = nil, target = nil, swingCooldown = false };
function _G.MasaFindAimbotBat()
	local g = e.Character;
	if not g then
		return nil;
	end;
	for g, u in ipairs(g:GetChildren()) do
		if u:IsA("Tool") and (((u.Name:lower()):find("bat") or (u.Name:lower()):find("slap"))) then
			return u;
		end;
	end;
	local u = e:FindFirstChild("Backpack");
	if u then
		for g, u in ipairs(u:GetChildren()) do
			if u:IsA("Tool") and (((u.Name:lower()):find("bat") or (u.Name:lower()):find("slap"))) then
				return u;
			end;
		end;
	end;
	return nil;
end;
function _G.MasaGetClosestAimbotTarget()
	local u = e.Character and e.Character:FindFirstChild("HumanoidRootPart");
	if not u then
		return nil;
	end;
	local B, a = nil, math.huge;
	for g, H in ipairs(g:GetPlayers()) do
		if H ~= e and H.Character then
			local g = H.Character:FindFirstChild("HumanoidRootPart");
			local i = H.Character:FindFirstChildOfClass("Humanoid");
			if g and (i and i.Health > 0) then
				local i = g.Position;
				if _G.MasaAntiVoid then
					i = _G.MasaAntiVoid.posFor(H, i);
				end;
				local R = ((i - u.Position)).Magnitude;
				if R < a then
					a = R;
					B = g;
				end;
			end;
		end;
	end;
	return B;
end;
function _G.MasaGetNormalAimbotSpeed()
	if I == "Lagger" or I == "Lagger Carry" then
		return tonumber(A) or 40;
	end;
	return tonumber(n) or 58;
end;
function _G.MasaGetBatAimbotV2Speed()
	if I == "Lagger" or I == "Lagger Carry" then
		return tonumber(_G.MasaBatAimbotV2LaggerSpeed) or 40;
	end;
	return tonumber(_G.MasaBatAimbotV2Speed) or 58;
end;
function _G.MasaGetSelectedAimbotSpeedValues()
	if N == "V2" then
		return tonumber(_G.MasaBatAimbotV2Speed) or 58, tonumber(_G.MasaBatAimbotV2LaggerSpeed) or 40;
	end;
	return tonumber(n) or 58, tonumber(A) or 40;
end;
function _G.MasaSetSelectedAimbotSpeedValues(g, u)
	if N == "V2" then
		if g then
			_G.MasaBatAimbotV2Speed = g;
		end;
		if u then
			_G.MasaBatAimbotV2LaggerSpeed = u;
		end;
	else
		if g then
			n = g;
		end;
		if u then
			A = u;
		end;
	end;
end;
function _G.MasaRefreshAimbotSpeedBoxes()
	local g, u = _G.MasaGetSelectedAimbotSpeedValues();
	if _G.MasaAimbotSpeedBox then
		_G.MasaAimbotSpeedBox.Text = tostring(g);
	end;
	if _G.MasaLaggerAimbotSpeedBox then
		_G.MasaLaggerAimbotSpeedBox.Text = tostring(u);
	end;
end;
_G._MasaAimbotStickyTime = _G._MasaAimbotStickyTime or 1.25;
_G._MasaAimbotStickyMaxDist = _G._MasaAimbotStickyMaxDist or 85;
_G._MasaAimbotStickyUntil = 0;
_G._MasaAimbotStickyTarget = nil;
_G._MasaAimbotLastScan = 0;
function _G.MasaGetAutoBatTarget()
	local g = e.Character and e.Character:FindFirstChild("HumanoidRootPart");
	if not g then
		return nil;
	end;
	local u = tick();
	local function B(u)
		if not u or not u.Parent then
			return false;
		end;
		local B = u.Parent:FindFirstChildOfClass("Humanoid");
		if not B or B.Health <= 0 then
			return false;
		end;
		local a = u.Position;
		if _G.MasaAntiVoid then
			a = _G.MasaAntiVoid.posForPart(u, a);
		end;
		if ((a - g.Position)).Magnitude > ((_G._MasaAimbotStickyMaxDist or 85)) then
			return false;
		end;
		return true;
	end;
	local a = _G._MasaAimbotStickyTarget;
	if a and (u < ((_G._MasaAimbotStickyUntil or 0)) and B(a)) then
		return a;
	end;
	if u - ((_G._MasaAimbotLastScan or 0)) <= .08 and (_G.MasaNormalAimbot and (_G.MasaNormalAimbot.target and B(_G.MasaNormalAimbot.target))) then
		return _G.MasaNormalAimbot.target;
	end;
	_G._MasaAimbotLastScan = u;
	local H = _G.MasaGetClosestAimbotTarget and _G.MasaGetClosestAimbotTarget() or nil;
	_G._MasaAimbotStickyTarget = H;
	_G._MasaAimbotStickyUntil = u + ((tonumber(_G._MasaAimbotStickyTime) or 1.25));
	return H;
end;
function _G.MasaLookAtPauseForAimbot()
	if _G.MasaStopLookAt then
		pcall(_G.MasaStopLookAt);
	end;
end;
function _G.MasaLookAtResumeAfterAimbot()
	if _G.MasaNormalAimbotOn == true then
		return;
	end;
	if _G.MasaBatAimbotV2On == true then
		return;
	end;
	if _G.MasaLookAtEnabled == true and _G.MasaStartLookAt then
		pcall(_G.MasaStartLookAt);
	end;
end;
function _G.MasaStartNormalAimbot(g)
	if _G.MasaAntiDieArmNow then
		pcall(_G.MasaAntiDieArmNow);
	end;
	if _G.MasaSafeModeTryStart and not _G.MasaSafeModeTryStart() then
		return false;
	end;
	if _G.MasaStopAutoTPForAction then
		_G.MasaStopAutoTPForAction();
	end;
	if not g then
		if _G.MasaStopBatAimbotV2 then
			_G.MasaStopBatAimbotV2(false);
		end;
		_G.MasaBatAimbotV2On = false;
	end;
	_G.MasaNormalAimbotOn = true;
	if _G.MasaLookAtPauseForAimbot then
		pcall(_G.MasaLookAtPauseForAimbot);
	end;
	if _G.MasaStartChaseRagdollWatcher then
		_G.MasaStartChaseRagdollWatcher();
	end;
	if _G.MasaNormalAimbot.conn then
		_G.MasaNormalAimbot.conn:Disconnect();
		_G.MasaNormalAimbot.conn = nil;
	end;
	if _G._MasaNormalAimbotCharConn then
		pcall(function()
			_G._MasaNormalAimbotCharConn:Disconnect();
		end);
		_G._MasaNormalAimbotCharConn = nil;
	end;
	local u = e.Character and e.Character:FindFirstChildOfClass("Humanoid");
	if u then
		u.AutoRotate = false;
	end;
	_G.MasaNormalAimbot.conn = a.Heartbeat:Connect(function()
			if not _G.MasaNormalAimbotOn then
				return;
			end;
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChild("HumanoidRootPart");
			if not u then
				return;
			end;
			local B = g:FindFirstChildOfClass("Humanoid");
			if not B then
				return;
			end;
			if B.Health <= 0 then
				return;
			end;
			if B.PlatformStand then
				pcall(function()
					B.PlatformStand = false;
				end);
			end;
			pcall(function()
				local g = u.AssemblyLinearVelocity;
				local B = u.AssemblyAngularVelocity;
				local a = _G.MasaAntiBatEnabled == true;
				local H = _G._MasaAntiBatSpiking == true;
				if g.Magnitude > 220 and (not a and not H) then
					u.AssemblyLinearVelocity = g.Unit * 60;
				end;
				if B.Magnitude > 25 then
					u.AssemblyAngularVelocity = Vector3.zero;
				end;
			end);
			local a = g:FindFirstChildOfClass("Tool") or _G.MasaFindAimbotBat();
			if a and a.Parent ~= g then
				pcall(function()
					B:EquipTool(a);
				end);
			end;
			local H = _G.MasaGetAutoBatTarget and _G.MasaGetAutoBatTarget() or _G.MasaGetClosestAimbotTarget();
			if not H then
				B.AutoRotate = true;
				u.AssemblyAngularVelocity = Vector3.zero;
				return;
			end;
			_G.MasaNormalAimbot.target = H;
			B.AutoRotate = false;
			local i = (_G.MasaBatAimbotV2On == true) and "V2" or "V1";
			local R = (_G._MasaAimbotChase and _G._MasaAimbotChase[i]) or "NORMAL";
			if R == "BYPASS" then
				local g = u.Position;
				local B = H.Position;
				if _G.MasaAntiVoid then
					B = _G.MasaAntiVoid.posForPart(H, B);
				end;
				local i = B - g;
				local R = Vector3.new(i.X, 0, i.Z);
				if R.Magnitude < .01 then
					return;
				end;
				R = R.Unit;
				local O = (_G.MasaBatAimbotV2On == true) and ((_G.MasaGetBatAimbotV2Speed and _G.MasaGetBatAimbotV2Speed() or _G.MasaGetNormalAimbotSpeed())) or _G.MasaGetNormalAimbotSpeed();
				local c = Vector3.new(R.X * O, u.AssemblyLinearVelocity.Y, R.Z * O);
				if _G.MasaAntiBatEnabled then
					_G._MasaAntiBatDesiredXZ = Vector3.new(R.X * O, 0, R.Z * O);
				end;
				if not _G._MasaAntiBatSpiking then
					u.AssemblyLinearVelocity = u.AssemblyLinearVelocity:Lerp(c, .8);
				end;
				if ((B - g)).Magnitude > .1 then
					local a = CFrame.lookAt(g, B);
					local H = u.CFrame:Inverse() * a;
					local i, R, O = H:ToEulerAnglesXYZ();
					u.AssemblyAngularVelocity = u.CFrame:VectorToWorldSpace(Vector3.new(math.clamp(i, -2.5, 2.5) * 42, math.clamp(R, -2.5, 2.5) * 42, math.clamp(O, -2.5, 2.5) * 42));
				end;
				if d and (a and (_G.MasaBatAimbotV2On ~= true and not _G.MasaNormalAimbot.swingCooldown)) then
					_G.MasaNormalAimbot.swingCooldown = true;
					pcall(function()
						a:Activate();
					end);
					task.delay(.08, function()
						if _G.MasaNormalAimbot then
							_G.MasaNormalAimbot.swingCooldown = false;
						end;
					end);
				end;
				return;
			end;
			local O = H.AssemblyLinearVelocity or Vector3.zero;
			local c = u.Position;
			local h = H.Position;
			if _G.MasaAntiVoid then
				local g, u = _G.MasaAntiVoid.posForPart(H, h);
				h = g;
				if u then
					O = Vector3.zero;
				end;
			end;
			local Q = (_G.MasaBatAimbotV2On == true);
			local P = h;
			if not Q then
				P = (h + O * .14) + H.CFrame.LookVector * .3;
			end;
			local m = P - c;
			if m.Magnitude < .01 then
				return;
			end;
			local Z = Vector3.new(m.X, 0, m.Z);
			if Z.Magnitude < .01 then
				return;
			end;
			Z = Z.Unit;
			local F = (_G.MasaBatAimbotV2On == true) and ((_G.MasaGetBatAimbotV2Speed and _G.MasaGetBatAimbotV2Speed() or _G.MasaGetNormalAimbotSpeed())) or _G.MasaGetNormalAimbotSpeed();
			local S = h.Y + ((Q and 0 or 3.7));
			local r = ((S - c.Y)) * 19.5;
			if not Q then
				r = r + O.Y * .8;
			end;
			if not Q and B.FloorMaterial ~= Enum.Material.Air then
				r = math.max(r, 13);
			end;
			r = math.clamp(r, -70, 110);
			local U = Vector3.new(Z.X * F, r, Z.Z * F);
			if _G.MasaAntiBatEnabled then
				_G._MasaAntiBatDesiredXZ = Vector3.new(Z.X * F, 0, Z.Z * F);
			end;
			if not _G._MasaAntiBatSpiking then
				u.AssemblyLinearVelocity = u.AssemblyLinearVelocity:Lerp(U, .8);
			end;
			local I = h;
			if not Q then
				local g = math.clamp(O.Magnitude / 150, .05, .2);
				I = h + O * g;
			end;
			local X = I - c;
			if X.Magnitude > .1 then
				local g = CFrame.lookAt(c, I);
				local B = u.CFrame:Inverse() * g;
				local a, H, i = B:ToEulerAnglesXYZ();
				u.AssemblyAngularVelocity = u.CFrame:VectorToWorldSpace(Vector3.new(math.clamp(a, -2.5, 2.5) * 42, math.clamp(H, -2.5, 2.5) * 42, math.clamp(i, -2.5, 2.5) * 42));
			end;
			if d and (a and (_G.MasaBatAimbotV2On ~= true and not _G.MasaNormalAimbot.swingCooldown)) then
				_G.MasaNormalAimbot.swingCooldown = true;
				pcall(function()
					a:Activate();
				end);
				task.delay(.08, function()
					if _G.MasaNormalAimbot then
						_G.MasaNormalAimbot.swingCooldown = false;
					end;
				end);
			end;
		end);
	_G._MasaNormalAimbotCharConn = e.CharacterAdded:Connect(function(g)
			if not _G.MasaNormalAimbotOn then
				return;
			end;
			task.wait(.25);
			local u = g:FindFirstChild("HumanoidRootPart") or g:WaitForChild("HumanoidRootPart", 3);
			local B = g:FindFirstChildOfClass("Humanoid");
			pcall(function()
				if u then
					u.AssemblyLinearVelocity = Vector3.zero;
					u.AssemblyAngularVelocity = Vector3.zero;
				end;
				if B then
					B.PlatformStand = false;
					B.AutoRotate = false;
					local g = _G.MasaFindAimbotBat and _G.MasaFindAimbotBat() or nil;
					if g then
						B:EquipTool(g);
					end;
				end;
			end);
		end);
	if _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
end;
function _G.MasaStopNormalAimbot()
	_G.MasaNormalAimbotOn = false;
	if _G.MasaStopChaseRagdollWatcher then
		_G.MasaStopChaseRagdollWatcher();
	end;
	if _G.MasaPathfind then
		pcall(_G.MasaPathfind.reset, "aimbot");
	end;
	if _G.MasaNormalAimbot and _G.MasaNormalAimbot.conn then
		_G.MasaNormalAimbot.conn:Disconnect();
		_G.MasaNormalAimbot.conn = nil;
	end;
	if _G._MasaNormalAimbotCharConn then
		pcall(function()
			_G._MasaNormalAimbotCharConn:Disconnect();
		end);
		_G._MasaNormalAimbotCharConn = nil;
	end;
	if _G.MasaNormalAimbot then
		_G.MasaNormalAimbot.target = nil;
		_G.MasaNormalAimbot.swingCooldown = false;
	end;
	_G._MasaAimbotStickyTarget = nil;
	_G._MasaAimbotStickyUntil = 0;
	local g = e.Character;
	local u = g and g:FindFirstChild("HumanoidRootPart");
	if u then
		u.AssemblyLinearVelocity = Vector3.zero;
		u.AssemblyAngularVelocity = Vector3.zero;
	end;
	local B = g and g:FindFirstChildOfClass("Humanoid");
	if B then
		B.AutoRotate = true;
	end;
	if _G.MasaLookAtResumeAfterAimbot then
		pcall(_G.MasaLookAtResumeAfterAimbot);
	end;
	if _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
end;
_G.MasaBatAimbotV2State = _G.MasaBatAimbotV2State or { conn = nil };
_G.MasaBatAimbotV2TPDistance = 4;
function _G.MasaBatAimbotV2GetClosest()
	local u = e.Character and e.Character:FindFirstChild("HumanoidRootPart");
	if not u then
		return nil, math.huge;
	end;
	local B, a = nil, math.huge;
	for g, H in ipairs(g:GetPlayers()) do
		if H ~= e and H.Character then
			local g = H.Character:FindFirstChild("HumanoidRootPart");
			local i = H.Character:FindFirstChildOfClass("Humanoid");
			if g and (i and i.Health > 0) then
				local i = g.Position;
				if _G.MasaAntiVoid then
					i = _G.MasaAntiVoid.posFor(H, i);
				end;
				local R = ((i - u.Position)).Magnitude;
				if R < a then
					a = R;
					B = g;
				end;
			end;
		end;
	end;
	return B, a;
end;
function _G.MasaBatAimbotV2StartChase()
	if _G.MasaStartNormalAimbot then
		_G.MasaStartNormalAimbot(true);
	end;
end;
function _G.MasaStartBatAimbotV2()
	if _G.MasaAntiDieArmNow then
		pcall(_G.MasaAntiDieArmNow);
	end;
	if _G.MasaSafeModeTryStart and not _G.MasaSafeModeTryStart() then
		return false;
	end;
	if _G.MasaStopAutoTPForAction then
		_G.MasaStopAutoTPForAction();
	end;
	_G.MasaBatAimbotV2On = true;
	if _G.MasaLookAtPauseForAimbot then
		pcall(_G.MasaLookAtPauseForAimbot);
	end;
	N = "V2";
	_G.MasaBatAimbotV2StartChase();
	if _G.MasaBatAimbotV2State.conn then
		_G.MasaBatAimbotV2State.conn:Disconnect();
		_G.MasaBatAimbotV2State.conn = nil;
	end;
	_G.MasaBatAimbotV2State.conn = a.Heartbeat:Connect(function()
			if not _G.MasaBatAimbotV2On then
				return;
			end;
			if _G.MasaTPBatOn then
				return;
			end;
			local g, u = _G.MasaBatAimbotV2GetClosest();
			local B = tonumber(_G.MasaBatAimbotV2TPDistance) or 4;
			if g and u <= B then
				_G.MasaTPBatSilent = true;
				_G._MasaV2SwingGate = tick() + .05;
				if _G.MasaStartTPBat then
					_G.MasaStartTPBat();
				end;
			elseif not _G.MasaNormalAimbotOn then
				local g = tick();
				if g - ((_G.MasaBatAimbotV2State.lastChase or 0)) >= .15 then
					_G.MasaBatAimbotV2State.lastChase = g;
					_G.MasaBatAimbotV2StartChase();
				end;
			end;
		end);
	if _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
end;
function _G.MasaStopBatAimbotV2(g)
	_G.MasaBatAimbotV2On = false;
	if _G.MasaStopChaseRagdollWatcher then
		_G.MasaStopChaseRagdollWatcher();
	end;
	if _G.MasaBatAimbotV2State and _G.MasaBatAimbotV2State.conn then
		_G.MasaBatAimbotV2State.conn:Disconnect();
		_G.MasaBatAimbotV2State.conn = nil;
	end;
	if _G.MasaNormalAimbotOn and _G.MasaStopNormalAimbot then
		_G.MasaStopNormalAimbot();
	end;
	if _G.MasaTPBatOn and _G.MasaStopTPBat then
		_G.MasaStopTPBat();
	end;
	local u = e.Character;
	local B = u and u:FindFirstChild("HumanoidRootPart");
	if B then
		B.AssemblyLinearVelocity = Vector3.zero;
		B.AssemblyAngularVelocity = Vector3.zero;
	end;
	local a = u and u:FindFirstChildOfClass("Humanoid");
	if a then
		a.AutoRotate = true;
		a.PlatformStand = false;
		pcall(function()
			a:ChangeState(Enum.HumanoidStateType.GettingUp);
		end);
	end;
	if _G.MasaLookAtResumeAfterAimbot then
		pcall(_G.MasaLookAtResumeAfterAimbot);
	end;
	if g ~= false and _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
end;
function _G.MasaToggleSelectedAimbot()
	if N == "V2" then
		if _G.MasaBatAimbotV2On then
			if _G.MasaStopBatAimbotV2 then
				_G.MasaStopBatAimbotV2();
			else
				_G.MasaBatAimbotV2On = false;
			end;
		else
			if _G.MasaStopNormalAimbot then
				_G.MasaStopNormalAimbot();
			end;
			if _G.MasaStartBatAimbotV2 then
				_G.MasaStartBatAimbotV2();
			else
				_G.MasaBatAimbotV2On = true;
			end;
		end;
	else
		if _G.MasaNormalAimbotOn then
			_G.MasaStopNormalAimbot();
		else
			if _G.MasaStopBatAimbotV2 then
				_G.MasaStopBatAimbotV2(false);
			else
				_G.MasaBatAimbotV2On = false;
			end;
			_G.MasaStartNormalAimbot();
		end;
	end;
	if _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	saveMasaConfig();
end;
function _G.MasaRefreshAimbotVisual()
	if _G.MasaAimbotSetVisual then
		if N == "V2" then
			_G.MasaAimbotSetVisual(_G.MasaBatAimbotV2On == true);
		else
			_G.MasaAimbotSetVisual(_G.MasaNormalAimbotOn == true);
		end;
	end;
end;
_G.MasaNormalAimbotStart = _G.MasaStartNormalAimbot;
_G.MasaNormalAimbotStop = _G.MasaStopNormalAimbot;
_G.MasaBatAimbotV2Start = _G.MasaStartBatAimbotV2;
_G.MasaBatAimbotV2Stop = _G.MasaStopBatAimbotV2;
do
	local u = 3;
	local B = -7;
	local H = {};
	local i = 0;
	local function R()
		return (_G.MasaNormalAimbotOn == true) or (_G.MasaBatAimbotV2On == true) or (_G.MasaTPBatOn == true);
	end;
	local function O()
		local g = e.Character;
		local u = g and g:FindFirstChild("HumanoidRootPart");
		local a = g and g:FindFirstChildOfClass("Humanoid");
		if not u or not a or a.Health <= 0 then
			return;
		end;
		local H = tick();
		if H - i < .08 then
			return;
		end;
		i = H;
		local R, O = u.CFrame:ToEulerAnglesYXZ();
		u.CFrame = CFrame.new(u.Position.X, B, u.Position.Z) * CFrame.Angles(0, O, 0);
		u.Velocity = Vector3.zero;
		pcall(function()
			u.AssemblyLinearVelocity = Vector3.zero;
		end);
	end;
	a.Heartbeat:Connect(function()
		if not C or not R() then
			table.clear(H);
			return;
		end;
		for g, B in ipairs(g:GetPlayers()) do
			if B ~= e and B.Character then
				local g = B.Character:FindFirstChild("HumanoidRootPart");
				if g then
					local a = g.Position.Y;
					local i = H[B.UserId];
					if i and i - a >= u then
						pcall(O);
						table.clear(H);
						if type(showActionNotification) == "function" then
							pcall(function()
								showActionNotification("MIRROR TP!");
							end);
						end;
						return;
					end;
					H[B.UserId] = a;
				end;
			end;
		end;
	end);
	function _G.MasaSetMirrorTPDown(g)
		C = g == true;
		if not C then
			table.clear(H);
		end;
		if _G.MasaMirrorTPDownSetVisual then
			_G.MasaMirrorTPDownSetVisual(C);
		end;
	end;
end;
local bj = false;
do
	local u = nil;
	local B = nil;
	local H = nil;
	local i = 0;
	local R = .08;
	local O = {};
	local c = _G._MasaTPBatCameraLockPending == true;
	_G._MasaTPBatCameraLockPending = nil;
	_G._MasaGetTPBatCameraLock = function()
			return c;
		end;
	_G._MasaSetTPBatCameraLock = function(g)
			c = g;
		end;
	local function h()
		if _G.MasaNoCollisionAcquire then
			_G.MasaNoCollisionAcquire("tpbat");
		end;
	end;
	local function Q()
		if _G.MasaNoCollisionRelease then
			_G.MasaNoCollisionRelease("tpbat");
		end;
	end;
	local P = false;
	local function m()
		local g = e.Character;
		if not g then
			return nil;
		end;
		for g, u in ipairs(g:GetChildren()) do
			if u:IsA("Tool") then
				local g = u.Name:lower();
				if g:find("bat", 1, true) or g:find("slap", 1, true) then
					return u;
				end;
			end;
		end;
		local u = e:FindFirstChildOfClass("Backpack");
		if u then
			for u, B in ipairs(u:GetChildren()) do
				if B:IsA("Tool") then
					local u = B.Name:lower();
					if u:find("bat", 1, true) or u:find("slap", 1, true) then
						local u = g:FindFirstChildOfClass("Humanoid");
						if u then
							pcall(function()
								u:EquipTool(B);
							end);
						end;
						return B;
					end;
				end;
			end;
		end;
		return nil;
	end;
	local function Z(u)
		if not u then
			return nil, math.huge;
		end;
		local B, a = nil, math.huge;
		for g, H in ipairs(g:GetPlayers()) do
			if H ~= e and H.Character then
				local g = H.Character:FindFirstChild("HumanoidRootPart");
				local i = H.Character:FindFirstChildOfClass("Humanoid");
				if g and (i and i.Health > 0) then
					local i = g.Position;
					if _G.MasaAntiVoid then
						i = _G.MasaAntiVoid.posForPart(g, g.Position);
					end;
					local R = ((i - u.Position)).Magnitude;
					if R < a then
						a = R;
						B = H;
					end;
				end;
			end;
		end;
		return B, a;
	end;
	local function F()
		if P then
			return;
		end;
		P = true;
		pcall(function()
			local g = m();
			if not g then
				return;
			end;
			g:Activate();
			local u = g:FindFirstChildWhichIsA("RemoteEvent");
			if u then
				u:FireServer();
			end;
		end);
		task.delay(.08, function()
			P = false;
		end);
	end;
	local function S()
		if not bj then
			return;
		end;
		if _G.MasaBatAimbotV2On then
			if _G.MasaStopBatAimbotV2 then
				_G.MasaStopBatAimbotV2();
				return;
			end;
		end;
		_G.MasaStopTPBat();
	end;
	local function r(g)
		local u = g.DescendantAdded:Connect(function(g)
				if g:IsA("BallSocketConstraint") then
					S();
				end;
			end);
		return u;
	end;
	local function U(g)
		if g == e then
			return;
		end;
		if O[g] then
			pcall(function()
				O[g]:Disconnect();
			end);
		end;
		O[g] = g.CharacterAdded:Connect(function(g)
				if g then
					local u = r(g);
					g.AncestryChanged:Connect(function(g, B)
						if not B then
							pcall(function()
								u:Disconnect();
							end);
						end;
					end);
				end;
			end);
		if g.Character then
			local u = r(g.Character);
			g.Character.AncestryChanged:Connect(function(g, B)
				if not B then
					pcall(function()
						u:Disconnect();
					end);
				end;
			end);
		end;
	end;
	local I = {
			velHist = setmetatable({}, { __mode = "k" }),
			orbitAngle = 0,
			spinAngle = 0,
			orbitRadius = 4.2,
			orbitSpeed = 80,
			spinSpeed = 48,
			teleports = 300,
			v5Teleports = 300,
			v5SpinSpeed = 60,
			v5RadiusMin = 1.5,
			v5RadiusMax = 3,
		};
	_G._MasaTPB = I;
	local function X(g)
		local u = os.clock();
		local B = g.Position;
		local a = g.AssemblyLinearVelocity or Vector3.zero;
		local H = I.velHist[g];
		if H then
			local g = u - H.t;
			if g > .004 and g < .5 then
				local u = ((B - H.p)) / g;
				if u.Magnitude < 180 then
					local B = math.clamp(g * 12, .2, .85);
					a = ((H.v or a)):Lerp(u, B);
				end;
			end;
		end;
		I.velHist[g] = { t = u, p = B, v = a };
		return a;
	end;
	local function w(g, u, B)
		if ((u - B)).Magnitude > .001 then
			g.CFrame = CFrame.new(u, B);
		else
			g.CFrame = CFrame.new(u);
		end;
		g.AssemblyLinearVelocity = Vector3.zero;
		g.AssemblyAngularVelocity = Vector3.zero;
	end;
	local function k()
		if not bj then
			return;
		end;
		local u = e.Character;
		if not u then
			return;
		end;
		local B = u:FindFirstChild("HumanoidRootPart");
		local a = u:FindFirstChildOfClass("Humanoid");
		if not B or not a then
			return;
		end;
		if a.Health <= 0 then
			return;
		end;
		local H = _G.MasaTPBatVersion or 1;
		if H == 2 or H == 3 then
			local i = { [2] = {
						range = 250,
						offset = Vector3.new(0, 0, 0),
						delay = .08,
						predict = true,
						prediction = .15,
						rotate = true,
						reset = true,
						antiFling = true,
						side = 2.5,
					}, [3] = {
						range = 250,
						offset = Vector3.new(0, 3, 0),
						delay = .08,
						predict = false,
						prediction = 0,
						rotate = false,
						reset = true,
						antiFling = false,
						side = 0,
					} };
			local R = i[H];
			local O, h = nil, R.range;
			for g, u in ipairs(g:GetPlayers()) do
				if u ~= e and u.Character then
					local g = u.Character:FindFirstChild("HumanoidRootPart");
					local a = u.Character:FindFirstChildOfClass("Humanoid");
					if g and (a and a.Health > 0) then
						local u = ((g.Position - B.Position)).Magnitude;
						if u < h then
							h = u;
							O = g;
						end;
					end;
				end;
			end;
			if not O then
				return;
			end;
			local Q = O.Position + ((R.predict and O.AssemblyLinearVelocity * R.prediction or Vector3.zero));
			local P;
			if R.side > 0 then
				local g = B.Position - Q;
				g = Vector3.new(g.X, 0, g.Z);
				if g.Magnitude < .1 then
					g = Vector3.new(1, 0, 0);
				else
					g = g.Unit;
				end;
				P = Q + g * R.side;
			else
				P = Q + R.offset;
			end;
			B.CFrame = R.rotate and CFrame.new(P, Q) or CFrame.new(P);
			if R.reset then
				B.AssemblyLinearVelocity = Vector3.zero;
				B.AssemblyAngularVelocity = Vector3.zero;
			end;
			if R.antiFling then
				a.PlatformStand = false;
				a.Sit = false;
			end;
			if c then
				local g = workspace.CurrentCamera;
				if g then
					g.CFrame = CFrame.new(g.CFrame.Position, Q);
				end;
			end;
			if j then
				F();
			end;
			pcall(function()
				for g, u in ipairs(u:GetDescendants()) do
					if u:IsA("BasePart") then
						u.CanCollide = false;
					end;
				end;
			end);
			return;
		end;
		local i = a:FindFirstChildOfClass("Animator");
		if i then
			pcall(function()
				for g, u in ipairs(i:GetPlayingAnimationTracks()) do
					u:Stop();
				end;
			end);
		end;
		local R = m();
		if R and R.Parent ~= u then
			pcall(function()
				a:EquipTool(R);
			end);
		end;
		local O, h = Z(B);
		if not O then
			return;
		end;
		local Q = O.Character and O.Character:FindFirstChild("HumanoidRootPart");
		if not Q then
			return;
		end;
		local P, S = Q.Position, false;
		if _G.MasaAntiVoid then
			P, S = _G.MasaAntiVoid.posForPart(Q, Q.Position);
		end;
		if h > 100 then
			return;
		end;
		pcall(function()
			if B.SetNetworkOwner then
				B:SetNetworkOwner(nil);
			end;
		end);
		if not bj or B.Parent ~= u or not Q.Parent then
			return;
		end;
		B.CFrame = CFrame.new(P + Vector3.new(0, .9, 0));
		if not S then
			B.AssemblyLinearVelocity = Q.AssemblyLinearVelocity;
		else
			B.AssemblyLinearVelocity = Vector3.zero;
		end;
		pcall(function()
			if B.SetNetworkOwner then
				B:SetNetworkOwner(e);
			end;
		end);
		if c then
			local g = workspace.CurrentCamera;
			if g then
				g.CFrame = CFrame.new(g.CFrame.Position, P);
			end;
		end;
		if j then
			F();
		end;
		pcall(function()
			for g, u in ipairs(u:GetDescendants()) do
				if u:IsA("BasePart") then
					u.CanCollide = false;
				end;
			end;
		end);
	end;
	function _G.MasaSetTPBatVersion(g)
		g = math.clamp(tonumber(g) or 1, 1, 3);
		_G.MasaTPBatVersion = g;
		I.orbitAngle = 0;
		I.spinAngle = 0;
		table.clear(I.velHist);
		if _G._MasaTPBatSetVersionVisual then
			_G._MasaTPBatSetVersionVisual(g);
		end;
		if saveMasaConfig then
			saveMasaConfig();
		end;
		return g;
	end;
	function _G.MasaStartTPBat()
		if _G.MasaAntiDieArmNow then
			pcall(_G.MasaAntiDieArmNow);
		end;
		if bj then
			return;
		end;
		if _G.MasaSafeModeTryStart and not _G.MasaSafeModeTryStart() then
			return false;
		end;
		if _G.MasaStopNormalAimbot then
			_G.MasaStopNormalAimbot();
		end;
		if not _G.MasaBatAimbotV2On then
			if _G.MasaStopBatAimbotV2 then
				_G.MasaStopBatAimbotV2(false);
			end;
		end;
		bj = true;
		_G.MasaTPBatOn = true;
		h();
		if u then
			u:Disconnect();
		end;
		I.orbitAngle = 0;
		I.spinAngle = 0;
		table.clear(I.velHist);
		u = a.Heartbeat:Connect(k);
		if B then
			B:Disconnect();
		end;
		B = g.PlayerAdded:Connect(U);
		for g, u in ipairs(g:GetPlayers()) do
			U(u);
		end;
		if H then
			H:Disconnect();
		end;
		H = g.PlayerRemoving:Connect(function(g)
				if O[g] then
					pcall(function()
						O[g]:Disconnect();
					end);
					O[g] = nil;
				end;
			end);
		if _G.MasaTPBatSetVisual then
			_G.MasaTPBatSetVisual(true);
		end;
		if _G.MasaRefreshMobileButtonStates then
			_G.MasaRefreshMobileButtonStates();
		end;
		saveMasaConfig();
		return true;
	end;
	function _G.MasaStopTPBat()
		bj = false;
		_G.MasaTPBatOn = false;
		if not ((_G.MasaBatAimbotV2On == true)) and not ((_G.MasaCounterState and _G.MasaCounterState.batDebounce == true)) then
			_G.MasaTPBatSilent = false;
		end;
		if u then
			u:Disconnect();
			u = nil;
		end;
		if B then
			B:Disconnect();
			B = nil;
		end;
		if H then
			H:Disconnect();
			H = nil;
		end;
		for g, u in pairs(O) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		table.clear(O);
		I.orbitAngle = 0;
		I.spinAngle = 0;
		table.clear(I.velHist);
		local g = e.Character;
		local a = g and g:FindFirstChild("HumanoidRootPart");
		if a then
			pcall(function()
				if a.SetNetworkOwner then
					a:SetNetworkOwner(e);
				end;
			end);
		end;
		if _G.MasaTPBatSetVisual then
			_G.MasaTPBatSetVisual(false);
		end;
		if _G.MasaRefreshMobileButtonStates then
			_G.MasaRefreshMobileButtonStates();
		end;
		saveMasaConfig();
		task.delay(.5, function()
			Q();
		end);
	end;
	function _G.MasaToggleTPBat()
		_G.MasaTPBatSilent = false;
		if bj then
			_G.MasaStopTPBat();
		else
			_G.MasaStartTPBat();
		end;
	end;
end;
_G.MasaTPBatOn = false;
do
	local u = false;
	local B = {};
	local a = nil;
	local H = nil;
	local function i()
		if not u then
			return;
		end;
		if _G.MasaTPBatOn then
			return;
		end;
		if _G.MasaBatAimbotV2On then
			if _G.MasaStopBatAimbotV2 then
				_G.MasaStopBatAimbotV2();
			end;
		elseif _G.MasaNormalAimbotOn then
			if _G.MasaStopNormalAimbot then
				_G.MasaStopNormalAimbot();
			end;
		end;
	end;
	local function R(g)
		local u = g.DescendantAdded:Connect(function(g)
				if g:IsA("BallSocketConstraint") then
					i();
				end;
			end);
		return u;
	end;
	local function O(g)
		if g == e then
			return;
		end;
		if B[g] then
			pcall(function()
				B[g]:Disconnect();
			end);
		end;
		B[g] = g.CharacterAdded:Connect(function(g)
				if g and u then
					local u = R(g);
					g.AncestryChanged:Connect(function(g, B)
						if not B then
							pcall(function()
								u:Disconnect();
							end);
						end;
					end);
				end;
			end);
		if g.Character then
			local u = R(g.Character);
			g.Character.AncestryChanged:Connect(function(g, B)
				if not B then
					pcall(function()
						u:Disconnect();
					end);
				end;
			end);
		end;
	end;
	function _G.MasaStartChaseRagdollWatcher()
		if u then
			return;
		end;
		u = true;
		if a then
			a:Disconnect();
		end;
		a = g.PlayerAdded:Connect(O);
		for g, u in ipairs(g:GetPlayers()) do
			O(u);
		end;
		if H then
			H:Disconnect();
		end;
		H = g.PlayerRemoving:Connect(function(g)
				if B[g] then
					pcall(function()
						B[g]:Disconnect();
					end);
					B[g] = nil;
				end;
			end);
	end;
	function _G.MasaStopChaseRagdollWatcher()
		u = false;
		if a then
			a:Disconnect();
			a = nil;
		end;
		if H then
			H:Disconnect();
			H = nil;
		end;
		for g, u in pairs(B) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		table.clear(B);
	end;
end;
function _G.MasaToggleTPBatManual()
	_G.MasaTPBatSilent = false;
	if _G.MasaBatAimbotV2On then
		if _G.MasaStopBatAimbotV2 then
			_G.MasaStopBatAimbotV2();
		end;
		if _G.MasaStartTPBat then
			_G.MasaStartTPBat();
		end;
		return;
	end;
	if _G.MasaToggleTPBat then
		_G.MasaToggleTPBat();
	elseif _G.MasaStartTPBat and _G.MasaStopTPBat then
		if _G.MasaTPBatOn then
			_G.MasaStopTPBat();
		else
			_G.MasaStartTPBat();
		end;
	end;
end;
_G.__MasaSetupNormalAutoSteal = function()
		_G.MasaNormalSteal = _G.MasaNormalSteal or {
				enabled = false,
				radius = 62,
				duration = 1.3,
				animals = {},
				promptCache = {},
				internalCache = {},
				scannerStarted = false,
				scanning = false,
				isStealing = false,
				stealConn = nil,
				refreshThread = nil,
				lastSteal = 0,
				cooldown = .08,
			};
		if _G.MasaNormalSteal.stealConn then
			pcall(function()
				_G.MasaNormalSteal.stealConn:Disconnect();
			end);
			_G.MasaNormalSteal.stealConn = nil;
		end;
		_G.MasaNormalSteal.enabled = false;
		_G.MasaNormalSteal.isStealing = false;
		local function g(g)
			g = math.clamp(tonumber(g) or 0, 0, 1);
			pcall(function()
				if _G.StealBar then
					_G.StealBar.SetState("STEALING");
					_G.StealBar.SetProgress(g);
				end;
			end);
		end;
		local function u()
			pcall(function()
				if _G.StealBar then
					_G.StealBar.Reset();
				end;
			end);
		end;
		local function B()
			local g = e.Character;
			if not g then
				return nil;
			end;
			return g:FindFirstChild("HumanoidRootPart") or g:FindFirstChild("UpperTorso");
		end;
		local function H(g)
			local u = workspace:FindFirstChild("Plots");
			local B = u and u:FindFirstChild(g);
			if not B then
				return false;
			end;
			local a = B:FindFirstChild("PlotSign");
			local H = a and a:FindFirstChild("YourBase");
			return H and (H:IsA("BillboardGui") and H.Enabled == true);
		end;
		local function i()
			local g = _G.MasaNormalSteal;
			g.animals = {};
			local u = workspace:FindFirstChild("Plots");
			if not u then
				return;
			end;
			for u, B in ipairs(u:GetChildren()) do
				if B:IsA("Model") and not H(B.Name) then
					local u = B:FindFirstChild("AnimalPodiums");
					if u then
						for u, a in ipairs(u:GetChildren()) do
							if a:IsA("Model") then
								local u = a:FindFirstChild("Base");
								local H = u and u:FindFirstChild("Spawn");
								if H then
									table.insert(g.animals, {
										plot = B.Name,
										slot = a.Name,
										worldPosition = H.Position,
										uid = B.Name .. ("_" .. a.Name),
									});
								end;
							end;
						end;
					end;
				end;
			end;
		end;
		local function R()
			local g = _G.MasaNormalSteal;
			if g.scannerStarted then
				return;
			end;
			g.scannerStarted = true;
			task.spawn(function()
				task.wait(1);
				while _G.MasaNormalSteal do
					if _G.MasaNormalSteal.enabled then
						pcall(i);
					end;
					task.wait(3);
				end;
			end);
		end;
		local function O(g)
			if not g then
				return nil;
			end;
			local u = _G.MasaNormalSteal;
			local B = u.promptCache[g.uid];
			if B and B.Parent then
				return B;
			end;
			local a = workspace:FindFirstChild("Plots");
			local H = a and a:FindFirstChild(g.plot);
			local i = H and H:FindFirstChild("AnimalPodiums");
			local R = i and i:FindFirstChild(g.slot);
			local O = R and R:FindFirstChild("Base");
			local c = O and O:FindFirstChild("Spawn");
			local h = c and c:FindFirstChild("PromptAttachment");
			if not h then
				return nil;
			end;
			for B, a in ipairs(h:GetChildren()) do
				if a:IsA("ProximityPrompt") then
					u.promptCache[g.uid] = a;
					return a;
				end;
			end;
			return nil;
		end;
		local function c(g)
			local u = _G.MasaNormalSteal;
			if u.internalCache[g] then
				return;
			end;
			local B = { hold = {}, trigger = {}, ready = true };
			pcall(function()
				if getconnections then
					for g, u in ipairs(getconnections(g.PromptButtonHoldBegan)) do
						if type(u.Function) == "function" then
							table.insert(B.hold, u.Function);
						end;
					end;
					for g, u in ipairs(getconnections(g.Triggered)) do
						if type(u.Function) == "function" then
							table.insert(B.trigger, u.Function);
						end;
					end;
				end;
			end);
			if #B.hold > 0 or #B.trigger > 0 then
				u.internalCache[g] = B;
			end;
		end;
		local function h(g)
			local u = _G.MasaNormalSteal;
			local a = B();
			if not a or not g.Parent or not g.Parent.Parent then
				return false;
			end;
			return ((a.Position - g.Parent.Parent.Position)).Magnitude <= ((tonumber(u.radius) or 62));
		end;
		local function Q(B)
			local a = _G.MasaNormalSteal;
			if not B or not B.Parent or a.isStealing then
				return;
			end;
			if tick() - ((a.lastSteal or 0)) < ((a.cooldown or .08)) then
				return;
			end;
			c(B);
			local H = a.internalCache[B];
			if not H or not H.ready then
				return;
			end;
			H.ready = false;
			a.isStealing = true;
			a.lastSteal = tick();
			pcall(function()
				if _G.StealBar then
					_G.StealBar.SetState("STEALING");
				end;
			end);
			task.spawn(function()
				if #H.hold > 0 then
					for g, u in ipairs(H.hold) do
						task.spawn(function()
							pcall(u);
						end);
					end;
				end;
				local i = tick();
				local R = 1.3;
				a.duration = R;
				local O = math.max(R - .05, .05);
				local c = false;
				while a.enabled and (w == "Normal" and tick() - i < R) do
					if not h(B) then
						c = true;
						break;
					end;
					g(((tick() - i)) / O);
					task.wait(.02);
				end;
				if c or not a.enabled or w ~= "Normal" then
					H.ready = true;
					a.isStealing = false;
					u();
					return;
				end;
				g(1);
				if #H.trigger > 0 then
					for g, u in ipairs(H.trigger) do
						task.spawn(function()
							pcall(u);
						end);
					end;
				end;
				pcall(function()
					if _G.AutoCarrySpeed and _G.AutoCarrySpeed.WatchPickup then
						_G.AutoCarrySpeed.WatchPickup(1.25);
					end;
				end);
				H.ready = true;
				a.isStealing = false;
				u();
			end);
		end;
		local function P()
			local g = _G.MasaNormalSteal;
			local u = B();
			if not u then
				return nil;
			end;
			local a = tonumber(g.radius) or 62;
			if _G.MasaStealAnimals then
				local g = _G.MasaStealAnimals();
				if type(g) == "table" and #g > 0 then
					local B, H = nil, math.huge;
					for g, i in ipairs(g) do
						local R = _G.MasaStealIsMyBase and _G.MasaStealIsMyBase(i);
						local O = (not _G.MasaStealSlotOccupied) or _G.MasaStealSlotOccupied(i);
						if not R and O then
							local g = _G.MasaStealAnimalPos and _G.MasaStealAnimalPos(i);
							if g then
								local R = ((u.Position - g)).Magnitude;
								if R <= a and R < H then
									B, H = i, R;
								end;
							end;
						end;
					end;
					return B;
				end;
			end;
			local i, R = nil, math.huge;
			for g, B in ipairs(g.animals) do
				if not H(B.plot) then
					local g = workspace:FindFirstChild("Plots");
					local H = g and g:FindFirstChild(B.plot);
					local O = H and H:FindFirstChild("AnimalPodiums");
					local c = O and O:FindFirstChild(B.slot);
					if c then
						local g = ((u.Position - (c:GetPivot()).Position)).Magnitude;
						if g <= a and g < R then
							i, R = B, g;
						end;
					end;
				end;
			end;
			return i;
		end;
		_G.MasaNormalAutoStealSetRadius = function(g)
				_G.MasaNormalSteal.radius = tonumber(g) or _G.MasaNormalSteal.radius or 62;
			end;
		_G.MasaNormalAutoStealStop = function()
				local g = _G.MasaNormalSteal;
				g.enabled = false;
				g.isStealing = false;
				if g.stealConn then
					g.stealConn:Disconnect();
					g.stealConn = nil;
				end;
				u();
			end;
		_G.MasaNormalAutoStealStart = function()
				local g = _G.MasaNormalSteal;
				g.radius = tonumber(t) or g.radius or 62;
				g.duration = 1.3;
				g.enabled = true;
				R();
				pcall(i);
				if _G.MasaStealEnsureScan then
					pcall(_G.MasaStealEnsureScan);
				end;
				if g.stealConn then
					g.stealConn:Disconnect();
					g.stealConn = nil;
				end;
				g.stealConn = a.Heartbeat:Connect(function()
						if not g.enabled then
							return;
						end;
						if w ~= "Normal" then
							_G.MasaNormalAutoStealStop();
							return;
						end;
						if g.isStealing then
							return;
						end;
						local u = P();
						if not u then
							return;
						end;
						local B = O(u);
						if B then
							Q(B);
						end;
					end);
			end;
		_G.MasaNormalAutoStealSync = function()
				if w == "Normal" and X then
					_G.MasaNormalAutoStealStart();
				else
					_G.MasaNormalAutoStealStop();
				end;
			end;
	end;
_G.__MasaSetupNormalAutoSteal();
_G.__MasaSetupSemiAutoSteal = function()
		_G.MasaSemiSteal = _G.MasaSemiSteal or {};
		local g = _G.MasaSemiSteal;
		if g.conn then
			pcall(function()
				g.conn:Disconnect();
			end);
			g.conn = nil;
		end;
		g.enabled = false;
		g.cooldown = g.cooldown or .05;
		g.primeRange = g.primeRange or 80;
		g.radius = tonumber(t) or g.radius or 60;
		local u = _G._MasaSemiStealPending;
		g.autoGrabStopTime = (u and u.autoGrabStopTime) or g.autoGrabStopTime or 1.29;
		g.autoGrabStopPercent = (u and u.autoGrabStopPercent) or g.autoGrabStopPercent or 75;
		g.autoGrabSetDelayRadius = (u and u.autoGrabSetDelayRadius) or g.autoGrabSetDelayRadius or 8;
		g.autoGrabStopEnabled = true;
		_G._MasaSemiStealPending = nil;
		g.conn = g.conn;
		g.scanThread = g.scanThread;
		g.plotSync = g.plotSync or { caches = {}, connections = {} };
		g.animals = g.animals or {};
		g.promptCache = g.promptCache or {};
		g.internalCache = g.internalCache or {};
		g.state = g.state or {
				active = false,
				startTime = 0,
				phase = "idle",
				label = "",
				lastResult = "",
				lastResultTime = 0,
			};
		local function B(g, u)
			pcall(function()
				if _G.StealBar then
					_G.StealBar.SetState(u or "STEALING");
					_G.StealBar.SetProgress(math.clamp(tonumber(g) or 0, 0, 1));
				end;
			end);
		end;
		local function H()
			pcall(function()
				if _G.StealBar then
					_G.StealBar.Reset();
				end;
			end);
		end;
		local function i()
			local g = e.Character;
			return g and ((g:FindFirstChild("HumanoidRootPart") or g:FindFirstChild("UpperTorso"))) or nil;
		end;
		local function R(g)
			if typeof(g) == "table" then
				return g;
			end;
			local u = {};
			for g in string.gmatch(tostring(g), "[^%.]+") do
				table.insert(u, tonumber(g) or g);
			end;
			return u;
		end;
		local function O(g, u)
			local B, a, H = u, nil, nil;
			for g, u in ipairs(R(g)) do
				a = B;
				H = u;
				B = B and B[u] or nil;
			end;
			return B, a, H;
		end;
		local function c(u, B)
			local a = g.plotSync.caches[u];
			if typeof(a) ~= "table" then
				return;
			end;
			local H, i, R, c = B[1], B[2], B[3], B[4];
			local h, Q, e = O(H, a);
			if i == "Changed" then
				if Q ~= nil then
					Q[e] = R;
				end;
			elseif i == "ArrayInsert" then
				if h ~= nil then
					table.insert(h, c, R);
				end;
			elseif i == "ArrayRemoved" then
				if h ~= nil then
					table.remove(h, c);
				end;
			elseif i == "DictionaryInsert" then
				if h ~= nil then
					h[c] = R;
				end;
			elseif i == "DictionaryRemoved" then
				if h ~= nil then
					h[c] = nil;
				end;
			end;
		end;
		local function h(u, B, a)
			if g.plotSync.connections[u] then
				return;
			end;
			local H = tostring(u.Name);
			if not B:FindFirstChild(H) then
				return;
			end;
			if a and g.plotSync.caches[H] == nil then
				local u, B = pcall(function()
						return a:InvokeServer(H);
					end);
				g.plotSync.caches[H] = ((u and typeof(B) == "table")) and B or {};
			elseif g.plotSync.caches[H] == nil then
				g.plotSync.caches[H] = {};
			end;
			g.plotSync.connections[u] = u.OnClientEvent:Connect(function(g)
					for g, u in ipairs(g) do
						c(H, u);
					end;
				end);
		end;
		local function Q()
			if g.syncReady then
				return true;
			end;
			local u = pcall(function()
					local u = game:GetService("ReplicatedStorage");
					g.packages = u:WaitForChild("Packages", 10);
					g.datas = u:WaitForChild("Datas", 10);
					g.plots = workspace:WaitForChild("Plots", 10);
					if not ((g.packages and (g.datas and g.plots))) then
						return;
					end;
					g.animalsData = require(g.datas:WaitForChild("Animals", 10));
					local B = g.packages:WaitForChild("Synchronizer", 10);
					g.channelFolder = B:WaitForChild("Channel", 10);
					g.routeRemote = B:WaitForChild("CommunicationRoute", 10);
					g.requestData = B:FindFirstChild("RequestData");
					for u, B in ipairs(g.channelFolder:GetChildren()) do
						if B:IsA("RemoteEvent") then
							h(B, g.plots, g.requestData);
						end;
					end;
					g.channelFolder.ChildAdded:Connect(function(u)
						if u:IsA("RemoteEvent") then
							h(u, g.plots, g.requestData);
						end;
					end);
					g.routeRemote.OnClientEvent:Connect(function(u)
						for u, B in ipairs(u) do
							local a, H = B[1], tostring(B[2]);
							if g.plots and g.plots:FindFirstChild(H) then
								if a == "ListenerAdded" then
									local u = g.channelFolder and g.channelFolder:FindFirstChild(H);
									if u and u:IsA("RemoteEvent") then
										h(u, g.plots, g.requestData);
									end;
								elseif a == "ListenerRemoved" then
									for u, B in pairs(g.plotSync.connections) do
										if tostring(u.Name) == H then
											pcall(function()
												B:Disconnect();
											end);
											g.plotSync.connections[u] = nil;
											g.plotSync.caches[H] = nil;
											break;
										end;
									end;
								end;
							end;
						end;
					end);
					g.syncReady = true;
				end);
			return u and g.syncReady == true;
		end;
		local function P(g)
			local u = g and g:FindFirstChild("PlotSign");
			local B = u and (u:FindFirstChild("SurfaceGui") and u.SurfaceGui:FindFirstChild("Frame"));
			local a = B and B:FindFirstChild("TextLabel");
			if not a or a.Text == "Empty Base" then
				return nil;
			end;
			return (a.Text:gsub("\'s [Bb]ase$", "")):gsub("%s+$", "");
		end;
		local function m(u)
			if not u or not u.plot or not g.plots then
				return false;
			end;
			local B = g.plots:FindFirstChild(u.plot);
			if not B then
				return false;
			end;
			local a = P(B);
			return a == e.DisplayName or a == e.Name;
		end;
		local function Z(u)
			local B = g.plots and g.plots:FindFirstChild(u.plot);
			local a = B and B:FindFirstChild("AnimalPodiums");
			return a and a:FindFirstChild(u.slot) or nil;
		end;
		local function F(g)
			local u = Z(g);
			return u and (u:GetPivot()).Position or nil;
		end;
		local function S(g)
			local u = i();
			local B = F(g);
			return u and (B and ((u.Position - B)).Magnitude) or math.huge;
		end;
		local function r(u)
			if not u then
				return nil;
			end;
			local B = g.promptCache[u.uid];
			if B and B.Parent then
				return B;
			end;
			local a = Z(u);
			local H = a and a:FindFirstChild("Base");
			local i = H and H:FindFirstChild("Spawn");
			local R = i and i:FindFirstChild("PromptAttachment");
			if not R then
				return nil;
			end;
			for B, a in ipairs(R:GetChildren()) do
				if a:IsA("ProximityPrompt") then
					g.promptCache[u.uid] = a;
					return a;
				end;
			end;
			return nil;
		end;
		local function U()
			if not Q() then
				return 0;
			end;
			local u = {};
			for B, a in ipairs(g.plots:GetChildren()) do
				local H = g.plotSync.caches[a.Name];
				local i = H and H.AnimalList;
				if typeof(i) == "table" then
					for B, H in pairs(i) do
						if type(H) == "table" then
							local i = H.Index;
							local R = g.animalsData and g.animalsData[i];
							if R then
								table.insert(u, {
									name = R.DisplayName or i,
									plot = a.Name,
									slot = tostring(B),
									uid = a.Name .. ("_" .. tostring(B)),
								});
							end;
						end;
					end;
				end;
			end;
			g.animals = u;
			return #u;
		end;
		local function I()
			local u = i();
			if not u then
				return nil;
			end;
			local B, a = nil, math.huge;
			for H, i in ipairs(g.animals) do
				if not m(i) then
					local H = F(i);
					local R = H and ((u.Position - H)).Magnitude or math.huge;
					if R <= ((g.primeRange or 80)) and R < a then
						B, a = i, R;
					end;
				end;
			end;
			return B;
		end;
		local function V(u)
			if g.internalCache[u] then
				return;
			end;
			local B = { holdCallbacks = {}, triggerCallbacks = {}, ready = true };
			local a, H = pcall(getconnections, u.PromptButtonHoldBegan);
			if a and type(H) == "table" then
				for g, u in ipairs(H) do
					if type(u.Function) == "function" then
						table.insert(B.holdCallbacks, u.Function);
					end;
				end;
			end;
			local i, R = pcall(getconnections, u.Triggered);
			if i and type(R) == "table" then
				for g, u in ipairs(R) do
					if type(u.Function) == "function" then
						table.insert(B.triggerCallbacks, u.Function);
					end;
				end;
			end;
			if #B.holdCallbacks > 0 or #B.triggerCallbacks > 0 then
				g.internalCache[u] = B;
			end;
		end;
		g.autoGrabStopTime = g.autoGrabStopTime or 1.29;
		g.autoGrabStopPercent = g.autoGrabStopPercent or 75;
		g.autoGrabSetDelayRadius = g.autoGrabSetDelayRadius or 8;
		g.autoGrabStopEnabled = true;
		g.cooldown = g.cooldown or .05;
		local function E(u, a)
			if not u or not u.Parent or not a then
				return false;
			end;
			V(u);
			local R = g.internalCache[u];
			if not R or not R.ready then
				return false;
			end;
			R.ready = false;
			g.state.active = true;
			g.state.startTime = tick();
			g.state.phase = "holding";
			g.state.label = a.name or "Animal";
			task.spawn(function()
				local O = g.state.startTime;
				local c = 1.3;
				for g, u in ipairs(R.holdCallbacks) do
					task.spawn(function()
						pcall(u);
					end);
				end;
				local h = g.autoGrabStopTime;
				if k == "V3" then
					local u = math.clamp(tonumber(g.autoGrabStopPercent) or 75, 1, 100);
					h = c * ((u / 100));
				end;
				while g.enabled and w == "Semi" do
					local a = tick() - O;
					if a >= h then
						break;
					end;
					B(math.clamp(a / c, 0, 1), "STEALING");
					local H = i();
					if not H or not u.Parent or not u.Parent.Parent then
						break;
					end;
					if ((H.Position - u.Parent.Parent.Position)).Magnitude > ((tonumber(g.radius) or 60)) then
						break;
					end;
					task.wait();
				end;
				local Q = math.clamp(h / c, 0, 1);
				B(Q, "STEALING");
				local e = math.max((2.99 - h) - math.max(c - h, 0), .05);
				local P = tick();
				while g.enabled and w == "Semi" do
					if tick() - P >= e then
						H();
						R.ready = true;
						g.state.active = false;
						g.state.phase = "idle";
						E(u, a);
						return;
					end;
					if not u.Parent or not u.Parent.Parent then
						H();
						R.ready = true;
						g.state.active = false;
						g.state.phase = "idle";
						return;
					end;
					local B = i();
					if B then
						local a = ((B.Position - u.Parent.Parent.Position)).Magnitude;
						if a <= ((g.autoGrabSetDelayRadius or 8)) then
							break;
						elseif a > ((tonumber(g.radius) or 60)) then
							H();
							R.ready = true;
							g.state.active = false;
							g.state.phase = "idle";
							return;
						end;
					end;
					task.wait();
				end;
				if g.enabled and w == "Semi" then
					local u = math.max(c - h, 0);
					local a = math.min(.05, u);
					local H = u - a;
					local i = tick();
					while true do
						local g = (H > 0) and math.clamp(((tick() - i)) / H, 0, 1) or 1;
						B(Q + g * ((1 - Q)), "STEALING");
						if g >= 1 then
							break;
						end;
						task.wait();
					end;
					B(1, "STEALING");
					if a > 0 then
						task.wait(a);
					end;
					for g, u in ipairs(R.triggerCallbacks) do
						task.spawn(function()
							pcall(u);
						end);
					end;
					pcall(function()
						if _G.AutoCarrySpeed and _G.AutoCarrySpeed.WatchPickup then
							_G.AutoCarrySpeed.WatchPickup(1.25);
						end;
					end);
					g.state.lastResult = "Stole " .. tostring(g.state.label);
				else
					g.state.lastResult = "Cancelled";
				end;
				g.state.active = false;
				g.state.phase = "idle";
				g.state.lastResultTime = tick();
				R.ready = true;
				H();
			end);
			return true;
		end;
		_G.MasaStealAnimals = function()
				return g.animals;
			end;
		_G.MasaStealAnimalPos = function(g)
				return F(g);
			end;
		_G.MasaStealIsMyBase = function(g)
				return m(g);
			end;
		_G.MasaStealSlotOccupied = function(u)
				if not u or not u.plot or not u.slot then
					return false;
				end;
				local B = g.plotSync and (g.plotSync.caches and g.plotSync.caches[u.plot]);
				local a = B and B.AnimalList;
				if typeof(a) ~= "table" then
					return true;
				end;
				local H = a[u.slot] or a[tonumber(u.slot) or -1];
				return type(H) == "table";
			end;
		local function N()
			if g.scanThread then
				return;
			end;
			g.scanThread = task.spawn(function()
					while _G.MasaSemiSteal do
						if g.enabled or w == "Semi" or (w == "Normal" and X) then
							pcall(U);
						end;
						task.wait(5);
					end;
				end);
		end;
		_G.MasaStealEnsureScan = function()
				N();
				task.spawn(function()
					pcall(U);
				end);
			end;
		_G.MasaSemiAutoStealSetRadius = function(u)
				local B = tonumber(u);
				if B then
					g.radius = B;
				end;
			end;
		_G.MasaSemiAutoStealStop = function()
				g.enabled = false;
				if g.conn then
					g.conn:Disconnect();
					g.conn = nil;
				end;
				g.state.active = false;
				g.state.phase = "idle";
				H();
			end;
		_G.MasaSemiAutoStealStart = function()
				g.radius = tonumber(t) or g.radius or 60;
				g.enabled = true;
				Q();
				N();
				pcall(U);
				if g.conn then
					g.conn:Disconnect();
					g.conn = nil;
				end;
				g.conn = a.Heartbeat:Connect(function()
						if not g.enabled then
							return;
						end;
						if w ~= "Semi" then
							_G.MasaSemiAutoStealStop();
							return;
						end;
						if g.state.active then
							return;
						end;
						local u = I();
						if not u then
							return;
						end;
						local B = r(u);
						if B then
							E(B, u);
						end;
					end);
			end;
		_G.MasaSemiAutoStealSync = function()
				if w == "Semi" and X then
					_G.MasaSemiAutoStealStart();
				else
					_G.MasaSemiAutoStealStop();
				end;
			end;
	end;
_G.__MasaSetupSemiAutoSteal();
_G.__MasaSetupSemiV2AutoSteal = function()
		_G.MasaSemiV2Steal = _G.MasaSemiV2Steal or {};
		local g = _G.MasaSemiV2Steal;
		if g.conn then
			pcall(function()
				g.conn:Disconnect();
			end);
			g.conn = nil;
		end;
		g.enabled = false;
		g.holdMin = 1.3;
		g.holdMax = 2.69;
		g.entryDelay = .3;
		g.cooldown = .05;
		g.radius = tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2Radius) or g.radius or 60;
		g.semiRadius = tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or g.semiRadius or 8;
		g.plotSync = g.plotSync or { caches = {}, connections = {} };
		g.animals = g.animals or {};
		g.promptCache = g.promptCache or {};
		g.internalCache = g.internalCache or {};
		g.state = g.state or { active = false, startTime = 0, phase = "idle" };
		local function u(g, u)
			pcall(function()
				if _G.StealBar then
					_G.StealBar.SetState(u or "STEALING");
					_G.StealBar.SetProgress(math.clamp(tonumber(g) or 0, 0, 1));
				end;
			end);
		end;
		local function B()
			pcall(function()
				if _G.StealBar then
					_G.StealBar.Reset();
				end;
			end);
		end;
		local function H()
			local g = e.Character;
			return g and ((g:FindFirstChild("HumanoidRootPart") or g:FindFirstChild("UpperTorso"))) or nil;
		end;
		local function i(g)
			if typeof(g) == "table" then
				return g;
			end;
			local u = {};
			for g in string.gmatch(tostring(g), "[^%.]+") do
				table.insert(u, tonumber(g) or g);
			end;
			return u;
		end;
		local function R(g, u)
			local B, a, H = u, nil, nil;
			for g, u in ipairs(i(g)) do
				a = B;
				H = u;
				B = B and B[u] or nil;
			end;
			return B, a, H;
		end;
		local function O(u, B)
			local a = g.plotSync.caches[u];
			if typeof(a) ~= "table" then
				return;
			end;
			local H, i, O, c = B[1], B[2], B[3], B[4];
			local h, Q, e = R(H, a);
			if i == "Changed" then
				if Q ~= nil then
					Q[e] = O;
				end;
			elseif i == "ArrayInsert" then
				if h ~= nil then
					table.insert(h, c, O);
				end;
			elseif i == "ArrayRemoved" then
				if h ~= nil then
					table.remove(h, c);
				end;
			elseif i == "DictionaryInsert" then
				if h ~= nil then
					h[c] = O;
				end;
			elseif i == "DictionaryRemoved" then
				if h ~= nil then
					h[c] = nil;
				end;
			end;
		end;
		local function c(u, B, a)
			if g.plotSync.connections[u] then
				return;
			end;
			local H = tostring(u.Name);
			if not B:FindFirstChild(H) then
				return;
			end;
			if a and g.plotSync.caches[H] == nil then
				local u, B = pcall(function()
						return a:InvokeServer(H);
					end);
				g.plotSync.caches[H] = ((u and typeof(B) == "table")) and B or {};
			elseif g.plotSync.caches[H] == nil then
				g.plotSync.caches[H] = {};
			end;
			g.plotSync.connections[u] = u.OnClientEvent:Connect(function(g)
					for g, u in ipairs(g) do
						O(H, u);
					end;
				end);
		end;
		local function h()
			if g.syncReady then
				return true;
			end;
			local u = pcall(function()
					local u = game:GetService("ReplicatedStorage");
					g.packages = u:WaitForChild("Packages", 10);
					g.datas = u:WaitForChild("Datas", 10);
					g.plots = workspace:WaitForChild("Plots", 10);
					if not ((g.packages and (g.datas and g.plots))) then
						return;
					end;
					g.animalsData = require(g.datas:WaitForChild("Animals", 10));
					local B = g.packages:WaitForChild("Synchronizer", 10);
					g.channelFolder = B:WaitForChild("Channel", 10);
					g.routeRemote = B:WaitForChild("CommunicationRoute", 10);
					g.requestData = B:FindFirstChild("RequestData");
					for u, B in ipairs(g.channelFolder:GetChildren()) do
						if B:IsA("RemoteEvent") then
							c(B, g.plots, g.requestData);
						end;
					end;
					g.channelFolder.ChildAdded:Connect(function(u)
						if u:IsA("RemoteEvent") then
							c(u, g.plots, g.requestData);
						end;
					end);
					g.routeRemote.OnClientEvent:Connect(function(u)
						for u, B in ipairs(u) do
							local a, H = B[1], tostring(B[2]);
							if g.plots and g.plots:FindFirstChild(H) then
								if a == "ListenerAdded" then
									local u = g.channelFolder and g.channelFolder:FindFirstChild(H);
									if u and u:IsA("RemoteEvent") then
										c(u, g.plots, g.requestData);
									end;
								elseif a == "ListenerRemoved" then
									for u, B in pairs(g.plotSync.connections) do
										if tostring(u.Name) == H then
											pcall(function()
												B:Disconnect();
											end);
											g.plotSync.connections[u] = nil;
											g.plotSync.caches[H] = nil;
											break;
										end;
									end;
								end;
							end;
						end;
					end);
					g.syncReady = true;
				end);
			return u and g.syncReady == true;
		end;
		local function Q(g)
			local u = g and g:FindFirstChild("PlotSign");
			local B = u and (u:FindFirstChild("SurfaceGui") and u.SurfaceGui:FindFirstChild("Frame"));
			local a = B and B:FindFirstChild("TextLabel");
			if not a or a.Text == "Empty Base" then
				return nil;
			end;
			return (a.Text:gsub("\'s [Bb]ase$", "")):gsub("%s+$", "");
		end;
		local function P(u)
			if not u or not u.plot or not g.plots then
				return false;
			end;
			local B = g.plots:FindFirstChild(u.plot);
			if not B then
				return false;
			end;
			local a = Q(B);
			return a == e.DisplayName or a == e.Name;
		end;
		local function m(u)
			local B = g.plots and g.plots:FindFirstChild(u.plot);
			local a = B and B:FindFirstChild("AnimalPodiums");
			return a and a:FindFirstChild(u.slot) or nil;
		end;
		local function Z(g)
			local u = m(g);
			return u and (u:GetPivot()).Position or nil;
		end;
		local function F(g)
			local u = H();
			local B = Z(g);
			return u and (B and ((u.Position - B)).Magnitude) or math.huge;
		end;
		local function S(u)
			if not u then
				return nil;
			end;
			local B = g.promptCache[u.uid];
			if B and B.Parent then
				return B;
			end;
			local a = m(u);
			local H = a and a:FindFirstChild("Base");
			local i = H and H:FindFirstChild("Spawn");
			local R = i and i:FindFirstChild("PromptAttachment");
			if not R then
				return nil;
			end;
			for B, a in ipairs(R:GetChildren()) do
				if a:IsA("ProximityPrompt") then
					g.promptCache[u.uid] = a;
					return a;
				end;
			end;
			return nil;
		end;
		local function r()
			if not h() then
				return 0;
			end;
			local u = {};
			for B, a in ipairs(g.plots:GetChildren()) do
				local H = g.plotSync.caches[a.Name];
				local i = H and H.AnimalList;
				if typeof(i) == "table" then
					for B, H in pairs(i) do
						if type(H) == "table" then
							local i = H.Index;
							local R = g.animalsData and g.animalsData[i];
							if R then
								table.insert(u, {
									name = R.DisplayName or i,
									plot = a.Name,
									slot = tostring(B),
									uid = a.Name .. ("_" .. tostring(B)),
								});
							end;
						end;
					end;
				end;
			end;
			g.animals = u;
			return #u;
		end;
		local function U()
			local u = H();
			if not u then
				return nil;
			end;
			local B, a = nil, math.huge;
			for H, i in ipairs(g.animals) do
				if not P(i) then
					local H = Z(i);
					local R = H and ((u.Position - H)).Magnitude or math.huge;
					if R <= ((g.radius or 60)) and R < a then
						B, a = i, R;
					end;
				end;
			end;
			return B;
		end;
		local function I(u)
			if g.internalCache[u] then
				return;
			end;
			local B = { holdCallbacks = {}, triggerCallbacks = {}, ready = true };
			local a, H = pcall(getconnections, u.PromptButtonHoldBegan);
			if a and type(H) == "table" then
				for g, u in ipairs(H) do
					if type(u.Function) == "function" then
						table.insert(B.holdCallbacks, u.Function);
					end;
				end;
			end;
			local i, R = pcall(getconnections, u.Triggered);
			if i and type(R) == "table" then
				for g, u in ipairs(R) do
					if type(u.Function) == "function" then
						table.insert(B.triggerCallbacks, u.Function);
					end;
				end;
			end;
			if #B.holdCallbacks > 0 or #B.triggerCallbacks > 0 then
				g.internalCache[u] = B;
			end;
		end;
		local function t(a, H)
			if not a or not a.Parent or not H then
				return false;
			end;
			I(a);
			local i = g.internalCache[a];
			if not i or not i.ready then
				return false;
			end;
			i.ready = false;
			g.state.active = true;
			g.state.startTime = tick();
			g.state.phase = "holding";
			g.state.barHold = false;
			task.spawn(function()
				local R = g.holdMin or 1.3;
				local O = g.holdMax or 2.69;
				local c = g.entryDelay or .3;
				local h = g.semiRadius or 8;
				local Q = g.radius or 60;
				for g, u in ipairs(i.holdCallbacks) do
					task.spawn(function()
						pcall(u);
					end);
				end;
				local e = tick();
				while tick() - e < R do
					if F(H) > Q then
						B();
						g.state.active = false;
						g.state.phase = "idle";
						task.wait(g.cooldown or .05);
						i.ready = true;
						return;
					end;
					task.wait();
				end;
				g.state.phase = "waitingRange";
				local P = F(H) <= h;
				local m = false;
				while true do
					if tick() - g.state.startTime > O then
						break;
					end;
					if not a.Parent then
						break;
					end;
					if w ~= "Semi" or k ~= "V2" or not g.enabled then
						break;
					end;
					if F(H) > Q then
						B();
						g.state.active = false;
						g.state.phase = "idle";
						task.wait(g.cooldown or .05);
						i.ready = true;
						return;
					end;
					if F(H) <= h then
						if not P then
							task.wait(c);
						end;
						g.state.barHold = true;
						u(1, "STEALING");
						for g, u in ipairs(i.triggerCallbacks) do
							task.spawn(function()
								pcall(u);
							end);
						end;
						pcall(function()
							if _G.AutoCarrySpeed and _G.AutoCarrySpeed.WatchPickup then
								_G.AutoCarrySpeed.WatchPickup(1.25);
							end;
						end);
						m = true;
						break;
					end;
					task.wait();
				end;
				B();
				g.state.barHold = false;
				g.state.active = false;
				g.state.phase = "idle";
				task.wait(g.cooldown or .05);
				i.ready = true;
			end);
			return true;
		end;
		local function V()
			if g.scanThread then
				return;
			end;
			g.scanThread = task.spawn(function()
					while _G.MasaSemiV2Steal do
						if g.enabled or (w == "Semi" and k == "V2") then
							pcall(r);
						end;
						task.wait(5);
					end;
				end);
		end;
		_G.MasaSemiV2SetRadius = function(u)
				local B = tonumber(u);
				if B then
					g.radius = B;
				end;
			end;
		_G.MasaSemiV2SetSemiRadius = function(u)
				local B = tonumber(u);
				if B then
					g.semiRadius = B;
				end;
			end;
		if g.barConn then
			pcall(function()
				g.barConn:Disconnect();
			end);
			g.barConn = nil;
		end;
		g.barConn = a.RenderStepped:Connect(function()
				if not g.state.active then
					return;
				end;
				if g.state.barHold then
					return;
				end;
				local u = tick() - g.state.startTime;
				local B = g.holdMax or 2.69;
				local a = math.max(B - .05, .05);
				local H = math.clamp(u / a, 0, 1);
				pcall(function()
					if _G.StealBar then
						_G.StealBar.SetState("STEALING");
						_G.StealBar.SetProgress(H);
					end;
				end);
			end);
		_G.MasaSemiV2AutoStealStop = function()
				g.enabled = false;
				if g.conn then
					g.conn:Disconnect();
					g.conn = nil;
				end;
				g.state.active = false;
				g.state.phase = "idle";
				g.state.barHold = false;
				B();
			end;
		_G.MasaSemiV2AutoStealStart = function()
				g.radius = tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2Radius) or g.radius or 60;
				g.semiRadius = tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or g.semiRadius or 8;
				g.enabled = true;
				h();
				V();
				pcall(r);
				if g.conn then
					g.conn:Disconnect();
					g.conn = nil;
				end;
				g.conn = a.Heartbeat:Connect(function()
						if not g.enabled then
							return;
						end;
						if w ~= "Semi" or k ~= "V2" then
							_G.MasaSemiV2AutoStealStop();
							return;
						end;
						if g.state.active then
							return;
						end;
						local u = U();
						if not u then
							return;
						end;
						local B = S(u);
						if B then
							t(B, u);
						end;
					end);
			end;
		_G.MasaSemiV2AutoStealSync = function()
				if w == "Semi" and (k == "V2" and X) then
					_G.MasaSemiV2AutoStealStart();
				else
					_G.MasaSemiV2AutoStealStop();
				end;
			end;
	end;
_G.__MasaSetupSemiV2AutoSteal();
_G.MasaAutoStealSync = function()
		if not X then
			if _G.MasaNormalAutoStealStop then
				_G.MasaNormalAutoStealStop();
			end;
			if _G.MasaSemiAutoStealStop then
				_G.MasaSemiAutoStealStop();
			end;
			if _G.MasaSemiV2AutoStealStop then
				_G.MasaSemiV2AutoStealStop();
			end;
			return;
		end;
		if w == "Normal" then
			if _G.MasaSemiAutoStealStop then
				_G.MasaSemiAutoStealStop();
			end;
			if _G.MasaSemiV2AutoStealStop then
				_G.MasaSemiV2AutoStealStop();
			end;
			if _G.MasaNormalAutoStealSync then
				_G.MasaNormalAutoStealSync();
			end;
		elseif w == "Semi" then
			if _G.MasaNormalAutoStealStop then
				_G.MasaNormalAutoStealStop();
			end;
			if k == "V2" then
				if _G.MasaSemiAutoStealStop then
					_G.MasaSemiAutoStealStop();
				end;
				if _G.MasaSemiV2AutoStealSync then
					_G.MasaSemiV2AutoStealSync();
				end;
			else
				if _G.MasaSemiV2AutoStealStop then
					_G.MasaSemiV2AutoStealStop();
				end;
				if _G.MasaSemiAutoStealSync then
					_G.MasaSemiAutoStealSync();
				end;
			end;
		end;
	end;
local function Tj()
	return (tick() - ((_G._MasaMedusaHitTime or 0))) < 4;
end;
_G._MasaIsMedusaHit = Tj;
local function Wj()
	if w == "Normal" then
		local g = _G.MasaNormalSteal;
		if g then
			g.enabled = false;
			g.isStealing = false;
			if g.stealConn then
				pcall(function()
					g.stealConn:Disconnect();
				end);
				g.stealConn = nil;
			end;
			for g, u in pairs(g.internalCache or {}) do
				u.ready = true;
			end;
			pcall(function()
				if _G.StealBar then
					_G.StealBar.Reset();
				end;
			end);
		end;
	elseif w == "Semi" then
		if k == "V2" then
			local g = _G.MasaSemiV2Steal;
			if g then
				g.enabled = false;
				if g.conn then
					pcall(function()
						g.conn:Disconnect();
					end);
					g.conn = nil;
				end;
				g.state.active = false;
				g.state.phase = "idle";
				for g, u in pairs(g.internalCache or {}) do
					u.ready = true;
				end;
				pcall(function()
					if _G.StealBar then
						_G.StealBar.Reset();
					end;
				end);
			end;
		else
			local g = _G.MasaSemiSteal;
			if g then
				g.enabled = false;
				if g.conn then
					pcall(function()
						g.conn:Disconnect();
					end);
					g.conn = nil;
				end;
				g.state.active = false;
				g.state.phase = "idle";
				for g, u in pairs(g.internalCache or {}) do
					u.ready = true;
				end;
				pcall(function()
					if _G.StealBar then
						_G.StealBar.Reset();
					end;
				end);
			end;
		end;
	end;
	local g = _G._MasaSyncAfterHit.gen;
	local u = Tj() and 2.45 or 1.45;
	task.delay(u, function()
		if g ~= _G._MasaSyncAfterHit.gen then
			return;
		end;
		_G._MasaSyncAfterHit.wasRagdoll = false;
		if _G._MasaSyncAfterHit.enabled and X then
			if w == "Normal" then
				if _G.MasaNormalAutoStealStart then
					pcall(_G.MasaNormalAutoStealStart);
				end;
			elseif w == "Semi" then
				if k == "V2" then
					if _G.MasaSemiV2AutoStealStart then
						pcall(_G.MasaSemiV2AutoStealStart);
					end;
				else
					if _G.MasaSemiAutoStealStart then
						pcall(_G.MasaSemiAutoStealStart);
					end;
				end;
			end;
		end;
	end);
end;
local function Dj()
	if _G._MasaSyncAfterHit.conn then
		pcall(function()
			_G._MasaSyncAfterHit.conn:Disconnect();
		end);
		_G._MasaSyncAfterHit.conn = nil;
	end;
	_G._MasaSyncAfterHit.wasRagdoll = false;
	_G._MasaSyncAfterHit.conn = a.Heartbeat:Connect(function()
			if not _G._MasaSyncAfterHit.enabled then
				return;
			end;
			if not X then
				return;
			end;
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChildOfClass("Humanoid");
			if not u or u.Health <= 0 then
				return;
			end;
			local B = u:GetState();
			local a = (B == Enum.HumanoidStateType.Physics or B == Enum.HumanoidStateType.Ragdoll);
			if a and not _G._MasaSyncAfterHit.wasRagdoll then
				_G._MasaSyncAfterHit.wasRagdoll = true;
				_G._MasaSyncAfterHit.gen = _G._MasaSyncAfterHit.gen + 1;
				Wj();
			elseif not a then
				_G._MasaSyncAfterHit.wasRagdoll = false;
			end;
		end);
end;
local function Kj()
	if _G._MasaSyncAfterHit.conn then
		pcall(function()
			_G._MasaSyncAfterHit.conn:Disconnect();
		end);
		_G._MasaSyncAfterHit.conn = nil;
	end;
	_G._MasaSyncAfterHit.wasRagdoll = false;
end;
Dj();
_G.MasaTPRagdoll = _G.MasaTPRagdoll or {};
_G.MasaTPRagdollEnabled = _G.MasaTPRagdollEnabled == true;
_G.MasaTPRagdollBusy = false;
_G.MasaTPRagdoll.cfg = {
		BLOCK = 1.15,
		PIVOT = 1.25,
		STEP = .095,
		R = { { x = -461, z = 62.58 }, { x = -459.24, z = -11.13 }, { x = -484.88, z = 24.08 } },
		L = { { x = -461, z = 62.58 }, { x = -468.65, z = 133.95 }, { x = -484.88, z = 96.05 } },
	};
function _G.MasaTPRagdoll.run()
	local g = _G.MasaTPRagdoll;
	local u = _G.MasaAutoPlay and _G.MasaAutoPlay.side;
	if u ~= "L" and u ~= "R" then
		return;
	end;
	local B = g.cfg[u];
	if not B then
		return;
	end;
	g.gen = ((g.gen or 0)) + 1;
	g.done = nil;
	local a = g.gen;
	task.delay(g.cfg.BLOCK, function()
		if a ~= g.gen then
			return;
		end;
		_G.MasaTPRagdollBusy = true;
		if _G.MasaSafeModeForceStop then
			pcall(_G.MasaSafeModeForceStop, "TP RAGDOLL");
		end;
		if _G.MasaRunTPDown then
			pcall(_G.MasaRunTPDown, true);
		end;
	end);
	task.delay(g.cfg.PIVOT, function()
		if a ~= g.gen then
			return;
		end;
		local u = e.Character;
		if not u then
			_G.MasaTPRagdollBusy = false;
			return;
		end;
		for B, H in ipairs(B) do
			if a ~= g.gen then
				return;
			end;
			pcall(function()
				local g = (u:GetPivot()).Position;
				u:PivotTo(CFrame.new(H.x, g.Y, H.z));
			end);
			task.wait(g.cfg.STEP);
		end;
		_G.MasaTPRagdollBusy = false;
		g.done = a;
	end);
end;
function _G.MasaTPRagdoll.stop()
	local g = _G.MasaTPRagdoll;
	g.gen = ((g.gen or 0)) + 1;
	_G.MasaTPRagdollBusy = false;
	if g.conn then
		pcall(function()
			g.conn:Disconnect();
		end);
		g.conn = nil;
	end;
	if not p and _G.MasaStopBatCounterWatcher then
		pcall(_G.MasaStopBatCounterWatcher);
	end;
end;
function _G.MasaTPRagdoll.start()
	local g = _G.MasaTPRagdoll;
	if g.conn then
		pcall(function()
			g.conn:Disconnect();
		end);
	end;
	g.was = false;
	if _G.MasaStartBatCounterWatcher then
		pcall(_G.MasaStartBatCounterWatcher);
	end;
	g.conn = a.Heartbeat:Connect(function()
			if not _G.MasaTPRagdollEnabled then
				return;
			end;
			local u = e.Character;
			local B = u and u:FindFirstChildOfClass("Humanoid");
			if not B or B.Health <= 0 or _G._MasaInstantResetBusy then
				g.was = false;
				if ((g.gen or 0)) ~= ((g.done or -1)) then
					g.gen = ((g.gen or 0)) + 1;
					g.done = g.gen;
					_G.MasaTPRagdollBusy = false;
				end;
				return;
			end;
			local a = B:GetState();
			local H = (a == Enum.HumanoidStateType.Physics or a == Enum.HumanoidStateType.Ragdoll);
			if H and not g.was then
				g.was = true;
				local u = _G._MasaIsMedusaHit and _G._MasaIsMedusaHit() or false;
				local B = _G.MasaIsNearestEnemyRagdolled and _G.MasaIsNearestEnemyRagdolled() or false;
				if not u and not B then
					_G.MasaTPRagdoll.run();
				end;
			elseif not H then
				g.was = false;
			end;
		end);
end;
function _G.MasaTPRagdoll.set(g)
	_G.MasaTPRagdollEnabled = g and true or false;
	if _G.MasaTPRagdollEnabled then
		_G.MasaTPRagdoll.start();
	else
		_G.MasaTPRagdoll.stop();
	end;
end;
if _G.MasaTPRagdollEnabled then
	_G.MasaTPRagdoll.start();
end;
do
	local g = {};
	local function u()
		for g, u in ipairs(g) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		g = {};
	end;
	local function B(u)
		if not u:IsA("BasePart") then
			return;
		end;
		local B = (u:GetPropertyChangedSignal("Anchored")):Connect(function()
				if u.Anchored and u.Transparency == 1 then
					_G._MasaMedusaHitTime = tick();
				end;
			end);
		table.insert(g, B);
	end;
	local function a(a)
		u();
		_G._MasaMedusaHitTime = 0;
		if not a then
			return;
		end;
		for g, u in ipairs(a:GetDescendants()) do
			B(u);
		end;
		table.insert(g, a.DescendantAdded:Connect(function(g)
			B(g);
		end));
	end;
	if e.Character then
		a(e.Character);
	end;
	e.CharacterAdded:Connect(function(g)
		_G._MasaWaitCharReady(g, 10);
		a(g);
	end);
end;
task.spawn(function()
	while task.wait(30) do
		saveMasaConfig();
	end;
end);
local oj = Vector3.new(0, 0, 0);
local function xj()
	if I == "Carry" then
		return S;
	elseif I == "Lagger" then
		return r;
	elseif I == "Lagger Carry" then
		return U;
	end;
	return F;
end;
_G.MasaGetCurrentSpeedValue = xj;
local lj = nil;
local function Mj(g)
	if g ~= "Normal" and (g ~= "Carry" and (g ~= "Lagger" and g ~= "Lagger Carry")) then
		g = "Normal";
	end;
	if not _G._MasaAS.restoring and (autoCarrySpeedEnabled and _G._MasaAS.locked) then
		if g ~= "Carry" and g ~= "Lagger Carry" then
			return;
		end;
	end;
	I = g;
	if lj then
		lj();
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
	saveMasaConfig();
end;
local function zj()
	if autoCarrySpeedEnabled and _G._MasaAS.locked then
		Mj("Carry");
		return;
	end;
	if I == "Lagger" or I == "Lagger Carry" then
		Mj("Carry");
	elseif I == "Carry" then
		Mj("Normal");
	else
		Mj("Carry");
	end;
end;
local function fj()
	if autoCarrySpeedEnabled and _G._MasaAS.locked then
		Mj("Lagger Carry");
		return;
	end;
	if I ~= "Lagger" and I ~= "Lagger Carry" then
		Mj("Lagger Carry");
	elseif I == "Lagger Carry" then
		Mj("Lagger");
	else
		Mj("Lagger Carry");
	end;
end;
State = State or {};
State.normalSpeed = F;
State.carrySpeed = S;
State.laggerSpeed = r;
State.speedToggled = (I == "Carry" or I == "Lagger Carry");
State.laggerEnabled = (I == "Lagger" or I == "Lagger Carry");
toggleRefs = toggleRefs or {};
function setCarry(g)
	if g then
		Mj("Carry");
	else
		if I == "Carry" or I == "Lagger Carry" then
			Mj("Normal");
		end;
	end;
	State.speedToggled = g == true;
end;
function setLagger(g)
	if g then
		Mj("Lagger");
	else
		if I == "Lagger" or I == "Lagger Carry" then
			Mj("Normal");
		end;
	end;
	State.laggerEnabled = g == true;
end;
State = State or {};
State.normalSpeed = State.normalSpeed or 59;
State.carrySpeed = State.carrySpeed or 30;
State.laggerSpeed = State.laggerSpeed or 60;
State.speedToggled = State.speedToggled or false;
State.laggerEnabled = State.laggerEnabled or false;
State._autoCarryFromSteal = State._autoCarryFromSteal or false;
State._autoCarryGraceUntil = State._autoCarryGraceUntil or 0;
State._waitingForCarryPickup = State._waitingForCarryPickup or false;
State._carryPickupWatchUntil = State._carryPickupWatchUntil or 0;
State._autoCarryReturnMode = State._autoCarryReturnMode or nil;
toggleRefs = toggleRefs or {};
local function Gj()
	if type(saveConfig) == "function" then
		task.spawn(saveConfig);
	end;
end;
function _G.MasaAutoCarryScanAnimals()
	local g = _G._MasaAutoCarrySoft;
	local u = {};
	local B = workspace:FindFirstChild("Plots");
	if not B then
		g.animals = u;
		return;
	end;
	for g, B in ipairs(B:GetChildren()) do
		if B:IsA("Model") then
			local g = false;
			local a = B:FindFirstChild("PlotSign");
			local H = a and a:FindFirstChild("YourBase");
			if H and (H:IsA("BillboardGui") and H.Enabled == true) then
				g = true;
			end;
			if not g then
				local g = B:FindFirstChild("AnimalPodiums");
				if g then
					for g, B in ipairs(g:GetChildren()) do
						if B:IsA("Model") then
							local g = B:FindFirstChild("Base");
							local a = g and g:FindFirstChild("Spawn");
							if a then
								table.insert(u, a.Position);
							end;
						end;
					end;
				end;
			end;
		end;
	end;
	g.animals = u;
end;
function _G.MasaAutoCarryNearestAnimalDist()
	local g = _G._MasaAutoCarrySoft;
	local u = e.Character;
	local B = u and ((u:FindFirstChild("HumanoidRootPart") or u:FindFirstChild("UpperTorso")));
	if not B then
		return math.huge;
	end;
	local a = tick();
	if (a - ((g.lastScan or 0))) >= ((g.scanInterval or 2)) then
		g.lastScan = a;
		pcall(_G.MasaAutoCarryScanAnimals);
	end;
	local H = B.Position;
	local i = math.huge;
	for g, u in ipairs(g.animals) do
		local B = ((H - u)).Magnitude;
		if B < i then
			i = B;
		end;
	end;
	return i;
end;
function _G.MasaAutoCarryInSoftRadius()
	local g = _G._MasaAutoCarrySoft;
	return _G.MasaAutoCarryNearestAnimalDist() <= ((tonumber(g.radius) or 9.5));
end;
local function sj()
	if not autoCarrySpeedEnabled then
		return;
	end;
	local g = e.Character;
	if not g then
		return;
	end;
	local u = g:FindFirstChildOfClass("Humanoid");
	if not u then
		return;
	end;
	if _G.MasaSafeModeInDuelCountdown then
		local g, u = pcall(_G.MasaSafeModeInDuelCountdown);
		if g and u then
			if _G._MasaAS.locked then
				_G._MasaAS.locked = false;
				if _G._MasaAS.savedMode then
					_G._MasaAS.restoring = true;
					Mj(_G._MasaAS.savedMode);
					_G._MasaAS.restoring = false;
					_G._MasaAS.savedMode = nil;
				end;
			end;
			_G._MasaAS.wasLow = false;
			return;
		end;
	end;
	local B = u.WalkSpeed < 25;
	if _G._MasaAutoCarryMode == "SOFT" then
		local g = false;
		local u, a = pcall(_G.MasaAutoCarryInSoftRadius);
		if u then
			g = a and true or false;
		end;
		B = g or B;
	end;
	if B == _G._MasaAS.wasLow then
		return;
	end;
	_G._MasaAS.wasLow = B;
	if B then
		_G._MasaAS.locked = true;
		if I ~= "Carry" and I ~= "Lagger Carry" then
			_G._MasaAS.savedMode = I;
			if I == "Lagger" then
				Mj("Lagger Carry");
			else
				Mj("Carry");
			end;
		end;
	else
		_G._MasaAS.locked = false;
		if _G._MasaAS.savedMode then
			_G._MasaAS.restoring = true;
			Mj(_G._MasaAS.savedMode);
			_G._MasaAS.restoring = false;
			_G._MasaAS.savedMode = nil;
		end;
	end;
end;
task.spawn(function()
	while true do
		task.wait(_G._MasaAS.interval);
		sj();
		if _G.MasaUpdateKickWarning then
			pcall(_G.MasaUpdateKickWarning);
		end;
	end;
end);
_G.MasaUltimateAntiKick = _G.MasaUltimateAntiKick or {};
_G.MasaUAKEnabled = _G.MasaUAKEnabled == true;
_G.MasaUltimateAntiKick.cfg = {
		RADIUS = 30,
		LEAD = .1,
		HEIGHT = 40,
		THICK = 2,
		RISE = 8,
	};
_G.MasaUltimateAntiKick.zones = { { at = { x = -488, z = 24 }, wall = {
				x1 = -478,
				z1 = 88,
				x2 = -422,
				z2 = 88,
			} }, { at = { x = -488, z = 95 }, wall = {
				x1 = -478,
				z1 = 32,
				x2 = -422,
				z2 = 32,
			} } };
function _G.MasaUltimateAntiKick.clear()
	local g = workspace:FindFirstChild("MasaAntiKickWall");
	while g do
		pcall(function()
			g:Destroy();
		end);
		g = workspace:FindFirstChild("MasaAntiKickWall");
	end;
end;
function _G.MasaUltimateAntiKick.zoneFor(g)
	local u = _G.MasaUltimateAntiKick;
	for B, a in ipairs(u.zones) do
		local H = g.X - a.at.x;
		local i = g.Z - a.at.z;
		if math.sqrt(H * H + i * i) <= u.cfg.RADIUS then
			return a;
		end;
	end;
	return nil;
end;
function _G.MasaUltimateAntiKick.onWarning(g)
	if _G.MasaUAKEnabled ~= true then
		return;
	end;
	if not ((_G._MasaKickWarn and _G._MasaKickWarn.enabled == true)) then
		return;
	end;
	local u = _G.MasaUltimateAntiKick;
	local B = e.Character;
	local a = B and B:FindFirstChild("HumanoidRootPart");
	if not a then
		return;
	end;
	local H = u.zoneFor(a.Position);
	if not H then
		return;
	end;
	u.clear();
	local i = H.wall;
	local R = ((i.x1 + i.x2)) / 2;
	local O = ((i.z1 + i.z2)) / 2;
	local c = i.x2 - i.x1;
	local h = i.z2 - i.z1;
	local Q = math.sqrt(c * c + h * h);
	if Q < .1 then
		return;
	end;
	local P = Instance.new("Part");
	P.Name = "MasaAntiKickWall";
	P.Anchored = true;
	P.CanCollide = true;
	P.CanQuery = false;
	P.CanTouch = false;
	P.CastShadow = false;
	P.Transparency = 1;
	P.Size = Vector3.new(Q, u.cfg.HEIGHT, u.cfg.THICK);
	local m = Vector3.new(i.x1, a.Position.Y + u.cfg.RISE, i.z1);
	local Z = Vector3.new(i.x2, a.Position.Y + u.cfg.RISE, i.z2);
	local F = Vector3.new(R, a.Position.Y + u.cfg.RISE, O);
	P.CFrame = CFrame.lookAt(F, Z) * CFrame.Angles(0, math.rad(90), 0);
	P.Parent = workspace;
	u.token = ((u.token or 0)) + 1;
	local S = u.token;
	local r = math.max(((tonumber(g) or 2.35)) - u.cfg.LEAD, .05);
	task.delay(r, function()
		if u.token ~= S then
			return;
		end;
		u.clear();
	end);
end;
function _G.MasaDestroyKickWarning()
	local g = _G._MasaKickWarn;
	g.gen = ((g.gen or 0)) + 1;
	g.active = false;
	local u = m:FindFirstChild("MasaHubKickWarning");
	if u then
		pcall(function()
			u:Destroy();
		end);
	end;
	if _G.MasaUltimateAntiKick then
		pcall(_G.MasaUltimateAntiKick.clear);
	end;
end;
function _G.MasaShowKickWarning()
	local g = _G._MasaKickWarn;
	if g.active then
		return;
	end;
	if m:FindFirstChild("MasaHubKickWarning") then
		return;
	end;
	if _G.MasaSafeModeInDuelCountdown then
		local g, u = pcall(_G.MasaSafeModeInDuelCountdown);
		if g and u then
			return;
		end;
	end;
	local u = 0;
	do
		local g = m:FindFirstChild("MasaHubPingWarning");
		if g then
			local a = g:FindFirstChild("WarningFrame");
			u = .12;
			pcall(function()
				(B:Create(a, TweenInfo.new(.12, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(.5, -210, 0, -60) })):Play();
			end);
			task.delay(.13, function()
				pcall(function()
					g:Destroy();
				end);
			end);
		end;
	end;
	g.active = true;
	g.gen = ((g.gen or 0)) + 1;
	local H = g.gen;
	local i, R = 280, 40;
	local O = 2.35;
	if _G.MasaUltimateAntiKick then
		pcall(_G.MasaUltimateAntiKick.onWarning, O);
	end;
	local c = Color3.fromRGB(15, 30, 70);
	local h = Color3.fromRGB(255, 105, 180);
	local Q = Instance.new("ScreenGui");
	Q.Name = "MasaHubKickWarning";
	Q.ResetOnSpawn = false;
	Q.IgnoreGuiInset = true;
	Q.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	Q.DisplayOrder = 99999;
	Q.Parent = m;
	local P = Instance.new("Frame");
	P.Name = "WarningFrame";
	P.Size = UDim2.new(0, i, 0, R);
	P.Position = UDim2.new(.5, -i / 2, 0, -60);
	P.BackgroundColor3 = c;
	P.BackgroundTransparency = 0;
	P.BorderSizePixel = 0;
	P.ClipsDescendants = true;
	P.ZIndex = 1;
	P.Parent = Q;
	(Instance.new("UICorner", P)).CornerRadius = UDim.new(0, 10);
	local Z = Instance.new("UIStroke");
	Z.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	Z.Color = Color3.fromRGB(255, 105, 180);
	Z.Thickness = 1.5;
	Z.Transparency = .1;
	Z.Parent = P;
	local F = Instance.new("Frame");
	F.Name = "FillFrame";
	F.Size = UDim2.new(0, 0, 1, 0);
	F.Position = UDim2.new(0, 0, 0, 0);
	F.BackgroundColor3 = h;
	F.BackgroundTransparency = .05;
	F.BorderSizePixel = 0;
	F.ZIndex = 2;
	F.Parent = P;
	(Instance.new("UICorner", F)).CornerRadius = UDim.new(0, 10);
	local S = Instance.new("TextLabel");
	S.Name = "WarningText";
	S.Size = UDim2.new(1, -24, 1, 0);
	S.Position = UDim2.new(0, 12, 0, 0);
	S.BackgroundTransparency = 1;
	S.Text = "DON\'T ENTER";
	S.TextColor3 = Color3.fromRGB(255, 255, 255);
	S.Font = Enum.Font.GothamBlack;
	S.TextSize = 13;
	S.TextXAlignment = Enum.TextXAlignment.Center;
	S.TextStrokeColor3 = Color3.fromRGB(0, 20, 60);
	S.TextStrokeTransparency = .3;
	S.ZIndex = 3;
	S.Parent = P;
	local function r()
		if g.gen ~= H or not Q.Parent then
			return;
		end;
		(B:Create(P, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(.5, -i / 2, 0, 18) })):Play();
	end;
	if u > 0 then
		task.delay(u, r);
	else
		r();
	end;
	local function U()
		if _G.MasaSafeModeInDuelCountdown then
			local g, u = pcall(_G.MasaSafeModeInDuelCountdown);
			if g and u then
				return false;
			end;
		end;
		local g = e.Character;
		local u = g and g:FindFirstChildOfClass("Humanoid");
		if not u then
			return false;
		end;
		return u.WalkSpeed < 25;
	end;
	local function I()
		(B:Create(P, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(.5, -i / 2, 0, -60) })):Play();
		task.wait(.35);
		pcall(function()
			Q:Destroy();
		end);
		g.active = false;
		if _G.MasaUltimateAntiKick then
			pcall(_G.MasaUltimateAntiKick.clear);
		end;
	end;
	task.spawn(function()
		local u = tick();
		while true do
			if g.gen ~= H or not Q.Parent then
				g.active = false;
				return;
			end;
			if not U() then
				I();
				return;
			end;
			local B = tick() - u;
			local R = math.clamp(B / O, 0, 1);
			F.Size = UDim2.new(0, math.floor(R * i), 1, 0);
			if R >= 1 then
				break;
			end;
			a.Heartbeat:Wait();
		end;
		if g.gen ~= H or not Q.Parent then
			g.active = false;
			return;
		end;
		S.Text = "ENTER";
		S.TextColor3 = Color3.fromRGB(15, 30, 70);
		while true do
			if g.gen ~= H or not Q.Parent then
				g.active = false;
				return;
			end;
			if not U() then
				break;
			end;
			task.wait(.05);
		end;
		if g.gen ~= H or not Q.Parent then
			g.active = false;
			return;
		end;
		I();
	end);
end;
function _G.MasaUpdateKickWarning()
	local g = _G._MasaKickWarn;
	local u = e.Character;
	local B = u and u:FindFirstChildOfClass("Humanoid");
	if not B then
		return;
	end;
	if _G.MasaSafeModeInDuelCountdown then
		local u, B = pcall(_G.MasaSafeModeInDuelCountdown);
		if u and B then
			if g.active then
				pcall(_G.MasaDestroyKickWarning);
			end;
			g.wasLow = false;
			return;
		end;
	end;
	local a = B.WalkSpeed < 25;
	if not g.enabled then
		g.wasLow = a;
		return;
	end;
	if a == g.wasLow then
		return;
	end;
	g.wasLow = a;
	if a then
		_G.MasaShowKickWarning();
	end;
end;
_G.MasaPathfind = _G.MasaPathfind or {};
_G.MasaPathfind.cfg = {
		PROBE = 14,
		ANGLES = {
			18,
			36,
			54,
			72,
			90,
		},
		WALL_Y = .6,
		WP_REACH = 4,
		RECOMPUTE = 1.25,
		GOAL_DRIFT = 6,
	};
function _G.MasaPathfind.rayParams()
	local u = RaycastParams.new();
	local B = {};
	local a = e.Character;
	if a then
		B[#B + 1] = a;
	end;
	for g, u in ipairs(g:GetPlayers()) do
		if u ~= e and u.Character then
			B[#B + 1] = u.Character;
		end;
	end;
	u.FilterDescendantsInstances = B;
	u.FilterType = Enum.RaycastFilterType.Exclude;
	u.IgnoreWater = true;
	return u;
end;
function _G.MasaPathfind.blocked(g, u, B, a)
	local H = workspace:Raycast(g, u * B, a);
	if not H then
		return false;
	end;
	if math.abs(H.Normal.Y) > _G.MasaPathfind.cfg.WALL_Y then
		return false;
	end;
	return true;
end;
function _G.MasaPathfind.steer(g, u, B)
	if u.Magnitude < .01 then
		return u;
	end;
	u = u.Unit;
	local a = _G.MasaPathfind.cfg;
	B = B or a.PROBE;
	local H = _G.MasaPathfind.rayParams();
	local i = g - Vector3.new(0, 2, 0);
	if not _G.MasaPathfind.blocked(g, u, B, H) and not _G.MasaPathfind.blocked(i, u, B, H) then
		return u;
	end;
	for a, R in ipairs(a.ANGLES) do
		for a, O in ipairs({ 1, -1 }) do
			local c = CFrame.Angles(0, math.rad(R * O), 0);
			local h = c:VectorToWorldSpace(u);
			h = Vector3.new(h.X, 0, h.Z);
			if h.Magnitude > .01 then
				h = h.Unit;
				if not _G.MasaPathfind.blocked(g, h, B, H) and not _G.MasaPathfind.blocked(i, h, B, H) then
					return h;
				end;
			end;
		end;
	end;
	return u;
end;
_G.MasaPathfind.paths = _G.MasaPathfind.paths or {};
function _G.MasaPathfind.reset(g)
	_G.MasaPathfind.paths[g] = nil;
end;
function _G.MasaPathfind.dirTo(g, u, B, a)
	local H = _G.MasaPathfind.cfg;
	local i = _G.MasaPathfind.paths[g];
	local R = os.clock();
	local O = (a and tonumber(a.recompute)) or H.RECOMPUTE;
	local c = (a and tonumber(a.drift)) or H.GOAL_DRIFT;
	if i and (i.goal and ((i.goal - B)).Magnitude > c) then
		i = nil;
	end;
	if not i then
		i = {
				goal = B,
				wp = nil,
				i = 1,
				computing = false,
				last = 0,
			};
		_G.MasaPathfind.paths[g] = i;
	end;
	if not i.computing and ((not i.wp or (R - i.last) > O)) then
		i.computing = true;
		i.last = R;
		i.goal = B;
		local a = u;
		task.spawn(function()
			local u, H = pcall(function()
					_G.MasaPathfind.svc = _G.MasaPathfind.svc or game:GetService("PathfindingService");
					local g = _G.MasaPathfind.svc:CreatePath({
							AgentRadius = 2.5,
							AgentHeight = 5,
							AgentCanJump = true,
							WaypointSpacing = 6,
						});
					g:ComputeAsync(a, B);
					return g;
				end);
			local R = _G.MasaPathfind.paths[g];
			if R ~= i then
				return;
			end;
			i.computing = false;
			if u and (H and H.Status == Enum.PathStatus.Success) then
				local g = H:GetWaypoints();
				i.wp = g;
				i.i = math.min(2, #g);
			else
				i.wp = nil;
			end;
		end);
	end;
	local h = i.wp;
	if not h or #h == 0 then
		return nil;
	end;
	while i.i <= #h do
		local g = h[i.i].Position;
		local B = Vector3.new(g.X - u.X, 0, g.Z - u.Z);
		if B.Magnitude > H.WP_REACH then
			if B.Magnitude < .01 then
				return nil;
			end;
			return B.Unit;
		end;
		i.i = i.i + 1;
	end;
	return nil;
end;
_G.MasaAutoPathState = _G.MasaAutoPathState or {
		leftConn = nil,
		rightConn = nil,
		leftPhase = 1,
		rightPhase = 1,
	};
_G.MasaAutoPathPoints = _G.MasaAutoPathPoints or {
		L1 = Vector3.new(-476.48, -6.28, 92.73),
		L2 = Vector3.new(-483.12, -4.95, 94.8),
		LFace = Vector3.new(-482.25, -4.96, 92.09),
		R1 = Vector3.new(-476.16, -6.52, 25.62),
		R2 = Vector3.new(-483.06, -5.03, 25.48),
		RFace = Vector3.new(-482.06, -6.93, 35.47),
	};
function _G.MasaAutoPathSpeed()
	if I == "Lagger" or I == "Lagger Carry" then
		return r;
	end;
	return F;
end;
function _G.MasaStopAutoLeft()
	local g = _G.MasaAutoPathState;
	if g.leftConn then
		g.leftConn:Disconnect();
		g.leftConn = nil;
	end;
	g.leftPhase = 1;
	if _G.MasaPathfind then
		_G.MasaPathfind.reset("L1");
		_G.MasaPathfind.reset("L2");
	end;
	local u = e.Character;
	local B = u and u:FindFirstChildOfClass("Humanoid");
	local a = u and u:FindFirstChild("HumanoidRootPart");
	if B then
		B:Move(Vector3.zero, false);
	end;
	if a then
		a.AssemblyLinearVelocity = Vector3.new(0, a.AssemblyLinearVelocity.Y, 0);
	end;
end;
function _G.MasaStopAutoRight()
	local g = _G.MasaAutoPathState;
	if g.rightConn then
		g.rightConn:Disconnect();
		g.rightConn = nil;
	end;
	g.rightPhase = 1;
	if _G.MasaPathfind then
		_G.MasaPathfind.reset("R1");
		_G.MasaPathfind.reset("R2");
	end;
	local u = e.Character;
	local B = u and u:FindFirstChildOfClass("Humanoid");
	local a = u and u:FindFirstChild("HumanoidRootPart");
	if B then
		B:Move(Vector3.zero, false);
	end;
	if a then
		a.AssemblyLinearVelocity = Vector3.new(0, a.AssemblyLinearVelocity.Y, 0);
	end;
end;
function _G.MasaSetAutoLeft(g, u)
	if g and (_G.MasaSafeModeTryStart and not _G.MasaSafeModeTryStart()) then
		Xl = false;
		if _G.MasaSetAutoLeftVisual then
			_G.MasaSetAutoLeftVisual(false);
		end;
		if _G.MasaRefreshMobileButtonStates then
			_G.MasaRefreshMobileButtonStates();
		end;
		if not u then
			saveMasaConfig();
		end;
		return false;
	end;
	Xl = g and true or false;
	if _G.MasaSetAutoLeftVisual then
		_G.MasaSetAutoLeftVisual(Xl);
	end;
	if Xl then
		wl = false;
		if _G.MasaSetAutoRightVisual then
			_G.MasaSetAutoRightVisual(false);
		end;
		if _G.MasaStopAutoRight then
			_G.MasaStopAutoRight();
		end;
		if _G.MasaStartAutoLeft then
			_G.MasaStartAutoLeft();
		end;
	else
		if _G.MasaStopAutoLeft then
			_G.MasaStopAutoLeft();
		end;
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
	if not u then
		saveMasaConfig();
	end;
end;
function _G.MasaSetAutoRight(g, u)
	if g and (_G.MasaSafeModeTryStart and not _G.MasaSafeModeTryStart()) then
		wl = false;
		if _G.MasaSetAutoRightVisual then
			_G.MasaSetAutoRightVisual(false);
		end;
		if _G.MasaRefreshMobileButtonStates then
			_G.MasaRefreshMobileButtonStates();
		end;
		if not u then
			saveMasaConfig();
		end;
		return false;
	end;
	wl = g and true or false;
	if _G.MasaSetAutoRightVisual then
		_G.MasaSetAutoRightVisual(wl);
	end;
	if wl then
		Xl = false;
		if _G.MasaSetAutoLeftVisual then
			_G.MasaSetAutoLeftVisual(false);
		end;
		if _G.MasaStopAutoLeft then
			_G.MasaStopAutoLeft();
		end;
		if _G.MasaStartAutoRight then
			_G.MasaStartAutoRight();
		end;
	else
		if _G.MasaStopAutoRight then
			_G.MasaStopAutoRight();
		end;
	end;
	if _G.MasaRefreshMobileButtonStates then
		_G.MasaRefreshMobileButtonStates();
	end;
	if not u then
		saveMasaConfig();
	end;
end;
function _G.MasaStartAutoLeft()
	local g = _G.MasaAutoPathState;
	if g.leftConn then
		g.leftConn:Disconnect();
	end;
	g.leftPhase = 1;
	g.leftConn = a.Heartbeat:Connect(function()
			if not Xl then
				return;
			end;
			local u = e.Character;
			if not u then
				return;
			end;
			local B = u:FindFirstChild("HumanoidRootPart");
			local a = u:FindFirstChildOfClass("Humanoid");
			if not B or not a then
				return;
			end;
			local H = a:GetState();
			if a.PlatformStand or H == Enum.HumanoidStateType.Physics or H == Enum.HumanoidStateType.Ragdoll then
				a:Move(Vector3.zero, false);
				if _G.MasaSetAutoLeft then
					_G.MasaSetAutoLeft(false);
				end;
				return;
			end;
			local i = _G.MasaAutoPathPoints;
			local R = _G.MasaAutoPathSpeed();
			if g.leftPhase == 1 then
				local u = Vector3.new(i.L1.X, B.Position.Y, i.L1.Z);
				if ((u - B.Position)).Magnitude < 1 then
					g.leftPhase = 2;
					if _G.MasaPathfind then
						_G.MasaPathfind.reset("L1");
					end;
					local u = i.L2 - B.Position;
					local H = (Vector3.new(u.X, 0, u.Z)).Unit;
					a:Move(H, false);
					B.AssemblyLinearVelocity = Vector3.new(H.X * R, B.AssemblyLinearVelocity.Y, H.Z * R);
					return;
				end;
				local H = i.L1 - B.Position;
				local O = (Vector3.new(H.X, 0, H.Z)).Unit;
				if _G.MasaPathfind then
					local g = _G.MasaPathfind.dirTo("L1", B.Position, i.L1);
					if g then
						O = g;
					end;
				end;
				a:Move(O, false);
				B.AssemblyLinearVelocity = Vector3.new(O.X * R, B.AssemblyLinearVelocity.Y, O.Z * R);
			elseif g.leftPhase == 2 then
				local u = Vector3.new(i.L2.X, B.Position.Y, i.L2.Z);
				if ((u - B.Position)).Magnitude < 1 then
					a:Move(Vector3.zero, false);
					B.AssemblyLinearVelocity = Vector3.zero;
					Xl = false;
					if g.leftConn then
						g.leftConn:Disconnect();
						g.leftConn = nil;
					end;
					g.leftPhase = 1;
					if _G.MasaSetAutoLeftVisual then
						_G.MasaSetAutoLeftVisual(false);
					end;
					if _G.MasaRefreshMobileButtonStates then
						_G.MasaRefreshMobileButtonStates();
					end;
					if i.LFace and ((i.LFace - B.Position)).Magnitude > .01 then
						B.CFrame = CFrame.new(B.Position, Vector3.new(i.LFace.X, B.Position.Y, i.LFace.Z));
					end;
					saveMasaConfig();
					return;
				end;
				local H = i.L2 - B.Position;
				local O = (Vector3.new(H.X, 0, H.Z)).Unit;
				if _G.MasaPathfind then
					local g = _G.MasaPathfind.dirTo("L2", B.Position, i.L2);
					if g then
						O = g;
					end;
				end;
				a:Move(O, false);
				B.AssemblyLinearVelocity = Vector3.new(O.X * R, B.AssemblyLinearVelocity.Y, O.Z * R);
			end;
		end);
end;
function _G.MasaStartAutoRight()
	local g = _G.MasaAutoPathState;
	if g.rightConn then
		g.rightConn:Disconnect();
	end;
	g.rightPhase = 1;
	g.rightConn = a.Heartbeat:Connect(function()
			if not wl then
				return;
			end;
			local u = e.Character;
			if not u then
				return;
			end;
			local B = u:FindFirstChild("HumanoidRootPart");
			local a = u:FindFirstChildOfClass("Humanoid");
			if not B or not a then
				return;
			end;
			local H = a:GetState();
			if a.PlatformStand or H == Enum.HumanoidStateType.Physics or H == Enum.HumanoidStateType.Ragdoll then
				a:Move(Vector3.zero, false);
				if _G.MasaSetAutoRight then
					_G.MasaSetAutoRight(false);
				end;
				return;
			end;
			local i = _G.MasaAutoPathPoints;
			local R = _G.MasaAutoPathSpeed();
			if g.rightPhase == 1 then
				local u = Vector3.new(i.R1.X, B.Position.Y, i.R1.Z);
				if ((u - B.Position)).Magnitude < 1 then
					g.rightPhase = 2;
					if _G.MasaPathfind then
						_G.MasaPathfind.reset("R1");
					end;
					local u = i.R2 - B.Position;
					local H = (Vector3.new(u.X, 0, u.Z)).Unit;
					a:Move(H, false);
					B.AssemblyLinearVelocity = Vector3.new(H.X * R, B.AssemblyLinearVelocity.Y, H.Z * R);
					return;
				end;
				local H = i.R1 - B.Position;
				local O = (Vector3.new(H.X, 0, H.Z)).Unit;
				if _G.MasaPathfind then
					local g = _G.MasaPathfind.dirTo("R1", B.Position, i.R1);
					if g then
						O = g;
					end;
				end;
				a:Move(O, false);
				B.AssemblyLinearVelocity = Vector3.new(O.X * R, B.AssemblyLinearVelocity.Y, O.Z * R);
			elseif g.rightPhase == 2 then
				local u = Vector3.new(i.R2.X, B.Position.Y, i.R2.Z);
				if ((u - B.Position)).Magnitude < 1 then
					a:Move(Vector3.zero, false);
					B.AssemblyLinearVelocity = Vector3.zero;
					wl = false;
					if g.rightConn then
						g.rightConn:Disconnect();
						g.rightConn = nil;
					end;
					g.rightPhase = 1;
					if _G.MasaSetAutoRightVisual then
						_G.MasaSetAutoRightVisual(false);
					end;
					if _G.MasaRefreshMobileButtonStates then
						_G.MasaRefreshMobileButtonStates();
					end;
					if i.RFace and ((i.RFace - B.Position)).Magnitude > .01 then
						B.CFrame = CFrame.new(B.Position, Vector3.new(i.RFace.X, B.Position.Y, i.RFace.Z));
					end;
					saveMasaConfig();
					return;
				end;
				local H = i.R2 - B.Position;
				local O = (Vector3.new(H.X, 0, H.Z)).Unit;
				if _G.MasaPathfind then
					local g = _G.MasaPathfind.dirTo("R2", B.Position, i.R2);
					if g then
						O = g;
					end;
				end;
				a:Move(O, false);
				B.AssemblyLinearVelocity = Vector3.new(O.X * R, B.AssemblyLinearVelocity.Y, O.Z * R);
			end;
		end);
end;
_G.MasaAutoPlay = _G.MasaAutoPlay or {};
_G.MasaAutoPlay.cfg = {
		RADIUS = 10,
		AT = 2,
		LEFT = { x = -466.48, z = 6.65 },
		RIGHT = { x = -466.9, z = 113.56 },
		WAIT = 25,
		PLACE = 99606176102979,
	};
if _G.MasaAutoPlay.conn then
	pcall(function()
		_G.MasaAutoPlay.conn:Disconnect();
	end);
	_G.MasaAutoPlay.conn = nil;
end;
_G.MasaAutoPlay.side = nil;
function _G.MasaAutoPlay.placeOk()
	local g, u = pcall(function()
			return game.PlaceId;
		end);
	return g and u == _G.MasaAutoPlay.cfg.PLACE;
end;
function _G.MasaAutoPlay.zoneDir()
	local g = _G.MasaAutoPlay;
	local u = e.Character;
	local B = u and u:FindFirstChild("HumanoidRootPart");
	if not B then
		return nil;
	end;
	local a = B.Position;
	local function H(u)
		local B, H = a.X - u.x, a.Z - u.z;
		return math.sqrt(B * B + H * H) <= g.cfg.RADIUS;
	end;
	if H(g.cfg.LEFT) then
		return "L";
	end;
	if H(g.cfg.RIGHT) then
		return "R";
	end;
	return nil;
end;
function _G.MasaAutoPlay.running()
	local g = _G.MasaAutoPlay;
	if g.side == "L" then
		return Xl == true;
	end;
	if g.side == "R" then
		return wl == true;
	end;
	return false;
end;
function _G.MasaAutoPlay.save()
	local g = _G.MasaAutoPlay;
	if not g.placeOk() then
		return;
	end;
	local u, B = pcall(function()
			return tostring(game.JobId or "");
		end);
	if not u or B == "" then
		return;
	end;
	g.saveJob = B;
	g.saveSide = g.side;
	if saveMasaConfig then
		pcall(saveMasaConfig);
	end;
end;
function _G.MasaAutoPlay.setSideOn(g)
	local u = _G.MasaAutoPlay;
	if u.side == "L" then
		if _G.MasaSetAutoLeft then
			_G.MasaSetAutoLeft(g and true or false);
		end;
	elseif u.side == "R" then
		if _G.MasaSetAutoRight then
			_G.MasaSetAutoRight(g and true or false);
		end;
	else
		return;
	end;
	u.save();
	if _G.MasaRefreshMobileButtonStates then
		pcall(_G.MasaRefreshMobileButtonStates);
	end;
end;
function _G.MasaAutoPlay.active()
	return _G.MasaAutoPlay.running();
end;
function _G.MasaAutoPlay.stop()
	local g = _G.MasaAutoPlay;
	if g.conn then
		pcall(function()
			g.conn:Disconnect();
		end);
		g.conn = nil;
	end;
end;
function _G.MasaAutoPlay.watch()
	local g = _G.MasaAutoPlay;
	if g.side then
		return;
	end;
	if g.conn then
		pcall(function()
			g.conn:Disconnect();
		end);
	end;
	g.conn = a.Heartbeat:Connect(function()
			if g.side then
				return;
			end;
			local u, B = pcall(_G.MasaSafeModeCountdownValue);
			if not u or B == nil or B > g.cfg.AT then
				return;
			end;
			local a = g.zoneDir();
			if not a then
				return;
			end;
			g.side = a;
			g.stop();
			g.save();
			if _G.MasaRefreshMobileButtonStates then
				pcall(_G.MasaRefreshMobileButtonStates);
			end;
		end);
end;
function _G.MasaAutoPlay.forget()
	local g = _G.MasaAutoPlay;
	g.saveJob, g.saveSide = nil, nil;
	_G._AmbAutoPlaySavedJob = nil;
	_G._AmbAutoPlaySavedSide = nil;
end;
function _G.MasaAutoPlay.restore()
	local g = _G.MasaAutoPlay;
	if g.side then
		return;
	end;
	if not g.placeOk() then
		return;
	end;
	local u = _G._AmbAutoPlaySavedSide;
	if u ~= "L" and u ~= "R" then
		return;
	end;
	local B, a = pcall(function()
			return tostring(game.JobId or "");
		end);
	if not ((B and (a ~= "" and a == _G._AmbAutoPlaySavedJob))) then
		g.forget();
		return;
	end;
	g.side = u;
	g.stop();
	g.saveJob, g.saveSide = a, u;
	if _G.MasaRefreshMobileButtonStates then
		pcall(_G.MasaRefreshMobileButtonStates);
	end;
end;
function _G.MasaAutoPlayStatus()
	local g = _G.MasaAutoPlay;
	local u, B = pcall(function()
			return tostring(game.JobId or "");
		end);
	return table.concat({
		"lato=" .. tostring(g.side or "nessuno"),
		"ascolto=" .. tostring(g.conn ~= nil),
		"placeOk=" .. tostring(g.placeOk()),
		"jobOra=" .. (((u and (B ~= "" and B)) or "?")),
		"jobRicordo=" .. tostring(g.saveJob or _G._AmbAutoPlaySavedJob or "nessuno"),
	}, " | ");
end;
function _G.MasaAutoPlayToggle()
	local g = _G.MasaAutoPlay;
	if not g.side then
		return;
	end;
	g.setSideOn(not g.running());
end;
pcall(_G.MasaAutoPlay.restore);
pcall(_G.MasaAutoPlay.watch);
e.CharacterAdded:Connect(function(g)
	_G._MasaWaitCharReady(g, 10);
	if Xl and _G.MasaStartAutoLeft then
		_G.MasaStartAutoLeft();
	end;
	if wl and _G.MasaStartAutoRight then
		_G.MasaStartAutoRight();
	end;
end);
local Yj = nil;
local vj = nil;
local function yj(g)
	if Yj then
		pcall(function()
			Yj:Destroy();
		end);
		Yj = nil;
		vj = nil;
		ragdollCountdownLabel = nil;
	end;
	if not g then
		return;
	end;
	local u = g:FindFirstChild("Head") or g:WaitForChild("Head", 5);
	if not u then
		return;
	end;
	Yj = Instance.new("BillboardGui");
	Yj.Name = "MasaHubOverheadInfo";
	Yj.Size = UDim2.new(0, 250, 0, 88);
	Yj.StudsOffset = Vector3.new(0, 1.75, 0);
	Yj.AlwaysOnTop = true;
	Yj.LightInfluence = 0;
	Yj.Parent = u;
	ragdollCountdownLabel = Instance.new("TextLabel");
	ragdollCountdownLabel.Name = "RagdollCountdown";
	ragdollCountdownLabel.Size = UDim2.new(1, 0, 0, 26);
	ragdollCountdownLabel.Position = UDim2.new(0, 0, 0, 0);
	ragdollCountdownLabel.BackgroundTransparency = 1;
	ragdollCountdownLabel.Text = "";
	ragdollCountdownLabel.Visible = false;
	ragdollCountdownLabel.TextColor3 = Color3.fromRGB(80, 255, 120);
	ragdollCountdownLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	ragdollCountdownLabel.TextStrokeTransparency = 0;
	ragdollCountdownLabel.Font = Enum.Font.GothamBlack;
	ragdollCountdownLabel.TextSize = 22;
	ragdollCountdownLabel.TextXAlignment = Enum.TextXAlignment.Center;
	ragdollCountdownLabel.ZIndex = 10;
	ragdollCountdownLabel.Parent = Yj;
	local B = Instance.new("Frame");
	B.Name = "DividerLine";
	B.Size = UDim2.new(.7, 0, 0, 2);
	B.Position = UDim2.new(.15, 0, 0, 55);
	B.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	B.BackgroundTransparency = 0;
	B.BorderSizePixel = 0;
	B.ZIndex = 10;
	B.Parent = Yj;
	local a = Instance.new("UIGradient", B);
	a.Rotation = 0;
	a.Transparency = NumberSequence.new(.3);
	a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
	vj = Instance.new("TextLabel");
	vj.Name = "Speed";
	vj.Size = UDim2.new(1, 0, 0, 26);
	vj.Position = UDim2.new(0, 0, 0, 56);
	vj.BackgroundTransparency = 1;
	vj.Text = "Speed: 0";
	vj.TextColor3 = Color3.fromRGB(255, 255, 255);
	vj.TextStrokeColor3 = Color3.fromRGB(5, 12, 32);
	vj.TextStrokeTransparency = 0;
	vj.Font = Enum.Font.GothamBlack;
	vj.TextSize = 19;
	vj.TextXAlignment = Enum.TextXAlignment.Center;
	vj.ZIndex = 10;
	vj.Parent = Yj;
	local H = Instance.new("UIGradient", vj);
	H.Rotation = 0;
	H.Transparency = NumberSequence.new(0);
	H.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
end;
_G._MasaRCD = _G._MasaRCD or {
		conn = nil,
		charConn = nil,
		endTime = 0,
		seconds = 2.6,
	};
_G._MasaMedusaHitTime = _G._MasaMedusaHitTime or 0;
function stopRagdollCountdown()
	if _G._MasaRCD.conn then
		_G._MasaRCD.conn:Disconnect();
		_G._MasaRCD.conn = nil;
	end;
	if _G._MasaRCD.charConn then
		_G._MasaRCD.charConn:Disconnect();
		_G._MasaRCD.charConn = nil;
	end;
	if ragdollCountdownLabel then
		ragdollCountdownLabel.Visible = false;
		ragdollCountdownLabel.Text = "";
	end;
end;
local Jj = {};
_G.MasaEnemyRagdollData = Jj;
local gF = {};
local uF = nil;
local BF = 2.6;
function _G.MasaStartEnemyRagdollCountdown()
	if enemyRagdollConn then
		return;
	end;
	uF = a.Heartbeat:Connect(function()
			local g = tick();
			for u, B in pairs(Jj) do
				if not B or not B.gui or not B.gui.Parent then
					Jj[u] = nil;
					continue;
				end;
				if B.endTime and B.endTime > g then
					local u = B.endTime - g;
					local a = B.gui:FindFirstChild("Countdown");
					if a then
						a.Text = string.format("RAGDOLL %.1f", u);
						a.TextColor3 = u <= 1 and Color3.fromRGB(255, 230, 90) or Color3.fromRGB(80, 255, 120);
					end;
				else
					pcall(function()
						B.gui:Destroy();
					end);
					Jj[u] = nil;
				end;
			end;
		end);
	local function u(g, u)
		if gF[u] then
			local g = gF[u];
			pcall(function()
				if g.ragdollDetect then
					g.ragdollDetect:Disconnect();
				end;
			end);
			pcall(function()
				if g.stateChange then
					g.stateChange:Disconnect();
				end;
			end);
			gF[u] = nil;
		end;
		local B = g.DescendantAdded:Connect(function(B)
				if B:IsA("BallSocketConstraint") then
					local B = tick();
					local a = Jj[u];
					if not a then
						local a = g:FindFirstChild("Head");
						if a then
							local g = Instance.new("BillboardGui");
							g.Name = "MasaEnemyRagdollCountdown";
							g.Adornee = a;
							g.Size = UDim2.new(0, 120, 0, 30);
							g.StudsOffset = Vector3.new(0, 3.2, 0);
							g.AlwaysOnTop = true;
							g.LightInfluence = 0;
							g.Parent = m;
							local H = Instance.new("TextLabel");
							H.Name = "Countdown";
							H.Size = UDim2.new(1, 0, 1, 0);
							H.BackgroundTransparency = 1;
							H.Text = "";
							H.TextColor3 = Color3.fromRGB(80, 255, 120);
							H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
							H.TextStrokeTransparency = 0;
							H.Font = Enum.Font.GothamBlack;
							H.TextSize = 20;
							H.TextXAlignment = Enum.TextXAlignment.Center;
							H.ZIndex = 10;
							H.Parent = g;
							Jj[u] = { gui = g, endTime = B + BF };
						end;
					else
						a.endTime = B + BF;
					end;
				end;
			end);
		local a = g:FindFirstChildOfClass("Humanoid");
		local H;
		if a then
			H = a.StateChanged:Connect(function(g, B)
					local a = (B == Enum.HumanoidStateType.Physics or B == Enum.HumanoidStateType.Ragdoll);
					if not a then
						local g = Jj[u];
						if g then
							if tick() >= ((g.endTime or 0)) then
								if g.gui then
									pcall(function()
										g.gui:Destroy();
									end);
								end;
								Jj[u] = nil;
							end;
						end;
					end;
				end);
		else
			H = g.AncestryChanged:Connect(function(g, B)
					if not B then
						local g = Jj[u];
						if g and g.gui then
							pcall(function()
								g.gui:Destroy();
							end);
						end;
						Jj[u] = nil;
					end;
				end);
		end;
		gF[u] = { ragdollDetect = B, stateChange = H };
	end;
	local function B(g)
		if g == e then
			return;
		end;
		if gF[g] and gF[g].charAdded then
			pcall(function()
				gF[g].charAdded:Disconnect();
			end);
		end;
		local B = g.CharacterAdded:Connect(function(B)
				if B then
					u(B, g);
				end;
			end);
		if not gF[g] then
			gF[g] = {};
		end;
		gF[g].charAdded = B;
		if g.Character then
			u(g.Character, g);
		end;
	end;
	for g, u in pairs(gF) do
		pcall(function()
			if u.ragdollDetect then
				u.ragdollDetect:Disconnect();
			end;
			if u.stateChange then
				u.stateChange:Disconnect();
			end;
			if u.charAdded then
				u.charAdded:Disconnect();
			end;
		end);
	end;
	gF = {};
	enemyRagdollConn = g.PlayerAdded:Connect(B);
	for g, u in ipairs(g:GetPlayers()) do
		B(u);
	end;
	if _G._MasaEnemyCountdownRemovingConn then
		pcall(function()
			_G._MasaEnemyCountdownRemovingConn:Disconnect();
		end);
	end;
	_G._MasaEnemyCountdownRemovingConn = g.PlayerRemoving:Connect(function(g)
			local u = Jj[g];
			if u and u.gui then
				pcall(function()
					u.gui:Destroy();
				end);
			end;
			Jj[g] = nil;
			if gF[g] then
				pcall(function()
					if gF[g].ragdollDetect then
						gF[g].ragdollDetect:Disconnect();
					end;
					if gF[g].stateChange then
						gF[g].stateChange:Disconnect();
					end;
					if gF[g].charAdded then
						gF[g].charAdded:Disconnect();
					end;
				end);
				gF[g] = nil;
			end;
		end);
end;
function _G.MasaStopEnemyRagdollCountdown()
	if enemyRagdollConn then
		enemyRagdollConn:Disconnect();
		enemyRagdollConn = nil;
	end;
	if uF then
		uF:Disconnect();
		uF = nil;
	end;
	if _G._MasaEnemyCountdownRemovingConn then
		pcall(function()
			_G._MasaEnemyCountdownRemovingConn:Disconnect();
		end);
		_G._MasaEnemyCountdownRemovingConn = nil;
	end;
	for g, u in pairs(gF) do
		pcall(function()
			if u.ragdollDetect then
				u.ragdollDetect:Disconnect();
			end;
			if u.stateChange then
				u.stateChange:Disconnect();
			end;
			if u.charAdded then
				u.charAdded:Disconnect();
			end;
		end);
	end;
	gF = {};
	for g, u in pairs(Jj) do
		if u and u.gui then
			pcall(function()
				u.gui:Destroy();
			end);
		end;
	end;
	for g in pairs(Jj) do
		Jj[g] = nil;
	end;
end;
local aF = stopRagdollCountdown;
function stopRagdollCountdown()
	aF();
	_G.MasaStopEnemyRagdollCountdown();
end;
function hookRagdollCountdown(g)
	stopRagdollCountdown();
	if not K then
		return;
	end;
	_G.MasaStartEnemyRagdollCountdown();
	g = g or e.Character;
	if not g then
		return;
	end;
	local u = g:FindFirstChildOfClass("Humanoid") or g:WaitForChild("Humanoid", 4);
	if not u then
		return;
	end;
	local function B()
		local g = Tj() and 3.6 or _G._MasaRCD.seconds;
		_G._MasaRCD.endTime = tick() + g;
		if ragdollCountdownLabel then
			ragdollCountdownLabel.Visible = true;
		end;
	end;
	local function H()
		local g = u:GetState();
		return u.PlatformStand or g == Enum.HumanoidStateType.Physics or g == Enum.HumanoidStateType.Ragdoll;
	end;
	_G._MasaRCD.charConn = u.StateChanged:Connect(function(g, u)
			if u == Enum.HumanoidStateType.Physics or u == Enum.HumanoidStateType.Ragdoll then
				B();
			end;
		end);
	_G._MasaRCD.conn = a.RenderStepped:Connect(function()
			if not K then
				stopRagdollCountdown();
				return;
			end;
			if not ragdollCountdownLabel or not ragdollCountdownLabel.Parent then
				return;
			end;
			if H() and _G._MasaRCD.endTime < tick() then
				B();
			end;
			local g = math.max(0, _G._MasaRCD.endTime - tick());
			if g > 0 then
				ragdollCountdownLabel.Visible = true;
				ragdollCountdownLabel.Text = string.format("RAGDOLL %.1f", g);
				if g <= 1 then
					ragdollCountdownLabel.TextColor3 = Color3.fromRGB(255, 230, 90);
				else
					ragdollCountdownLabel.TextColor3 = Color3.fromRGB(80, 255, 120);
				end;
			else
				ragdollCountdownLabel.Visible = false;
				ragdollCountdownLabel.Text = "";
			end;
		end);
end;
if e.Character then
	task.spawn(function()
		yj(e.Character);
	end);
end;
e.CharacterAdded:Connect(function(g)
	_G._MasaWaitCharReady(g, 10);
	yj(g);
	if K then
		hookRagdollCountdown(g);
	end;
end);
do
	local g = nil;
	local u = false;
	local function B()
		if g then
			g:Disconnect();
			g = nil;
		end;
		u = true;
		g = a.Heartbeat:Connect(function()
				if not u then
					g:Disconnect();
					g = nil;
					return;
				end;
				local B = e.Character;
				if not B then
					return;
				end;
				local a = B:FindFirstChild("HumanoidRootPart");
				if not a then
					return;
				end;
				local H = B:FindFirstChildOfClass("Humanoid");
				if not H then
					return;
				end;
				local i = H:GetState();
				if H.PlatformStand or i == Enum.HumanoidStateType.Physics or i == Enum.HumanoidStateType.Ragdoll or i == Enum.HumanoidStateType.FallingDown then
					oj = Vector3.new(0, 0, 0);
					return;
				end;
				local R = H.MoveDirection;
				local O = xj();
				if not Xl and (not wl and R.Magnitude > 0) then
					oj = R;
					if _G._MasaZigZagFalling then
						_G._MasaAntiBatDesiredXZ = nil;
					else
						_G._MasaAntiBatDesiredXZ = Vector3.new(R.X * O, 0, R.Z * O);
					end;
					if not _G._MasaAntiBatSpiking and not _G._MasaZigZagFalling then
						local g = a.Velocity;
						a.Velocity = Vector3.new(R.X * O, g.Y, R.Z * O);
					end;
				end;
				if R.Magnitude <= 0 or Xl or wl then
					_G._MasaAntiBatDesiredXZ = nil;
				end;
				if vj then
					local g;
					if _G.MasaNormalAimbotOn then
						g = _G.MasaGetNormalAimbotSpeed and _G.MasaGetNormalAimbotSpeed() or O;
					elseif _G.MasaBatAimbotV2On then
						g = _G.MasaGetBatAimbotV2Speed and _G.MasaGetBatAimbotV2Speed() or O;
					elseif Xl or wl then
						g = _G.MasaAutoPathSpeed();
					elseif _G.MasaAntiBatEnabled then
						g = (R.Magnitude > 0) and O or 0;
					else
						local u = a.AssemblyLinearVelocity;
						local B = (Vector3.new(u.X, 0, u.Z)).Magnitude;
						g = B > 200 and 0 or B;
					end;
					vj.Text = string.format("%.1f", g);
				end;
			end);
	end;
	local function H()
		u = false;
		if g then
			g:Disconnect();
			g = nil;
		end;
		local B = e.Character;
		local a = B and B:FindFirstChild("HumanoidRootPart");
		if a then
			pcall(function()
				local g = a.Velocity;
				a.Velocity = Vector3.new(0, g.Y, 0);
			end);
		end;
		_G._MasaAntiBatDesiredXZ = nil;
	end;
	if e.Character then
		task.wait(.1);
		B();
	else
		e.CharacterAdded:Wait();
		task.wait(.1);
		B();
	end;
end;
local HF = {
		bg = Color3.fromRGB(245, 252, 255),
		row = Color3.fromRGB(255, 255, 255),
		row2 = Color3.fromRGB(255, 220, 235),
		stroke = Color3.fromRGB(255, 105, 180),
		strokeSoft = Color3.fromRGB(255, 160, 200),
		white = Color3.fromRGB(255, 255, 255),
		textDim = Color3.fromRGB(14, 116, 144),
		toggleBg = Color3.fromRGB(255, 235, 245),
		knob = Color3.fromRGB(255, 255, 255),
		cyan = Color3.fromRGB(255, 105, 180),
		ice = Color3.fromRGB(255, 192, 203),
		text = Color3.fromRGB(12, 74, 110),
	};
function corner(g, u)
	local B = Instance.new("UICorner");
	B.CornerRadius = UDim.new(0, u or 10);
	B.Parent = g;
	return B;
end;
function stroke(g, u, B, a)
	local H = Instance.new("UIStroke");
	H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	H.Color = u or HF.stroke;
	H.Thickness = B or 1;
	H.Transparency = a or .35;
	H.Parent = g;
	local i = Instance.new("UIGradient");
	i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
	i.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .55), NumberSequenceKeypoint.new(.5, .1), NumberSequenceKeypoint.new(1, .55) });
	i.Parent = H;
	return H;
end;
function tween(g, u, a)
	(B:Create(g, TweenInfo.new(a or .14, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), u)):Play();
end;
_G._MasaArrowGlyph = function(g)
		if not g then
			return nil, nil;
		end;
		local u = g:FindFirstChild("GlyphUp");
		local B = g:FindFirstChild("GlyphDown");
		if not u then
			local function a(u, B)
				local a = Instance.new("TextLabel");
				a.Name = u;
				a.BackgroundTransparency = 1;
				a.Size = UDim2.new(1, 0, 1, 0);
				a.Position = UDim2.new(0, 0, 0, 0);
				a.Text = B;
				a.TextColor3 = g.TextColor3;
				a.TextStrokeColor3 = g.TextStrokeColor3;
				a.TextStrokeTransparency = g.TextStrokeTransparency;
				a.TextSize = g.TextSize;
				a.Font = g.Font;
				a.TextXAlignment = Enum.TextXAlignment.Center;
				a.TextYAlignment = Enum.TextYAlignment.Center;
				a.ZIndex = ((g.ZIndex or 1)) + 1;
				a.Parent = g;
				return a;
			end;
			u = a("GlyphUp", "\226\150\178");
			B = a("GlyphDown", "\226\150\188");
			B.TextTransparency = 1;
			B.TextStrokeTransparency = 1;
			g.Text = "";
		end;
		return u, B;
	end;
_G._MasaAccentList = _G._MasaAccentList or {};
_G.MasaHalloweenTheme = _G.MasaHalloweenTheme == true;
_G._MasaAccentIsGrey = function()
		return false;
	end;
_G._MasaThemePalette = function()
		if _G.MasaHalloweenTheme == true then
			return {
				c0 = Color3.fromRGB(255, 237, 213),
				c1 = Color3.fromRGB(249, 115, 22),
				c2 = Color3.fromRGB(234, 88, 12),
				edge = Color3.fromRGB(253, 186, 116),
				soft = Color3.fromRGB(249, 115, 22),
				base = Color3.fromRGB(249, 115, 22),
				on = Color3.fromRGB(234, 88, 12),
				onEdge = Color3.fromRGB(253, 186, 116),
				panel0 = Color3.fromRGB(255, 237, 213),
				panel1 = Color3.fromRGB(253, 186, 116),
				panel2 = Color3.fromRGB(251, 146, 60),
				panel3 = Color3.fromRGB(234, 88, 12),
				row = Color3.fromRGB(255, 237, 213),
				row2 = Color3.fromRGB(254, 215, 170),
			};
		end;
		return {
			c0 = Color3.fromRGB(255, 220, 235),
			c1 = Color3.fromRGB(255, 105, 180),
			c2 = Color3.fromRGB(255, 160, 200),
			edge = Color3.fromRGB(255, 192, 203),
			soft = Color3.fromRGB(255, 105, 180),
			base = Color3.fromRGB(255, 105, 180),
			on = Color3.fromRGB(255, 105, 180),
			onEdge = Color3.fromRGB(255, 192, 203),
			panel0 = Color3.fromRGB(255, 255, 255),
			panel1 = Color3.fromRGB(255, 240, 245),
			panel2 = Color3.fromRGB(255, 220, 235),
			panel3 = Color3.fromRGB(255, 192, 203),
			row = Color3.fromRGB(255, 255, 255),
			row2 = Color3.fromRGB(255, 220, 235),
		};
	end;
_G._MasaApplyAccent = function()
		local g = _G._MasaAccentIsGrey();
		local u = _G._MasaThemePalette and _G._MasaThemePalette() or nil;
		local B, a, H, i, R, O;
		if g then
			B = Color3.fromRGB(126, 126, 138);
			a = Color3.fromRGB(62, 62, 70);
			H = Color3.fromRGB(20, 20, 24);
			i = Color3.fromRGB(178, 178, 192);
			R = Color3.fromRGB(92, 92, 102);
			O = Color3.fromRGB(62, 62, 70);
		elseif u then
			B, a, H, i, R, O = u.c0, u.c1, u.c2, u.edge, u.soft, u.base;
		else
			B = Color3.fromRGB(255, 220, 235);
			a = Color3.fromRGB(255, 105, 180);
			H = Color3.fromRGB(255, 160, 200);
			i = Color3.fromRGB(255, 192, 203);
			R = Color3.fromRGB(255, 105, 180);
			O = Color3.fromRGB(255, 105, 180);
		end;
		local c = ColorSequence.new({ ColorSequenceKeypoint.new(0, B), ColorSequenceKeypoint.new(.5, a), ColorSequenceKeypoint.new(1, H) });
		local h = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		local Q = NumberSequence.new({ NumberSequenceKeypoint.new(0, .12), NumberSequenceKeypoint.new(.5, .05), NumberSequenceKeypoint.new(1, .12) });
		local e = _G._MasaAccentList;
		for g = #e, 1, -1 do
			local u = e[g];
			if not ((u and (u.obj and u.obj.Parent))) then
				table.remove(e, g);
			else
				local g = u.obj:FindFirstChildOfClass("UIStroke");
				if u.kind == "soft" then
					if g then
						g.Color = R;
					end;
				elseif u.kind == "button" then
					if not ((u.grad and u.grad.Enabled == false)) then
						u.obj.BackgroundColor3 = O;
						u.obj.BackgroundTransparency = 0;
						if u.grad then
							u.grad.Color = c;
						end;
						if g then
							g.Color = i;
						end;
					end;
				elseif u.kind == "toggle" then
					u.obj.BackgroundColor3 = O;
					if u.grad then
						u.grad.Color = c;
					end;
					local g = (u.obj.BackgroundTransparency < .5);
					if u.track then
						if g then
							u.track.BackgroundColor3 = O;
						end;
						local B = u.track:FindFirstChildOfClass("UIStroke");
						if B and g then
							B.Color = i;
						end;
					end;
					if u.knob and g then
						local g = u.knob:FindFirstChildOfClass("UIStroke");
						if g then
							g.Color = i;
						end;
					end;
					if u.row and g then
						local g = u.row:FindFirstChildOfClass("UIStroke");
						if g then
							g.Color = O;
						end;
					end;
				else
					u.obj.BackgroundColor3 = O;
					u.obj.BackgroundTransparency = (u.kind == "slide") and .1 or .28;
					if u.grad then
						u.grad.Color = c;
						u.grad.Transparency = (u.kind == "slide") and h or Q;
					end;
					if g then
						g.Color = i;
					end;
				end;
			end;
		end;
	end;
_G._MasaRegAccent = function(g, u, B, a, H, i)
		if not g then
			return;
		end;
		table.insert(_G._MasaAccentList, {
			obj = g,
			grad = u,
			kind = B or "pick",
			track = a,
			knob = H,
			row = i,
		});
		pcall(_G._MasaApplyAccent);
	end;
_G._MasaToggleOnColor = function()
		if _G._MasaAccentIsGrey() then
			return Color3.fromRGB(62, 62, 70), Color3.fromRGB(178, 178, 192);
		end;
		local g = _G._MasaThemePalette and _G._MasaThemePalette();
		if g then
			return g.on, g.onEdge;
		end;
		return Color3.fromRGB(255, 105, 180), Color3.fromRGB(255, 192, 203);
	end;
_G.MasaApplyHalloweenTheme = function()
		local g = _G.MasaHalloweenTheme == true;
		local u = _G._MasaThemePalette and _G._MasaThemePalette();
		if not u then
			return;
		end;
		local B = _G._MasaMainFrame;
		local a = _G._MasaMiniFrame;
		pcall(function()
			if not B or not B.Parent then
				local g = m and ((m:FindFirstChild("MasaHub") or m:FindFirstChild("MasaHub")));
				B = g and g:FindFirstChild("Main");
				if B then
					_G._MasaMainFrame = B;
				end;
				a = g and g:FindFirstChild("MiniFrame");
				if a then
					_G._MasaMiniFrame = a;
				end;
			end;
		end);
		local H = B;
		local i = a;
		pcall(function()
			if _G._MasaApplyAccent then
				_G._MasaApplyAccent();
			end;
		end);
		local function R(g)
			if not g then
				return false;
			end;
			local u, B, a = g.R, g.G, g.B;
			if a > .55 and (a > u + .04 and a >= B * .85) then
				return true;
			end;
			local H = (((u + B) + a)) / 3;
			if H > .88 and (a >= u - .02 and (a >= B - .02 and (a - u) > -0.01)) then
				if a > u + .01 or (H > .92 and B > .9) then
					return true;
				end;
			end;
			if H > .96 and (math.abs(u - B) < .03 and math.abs(B - a) < .03) then
				return true;
			end;
			return false;
		end;
		local function O(g)
			if not g then
				return g;
			end;
			local B, a, H = g.R, g.G, g.B;
			local i = (((B + a) + H)) / 3;
			if i > .92 then
				return u.panel0;
			end;
			if i > .82 then
				return u.panel1;
			end;
			if i > .7 then
				return u.panel2;
			end;
			if H > .6 and H > B then
				return u.base;
			end;
			if H > .4 and H > B then
				return u.on;
			end;
			return u.edge;
		end;
		local function c(g, u, B)
			if g:GetAttribute(u) == nil then
				g:SetAttribute(u, string.format("%.4f,%.4f,%.4f", B.R, B.G, B.B));
			end;
		end;
		local function h(g, u)
			local B = g:GetAttribute(u);
			if type(B) ~= "string" then
				return nil;
			end;
			local a, H, i = string.match(B, "([%d%.]+),([%d%.]+),([%d%.]+)");
			if a then
				return Color3.new(tonumber(a), tonumber(H), tonumber(i));
			end;
			return nil;
		end;
		local function Q(B)
			if not B or not B:IsA("UIStroke") then
				return;
			end;
			if g then
				c(B, "_HwOrigStroke", B.Color);
				if R(B.Color) or true then
					B.Color = u.edge;
				end;
			else
				local g = h(B, "_HwOrigStroke");
				if g then
					B.Color = g;
				end;
			end;
		end;
		local function e(B)
			if not B or not B:IsA("UIGradient") then
				return;
			end;
			local a = B.Parent;
			if a and ((a:IsA("TextLabel") or a:IsA("TextBox"))) then
				return;
			end;
			if g then
				if B:GetAttribute("_HwOrigGrad") == nil then
					local g, u = pcall(function()
							return B.Color;
						end);
					if g and u then
						local g = u.Keypoints[1] and u.Keypoints[1].Value;
						local a = u.Keypoints[math.ceil(#u.Keypoints / 2)] and u.Keypoints[math.ceil(#u.Keypoints / 2)].Value;
						local H = u.Keypoints[#u.Keypoints] and u.Keypoints[#u.Keypoints].Value;
						if g then
							c(B, "_HwOrigG0", g);
						end;
						if a then
							c(B, "_HwOrigG1", a);
						end;
						if H then
							c(B, "_HwOrigG2", H);
						end;
						B:SetAttribute("_HwOrigGrad", true);
					end;
				end;
				B.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, u.panel0),
						ColorSequenceKeypoint.new(.4, u.base),
						ColorSequenceKeypoint.new(.75, u.on),
						ColorSequenceKeypoint.new(1, u.edge),
					});
			else
				if B:GetAttribute("_HwOrigGrad") then
					local g = h(B, "_HwOrigG0") or Color3.fromRGB(255, 255, 255);
					local u = h(B, "_HwOrigG1") or Color3.fromRGB(255, 105, 180);
					local a = h(B, "_HwOrigG2") or Color3.fromRGB(255, 192, 203);
					B.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, g), ColorSequenceKeypoint.new(.5, u), ColorSequenceKeypoint.new(1, a) });
				end;
			end;
		end;
		local function P(B)
			if not B then
				return;
			end;
			if B:IsA("TextLabel") or B:IsA("TextBox") then
				return;
			end;
			if B:IsA("GuiObject") and B.BackgroundTransparency < .98 then
				local a = B.BackgroundColor3;
				if g then
					c(B, "_HwOrigBg", a);
					if R(a) or B.Name == "Main" or B.Name == "MiniFrame" or B.Name == "HudBar" or B.Name == "BrandBadge" or B.Name == "MiniBadge" or B.Name == "HeaderDivider" or B.Name == "Close" or B.Name == "StealBar" or B.Name == "Track" or B.Name == "Wash" or B.Name == "Scrim" or B.Name == "Badge" then
						B.BackgroundColor3 = O(a);
					elseif R(a) then
						B.BackgroundColor3 = O(a);
					else
						local g = (((a.R + a.G) + a.B)) / 3;
						if g > .85 then
							B.BackgroundColor3 = u.row;
						elseif g > .7 and a.B >= a.R then
							B.BackgroundColor3 = u.row2;
						end;
					end;
				else
					local g = h(B, "_HwOrigBg");
					if g then
						B.BackgroundColor3 = g;
					end;
				end;
			end;
			for g, u in ipairs(B:GetChildren()) do
				if u:IsA("UIStroke") then
					Q(u);
				end;
				if u:IsA("UIGradient") then
					e(u);
				end;
			end;
		end;
		local Z = {};
		pcall(function()
			if H and H.Parent then
				table.insert(Z, H);
			end;
		end);
		pcall(function()
			if i and i.Parent then
				table.insert(Z, i);
			end;
		end);
		pcall(function()
			local g = _G._MasaFloatUiBar;
			if g and g.Parent then
				table.insert(Z, g);
			end;
		end);
		pcall(function()
			if m then
				local g = m:FindFirstChild("MasaHubStealBarGui");
				if g then
					table.insert(Z, g);
				end;
				local u = m:FindFirstChild("MasaTopHud");
				if u then
					table.insert(Z, u);
				end;
			end;
		end);
		pcall(function()
			for g, u in pairs(_G.MasaMobileButtonRefs or {}) do
				if u and (u.holder and u.holder.Parent) then
					table.insert(Z, u.holder);
				end;
			end;
		end);
		for g, u in ipairs(Z) do
			pcall(function()
				P(u);
				for g, u in ipairs(u:GetDescendants()) do
					if u:IsA("UIStroke") then
						Q(u);
					elseif u:IsA("UIGradient") then
						e(u);
					elseif u:IsA("Frame") or u:IsA("TextButton") or u:IsA("ImageButton") or u:IsA("ScrollingFrame") or u:IsA("ImageLabel") then
						if u:IsA("ImageLabel") and u.BackgroundTransparency >= .98 then
 
						else
							P(u);
						end;
					end;
				end;
			end);
		end;
		pcall(function()
			if not H or not H.Parent then
				return;
			end;
			local function u(u, B, a)
				local i = H:FindFirstChild(u);
				if not i then
					i = Instance.new("TextLabel");
					i.Name = u;
					i.BackgroundTransparency = 1;
					i.Text = "\240\159\142\131";
					i.TextSize = 22;
					i.Font = Enum.Font.GothamBlack;
					i.TextXAlignment = Enum.TextXAlignment.Center;
					i.TextYAlignment = Enum.TextYAlignment.Center;
					i.ZIndex = 20;
					i.Size = UDim2.new(0, 28, 0, 28);
					i.AnchorPoint = B;
					i.Position = a;
					i.Parent = H;
				end;
				i.Visible = g;
			end;
			u("HwPumpkinTL", Vector2.new(0, 0), UDim2.new(0, 6, 0, 4));
			u("HwPumpkinTR", Vector2.new(1, 0), UDim2.new(1, -6, 0, 4));
			u("HwPumpkinBL", Vector2.new(0, 1), UDim2.new(0, 6, 1, -6));
			u("HwPumpkinBR", Vector2.new(1, 1), UDim2.new(1, -6, 1, -6));
		end);
		pcall(function()
			if not H or not H.Parent then
				return;
			end;
			local u = H:FindFirstChild("HalloweenMenuBg");
			if not u then
				u = Instance.new("Frame");
				u.Name = "HalloweenMenuBg";
				u.Size = UDim2.new(1, 0, 1, 0);
				u.Position = UDim2.new(0, 0, 0, 0);
				u.BorderSizePixel = 0;
				u.ZIndex = 0;
				u.Active = false;
				u.Parent = H;
				local g = Instance.new("UICorner");
				g.CornerRadius = UDim.new(0, 20);
				g.Parent = u;
				local B = Instance.new("UIGradient");
				B.Name = "HwBgGrad";
				B.Rotation = 125;
				B.Parent = u;
			end;
			local B = u:FindFirstChild("HwBgGrad");
			if g then
				u.Visible = true;
				u.ZIndex = 0;
				u.BackgroundColor3 = Color3.fromRGB(251, 146, 60);
				u.BackgroundTransparency = 0;
				if B then
					B.Enabled = true;
					B.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 120)), ColorSequenceKeypoint.new(.4, Color3.fromRGB(251, 146, 60)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 88, 12)) });
				end;
				do
					local g = H.BackgroundColor3;
					local u = (g.R > .85 and (g.G > .4 and (g.G < .75 and g.B < .45)));
					if not u then
						c(H, "_HwOrigBg", g);
					elseif H:GetAttribute("_HwOrigBg") == nil then
						H:SetAttribute("_HwOrigBg", string.format("%.4f,%.4f,%.4f", .97254901960784, .98039215686275, .98823529411765));
					end;
				end;
				H.BackgroundColor3 = Color3.fromRGB(251, 146, 60);
				local g = H:FindFirstChild("MasaPanelGrad");
				if g and g:IsA("UIGradient") then
					if g:GetAttribute("_HwOrigGrad") == nil then
						local u = g.Color.Keypoints;
						local B = u[1] and u[1].Value;
						local a = u[math.ceil(#u / 2)] and u[math.ceil(#u / 2)].Value;
						local H = u[#u] and u[#u].Value;
						if B then
							c(g, "_HwOrigG0", B);
						end;
						if a then
							c(g, "_HwOrigG1", a);
						end;
						if H then
							c(g, "_HwOrigG2", H);
						end;
						g:SetAttribute("_HwOrigGrad", true);
					end;
					g.Enabled = false;
				end;
				local a = H:FindFirstChild("CustomBackground");
				if a then
					if a:GetAttribute("_HwWasVisible") == nil then
						a:SetAttribute("_HwWasVisible", a.Visible and true or false);
					end;
					a.Visible = false;
				end;
			else
				if u then
					u.Visible = false;
					u.BackgroundTransparency = 1;
				end;
				H.BackgroundColor3 = Color3.fromRGB(255, 240, 245);
				local g = H:FindFirstChild("MasaPanelGrad");
				if g and g:IsA("UIGradient") then
					g.Enabled = true;
					g.Rotation = 115;
					g.Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(.35, Color3.fromRGB(255, 240, 245)),
							ColorSequenceKeypoint.new(.72, Color3.fromRGB(255, 220, 235)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)),
						});
				end;
				for g, u in ipairs(H:GetChildren()) do
					if u:IsA("UIStroke") then
						if u.Name == "PanelOuterGlow" then
							u.Color = Color3.fromRGB(255, 105, 180);
						else
							u.Color = Color3.fromRGB(255, 160, 200);
						end;
					end;
				end;
				local B = H:FindFirstChild("CustomBackground");
				if B then
					if B:GetAttribute("_HwWasVisible") ~= nil then
						B.Visible = (B:GetAttribute("_HwWasVisible") == true);
					end;
				end;
				for g, u in ipairs(H:GetDescendants()) do
					if u:IsA("GuiObject") then
						local g = h(u, "_HwOrigBg");
						if g then
							u.BackgroundColor3 = g;
						end;
					end;
					if u:IsA("UIStroke") then
						local g = h(u, "_HwOrigStroke");
						if g then
							u.Color = g;
						end;
					end;
					if u:IsA("UIGradient") and u:GetAttribute("_HwOrigGrad") then
						local g = h(u, "_HwOrigG0");
						local B = h(u, "_HwOrigG1");
						local a = h(u, "_HwOrigG2");
						if g and (B and a) then
							u.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, g), ColorSequenceKeypoint.new(.5, B), ColorSequenceKeypoint.new(1, a) });
						end;
						if u.Name ~= "MasaPanelGrad" then
 
						end;
					end;
				end;
			end;
		end);
		pcall(function()
			if not i or not i.Parent then
				return;
			end;
			if g then
				c(i, "_HwOrigBg", i.BackgroundColor3);
				i.BackgroundColor3 = Color3.fromRGB(251, 146, 60);
			else
				i.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				local g = i:FindFirstChildOfClass("UIStroke");
				if g then
					g.Color = Color3.fromRGB(255, 105, 180);
				end;
				local u = i:FindFirstChildOfClass("UIGradient");
				if u then
					u.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 235, 245)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
				end;
			end;
		end);
		pcall(function()
			if _G.MasaApplyButtonShape then
				_G.MasaApplyButtonShape();
			end;
			if _G.MasaRefreshMobileButtonStates then
				_G.MasaRefreshMobileButtonStates();
			end;
			if _G.MasaHalloweenTheme == true then
				for g, u in pairs(_G.MasaMobileButtonRefs or {}) do
					local B = u and u.btn;
					local a = u and u.holder;
					local H = a and a:FindFirstChild("HwGhostScallop");
					if B and H then
						for g, u in ipairs(H:GetChildren()) do
							if u:IsA("Frame") then
								u.BackgroundColor3 = B.BackgroundColor3;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
_G._MasaClampCanvas = function(g)
		if not g or not g.Parent then
			return;
		end;
		if not g:IsA("ScrollingFrame") then
			return;
		end;
		task.defer(function()
			if not g or not g.Parent then
				return;
			end;
			local u = math.max(0, g.AbsoluteCanvasSize.Y - g.AbsoluteWindowSize.Y);
			local B = g.CanvasPosition;
			if B.Y > u then
				g.CanvasPosition = Vector2.new(B.X, u);
			end;
		end);
	end;
_G._MasaExpand = function(g, u, a, H)
		if not g or not g.Parent then
			return;
		end;
		g.ClipsDescendants = true;
		local i = TweenInfo.new(.22, Enum.EasingStyle.Quart, u and Enum.EasingDirection.Out or Enum.EasingDirection.In);
		g:SetAttribute("_expandToken", ((g:GetAttribute("_expandToken") or 0)) + 1);
		local R = g:GetAttribute("_expandToken");
		local O, c = _G._MasaArrowGlyph(H);
		if O and c then
			local g = H.TextStrokeTransparency;
			(B:Create(O, i, { TextTransparency = u and 1 or 0, TextStrokeTransparency = u and 1 or g })):Play();
			(B:Create(c, i, { TextTransparency = u and 0 or 1, TextStrokeTransparency = u and g or 1 })):Play();
		end;
		local h = g.Parent;
		local Q, e = g.Size.X.Scale, g.Size.X.Offset;
		if u then
			g.Visible = true;
			if g.Size.Y.Offset >= a then
				g.Size = UDim2.new(Q, e, 0, 0);
			end;
			(B:Create(g, i, { Size = UDim2.new(Q, e, 0, a) })):Play();
		else
			local u = B:Create(g, i, { Size = UDim2.new(Q, e, 0, 0) });
			u.Completed:Connect(function()
				if g and (g.Parent and g:GetAttribute("_expandToken") == R) then
					g.Visible = false;
				end;
				_G._MasaClampCanvas(h);
			end);
			u:Play();
		end;
	end;
_G._MasaExpandAuto = function(g, u, a, H)
		if not g or not g.Parent then
			return;
		end;
		g.ClipsDescendants = true;
		local i = TweenInfo.new(.26, Enum.EasingStyle.Quart, u and Enum.EasingDirection.Out or Enum.EasingDirection.In);
		g:SetAttribute("_expandToken", ((g:GetAttribute("_expandToken") or 0)) + 1);
		local R = g:GetAttribute("_expandToken");
		local O, c = _G._MasaArrowGlyph(H);
		if O and c then
			local g = H.TextStrokeTransparency;
			(B:Create(O, i, { TextTransparency = u and 1 or 0, TextStrokeTransparency = u and 1 or g })):Play();
			(B:Create(c, i, { TextTransparency = u and 0 or 1, TextStrokeTransparency = u and g or 1 })):Play();
		end;
		local function h()
			local u, B = 0, 0;
			for g, a in ipairs(g:GetChildren()) do
				if a:IsA("GuiObject") and a.Visible then
					u = u + a.Size.Y.Offset;
					B = B + 1;
				end;
			end;
			if a and (a:IsA("UIListLayout") and B > 1) then
				u = u + a.Padding.Offset * ((B - 1));
			end;
			if u <= 0 and a then
				u = a.AbsoluteContentSize.Y;
			end;
			local H = g:FindFirstChildOfClass("UIPadding");
			if H then
				u = (u + H.PaddingTop.Offset) + H.PaddingBottom.Offset;
			end;
			return u;
		end;
		local Q, e = g.Size.X.Scale, g.Size.X.Offset;
		if u then
			g.AutomaticSize = Enum.AutomaticSize.None;
			g.Visible = true;
			g.Size = UDim2.new(Q, e, 0, 0);
			local u = B:Create(g, i, { Size = UDim2.new(Q, e, 0, h()) });
			u.Completed:Connect(function()
				if g and (g.Parent and g:GetAttribute("_expandToken") == R) then
					g.Size = UDim2.new(Q, e, 0, 0);
					g.AutomaticSize = Enum.AutomaticSize.Y;
					g.ClipsDescendants = false;
					_G._MasaClampCanvas(g.Parent);
				end;
			end);
			u:Play();
		else
			g.AutomaticSize = Enum.AutomaticSize.None;
			g.Size = UDim2.new(Q, e, 0, h());
			local u = g.Parent;
			local a = B:Create(g, i, { Size = UDim2.new(Q, e, 0, 0) });
			a.Completed:Connect(function()
				if g and (g.Parent and g:GetAttribute("_expandToken") == R) then
					g.Visible = false;
				end;
				_G._MasaClampCanvas(u);
			end);
			a:Play();
		end;
	end;
function makeDraggable(g)
	local B = false;
	local a;
	local H;
	local i;
	g.InputBegan:Connect(function(u)
		if _G.MasaGuiLocked == true then
			return;
		end;
		if u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch then
			B = true;
			a = u.Position;
			H = g.Position;
			u.Changed:Connect(function()
				if u.UserInputState == Enum.UserInputState.End then
					B = false;
				end;
			end);
		end;
	end);
	g.InputChanged:Connect(function(g)
		if g.UserInputType == Enum.UserInputType.MouseMovement or g.UserInputType == Enum.UserInputType.Touch then
			i = g;
		end;
	end);
	u.InputChanged:Connect(function(u)
		if _G.MasaGuiLocked == true then
			return;
		end;
		if u == i and B then
			local B = u.Position - a;
			g.Position = UDim2.new(H.X.Scale, H.X.Offset + B.X, H.Y.Scale, H.Y.Offset + B.Y);
		end;
	end);
end;
local iF = Instance.new("ScreenGui");
iF.Name = "MasaHub";
iF.ResetOnSpawn = false;
iF.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
iF.Parent = m;
local RF = UDim2.new(0, 400, 0, 508);
local OF = Instance.new("Frame");
OF.Name = "Main";
OF.AnchorPoint = Vector2.new(0, .5);
OF.Size = RF;
do
	local g = UDim2.new(0, 18, .5, 0);
	local u = savedMainPositionTable;
	if type(u) == "table" then
		local g = tonumber(u.sx) or tonumber(u[1]);
		local B = tonumber(u.sy) or tonumber(u[3]);
		local a = tonumber(u.ox) or tonumber(u[2]) or 0;
		local H = tonumber(u.oy) or tonumber(u[4]) or 0;
		if g == .5 and (B == .5 and (math.abs(a) < 2 and math.abs(H) < 2)) then
			u = nil;
		end;
	end;
	OF.Position = tableToUDim2(u, g);
end;
savedMainPositionTable = udim2ToTable(OF.Position);
_G._MasaMainFrame = OF;
OF.BackgroundColor3 = Color3.fromRGB(255, 240, 245);
OF.BorderSizePixel = 0;
OF.Active = true;
OF.ClipsDescendants = true;
OF.Parent = iF;
corner(OF, 20);
do
	local g = Instance.new("UIGradient");
	g.Name = "MasaPanelGrad";
	g.Rotation = 115;
	g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
			ColorSequenceKeypoint.new(.35, Color3.fromRGB(255, 240, 245)),
			ColorSequenceKeypoint.new(.72, Color3.fromRGB(255, 220, 235)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)),
		});
	g.Parent = OF;
end;
stroke(OF, Color3.fromRGB(255, 160, 200), 1.6, .18);
do
	local g = Instance.new("UIStroke");
	g.Name = "PanelOuterGlow";
	g.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	g.Color = Color3.fromRGB(255, 105, 180);
	g.Thickness = 3.5;
	g.Transparency = .88;
	g.Parent = OF;
end;
makeDraggable(OF);
_G._MasaHubRestPos = OF.Position;
(OF:GetPropertyChangedSignal("Position")):Connect(function()
	if _G._MasaHubAnimating then
		return;
	end;
	_G._MasaHubRestPos = OF.Position;
	savedMainPositionTable = udim2ToTable(OF.Position);
end);
local cF = Instance.new("ImageLabel");
cF.Name = "MasaTitleImage";
cF.AnchorPoint = Vector2.new(.5, 0);
cF.Position = UDim2.new(.5, 0, 0, -106);
cF.Size = UDim2.new(0, 1000, 0, 300);
cF.BackgroundTransparency = 1;
cF.Image = "rbxassetid://128938872032759";
cF.ScaleType = Enum.ScaleType.Fit;
cF.ZIndex = 5;
cF.Visible = false;
cF.Parent = OF;
_G.MasaTitleStyles = { { image = "rbxassetid://128938872032759", scale = 1, prev = 2.5 }, { image = "rbxassetid://80924330621180", scale = .64, prev = 1.3 }, { image = "rbxassetid://105333739149934", scale = .56, prev = 1.3 } };
_G.MasaTitleStyle = math.clamp(math.floor(tonumber(_G.MasaTitleStyle or (savedConfig and savedConfig.titleStyle)) or 1), 1, #_G.MasaTitleStyles);
_G.MasaApplyTitleStyle = function(g)
		g = math.clamp(math.floor(tonumber(g) or 1), 1, #_G.MasaTitleStyles);
		_G.MasaTitleStyle = g;
		local u = _G.MasaTitleStyles[g];
		pcall(function()
			local g = tonumber(u.scale) or 1;
			cF.Image = "";
			cF.Size = UDim2.new(0, 1000 * g, 0, 300 * g);
			cF.Position = UDim2.new(.5, 0, 0, 44 - 150 * g);
			cF.Visible = false;
		end);
	end;
_G.MasaApplyTitleStyle(_G.MasaTitleStyle);
local hF = Instance.new("Frame");
hF.Name = "MiniFrame";
hF.AnchorPoint = Vector2.new(0, 0);
hF.Size = UDim2.new(0, 74, 0, 36);
local QF = UDim2.new(0, 132, 0, 112);
hF.Position = tableToUDim2(savedMiniPositionTable, QF);
savedMiniPositionTable = udim2ToTable(hF.Position);
hF.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
hF.BackgroundTransparency = 0;
hF.BorderSizePixel = 0;
hF.Visible = false;
hF.Active = true;
hF.ZIndex = 20;
hF.Parent = iF;
_G._MasaMiniFrame = hF;
corner(hF, 20);
stroke(hF, Color3.fromRGB(255, 105, 180), 1.2, .05);
local eF = Instance.new("TextButton");
eF.Name = "MiniButton";
eF.Size = UDim2.new(1, 0, 1, 0);
eF.Position = UDim2.new(0, 0, 0, 0);
eF.BackgroundTransparency = 1;
eF.Text = "";
eF.TextColor3 = Color3.fromRGB(220, 60, 140);
eF.TextStrokeTransparency = 1;
eF.TextSize = 12;
eF.Font = Enum.Font.GothamBlack;
eF.AutoButtonColor = false;
eF.ZIndex = 21;
eF.Parent = hF;
do
	local g = Instance.new("Frame");
	g.Name = "MiniBadge";
	g.Size = UDim2.new(0, 18, 0, 18);
	g.Position = UDim2.new(0, 8, .5, -9);
	g.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	g.BorderSizePixel = 0;
	g.ZIndex = 22;
	g.Parent = eF;
	corner(g, 5);
	local u = Instance.new("UIGradient");
	u.Rotation = 135;
	u.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
	u.Parent = g;
	stroke(g, Color3.fromRGB(255, 160, 200), 1.1, .2);
	local B = Instance.new("TextLabel");
	B.BackgroundTransparency = 1;
	B.Size = UDim2.new(1, 0, 1, 0);
	B.Text = "M";
	B.TextColor3 = Color3.fromRGB(255, 255, 255);
	B.Font = Enum.Font.GothamBlack;
	B.TextSize = 11;
	B.TextXAlignment = Enum.TextXAlignment.Center;
	B.ZIndex = 23;
	B.Parent = g;
	local a = Instance.new("TextLabel");
	a.BackgroundTransparency = 1;
	a.Size = UDim2.new(1, -28, 1, 0);
	a.Position = UDim2.new(0, 28, 0, 0);
	a.Text = "Masa Hub";
	a.TextColor3 = Color3.fromRGB(220, 60, 140);
	a.Font = Enum.Font.GothamBlack;
	a.TextSize = 11;
	a.TextXAlignment = Enum.TextXAlignment.Left;
	a.TextYAlignment = Enum.TextYAlignment.Center;
	a.ZIndex = 22;
	a.Parent = eF;
end;
hF.Size = UDim2.new(0, 96, 0, 36);
local PF = Instance.new("UIGradient", hF);
PF.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 235, 245)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
local mF = Instance.new("ImageLabel");
mF.Name = "MiniLogo";
mF.AnchorPoint = Vector2.new(.5, .5);
mF.Position = UDim2.new(.5, 0, .5, 0);
mF.Size = UDim2.new(4, 0, 4, 0);
mF.BackgroundTransparency = 1;
mF.Image = "";
mF.ScaleType = Enum.ScaleType.Fit;
mF.ZIndex = 22;
mF.Visible = false;
mF.Parent = eF;
do
	local g = false;
	local B = nil;
	local a = nil;
	local H = false;
	local i = nil;
	local R = 6;
	eF.InputBegan:Connect(function(u)
		if u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch then
			g = true;
			H = false;
			i = u;
			B = u.Position;
			a = hF.Position;
		end;
	end);
	u.InputChanged:Connect(function(u)
		if not g then
			return;
		end;
		if u.UserInputType ~= Enum.UserInputType.MouseMovement and u.UserInputType ~= Enum.UserInputType.Touch then
			return;
		end;
		if not B or not a then
			return;
		end;
		local i = u.Position - B;
		if math.abs(i.X) > R or math.abs(i.Y) > R then
			H = true;
		end;
		hF.Position = UDim2.new(a.X.Scale, a.X.Offset + i.X, a.Y.Scale, a.Y.Offset + i.Y);
	end);
	u.InputEnded:Connect(function(u)
		if u ~= i then
			return;
		end;
		local R = H;
		g = false;
		i = nil;
		B = nil;
		a = nil;
		if R then
			savedMiniPositionTable = udim2ToTable(hF.Position);
			pcall(saveMasaConfig);
			return;
		end;
		if _G.MasaHubOpen then
			_G.MasaHubOpen();
		else
			OF.Visible = true;
			hF.Visible = false;
			OF.Size = RF;
			savedMainPositionTable = udim2ToTable(OF.Position);
		end;
	end);
end;
_G._MasaHubAnimating = false;
_G._MasaHubAnimToken = 0;
_G._MasaHubEdgeFor = function(g)
		local u = workspace.CurrentCamera;
		local B = (u and u.ViewportSize) or Vector2.new(1920, 1080);
		if B.X < 1 or B.Y < 1 then
			B = Vector2.new(1920, 1080);
		end;
		local a = g.X.Scale * B.X + g.X.Offset;
		local H = g.Y.Scale * B.Y + g.Y.Offset;
		local i, R = a / B.X, H / B.Y;
		local O, c = 1 - i, 1 - R;
		local h, Q = i, "Left";
		if O < h then
			h, Q = O, "Right";
		end;
		if R < h then
			h, Q = R, "Top";
		end;
		if c < h then
			h, Q = c, "Bottom";
		end;
		return Q;
	end;
_G._MasaHubOffscreen = function(g, u)
		local B = workspace.CurrentCamera;
		local a = (B and B.ViewportSize) or Vector2.new(1920, 1080);
		if a.X < 1 or a.Y < 1 then
			a = Vector2.new(1920, 1080);
		end;
		local H = OF.AbsoluteSize;
		local i = (H.X > 1) and H.X or 400;
		local R = (H.Y > 1) and H.Y or 508;
		local O = g.X.Scale * a.X + g.X.Offset;
		local c = g.Y.Scale * a.Y + g.Y.Offset;
		local h, Q = 0, 0;
		if u == "Left" then
			h = -((O + i * .8));
		elseif u == "Right" then
			h = ((a.X - O)) + i * .8;
		elseif u == "Top" then
			Q = -((c + R * .8));
		else
			Q = ((a.Y - c)) + R * .8;
		end;
		return UDim2.new(g.X.Scale, g.X.Offset + h, g.Y.Scale, g.Y.Offset + Q);
	end;
_G._MasaHubTilt = function(g)
		if g == "Left" then
			return -7;
		end;
		if g == "Right" then
			return 7;
		end;
		if g == "Top" then
			return -4;
		end;
		return 4;
	end;
_G._MasaMiniPop = function(g)
		if not hF then
			return;
		end;
		local u = UDim2.new(0, 100, 0, 48);
		if g then
			hF.Size = UDim2.new(0, 0, 0, 0);
			hF.Visible = true;
			(B:Create(hF, TweenInfo.new(.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = u })):Play();
		else
			(B:Create(hF, TweenInfo.new(.16, Enum.EasingStyle.Quart, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) })):Play();
			task.delay(.17, function()
				hF.Visible = false;
				hF.Size = u;
			end);
		end;
	end;
_G._MasaHubRest = function()
		local g = _G._MasaHubRestPos or OF.Position;
		local u = workspace.CurrentCamera;
		local B = (u and u.ViewportSize) or Vector2.new(1920, 1080);
		if B.X < 1 or B.Y < 1 then
			B = Vector2.new(1920, 1080);
		end;
		local a = OF.AbsoluteSize;
		local H = (a.X > 1) and a.X or 400;
		local i = (a.Y > 1) and a.Y or 508;
		local R = g.X.Scale * B.X + g.X.Offset;
		local O = g.Y.Scale * B.Y + g.Y.Offset;
		local c = math.clamp(R, H * .25, math.max(B.X - H * .25, H * .25));
		local h = math.clamp(O, i * .15, math.max(B.Y - i * .15, i * .15));
		if math.abs(c - R) > .5 or math.abs(h - O) > .5 then
			g = UDim2.new(g.X.Scale, g.X.Offset + ((c - R)), g.Y.Scale, g.Y.Offset + ((h - O)));
			_G._MasaHubRestPos = g;
			savedMainPositionTable = udim2ToTable(g);
		end;
		return g;
	end;
_G.MasaHubClose = function(g)
		_G.__MasaDuelsMinimized = true;
		if not OF.Visible then
			if g then
				_G._MasaMiniPop(true);
			end;
			return;
		end;
		_G._MasaHubAnimToken = _G._MasaHubAnimToken + 1;
		local u = _G._MasaHubAnimToken;
		_G._MasaHubAnimating = true;
		local a = _G._MasaHubRest();
		local H = RF or OF.Size;
		local i = _G._MasaHubEdgeFor(a);
		local R = _G._MasaHubOffscreen(a, i);
		(B:Create(OF, TweenInfo.new(.38, Enum.EasingStyle.Quint, Enum.EasingDirection.In), { Position = R })):Play();
		if g then
			task.delay(.2, function()
				if u ~= _G._MasaHubAnimToken then
					return;
				end;
				_G._MasaMiniPop(true);
			end);
		end;
		task.delay(.4, function()
			if u ~= _G._MasaHubAnimToken then
				return;
			end;
			OF.Visible = false;
			OF.Rotation = 0;
			OF.Size = H;
			OF.Position = a;
			_G._MasaHubAnimating = false;
		end);
	end;
_G.MasaHubOpen = function()
		_G.__MasaDuelsMinimized = false;
		if _G.MasaIdleWake then
			_G.MasaIdleWake();
		end;
		_G._MasaHubAnimToken = _G._MasaHubAnimToken + 1;
		local g = _G._MasaHubAnimToken;
		_G._MasaMiniPop(false);
		local u = _G._MasaHubRest();
		local a = RF or OF.Size;
		local H = _G._MasaHubEdgeFor(u);
		_G._MasaHubAnimating = true;
		OF.Size = a;
		OF.Rotation = 0;
		OF.Position = _G._MasaHubOffscreen(u, H);
		OF.Visible = true;
		(B:Create(OF, TweenInfo.new(.52, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = u })):Play();
		task.delay(.6, function()
			if g ~= _G._MasaHubAnimToken then
				return;
			end;
			OF.Rotation = 0;
			OF.Size = a;
			OF.Position = u;
			_G._MasaHubAnimating = false;
			if _G.MasaHalloweenTheme == true and _G.MasaApplyHalloweenTheme then
				pcall(_G.MasaApplyHalloweenTheme);
			end;
		end);
	end;
_G._MasaIdle = {
		delay = 5,
		value = .7,
		fadeOut = .3,
		fadeIn = .14,
		last = os.clock(),
		faded = false,
		group = nil,
		started = false,
	};
_G._MasaIdleStays = function(g)
		if g.Name == "CustomBackground" then
			return true;
		end;
		if g:IsA("UICorner") or g:IsA("UIStroke") or g:IsA("UIScale") or g:IsA("UIPadding") or g:IsA("UIListLayout") or g:IsA("UIGradient") or g:IsA("UIAspectRatioConstraint") or g:IsA("UISizeConstraint") then
			return true;
		end;
		return false;
	end;
_G._MasaIdleEnsureGroup = function()
		local g = _G._MasaIdle;
		if g.group and g.group.Parent then
			return g.group;
		end;
		local u, B = pcall(function()
				return Instance.new("CanvasGroup");
			end);
		if not u or not B then
			return nil;
		end;
		B.Name = "MasaFadeGroup";
		B.BackgroundTransparency = 1;
		B.BorderSizePixel = 0;
		B.Size = UDim2.new(1, 0, 1, 0);
		B.Position = UDim2.new(0, 0, 0, 0);
		B.ZIndex = 2;
		B.GroupTransparency = 0;
		B.Active = false;
		B.Parent = OF;
		for g, u in ipairs(OF:GetChildren()) do
			if u ~= B and not _G._MasaIdleStays(u) then
				u.Parent = B;
			end;
		end;
		OF.ChildAdded:Connect(function(g)
			if g == B or _G._MasaIdleStays(g) then
				return;
			end;
			task.defer(function()
				if g.Parent == OF then
					g.Parent = B;
				end;
			end);
		end);
		g.group = B;
		return B;
	end;
_G._MasaIdleSet = function(g)
		local u = _G._MasaIdle;
		local a = _G._MasaIdleEnsureGroup();
		if not a then
			return;
		end;
		u.faded = g and true or false;
		(B:Create(a, TweenInfo.new(g and u.fadeOut or u.fadeIn, Enum.EasingStyle.Quad, g and Enum.EasingDirection.Out or Enum.EasingDirection.Out), { GroupTransparency = g and u.value or 0 })):Play();
	end;
_G.MasaIdleWake = function()
		local g = _G._MasaIdle;
		g.last = os.clock();
		if g.faded then
			_G._MasaIdleSet(false);
		end;
	end;
_G.MasaIdleStart = function()
		local g = _G._MasaIdle;
		if g.started then
			return;
		end;
		g.started = true;
		OF.InputBegan:Connect(_G.MasaIdleWake);
		OF.InputChanged:Connect(_G.MasaIdleWake);
		OF.MouseEnter:Connect(_G.MasaIdleWake);
		u.InputBegan:Connect(function(g)
			local u = g.UserInputType;
			if u == Enum.UserInputType.Gamepad1 or u == Enum.UserInputType.Gamepad2 or u == Enum.UserInputType.Gamepad3 or u == Enum.UserInputType.Gamepad4 then
				_G.MasaIdleWake();
			end;
		end);
		task.spawn(function()
			while true do
				task.wait(.25);
				if OF.Visible and not _G._MasaHubAnimating then
					if not g.faded and (os.clock() - g.last) >= g.delay then
						_G._MasaIdleSet(true);
					end;
				elseif g.faded then
					_G._MasaIdleSet(false);
					g.last = os.clock();
				end;
			end;
		end);
	end;
task.defer(function()
	pcall(_G.MasaIdleStart);
end);
local ZF = {
		"77599245856089",
		"128085595627413",
		"120663379122080",
		"71944223395764",
	};
do
	local g = tonumber(savedConfig.currentBackground);
	kj = ((g and g >= 1)) and g or kj;
	if type(savedConfig.customBgIds) == "table" then
		tj = {};
		for g, u in ipairs(savedConfig.customBgIds) do
			if type(u) == "string" and u:match("^%d+$") then
				table.insert(tj, u);
			end;
		end;
	end;
	if type(savedConfig.customBgSelected) == "string" then
		Vj = savedConfig.customBgSelected ~= "" and savedConfig.customBgSelected or nil;
	end;
	if type(savedConfig.customFont) == "string" then
		_G.MasaFontChoice = savedConfig.customFont;
	end;
	if type(savedConfig.tabPosition) == "string" then
		_G._MasaTabPosition = _G.MasaValidTabPosition(savedConfig.tabPosition);
	end;
	if savedConfig.floatUiVisible ~= nil then
		_G.MasaFloatUiVisible = savedConfig.floatUiVisible ~= false;
		if _G.MasaSetFloatUiVisible then
			pcall(_G.MasaSetFloatUiVisible, _G.MasaFloatUiVisible);
		end;
	end;
	if type(savedConfig.buttonShape) == "string" then
		_G.MasaButtonShape = savedConfig.buttonShape;
		if _G.MasaApplyButtonShape then
			pcall(_G.MasaApplyButtonShape);
		end;
	end;
end;
local FF = Instance.new("ImageLabel");
FF.Name = "CustomBackground";
FF.BackgroundTransparency = 1;
FF.ImageTransparency = 0;
FF.ScaleType = Enum.ScaleType.Crop;
FF.Size = UDim2.new(1, 0, 1, 0);
FF.Position = UDim2.new(0, 0, 0, 0);
FF.Visible = false;
FF.Image = "";
FF.ImageTransparency = 1;
FF.ZIndex = 1;
FF.Parent = OF;
corner(FF, 18);
local SF = Instance.new("ImageLabel");
SF.Name = "MiniBg";
SF.Size = UDim2.new(1, 0, 1, 0);
SF.Position = UDim2.new(0, 0, 0, 0);
SF.BackgroundTransparency = 1;
SF.Image = "";
SF.Visible = false;
SF.ScaleType = Enum.ScaleType.Crop;
SF.ZIndex = 20;
SF.Parent = hF;
local rF = Instance.new("UICorner");
rF.CornerRadius = UDim.new(0, 8);
rF.Parent = SF;
function applyBackground(g)
	Vj = nil;
	kj = ((tonumber(g) and tonumber(g) >= 1)) and tonumber(g) or 1;
	FF.Image = "";
	FF.Visible = false;
	SF.Image = "";
	SF.Visible = false;
	saveMasaConfig();
	if _G.MasaCustomBgPreviewUpdate then
		pcall(_G.MasaCustomBgPreviewUpdate);
	end;
	_G._MasaBgIndex = kj;
	_G._MasaBgCustom = false;
	if _G._MasaApplyAccent then
		pcall(_G._MasaApplyAccent);
	end;
	return "Solid";
end;
function applyCustomBackground(g)
	Vj = nil;
	kj = 1;
	FF.Image = "";
	FF.Visible = false;
	SF.Image = "";
	SF.Visible = false;
	saveMasaConfig();
	if _G.MasaCustomBgPreviewUpdate then
		pcall(_G.MasaCustomBgPreviewUpdate);
	end;
	_G._MasaBgIndex = 1;
	_G._MasaBgCustom = false;
	if _G._MasaApplyAccent then
		pcall(_G._MasaApplyAccent);
	end;
	if updateBackgroundButtons then
		pcall(updateBackgroundButtons);
	end;
end;
Vj = nil;
FF.Visible = false;
SF.Visible = false;
FF.Image = "";
SF.Image = "";
applyBackground(1);
_G._MasaBgIndex = kj;
_G._MasaBgCustom = (Vj ~= nil and Vj ~= "");
if _G._MasaApplyAccent then
	pcall(_G._MasaApplyAccent);
end;
local UF = Instance.new("Frame");
UF.Name = "HeaderDivider";
UF.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
UF.BackgroundTransparency = .35;
UF.BorderSizePixel = 0;
UF.Size = UDim2.new(1, -34, 0, 1);
UF.Position = UDim2.new(0, 17, 0, 44);
UF.ZIndex = 6;
UF.Parent = OF;
do
	local g = Instance.new("UIGradient");
	g.Rotation = 0;
	g.Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, .85),
			NumberSequenceKeypoint.new(.2, .15),
			NumberSequenceKeypoint.new(.5, 0),
			NumberSequenceKeypoint.new(.8, .15),
			NumberSequenceKeypoint.new(1, .85),
		});
	g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
	g.Parent = UF;
end;
do
	local g = Instance.new("Frame");
	g.Name = "HubBrand";
	g.BackgroundTransparency = 1;
	g.Size = UDim2.new(0, 140, 0, 28);
	g.Position = UDim2.new(0, 14, 0, 10);
	g.ZIndex = 6;
	g.Parent = OF;
	local u = Instance.new("Frame");
	u.Name = "BrandBadge";
	u.Size = UDim2.new(0, 26, 0, 26);
	u.Position = UDim2.new(0, 0, .5, -13);
	u.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	u.BorderSizePixel = 0;
	u.ZIndex = 7;
	u.Parent = g;
	corner(u, 7);
	local B = Instance.new("UIGradient");
	B.Rotation = 135;
	B.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.45, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
	B.Parent = u;
	stroke(u, Color3.fromRGB(255, 160, 200), 1.4, .15);
	local a = Instance.new("TextLabel");
	a.Name = "B";
	a.BackgroundTransparency = 1;
	a.Size = UDim2.new(1, 0, 1, 0);
	a.Text = "M";
	a.TextColor3 = Color3.fromRGB(255, 255, 255);
	a.TextStrokeColor3 = Color3.fromRGB(14, 116, 144);
	a.TextStrokeTransparency = .55;
	a.Font = Enum.Font.GothamBlack;
	a.TextSize = 15;
	a.TextXAlignment = Enum.TextXAlignment.Center;
	a.TextYAlignment = Enum.TextYAlignment.Center;
	a.ZIndex = 8;
	a.Parent = u;
	local H = Instance.new("TextLabel");
	H.Name = "HubTitle";
	H.BackgroundTransparency = 1;
	H.Text = "Masa Hub";
	H.TextColor3 = Color3.fromRGB(220, 60, 140);
	H.TextSize = 16;
	H.Font = Enum.Font.GothamBlack;
	H.TextXAlignment = Enum.TextXAlignment.Left;
	H.TextYAlignment = Enum.TextYAlignment.Center;
	H.Size = UDim2.new(0, 100, 1, 0);
	H.Position = UDim2.new(0, 32, 0, 0);
	H.ZIndex = 7;
	H.Parent = g;
	local i = Instance.new("UIGradient");
	i.Rotation = 0;
	i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 60, 140)), ColorSequenceKeypoint.new(.55, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	i.Parent = H;
end;
local IF = Instance.new("TextButton");
IF.Name = "Close";
IF.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
IF.BackgroundTransparency = 0;
IF.Text = "-";
IF.TextColor3 = Color3.fromRGB(220, 60, 140);
IF.TextSize = 20;
IF.Font = Enum.Font.GothamBlack;
IF.Size = UDim2.new(0, 30, 0, 26);
IF.Position = UDim2.new(1, -40, 0, 11);
IF.AutoButtonColor = false;
IF.ZIndex = 8;
IF.Parent = OF;
corner(IF, 8);
stroke(IF, Color3.fromRGB(255, 160, 200), 1.2, .25);
do
	local g = Instance.new("UIGradient");
	g.Rotation = 90;
	g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 220, 235)) });
	g.Parent = IF;
end;
MasaLockTopButton = Instance.new("TextButton");
MasaLockTopButton.Name = "LockGUI";
MasaLockTopButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
MasaLockTopButton.BackgroundTransparency = 0;
MasaLockTopButton.TextColor3 = Color3.fromRGB(220, 60, 140);
MasaLockTopButton.TextSize = 8;
MasaLockTopButton.Font = Enum.Font.GothamBlack;
MasaLockTopButton.Size = UDim2.new(0, 32, 0, 28);
MasaLockTopButton.Position = UDim2.new(0, 12, 0, 10);
MasaLockTopButton.AutoButtonColor = false;
MasaLockTopButton.ZIndex = 5;
MasaLockTopButton.Parent = OF;
MasaLockTopButton.Visible = false;
corner(MasaLockTopButton, 8);
stroke(MasaLockTopButton, HF.stroke, 1, .35);
function MasaUpdateGuiLockVisual()
	if MasaLockTopButton then
		local g = (_G.MasaGuiLocked == true);
		MasaLockTopButton.Text = g and "UNLOCK" or "LOCK";
		MasaLockTopButton.BackgroundColor3 = g and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(255, 255, 255);
		MasaLockTopButton.BackgroundTransparency = 0;
		MasaLockTopButton.TextColor3 = g and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(220, 60, 140);
		local u = MasaLockTopButton:FindFirstChildOfClass("UIStroke");
		if u then
			u.Transparency = .12;
			u.Color = Color3.fromRGB(255, 105, 180);
		end;
	end;
	if setLockGuiVisual then
		pcall(setLockGuiVisual, _G.MasaGuiLocked == true);
	end;
end;
MasaLockTopButton.Activated:Connect(function()
	_G.MasaGuiLocked = not ((_G.MasaGuiLocked == true));
	MasaUpdateGuiLockVisual();
	saveMasaConfig();
end);
MasaUpdateGuiLockVisual();
_G.MasaFloatUiVisible = (_G.MasaFloatUiVisible ~= false);
((function()
	local g = m:FindFirstChild("MasaTopHud");
	if g then
		g:Destroy();
	end;
	local u = Instance.new("ScreenGui");
	u.Name = "MasaTopHud";
	u.ResetOnSpawn = false;
	u.IgnoreGuiInset = true;
	u.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	u.DisplayOrder = 80;
	u.Parent = m;
	local B = Instance.new("Frame");
	B.Name = "HudBar";
	B.AnchorPoint = Vector2.new(.5, 0);
	B.Position = UDim2.new(.5, 0, 0, 36);
	B.Size = UDim2.new(0, 270, 0, 34);
	B.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	B.BorderSizePixel = 0;
	B.ZIndex = 20;
	B.Visible = _G.MasaFloatUiVisible ~= false;
	B.Parent = u;
	corner(B, 8);
	stroke(B, Color3.fromRGB(255, 105, 180), 1.2, .12);
	local H = Instance.new("UIGradient");
	H.Rotation = 0;
	H.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 220, 235)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
	H.Parent = B;
	local i = Instance.new("TextLabel");
	i.Name = "HudText";
	i.BackgroundTransparency = 1;
	i.Size = UDim2.new(1, -16, 1, 0);
	i.Position = UDim2.new(0, 8, 0, 0);
	i.Font = Enum.Font.GothamBlack;
	i.TextSize = 12;
	i.TextColor3 = Color3.fromRGB(220, 60, 140);
	i.TextXAlignment = Enum.TextXAlignment.Center;
	i.Text = "[M] Masa Hub  |  .gg/SyEW2B4Yb  |  -- MS  |  -- FPS";
	i.ZIndex = 21;
	i.Parent = B;
	_G.MasaSetFloatUiVisible = function(g)
			_G.MasaFloatUiVisible = g ~= false;
			pcall(function()
				B.Visible = _G.MasaFloatUiVisible;
			end);
		end;
	_G._MasaFloatUiBar = B;
	task.spawn(function()
		local g = tick();
		local B = 0;
		local H = 0;
		local R = 0;
		a.RenderStepped:Connect(function()
			B = B + 1;
			local u = tick();
			if u - g >= .25 then
				H = math.floor(B / ((u - g)) + .5);
				B = 0;
				g = u;
			end;
		end);
		while u.Parent do
			pcall(function()
				local g = e:GetNetworkPing();
				if g then
					R = math.floor(g * 1000 + .5);
				end;
			end);
			i.Text = string.format("[M] Masa Hub  |  .gg/SyEW2B4Yb  |  %s MS  |  %s FPS", tostring(R), tostring(H));
			task.wait(.25);
		end;
	end);
end))();
local XF = Instance.new("Frame");
XF.Name = "Content";
XF.BackgroundTransparency = 1;
XF.Position = UDim2.new(0, 13, 0, 52);
XF.Size = UDim2.new(1, -26, 1, -108);
XF.ZIndex = 3;
XF.Parent = OF;
local wF = Instance.new("Frame");
wF.Name = "Tabs";
wF.BackgroundTransparency = 1;
wF.Position = UDim2.new(0, 12, 0, 52);
wF.Size = UDim2.new(1, -24, 0, 73);
wF.ZIndex = 3;
wF.Parent = OF;
local kF = Instance.new("UIListLayout");
kF.FillDirection = Enum.FillDirection.Horizontal;
kF.Padding = UDim.new(0, 5);
kF.SortOrder = Enum.SortOrder.LayoutOrder;
kF.HorizontalAlignment = Enum.HorizontalAlignment.Center;
kF.VerticalAlignment = Enum.VerticalAlignment.Center;
kF.Wraps = true;
kF.Parent = wF;
local tF = {};
local VF = {};
local EF = {
		"MOVEMENT",
		"COMBAT",
		"KEYBINDS",
		"VISUALS",
		"SETTINGS",
	};
local NF = "MOVEMENT";
function addPage(g)
	local u = Instance.new("ScrollingFrame");
	u.Name = g;
	u.BackgroundTransparency = 1;
	u.BorderSizePixel = 0;
	u.ScrollBarThickness = 0;
	u.ScrollBarImageTransparency = 1;
	u.CanvasSize = UDim2.new(0, 0, 0, 0);
	u.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	u.Size = UDim2.new(1, 0, 1, 0);
	u.ZIndex = 3;
	u.Visible = false;
	u.Parent = XF;
	local B = Instance.new("UIListLayout");
	B.Padding = UDim.new(0, 14);
	B.SortOrder = Enum.SortOrder.LayoutOrder;
	B.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	B.Parent = u;
	local a = Instance.new("UIPadding");
	a.Name = "PagePad";
	a.PaddingBottom = UDim.new(0, 12);
	a.Parent = u;
	tF[g] = u;
	if _G._MasaApplyPagePadding then
		_G._MasaApplyPagePadding();
	end;
	return u;
end;
_G._MasaApplyPagePadding = function()
		local g = _G._MasaTabPosition or "Bottom";
		local u, B;
		if g == "Up" then
			u, B = 0, 12;
		elseif g == "Bottom" then
			u, B = 10, 0;
		else
			u, B = 10, 12;
		end;
		for g, a in pairs(tF) do
			local H = a:FindFirstChild("PagePad");
			if H then
				H.PaddingTop = UDim.new(0, u);
				H.PaddingBottom = UDim.new(0, B);
			end;
		end;
	end;
function setTab(g)
	NF = g;
	for u, B in pairs(tF) do
		B.Visible = u == g;
	end;
	for u, B in pairs(VF) do
		local a = u == g;
		B.TextColor3 = a and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(220, 60, 140);
		B.BackgroundColor3 = a and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(255, 255, 255);
		B.BackgroundTransparency = 0;
		local H = B:FindFirstChildOfClass("UIStroke");
		if H then
			H.Transparency = a and .05 or .25;
			H.Color = Color3.fromRGB(255, 105, 180);
		end;
	end;
end;
for g, u in ipairs(EF) do
	addPage(u);
	local B = Instance.new("TextButton");
	B.Name = u;
	B.Size = UDim2.new(0, 0, 0, 34);
	B.SizeConstraint = Enum.SizeConstraint.RelativeXY;
	B.AutomaticSize = Enum.AutomaticSize.None;
	B.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	B.BackgroundTransparency = 0;
	B.BorderSizePixel = 0;
	B.Text = u;
	B.TextColor3 = Color3.fromRGB(220, 60, 140);
	B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	B.TextStrokeTransparency = .35;
	B.TextSize = 8;
	B.Font = Enum.Font.GothamBlack;
	B.AutoButtonColor = false;
	B.ZIndex = 4;
	B.Parent = wF;
	B.LayoutOrder = g;
	B.Size = UDim2.new((g <= 3) and .333 or .5, -4, 0, 34);
	corner(B, 8);
	stroke(B, HF.stroke, 1, .18);
	VF[u] = B;
	B.MouseButton1Click:Connect(function()
		setTab(u);
	end);
end;
((function()
	local g = Enum.FillDirection.Horizontal;
	local u = Enum.FillDirection.Vertical;
	local B = 400;
	local a = 435;
	local H = 30;
	local i = {
			Up = {
				wide = false,
				tabsPos = UDim2.new(0, 12, 0, 52),
				tabsSize = UDim2.new(1, -24, 0, 73),
				dir = g,
				pad = UDim.new(0, 5),
				hAlign = Enum.HorizontalAlignment.Center,
				vAlign = Enum.VerticalAlignment.Center,
				contentPos = UDim2.new(0, 13, 0, 130),
				contentSize = UDim2.new(1, -26, 1, -130),
			},
			Bottom = {
				wide = false,
				tabsPos = UDim2.new(0, 12, 1, -46),
				tabsSize = UDim2.new(1, -24, 0, 34),
				dir = g,
				pad = UDim.new(0, 5),
				hAlign = Enum.HorizontalAlignment.Center,
				vAlign = Enum.VerticalAlignment.Center,
				contentPos = UDim2.new(0, 13, 0, 52),
				contentSize = UDim2.new(1, -26, 1, -108),
			},
			Left = {
				wide = true,
				tabsPos = UDim2.new(0, 10, 0, 52),
				tabsSize = UDim2.new(0, H, 1, -62),
				dir = u,
				pad = UDim.new(0, 3),
				hAlign = Enum.HorizontalAlignment.Center,
				vAlign = Enum.VerticalAlignment.Center,
				rot = -90,
				contentPos = UDim2.new(0, 48, 0, 52),
				contentSize = UDim2.new(1, -61, 1, -52),
			},
			Right = {
				wide = true,
				tabsPos = UDim2.new(1, -40, 0, 52),
				tabsSize = UDim2.new(0, H, 1, -62),
				dir = u,
				pad = UDim.new(0, 3),
				hAlign = Enum.HorizontalAlignment.Center,
				vAlign = Enum.VerticalAlignment.Center,
				rot = 90,
				contentPos = UDim2.new(0, 13, 0, 52),
				contentSize = UDim2.new(1, -61, 1, -52),
			},
		};
	local R = Enum.Font.GothamBlack;
	local O = 15;
	local c = 14;
	local h = game:GetService("TextService");
	local Q = {};
	local function e(g)
		local u = Q[g];
		if not u then
			local B, a = pcall(function()
					return h:GetTextSize(g, O, R, Vector2.new(4000, 100));
				end);
			u = (B and (a and math.ceil(a.X))) or ((#g * O) * .62);
			Q[g] = u;
		end;
		return u;
	end;
	local function P(g, u, B)
		local a = g:FindFirstChild("VWord");
		if a and (a:GetAttribute("Word") == u and a.Rotation == B) then
			return a;
		end;
		if a then
			a:Destroy();
		end;
		local H = e(u);
		a = Instance.new("TextLabel");
		a.Name = "VWord";
		a.BackgroundTransparency = 1;
		a.Text = u;
		a.Font = R;
		a.TextSize = O;
		a.TextXAlignment = Enum.TextXAlignment.Center;
		a.TextYAlignment = Enum.TextYAlignment.Center;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .35;
		a.TextWrapped = false;
		a.Size = UDim2.new(0, H, 0, O + 6);
		a.AnchorPoint = Vector2.new(.5, .5);
		a.Position = UDim2.new(.5, 0, .5, 0);
		a.Rotation = B;
		a.ZIndex = 5;
		a:SetAttribute("Word", u);
		a.Parent = g;
		return a;
	end;
	local function m()
		for g, u in pairs(VF) do
			local B = u:FindFirstChild("VWord");
			if B and B.Visible then
				B.TextColor3 = u.TextColor3;
			end;
		end;
	end;
	_G._MasaSyncTabLetters = m;
	function _G.MasaApplyTabPosition(g)
		g = "Up";
		local H = i[g];
		if not H then
			return;
		end;
		_G._MasaTabPosition = g;
		RF = UDim2.new(0, H.wide and a or B, 0, 508);
		OF.Size = RF;
		wF.Position = H.tabsPos;
		wF.Size = H.tabsSize;
		kF.FillDirection = H.dir;
		kF.Padding = H.pad;
		kF.HorizontalAlignment = H.hAlign;
		kF.VerticalAlignment = H.vAlign;
		for g, B in pairs(VF) do
			local a = B:FindFirstChild("TabPad");
			if not a then
				a = Instance.new("UIPadding");
				a.Name = "TabPad";
				a.Parent = B;
			end;
			if H.dir == u then
				B.Text = "";
				B.AutomaticSize = Enum.AutomaticSize.None;
				a.PaddingTop = UDim.new(0, 0);
				a.PaddingBottom = UDim.new(0, 0);
				B.Size = UDim2.new(1, 0, 0, e(g) + c);
				local u = P(B, g, H.rot or 90);
				u.Visible = true;
			else
				B.AutomaticSize = Enum.AutomaticSize.None;
				local u = B:FindFirstChild("VWord");
				if u then
					u.Visible = false;
				end;
				B.Text = g;
				B.TextSize = 8;
				B.TextWrapped = false;
				B.TextXAlignment = Enum.TextXAlignment.Center;
				B.TextYAlignment = Enum.TextYAlignment.Center;
				a.PaddingTop = UDim.new(0, 0);
				a.PaddingBottom = UDim.new(0, 0);
				local H = B.LayoutOrder or 1;
				if H <= 3 then
					B.Size = UDim2.new(.333, -4, 0, 34);
				else
					B.Size = UDim2.new(.5, -4, 0, 34);
				end;
			end;
		end;
		XF.Position = H.contentPos;
		XF.Size = H.contentSize;
		if _G._MasaApplyPagePadding then
			_G._MasaApplyPagePadding();
		end;
		m();
	end;
end))();
do
	local g = setTab;
	function setTab(u)
		g(u);
		if _G._MasaSyncTabLetters then
			_G._MasaSyncTabLetters();
		end;
	end;
end;
_G.MasaApplyTabPosition("Up");
function section(g, u, B)
	local a = Instance.new("TextLabel");
	a.Name = u;
	a.BackgroundTransparency = 1;
	a.Text = u;
	a.TextColor3 = Color3.fromRGB(220, 60, 140);
	a.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
	a.TextStrokeTransparency = .65;
	a.TextSize = 11;
	a.Font = Enum.Font.GothamBlack;
	a.TextXAlignment = Enum.TextXAlignment.Left;
	a.Size = UDim2.new(1, -6, 0, 15);
	a.LayoutOrder = B;
	a.ZIndex = 8;
	a.Parent = g;
	return a;
end;
local function nF(g, u)
	local B = {
			"Rectangle",
			"Rounded",
			"Pill",
			"Circle",
		};
	local a = {
			"\226\150\173 Rectangle",
			"\226\151\137 Rounded",
			"\226\150\172 Pill",
			"\226\151\143 Circle",
		};
	local H = Instance.new("Frame");
	H.Name = "_ShapeRow";
	H.BackgroundColor3 = Color3.fromRGB(8, 8, 18);
	H.BackgroundTransparency = .12;
	H.Size = UDim2.new(1, -4, 0, 38);
	H.BorderSizePixel = 0;
	H.LayoutOrder = u;
	H.ZIndex = 4;
	H.Parent = g;
	corner(H, 10);
	stroke(H, Color3.fromRGB(255, 105, 180), 1.2, .38);
	local i = Instance.new("UIGradient");
	i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 60, 140)), ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 182, 212)) });
	i.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .88), NumberSequenceKeypoint.new(1, .82) });
	i.Rotation = 0;
	i.Parent = H;
	local R = Instance.new("TextLabel");
	R.BackgroundTransparency = 1;
	R.Text = "Btn Shape";
	R.TextColor3 = Color3.fromRGB(255, 192, 203);
	R.TextSize = 10;
	R.Font = Enum.Font.GothamSemibold;
	R.TextXAlignment = Enum.TextXAlignment.Left;
	R.Position = UDim2.new(0, 10, 0, 0);
	R.Size = UDim2.new(0, 70, 1, 0);
	R.ZIndex = 5;
	R.Parent = H;
	local O, c, h = 62, 24, 4;
	local Q = O * 4 + h * 3;
	local e = -((Q + 8));
	local P = {};
	local function m()
		local g = _G.MasaButtonShape or "Rectangle";
		for u, B in ipairs(B) do
			local a = P[u];
			if a then
				local u = (g == B);
				a.BackgroundColor3 = u and Color3.fromRGB(255, 105, 180) or Color3.fromRGB(20, 20, 30);
				a.TextColor3 = u and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 160, 200);
				local H = a:FindFirstChildOfClass("UIStroke");
				if H then
					H.Transparency = u and .05 or .5;
				end;
			end;
		end;
	end;
	for g, u in ipairs(B) do
		local B = e + ((g - 1)) * ((O + h));
		local i = Instance.new("TextButton");
		i.BackgroundColor3 = Color3.fromRGB(20, 20, 30);
		i.BackgroundTransparency = 0;
		i.BorderSizePixel = 0;
		i.Text = a[g];
		i.TextColor3 = Color3.fromRGB(255, 160, 200);
		i.TextSize = 9;
		i.Font = Enum.Font.GothamBold;
		i.AutoButtonColor = false;
		i.Size = UDim2.new(0, O, 0, c);
		i.Position = UDim2.new(1, B, .5, -c / 2);
		i.ZIndex = 6;
		i.Parent = H;
		corner(i, 7);
		stroke(i, Color3.fromRGB(255, 105, 180), 1.1, .5);
		P[g] = i;
		i.Activated:Connect(function()
			_G.MasaButtonShape = u;
			if _G.MasaApplyButtonShape then
				pcall(_G.MasaApplyButtonShape);
			end;
			m();
			if _G.MasaRefreshAllShapeRows then
				pcall(_G.MasaRefreshAllShapeRows);
			end;
			saveMasaConfig();
		end);
	end;
	m();
	if not _G._MasaShapeRowRefreshers then
		_G._MasaShapeRowRefreshers = {};
	end;
	table.insert(_G._MasaShapeRowRefreshers, m);
	_G.MasaRefreshAllShapeRows = function()
			for g, u in ipairs(_G._MasaShapeRowRefreshers) do
				pcall(u);
			end;
		end;
	return H;
end;
function baseRow(g, u, B)
	local a = Instance.new("Frame");
	a.Name = u;
	a.BackgroundColor3 = Color3.fromRGB(10, 14, 26);
	a.BackgroundTransparency = .1;
	a.Size = UDim2.new(1, -4, 0, 44);
	a.BorderSizePixel = 0;
	a.LayoutOrder = B;
	a.ZIndex = 4;
	a.Parent = g;
	corner(a, 12);
	local H = Instance.new("UIStroke");
	H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	H.Color = Color3.fromRGB(255, 105, 180);
	H.Thickness = 1.2;
	H.Transparency = .52;
	H.Parent = a;
	do
		local g = Instance.new("UIGradient");
		g.Rotation = 5;
		g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 60, 140)), ColorSequenceKeypoint.new(.55, Color3.fromRGB(10, 10, 22)), ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 182, 212)) });
		g.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .92), NumberSequenceKeypoint.new(.5, .88), NumberSequenceKeypoint.new(1, .9) });
		g.Parent = a;
	end;
	local i = Instance.new("Frame");
	i.Name = "_Accent";
	i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	i.BackgroundTransparency = .25;
	i.BorderSizePixel = 0;
	i.Size = UDim2.new(0, 3, 0, 22);
	i.Position = UDim2.new(0, 6, .5, -11);
	i.ZIndex = 5;
	i.Parent = a;
	corner(i, 3);
	local R = Instance.new("TextLabel");
	R.Name = "Label";
	R.BackgroundTransparency = 1;
	R.Text = u;
	R.TextColor3 = Color3.fromRGB(255, 220, 235);
	R.TextStrokeColor3 = Color3.fromRGB(0, 10, 30);
	R.TextStrokeTransparency = .55;
	R.TextSize = 12;
	R.Font = Enum.Font.GothamSemibold;
	R.TextXAlignment = Enum.TextXAlignment.Left;
	R.Position = UDim2.new(0, 16, 0, 0);
	R.Size = UDim2.new(1, -132, 1, 0);
	R.ZIndex = 5;
	R.Parent = a;
	a.MouseEnter:Connect(function()
		tween(a, { BackgroundColor3 = Color3.fromRGB(14, 25, 50), BackgroundTransparency = .05 });
		tween(H, { Transparency = .18, Thickness = 1.4 });
		tween(i, { BackgroundTransparency = .05 });
	end);
	a.MouseLeave:Connect(function()
		tween(a, { BackgroundColor3 = Color3.fromRGB(10, 14, 26), BackgroundTransparency = .1 });
		tween(H, { Transparency = .52, Thickness = 1.2 });
		tween(i, { BackgroundTransparency = .25 });
	end);
	return a;
end;
function textboxRow(g, u, B, a)
	local H = baseRow(g, u, a);
	local i = Instance.new("TextBox");
	i.Name = "ValueBox";
	i.BackgroundColor3 = Color3.fromRGB(6, 18, 40);
	i.BackgroundTransparency = .05;
	i.Text = tostring(B or "");
	i.TextColor3 = Color3.fromRGB(255, 105, 180);
	i.PlaceholderColor3 = Color3.fromRGB(100, 160, 200);
	i.TextSize = 12;
	i.Font = Enum.Font.GothamBold;
	i.ClearTextOnFocus = false;
	i.Size = UDim2.new(0, 62, 0, 26);
	i.Position = UDim2.new(1, -72, .5, -13);
	i.BorderSizePixel = 0;
	i.ZIndex = 6;
	i.Parent = H;
	corner(i, 8);
	stroke(i, Color3.fromRGB(255, 105, 180), 1.2, .28);
	return H, i;
end;
local function AF(g, u, B, a, H)
	local i = baseRow(g, u, a);
	local R = Instance.new("TextButton");
	R.Name = "ToggleButton";
	R.BackgroundTransparency = 1;
	R.Text = "";
	R.Size = UDim2.new(1, 0, 1, 0);
	R.Position = UDim2.new(0, 0, 0, 0);
	R.AutoButtonColor = false;
	R.ZIndex = 7;
	R.Parent = i;
	local O = Instance.new("Frame");
	O.Name = "Track";
	O.BackgroundColor3 = Color3.fromRGB(255, 230, 240);
	O.BackgroundTransparency = 0;
	O.Size = UDim2.new(0, 48, 0, 24);
	O.Position = UDim2.new(1, -58, .5, -12);
	O.BorderSizePixel = 0;
	O.ClipsDescendants = true;
	O.ZIndex = 5;
	O.Parent = R;
	corner(O, 12);
	local c = stroke(O, Color3.fromRGB(255, 160, 200), 1.2, .05);
	local h = Instance.new("Frame");
	h.Name = "GlassGlow";
	h.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	h.BackgroundTransparency = .72;
	h.Size = UDim2.new(1, -4, 0, 5);
	h.Position = UDim2.new(0, 2, 0, 2);
	h.BorderSizePixel = 0;
	h.ZIndex = 5;
	h.Parent = O;
	corner(h, 5);
	local Q = Instance.new("Frame");
	Q.Name = "EnergyRail";
	Q.BackgroundTransparency = 1;
	Q.Size = UDim2.new(1, -10, 0, 4);
	Q.Position = UDim2.new(0, 5, .5, -2);
	Q.ZIndex = 5;
	Q.Parent = O;
	local e = Instance.new("UIListLayout");
	e.FillDirection = Enum.FillDirection.Horizontal;
	e.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	e.VerticalAlignment = Enum.VerticalAlignment.Center;
	e.Padding = UDim.new(0, 4);
	e.Parent = Q;
	local P = {};
	for g = 1, 5, 1 do
		local u = Instance.new("Frame");
		u.Name = "Core" .. g;
		u.Size = UDim2.new(0, 4, 0, 4);
		u.BackgroundColor3 = Color3.fromRGB(255, 160, 200);
		u.BackgroundTransparency = .2;
		u.BorderSizePixel = 0;
		u.ZIndex = 6;
		u.Parent = Q;
		corner(u, 99);
		P[g] = u;
	end;
	local m = Instance.new("Frame");
	m.Name = "Fill";
	m.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	m.BackgroundTransparency = B and 0 or 1;
	m.Size = UDim2.new(1, 0, 1, 0);
	m.BorderSizePixel = 0;
	m.ZIndex = 5;
	m.Parent = O;
	corner(m, 12);
	local Z = Instance.new("UIGradient");
	Z.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 242, 255)),
			ColorSequenceKeypoint.new(.35, Color3.fromRGB(255, 105, 180)),
			ColorSequenceKeypoint.new(.7, Color3.fromRGB(37, 99, 235)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)),
		});
	Z.Rotation = 12;
	Z.Parent = m;
	local F = Instance.new("Frame");
	F.Name = "Knob";
	F.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	F.Size = UDim2.new(0, 18, 0, 18);
	F.Position = B and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9);
	F.BorderSizePixel = 0;
	F.ZIndex = 7;
	F.Parent = O;
	corner(F, 999);
	local S = Instance.new("UIStroke");
	S.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	S.Color = B and Color3.fromRGB(220, 60, 140) or Color3.fromRGB(255, 160, 200);
	S.Thickness = 1.5;
	S.Transparency = .05;
	S.Parent = F;
	local r = Instance.new("Frame");
	r.Name = "Core";
	r.BackgroundColor3 = Color3.fromRGB(37, 99, 235);
	r.Size = UDim2.new(0, 6, 0, 6);
	r.AnchorPoint = Vector2.new(.5, .5);
	r.Position = UDim2.new(.5, 0, .5, 0);
	r.BorderSizePixel = 0;
	r.ZIndex = 8;
	r.Parent = F;
	corner(r, 99);
	local U = Instance.new("UIStroke");
	U.Color = Color3.fromRGB(255, 192, 203);
	U.Thickness = 1;
	U.Transparency = .05;
	U.Parent = r;
	local I = Instance.new("Frame");
	I.Name = "Shine";
	I.BackgroundColor3 = HF.white;
	I.BackgroundTransparency = .35;
	I.Size = UDim2.new(1, -6, 0, 3);
	I.Position = UDim2.new(0, 3, 0, 3);
	I.BorderSizePixel = 0;
	I.ZIndex = 9;
	I.Parent = F;
	corner(I, 4);
	local X = Instance.new("TextLabel");
	X.Name = "StateMark";
	X.BackgroundTransparency = 1;
	X.Text = B and "I" or "O";
	X.TextColor3 = B and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(14, 165, 233);
	X.TextSize = 7;
	X.Font = Enum.Font.GothamBlack;
	X.TextXAlignment = Enum.TextXAlignment.Center;
	X.Size = UDim2.new(0, 12, 0, 12);
	X.Position = B and UDim2.new(0, 4, .5, -6) or UDim2.new(1, -16, .5, -6);
	X.ZIndex = 8;
	X.Parent = O;
	_G._MasaRegAccent(m, Z, "toggle", O, F, i);
	local w = i:FindFirstChildOfClass("UIStroke");
	local k = B and true or false;
	local function t(g)
		k = g and true or false;
		local u, B = _G._MasaToggleOnColor();
		tween(F, { Position = k and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9) });
		tween(O, { BackgroundTransparency = k and 0 or .03, BackgroundColor3 = k and u or Color3.fromRGB(255, 230, 240) });
		tween(m, { BackgroundTransparency = k and 0 or 1 });
		tween(h, { BackgroundTransparency = k and .45 or .72 });
		tween(S, { Color = k and B or Color3.fromRGB(255, 160, 200), Thickness = k and 1.7 or 1.5 });
		tween(r, { BackgroundColor3 = k and Color3.fromRGB(220, 60, 140) or Color3.fromRGB(96, 165, 250) });
		tween(U, { Color = k and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(186, 230, 253) });
		if c then
			tween(c, { Color = k and B or Color3.fromRGB(255, 160, 200), Transparency = k and 0 or .18, Thickness = k and 1.5 or 1.2 });
		end;
		if w then
			tween(w, { Color = k and u or HF.strokeSoft, Transparency = k and .06 or .38, Thickness = k and 1.35 or 1.15 });
		end;
		X.Text = k and "I" or "O";
		tween(X, { TextColor3 = k and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(14, 165, 233), Position = k and UDim2.new(0, 4, .5, -6) or UDim2.new(1, -16, .5, -6) });
		for g, u in ipairs(P) do
			tween(u, { BackgroundColor3 = k and (((g % 2 == 0) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(186, 230, 253))) or Color3.fromRGB(125, 211, 252), BackgroundTransparency = k and .05 or .35 });
		end;
	end;
	t(B);
	R.Activated:Connect(function()
 
	end);
	if H then
		return i, t, R;
	end;
	return i, t;
end;
function toggleRow(g, u, B, a)
	return AF(g, u, B, a, false);
end;
_G.MasaSyncToggleVisuals = function()
		pcall(function()
			if setAutoStealVisual then
				setAutoStealVisual(X == true);
			end;
		end);
		pcall(function()
			if _G._MasaSyncAfterHit.setVisual then
				_G._MasaSyncAfterHit.setVisual(_G._MasaSyncAfterHit.enabled == true);
			end;
		end);
		pcall(function()
			if setInfJumpVisual then
				setInfJumpVisual(yl == true);
			end;
		end);
		pcall(function()
			if Z.setLookAtVisual then
				Z.setLookAtVisual(_G.MasaLookAtEnabled == true);
			end;
		end);
		pcall(function()
			if setAntiRagdollVisual then
				setAntiRagdollVisual(gj == true);
			end;
		end);
		pcall(function()
			if setAutoCarrySpeedVisual then
				setAutoCarrySpeedVisual(autoCarrySpeedEnabled == true);
			end;
		end);
		pcall(function()
			if _G.MasaRefreshAutoCarryModeSelector then
				_G.MasaRefreshAutoCarryModeSelector();
			end;
		end);
		pcall(function()
			if Z.setAutoTPVisual then
				Z.setAutoTPVisual(nl == true);
			end;
		end);
	end;
_G.MasaActionToggleRow = function(g, u, B, a)
		return AF(g, u, B, a, true);
	end;
function dropdownRow(g, u, B, a)
	local H = baseRow(g, u, a);
	local i = Instance.new("TextButton");
	i.Name = "Dropdown";
	i.BackgroundColor3 = Color3.fromRGB(255, 235, 245);
	i.BackgroundTransparency = 0;
	i.Text = tostring(B or "None") .. "  \226\150\188";
	i.TextColor3 = Color3.fromRGB(220, 60, 140);
	i.TextSize = 11;
	i.Font = Enum.Font.GothamSemibold;
	i.Size = UDim2.new(0, 70, 0, 24);
	i.Position = UDim2.new(1, -80, .5, -12);
	i.BorderSizePixel = 0;
	i.ZIndex = 6;
	i.Parent = H;
	corner(i, 7);
	stroke(i, HF.strokeSoft, 1, .45);
	return H, i;
end;
function keyName(g)
	if not g then
		return "None";
	end;
	if g == "MB3" then
		return "MB3";
	end;
	local u = (tostring(g)):gsub("Enum.KeyCode.", "");
	u = u:gsub("Button", "BTN ");
	u = u:gsub("DPad", "DPad ");
	return u;
end;
function refreshSpeedKeybindButton(g)
	local u = El[g];
	if u then
		if Nl == g then
			u.Text = "Press...";
		else
			u.Text = keyName(Vl[g]);
		end;
	end;
end;
function refreshAllSpeedKeybinds()
	for g in pairs(El) do
		refreshSpeedKeybindButton(g);
	end;
end;
function refreshTPDownKeybind()
	if pl then
		pl.Text = Ll and "Press..." or keyName(ql);
	end;
end;
function tpDownKeybindRow(g, u)
	local B = baseRow(g, "TP Down", u);
	local a = Instance.new("TextButton");
	a.Name = "TPDownKeybindButton";
	a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	a.BackgroundTransparency = .18;
	a.Text = keyName(ql);
	a.TextColor3 = HF.white;
	a.TextSize = 11;
	a.Font = Enum.Font.GothamSemibold;
	a.Size = UDim2.new(0, 56, 0, 24);
	a.Position = UDim2.new(1, -64, .5, -12);
	a.BorderSizePixel = 0;
	a.ZIndex = 6;
	a.AutoButtonColor = false;
	a.Parent = B;
	corner(a, 7);
	stroke(a, HF.strokeSoft, 1, .45);
	local H = Instance.new("TextButton");
	H.Name = "ClearKeybindButton";
	H.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	H.BackgroundTransparency = .18;
	H.Text = "\195\151";
	H.TextColor3 = HF.white;
	H.TextSize = 14;
	H.Font = Enum.Font.GothamBlack;
	H.Size = UDim2.new(0, 22, 0, 24);
	H.Position = UDim2.new(1, -90, .5, -12);
	H.BorderSizePixel = 0;
	H.ZIndex = 6;
	H.AutoButtonColor = false;
	H.Parent = B;
	corner(H, 7);
	stroke(H, HF.strokeSoft, 1, .45);
	pl = a;
	a.Activated:Connect(function()
		Nl = nil;
		Ll = true;
		bl = tick();
		refreshAllSpeedKeybinds();
		refreshTPDownKeybind();
	end);
	H.Activated:Connect(function()
		Nl = nil;
		Ll = false;
		ql = nil;
		if pl then
			pl.Text = "None";
		end;
		refreshAllSpeedKeybinds();
		refreshTPDownKeybind();
		saveMasaConfig();
	end);
	return B, a;
end;
function speedKeybindRow(g, u, B, a)
	local H = baseRow(g, u, a);
	local i = Instance.new("TextButton");
	i.Name = "KeybindButton";
	i.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	i.BackgroundTransparency = .18;
	i.Text = keyName(Vl[B]);
	i.TextColor3 = HF.white;
	i.TextSize = 11;
	i.Font = Enum.Font.GothamSemibold;
	i.Size = UDim2.new(0, 56, 0, 24);
	i.Position = UDim2.new(1, -64, .5, -12);
	i.BorderSizePixel = 0;
	i.ZIndex = 6;
	i.AutoButtonColor = false;
	i.Parent = H;
	corner(i, 7);
	stroke(i, HF.strokeSoft, 1, .45);
	local R = Instance.new("TextButton");
	R.Name = "ClearKeybindButton";
	R.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	R.BackgroundTransparency = .18;
	R.Text = "\195\151";
	R.TextColor3 = HF.white;
	R.TextSize = 14;
	R.Font = Enum.Font.GothamBlack;
	R.Size = UDim2.new(0, 22, 0, 24);
	R.Position = UDim2.new(1, -90, .5, -12);
	R.BorderSizePixel = 0;
	R.ZIndex = 6;
	R.AutoButtonColor = false;
	R.Parent = H;
	corner(R, 7);
	stroke(R, HF.strokeSoft, 1, .45);
	El[B] = i;
	i.Activated:Connect(function()
		Nl = B;
		Ll = false;
		bl = tick();
		refreshAllSpeedKeybinds();
		refreshTPDownKeybind();
	end);
	R.Activated:Connect(function()
		Nl = nil;
		Ll = false;
		Vl[B] = nil;
		if El[B] then
			El[B].Text = "None";
		end;
		refreshAllSpeedKeybinds();
		refreshTPDownKeybind();
		saveMasaConfig();
	end);
	return H, i;
end;
local dF = nil;
local CF = nil;
local jF = nil;
local qF = nil;
local pF = nil;
function getAimbotModeDisplay()
	if N == "V2" then
		return "Bat Aimbot V2";
	end;
	return "Bat Aimbot V1";
end;
function refreshAimbotButtonLabel()
	if CF then
		CF.Text = getAimbotModeDisplay();
	end;
end;
function refreshAimbotModeLabels()
	local g = getAimbotModeDisplay();
	if jF then
		jF.Text = g .. " Speed";
	end;
	if qF then
		qF.Text = g .. " Lagger Speed";
	end;
	if pF then
		pF.Text = g;
	end;
	refreshAimbotButtonLabel();
	pcall(function()
		local g = _G.MasaMobileButtonRefs;
		local u = g and g.aimbot;
		local B = u and u.btn;
		if B then
			B.Text = (N == "V2") and "BAT\nAIMBOT\nV2" or "BAT\nAIMBOT\nV1";
		end;
	end);
	if _G._AmbHideOptLabel_aimbot then
		pcall(_G._AmbHideOptLabel_aimbot);
	end;
	if _G.MasaRefreshAfterDropSelector then
		pcall(_G.MasaRefreshAfterDropSelector);
	end;
end;
lj = function()
		if dF then
			dF.Text = I;
		end;
	end;
function modeDisplayRow(g, u)
	local B = baseRow(g, "Mode", u);
	B.Size = UDim2.new(1, -4, 0, 42);
	local a = B:FindFirstChild("Label");
	if a then
		a.Text = "Mode";
		a.TextSize = 13;
		a.Size = UDim2.new(0, 110, 1, 0);
		a.Position = UDim2.new(0, 12, 0, 0);
		a.TextColor3 = Color3.fromRGB(245, 245, 255);
	end;
	local H = Instance.new("TextLabel");
	H.Name = "ModeValue";
	H.BackgroundTransparency = 1;
	H.Text = I;
	H.TextColor3 = Color3.fromRGB(255, 255, 255);
	H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	H.TextStrokeTransparency = .25;
	H.TextSize = 12;
	H.Font = Enum.Font.GothamSemibold;
	H.TextXAlignment = Enum.TextXAlignment.Right;
	H.Position = UDim2.new(1, -132, 0, 0);
	H.Size = UDim2.new(0, 120, 1, 0);
	H.ZIndex = 6;
	H.Parent = B;
	local i = Instance.new("TextButton");
	i.Name = "ModeClick";
	i.BackgroundTransparency = 1;
	i.Text = "";
	i.Size = UDim2.new(1, 0, 1, 0);
	i.Position = UDim2.new(0, 0, 0, 0);
	i.AutoButtonColor = false;
	i.ZIndex = 8;
	i.Parent = B;
	dF = H;
	i.MouseButton1Click:Connect(function()
		local g = I;
		if g == "Normal" then
			Mj("Carry");
		elseif g == "Carry" then
			Mj("Normal");
		elseif g == "Lagger" then
			Mj("Lagger Carry");
		elseif g == "Lagger Carry" then
			Mj("Lagger");
		else
			Mj("Normal");
		end;
	end);
	lj();
	return B, H;
end;
function aimbotModeButtonRow(g, u)
	local B, a = toggleRow(g, getAimbotModeDisplay(), false, u);
	CF = B and B:FindFirstChild("Label");
	_G.MasaAimbotSetVisual = a;
	refreshAimbotButtonLabel();
	if _G.MasaRefreshAimbotVisual then
		_G.MasaRefreshAimbotVisual();
	end;
	_masaBtn = B and B:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			if _G.MasaToggleSelectedAimbot then
				_G.MasaToggleSelectedAimbot();
			end;
		end);
	end;
	return B, a;
end;
_G.MasaAimbotSelectorRow = function(g, u)
		local B = Instance.new("Frame");
		B.Name = "Aimbot Mode";
		B.BackgroundColor3 = HF.row;
		B.BackgroundTransparency = .28;
		B.Size = UDim2.new(1, -4, 0, 42);
		B.BorderSizePixel = 0;
		B.LayoutOrder = u;
		B.ZIndex = 4;
		B.ClipsDescendants = true;
		B.Parent = g;
		corner(B, 14);
		stroke(B, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(B, nil, "soft");
		local a = Instance.new("Frame");
		a.Name = "SelectedSlide";
		a.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		a.BackgroundTransparency = .1;
		a.Size = UDim2.new(.5, -3, 1, -8);
		a.Position = UDim2.new(0, 4, 0, 4);
		a.BorderSizePixel = 0;
		a.ZIndex = 5;
		a.Parent = B;
		corner(a, 13);
		local H = Instance.new("UIStroke");
		H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		H.Color = Color3.fromRGB(255, 170, 210);
		H.Thickness = 1.5;
		H.Transparency = .1;
		H.Parent = a;
		local i = Instance.new("UIGradient");
		i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		i.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		i.Parent = a;
		_G._MasaRegAccent(a, i, "slide");
		i.Rotation = 22;
		local R = Instance.new("TextLabel");
		R.Name = "V1Text";
		R.BackgroundTransparency = 1;
		R.Text = "BAT AIMBOT V1";
		R.TextColor3 = HF.white;
		R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		R.TextStrokeTransparency = .2;
		R.TextSize = 10;
		R.Font = Enum.Font.GothamBlack;
		R.TextXAlignment = Enum.TextXAlignment.Center;
		R.Size = UDim2.new(.5, 0, 1, 0);
		R.Position = UDim2.new(0, 0, 0, 0);
		R.ZIndex = 8;
		R.Parent = B;
		local O = Instance.new("TextLabel");
		O.Name = "V2Text";
		O.BackgroundTransparency = 1;
		O.Text = "BAT AIMBOT V2";
		O.TextColor3 = HF.white;
		O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		O.TextStrokeTransparency = .2;
		O.TextSize = 10;
		O.Font = Enum.Font.GothamBlack;
		O.TextXAlignment = Enum.TextXAlignment.Center;
		O.Size = UDim2.new(.5, 0, 1, 0);
		O.Position = UDim2.new(.5, 0, 0, 0);
		O.ZIndex = 8;
		O.Parent = B;
		local c = Instance.new("TextButton");
		c.Name = "V1Click";
		c.BackgroundTransparency = 1;
		c.Text = "";
		c.AutoButtonColor = false;
		c.Size = UDim2.new(.5, 0, 1, 0);
		c.Position = UDim2.new(0, 0, 0, 0);
		c.ZIndex = 10;
		c.Parent = B;
		local h = Instance.new("TextButton");
		h.Name = "V2Click";
		h.BackgroundTransparency = 1;
		h.Text = "";
		h.AutoButtonColor = false;
		h.Size = UDim2.new(.5, 0, 1, 0);
		h.Position = UDim2.new(.5, 0, 0, 0);
		h.ZIndex = 10;
		h.Parent = B;
		local function Q(g)
			if g == "Bypass" or g == "Anti Bypass" then
				g = "V2";
			elseif g ~= "V2" then
				g = "V1";
			end;
			N = g;
			if _G.MasaRefreshAimbotChaseRows then
				_G.MasaRefreshAimbotChaseRows();
			end;
			refreshAimbotModeLabels();
			if _G.MasaRefreshAimbotSpeedBoxes then
				_G.MasaRefreshAimbotSpeedBoxes();
			end;
			if _G.MasaRefreshAimbotVisual then
				_G.MasaRefreshAimbotVisual();
			end;
			saveMasaConfig();
			local u = N == "V2";
			tween(a, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(R, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(O, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		c.MouseButton1Click:Connect(function()
			Q("V1");
		end);
		h.MouseButton1Click:Connect(function()
			Q("V2");
		end);
		Q(N);
		return B, Q;
	end;
function autoStealSelectorRow(g, u)
	local B = Instance.new("Frame");
	B.Name = "Auto Steal Mode";
	B.BackgroundColor3 = HF.row;
	B.BackgroundTransparency = .28;
	B.Size = UDim2.new(1, -4, 0, 42);
	B.BorderSizePixel = 0;
	B.LayoutOrder = u;
	B.ZIndex = 4;
	B.ClipsDescendants = true;
	B.Parent = g;
	corner(B, 14);
	stroke(B, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(B, nil, "soft");
	local a = Instance.new("Frame");
	a.Name = "SelectedSlide";
	a.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	a.BackgroundTransparency = .1;
	a.Size = UDim2.new(.5, -3, 1, -8);
	a.Position = UDim2.new(0, 4, 0, 4);
	a.BorderSizePixel = 0;
	a.ZIndex = 5;
	a.Parent = B;
	corner(a, 13);
	local H = Instance.new("UIStroke");
	H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	H.Color = Color3.fromRGB(255, 170, 210);
	H.Thickness = 1.5;
	H.Transparency = .1;
	H.Parent = a;
	local i = Instance.new("UIGradient");
	i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	i.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
	i.Parent = a;
	_G._MasaRegAccent(a, i, "slide");
	i.Rotation = 22;
	local R = Instance.new("TextLabel");
	R.Name = "NormalText";
	R.BackgroundTransparency = 1;
	R.Text = "NORMAL";
	R.TextColor3 = HF.white;
	R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	R.TextStrokeTransparency = .2;
	R.TextSize = 11;
	R.Font = Enum.Font.GothamBlack;
	R.TextXAlignment = Enum.TextXAlignment.Center;
	R.Size = UDim2.new(.5, 0, 1, 0);
	R.Position = UDim2.new(0, 0, 0, 0);
	R.ZIndex = 8;
	R.Parent = B;
	local O = Instance.new("TextLabel");
	O.Name = "SemiText";
	O.BackgroundTransparency = 1;
	O.Text = "SEMI";
	O.TextColor3 = HF.white;
	O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	O.TextStrokeTransparency = .2;
	O.TextSize = 11;
	O.Font = Enum.Font.GothamBlack;
	O.TextXAlignment = Enum.TextXAlignment.Center;
	O.Size = UDim2.new(.5, 0, 1, 0);
	O.Position = UDim2.new(.5, 0, 0, 0);
	O.ZIndex = 8;
	O.Parent = B;
	local c = Instance.new("TextButton");
	c.Name = "NormalClick";
	c.BackgroundTransparency = 1;
	c.Text = "";
	c.AutoButtonColor = false;
	c.Size = UDim2.new(.5, 0, 1, 0);
	c.Position = UDim2.new(0, 0, 0, 0);
	c.ZIndex = 10;
	c.Parent = B;
	local h = Instance.new("TextButton");
	h.Name = "SemiClick";
	h.BackgroundTransparency = 1;
	h.Text = "";
	h.AutoButtonColor = false;
	h.Size = UDim2.new(.5, 0, 1, 0);
	h.Position = UDim2.new(.5, 0, 0, 0);
	h.ZIndex = 10;
	h.Parent = B;
	local function Q(g)
		if g ~= "Semi" then
			g = "Normal";
		end;
		_G.MasaStealRadii = _G.MasaStealRadii or {
				Normal = 62,
				Semi = 60,
				SemiV2Radius = 60,
				SemiV2SemiRadius = 8,
			};
		if w == "Semi" and k == "V2" then
 
		else
			_G.MasaStealRadii[w] = tonumber(t) or _G.MasaStealRadii[w];
		end;
		w = g;
		if w == "Semi" and k == "V2" then
			if E then
				E.Text = tostring(_G.MasaStealRadii.SemiV2Radius or 60);
			end;
		else
			t = _G.MasaStealRadii[w] or ((w == "Semi") and 60 or 62);
			if E then
				E.Text = tostring(t);
			end;
		end;
		local u = w == "Semi";
		tween(a, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
		tween(R, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
		tween(O, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		if _G.MasaRefreshSemiStealRows then
			_G.MasaRefreshSemiStealRows();
		end;
		task.spawn(function()
			saveMasaConfig();
			if _G.MasaNormalAutoStealSetRadius then
				_G.MasaNormalAutoStealSetRadius(_G.MasaStealRadii.Normal or 62);
			end;
			if _G.MasaSemiAutoStealSetRadius then
				_G.MasaSemiAutoStealSetRadius(_G.MasaStealRadii.Semi or 60);
			end;
			if _G.MasaSemiV2SetRadius then
				_G.MasaSemiV2SetRadius(_G.MasaStealRadii.SemiV2Radius or 60);
			end;
			if _G.MasaAutoStealSync then
				_G.MasaAutoStealSync();
			end;
		end);
	end;
	c.MouseButton1Click:Connect(function()
		Q("Normal");
	end);
	h.MouseButton1Click:Connect(function()
		Q("Semi");
	end);
	Q(w);
	_G.MasaSetStealMode = Q;
	return B, Q;
end;
task.wait();
Movement = tF.MOVEMENT;
section(Movement, "SPEED", 1);
_, normalSpeedBox = textboxRow(Movement, "Normal Speed", tostring(F), 2);
normalSpeedBox.FocusLost:Connect(function()
	local g = tonumber(normalSpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		F = g;
	end;
	normalSpeedBox.Text = tostring(F);
	saveMasaConfig();
end);
_, carrySpeedBox = textboxRow(Movement, "Carry Speed", tostring(S), 3);
carrySpeedBox.FocusLost:Connect(function()
	local g = tonumber(carrySpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		S = g;
	end;
	carrySpeedBox.Text = tostring(S);
	saveMasaConfig();
end);
_, laggerSpeedBox = textboxRow(Movement, "Lagger Normal", tostring(r), 4);
laggerSpeedBox.FocusLost:Connect(function()
	local g = tonumber(laggerSpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		r = g;
	end;
	laggerSpeedBox.Text = tostring(r);
	saveMasaConfig();
end);
_, laggerCarrySpeedBox = textboxRow(Movement, "Lagger Carry", tostring(U), 5);
laggerCarrySpeedBox.FocusLost:Connect(function()
	local g = tonumber(laggerCarrySpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		U = g;
	end;
	laggerCarrySpeedBox.Text = tostring(U);
	saveMasaConfig();
end);
_G._MasaBuildAutoCarryModeSelector = function(g, u)
		local B = false;
		local a = Instance.new("TextButton");
		a.Name = "AutoCarryModeArrow";
		a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		a.BackgroundTransparency = .18;
		a.BorderSizePixel = 0;
		a.Size = UDim2.new(0, 28, 0, 24);
		a.Position = UDim2.new(1, -90, .5, -12);
		a.Text = "\226\150\178";
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .3;
		a.TextSize = 15;
		a.Font = Enum.Font.GothamBold;
		a.AutoButtonColor = false;
		a.ZIndex = 8;
		a.Parent = g;
		corner(a, 7);
		stroke(a, HF.strokeSoft, 1, .45);
		local H = Instance.new("Frame");
		H.Name = "AutoCarry Mode Selector";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = 6.5;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = false;
		H.Parent = u;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("Frame");
		i.Name = "SelectedSlide";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .1;
		i.Size = UDim2.new(.5, -3, 1, -8);
		i.Position = UDim2.new(0, 4, 0, 4);
		i.BorderSizePixel = 0;
		i.ZIndex = 5;
		i.Parent = H;
		corner(i, 13);
		local R = Instance.new("UIStroke");
		R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		R.Color = Color3.fromRGB(255, 170, 210);
		R.Thickness = 1.5;
		R.Transparency = .1;
		R.Parent = i;
		local O = Instance.new("UIGradient");
		O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		O.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		O.Parent = i;
		_G._MasaRegAccent(i, O, "slide");
		O.Rotation = 22;
		local c = Instance.new("TextLabel");
		c.Name = "NormalText";
		c.BackgroundTransparency = 1;
		c.Text = "NORMAL";
		c.TextColor3 = HF.white;
		c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		c.TextStrokeTransparency = .2;
		c.TextSize = 11;
		c.Font = Enum.Font.GothamBlack;
		c.TextXAlignment = Enum.TextXAlignment.Center;
		c.Size = UDim2.new(.5, 0, 1, 0);
		c.Position = UDim2.new(0, 0, 0, 0);
		c.ZIndex = 8;
		c.Parent = H;
		local h = Instance.new("TextLabel");
		h.Name = "SoftText";
		h.BackgroundTransparency = 1;
		h.Text = "SOFT";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .2;
		h.TextSize = 11;
		h.Font = Enum.Font.GothamBlack;
		h.TextXAlignment = Enum.TextXAlignment.Center;
		h.Size = UDim2.new(.5, 0, 1, 0);
		h.Position = UDim2.new(.5, 0, 0, 0);
		h.ZIndex = 8;
		h.Parent = H;
		local Q = Instance.new("TextButton");
		Q.Name = "NormalClick";
		Q.BackgroundTransparency = 1;
		Q.Text = "";
		Q.AutoButtonColor = false;
		Q.Size = UDim2.new(.5, 0, 1, 0);
		Q.Position = UDim2.new(0, 0, 0, 0);
		Q.ZIndex = 10;
		Q.Parent = H;
		local e = Instance.new("TextButton");
		e.Name = "SoftClick";
		e.BackgroundTransparency = 1;
		e.Text = "";
		e.AutoButtonColor = false;
		e.Size = UDim2.new(.5, 0, 1, 0);
		e.Position = UDim2.new(.5, 0, 0, 0);
		e.ZIndex = 10;
		e.Parent = H;
		local function P(g)
			local u = (g == "SOFT");
			tween(i, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(c, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(h, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		local function m(g)
			if g ~= "SOFT" then
				g = "NORMAL";
			end;
			if _G._MasaAutoCarryMode ~= g then
				_G._MasaAS.locked = false;
				_G._MasaAS.wasLow = false;
				if _G._MasaAS.savedMode then
					_G._MasaAS.restoring = true;
					pcall(function()
						Mj(_G._MasaAS.savedMode);
					end);
					_G._MasaAS.restoring = false;
					_G._MasaAS.savedMode = nil;
				end;
				_G._MasaAutoCarrySoft.lastScan = 0;
			end;
			_G._MasaAutoCarryMode = g;
			P(g);
			saveMasaConfig();
		end;
		_G.MasaRefreshAutoCarryModeSelector = function()
				P(_G._MasaAutoCarryMode or "NORMAL");
			end;
		local function Z(g)
			B = g;
			_G._MasaExpand(H, g, 42, a);
		end;
		a.Activated:Connect(function()
			Z(not B);
		end);
		Q.MouseButton1Click:Connect(function()
			m("NORMAL");
		end);
		e.MouseButton1Click:Connect(function()
			m("SOFT");
		end);
		P(_G._MasaAutoCarryMode or "NORMAL");
	end;
_, setAutoCarrySpeedVisual = toggleRow(Movement, "Auto Carry Speed", autoCarrySpeedEnabled, 6);
do
	local g = Movement:FindFirstChild("Auto Carry Speed");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			autoCarrySpeedEnabled = not autoCarrySpeedEnabled;
			if autoCarrySpeedEnabled ~= true then
				if _G.AutoCarrySpeed and _G.AutoCarrySpeed.Disable then
					_G.AutoCarrySpeed.Disable();
				end;
				_G._MasaAS.locked = false;
				_G._MasaAS.wasLow = false;
				if _G._MasaAS.savedMode then
					_G._MasaAS.restoring = true;
					Mj(_G._MasaAS.savedMode);
					_G._MasaAS.restoring = false;
					_G._MasaAS.savedMode = nil;
				end;
			end;
			if setAutoCarrySpeedVisual then
				setAutoCarrySpeedVisual(autoCarrySpeedEnabled == true);
			end;
			saveMasaConfig();
		end);
	end;
	if g then
		_G._MasaBuildAutoCarryModeSelector(g, Movement);
	end;
end;
modeDisplayRow(Movement, 7);
section(Movement, "TELEPORT", 8);
autoTPRow = nil;
autoTPRow, Z.setAutoTPVisual = toggleRow(Movement, "Auto TP Down", nl, 9);
do
	local g = autoTPRow and autoTPRow:FindFirstChild("ToggleButton");
	if g then
		g.MouseButton1Click:Connect(function()
			if jl then
				return;
			end;
			jl = true;
			local g = not nl;
			xl(g);
			task.delay(.15, function()
				jl = false;
				if Z.setAutoTPVisual then
					Z.setAutoTPVisual(nl);
				end;
			end);
		end);
	end;
	if nl then
		Dl();
	else
		Kl();
	end;
end;
do
	local g = false;
	local u = Instance.new("TextButton");
	u.Name = "AutoTPHeightArrow";
	u.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	u.BackgroundTransparency = .18;
	u.BorderSizePixel = 0;
	u.Size = UDim2.new(0, 28, 0, 24);
	u.Position = UDim2.new(1, -90, .5, -12);
	u.Text = "\226\150\178";
	u.TextColor3 = HF.white;
	u.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	u.TextStrokeTransparency = .3;
	u.TextSize = 15;
	u.Font = Enum.Font.GothamBold;
	u.AutoButtonColor = false;
	u.ZIndex = 8;
	u.Parent = autoTPRow;
	corner(u, 7);
	stroke(u, HF.strokeSoft, 1, .45);
	local B = Instance.new("Frame");
	B.Name = "Auto TP Height Holder";
	B.BackgroundColor3 = HF.row;
	B.BackgroundTransparency = .28;
	B.Size = UDim2.new(1, -4, 0, 42);
	B.BorderSizePixel = 0;
	B.LayoutOrder = 9;
	B.ZIndex = 4;
	B.ClipsDescendants = true;
	B.Visible = false;
	B.Parent = Movement;
	corner(B, 14);
	stroke(B, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(B, nil, "soft");
	local a = Instance.new("TextLabel");
	a.Name = "Label";
	a.BackgroundTransparency = 1;
	a.Text = "Auto TP Height";
	a.TextColor3 = HF.white;
	a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	a.TextStrokeTransparency = .25;
	a.TextSize = 11;
	a.Font = Enum.Font.GothamSemibold;
	a.TextXAlignment = Enum.TextXAlignment.Left;
	a.Size = UDim2.new(.55, 0, 1, 0);
	a.Position = UDim2.new(0, 12, 0, 0);
	a.ZIndex = 8;
	a.Parent = B;
	autoTPHeightBox = Instance.new("TextBox");
	autoTPHeightBox.Name = "AutoTPHeightBox";
	autoTPHeightBox.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	autoTPHeightBox.BackgroundTransparency = .18;
	autoTPHeightBox.Text = tostring(Al);
	autoTPHeightBox.TextColor3 = HF.white;
	autoTPHeightBox.TextSize = 12;
	autoTPHeightBox.Font = Enum.Font.GothamSemibold;
	autoTPHeightBox.ClearTextOnFocus = false;
	autoTPHeightBox.Size = UDim2.new(0, 58, 0, 24);
	autoTPHeightBox.Position = UDim2.new(1, -68, .5, -12);
	autoTPHeightBox.BorderSizePixel = 0;
	autoTPHeightBox.ZIndex = 6;
	autoTPHeightBox.Parent = B;
	corner(autoTPHeightBox, 7);
	stroke(autoTPHeightBox, HF.strokeSoft, 1, .45);
	_G.MasaRefreshAutoTPHeightBox = function()
			pcall(function()
				autoTPHeightBox.Text = tostring(Al);
			end);
		end;
	autoTPHeightBox.FocusLost:Connect(function()
		local g = tonumber(autoTPHeightBox.Text);
		if g and (g >= -500 and g <= 500) then
			Al = g;
		end;
		autoTPHeightBox.Text = tostring(Al);
		saveMasaConfig();
	end);
	u.Activated:Connect(function()
		g = not g;
		_G._MasaExpand(B, g, 42, u);
	end);
end;
_G._MasaBuildDropMethodSelector = function(g, u, B)
		local a = false;
		local H = baseRow(g, "Drop Method", u);
		local i = Instance.new("TextButton");
		i.Name = "DropMethodArrow";
		i.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		i.BackgroundTransparency = .18;
		i.BorderSizePixel = 0;
		i.Size = UDim2.new(0, 28, 0, 24);
		i.Position = UDim2.new(1, -40, .5, -12);
		i.Text = "\226\150\178";
		i.TextColor3 = HF.white;
		i.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		i.TextStrokeTransparency = .3;
		i.TextSize = 15;
		i.Font = Enum.Font.GothamBold;
		i.AutoButtonColor = false;
		i.ZIndex = 8;
		i.Parent = H;
		corner(i, 7);
		stroke(i, HF.strokeSoft, 1, .45);
		local R = Instance.new("Frame");
		R.Name = "Drop Method Mode";
		R.BackgroundColor3 = HF.row;
		R.BackgroundTransparency = .28;
		R.Size = UDim2.new(1, -4, 0, 42);
		R.BorderSizePixel = 0;
		R.LayoutOrder = B;
		R.ZIndex = 4;
		R.ClipsDescendants = true;
		R.Visible = false;
		R.Parent = g;
		corner(R, 14);
		stroke(R, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(R, nil, "soft");
		local O = Instance.new("Frame");
		O.Name = "SelectedSlide";
		O.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		O.BackgroundTransparency = .1;
		O.Size = UDim2.new(.5, -3, 1, -8);
		O.Position = UDim2.new(0, 4, 0, 4);
		O.BorderSizePixel = 0;
		O.ZIndex = 5;
		O.Parent = R;
		corner(O, 13);
		local c = Instance.new("UIStroke");
		c.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		c.Color = Color3.fromRGB(255, 170, 210);
		c.Thickness = 1.5;
		c.Transparency = .1;
		c.Parent = O;
		local h = Instance.new("UIGradient");
		h.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		h.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		h.Parent = O;
		_G._MasaRegAccent(O, h, "slide");
		h.Rotation = 22;
		local Q = Instance.new("TextLabel");
		Q.Name = "TpUpText";
		Q.BackgroundTransparency = 1;
		Q.Text = "TP UP";
		Q.TextColor3 = HF.white;
		Q.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		Q.TextStrokeTransparency = .2;
		Q.TextSize = 11;
		Q.Font = Enum.Font.GothamBlack;
		Q.TextXAlignment = Enum.TextXAlignment.Center;
		Q.Size = UDim2.new(.5, 0, 1, 0);
		Q.Position = UDim2.new(0, 0, 0, 0);
		Q.ZIndex = 8;
		Q.Parent = R;
		local e = Instance.new("TextLabel");
		e.Name = "StandStillText";
		e.BackgroundTransparency = 1;
		e.Text = "STAND STILL";
		e.TextColor3 = HF.white;
		e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		e.TextStrokeTransparency = .2;
		e.TextSize = 11;
		e.Font = Enum.Font.GothamBlack;
		e.TextXAlignment = Enum.TextXAlignment.Center;
		e.Size = UDim2.new(.5, 0, 1, 0);
		e.Position = UDim2.new(.5, 0, 0, 0);
		e.ZIndex = 8;
		e.Parent = R;
		local P = Instance.new("TextButton");
		P.Name = "TpUpClick";
		P.BackgroundTransparency = 1;
		P.Text = "";
		P.AutoButtonColor = false;
		P.Size = UDim2.new(.5, 0, 1, 0);
		P.Position = UDim2.new(0, 0, 0, 0);
		P.ZIndex = 10;
		P.Parent = R;
		local m = Instance.new("TextButton");
		m.Name = "StandStillClick";
		m.BackgroundTransparency = 1;
		m.Text = "";
		m.AutoButtonColor = false;
		m.Size = UDim2.new(.5, 0, 1, 0);
		m.Position = UDim2.new(.5, 0, 0, 0);
		m.ZIndex = 10;
		m.Parent = R;
		local function Z()
			local g = Yl == "Stand Still";
			tween(O, { Position = g and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(Q, { TextTransparency = g and .5 or 0, TextStrokeTransparency = g and .38 or .2 }, .14);
			tween(e, { TextTransparency = g and 0 or .5, TextStrokeTransparency = g and .2 or .38 }, .14);
		end;
		local function F(g)
			if g ~= "Stand Still" then
				g = "TP UP";
			end;
			Yl = g;
			Z();
			saveMasaConfig();
		end;
		_G.MasaRefreshDropMethodSelector = function()
				Z();
			end;
		P.MouseButton1Click:Connect(function()
			F("TP UP");
		end);
		m.MouseButton1Click:Connect(function()
			F("Stand Still");
		end);
		i.Activated:Connect(function()
			a = not a;
			_G._MasaExpand(R, a, 42, i);
		end);
		Z();
	end;
_G._MasaBuildLookAtRadiusSelector = function(g, u)
		local B = false;
		local a = Instance.new("TextButton");
		a.Name = "LookAtArrow";
		a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		a.BackgroundTransparency = .18;
		a.BorderSizePixel = 0;
		a.Size = UDim2.new(0, 28, 0, 24);
		a.Position = UDim2.new(1, -90, .5, -12);
		a.Text = "\226\150\178";
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .3;
		a.TextSize = 15;
		a.Font = Enum.Font.GothamBold;
		a.AutoButtonColor = false;
		a.ZIndex = 8;
		a.Parent = g;
		corner(a, 7);
		stroke(a, HF.strokeSoft, 1, .45);
		local H = Instance.new("Frame");
		H.Name = "Look At Enemy Radius Holder";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = 15.5;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = false;
		H.Parent = u;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("TextLabel");
		i.BackgroundTransparency = 1;
		i.Text = "Look At Enemy Radius";
		i.TextColor3 = HF.white;
		i.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		i.TextStrokeTransparency = .25;
		i.TextSize = 11;
		i.Font = Enum.Font.GothamSemibold;
		i.TextXAlignment = Enum.TextXAlignment.Left;
		i.Size = UDim2.new(.55, 0, 1, 0);
		i.Position = UDim2.new(0, 12, 0, 0);
		i.ZIndex = 8;
		i.Parent = H;
		local R = Instance.new("TextBox");
		R.Name = "LookAtRadiusBox";
		R.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		R.BackgroundTransparency = .18;
		R.Text = tostring(tonumber(_G.MasaLookAtRadius) or 20);
		R.TextColor3 = HF.white;
		R.TextSize = 12;
		R.Font = Enum.Font.GothamSemibold;
		R.ClearTextOnFocus = false;
		R.Size = UDim2.new(0, 58, 0, 24);
		R.Position = UDim2.new(1, -68, .5, -12);
		R.BorderSizePixel = 0;
		R.ZIndex = 6;
		R.Parent = H;
		corner(R, 7);
		stroke(R, HF.strokeSoft, 1, .45);
		_G.MasaLookAtRadiusBox = R;
		R.FocusLost:Connect(function()
			local g = math.clamp(tonumber(R.Text) or 20, 1, 200);
			_G.MasaLookAtRadius = g;
			R.Text = tostring(g);
			saveMasaConfig();
		end);
		local function O(g)
			B = g;
			_G._MasaExpand(H, g, 42, a);
		end;
		a.Activated:Connect(function()
			O(not B);
		end);
	end;
_G._MasaBuildTPDownMethodSelector = function(g, u, B)
		local a = baseRow(g, "TP Down Method", u);
		local H = Instance.new("TextButton");
		H.Name = "TPDownMethodArrow";
		H.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		H.BackgroundTransparency = .18;
		H.BorderSizePixel = 0;
		H.Size = UDim2.new(0, 28, 0, 24);
		H.Position = UDim2.new(1, -38, .5, -12);
		H.Text = "\226\150\178";
		H.TextColor3 = HF.white;
		H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		H.TextStrokeTransparency = .3;
		H.TextSize = 15;
		H.Font = Enum.Font.GothamBold;
		H.AutoButtonColor = false;
		H.ZIndex = 8;
		H.Parent = a;
		corner(H, 7);
		stroke(H, HF.strokeSoft, 1, .45);
		local i = Instance.new("Frame");
		i.Name = "TP Down Method Selector";
		i.BackgroundColor3 = HF.row;
		i.BackgroundTransparency = .28;
		i.Size = UDim2.new(1, -4, 0, 42);
		i.BorderSizePixel = 0;
		i.LayoutOrder = B;
		i.ZIndex = 4;
		i.ClipsDescendants = true;
		i.Visible = false;
		i.Parent = g;
		corner(i, 14);
		stroke(i, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(i, nil, "soft");
		local R = { "NORMAL", "SLOW", "ZIGZAG" };
		local O = { "NORMAL", "SLOW FALL", "ZIGZAG" };
		local c = #R;
		local h = 1 / c;
		local Q = Instance.new("Frame");
		Q.Name = "SelectedSlide";
		Q.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		Q.BackgroundTransparency = .1;
		Q.Size = UDim2.new(h, -8, 1, -8);
		Q.Position = UDim2.new(0, 4, 0, 4);
		Q.BorderSizePixel = 0;
		Q.ZIndex = 5;
		Q.Parent = i;
		corner(Q, 13);
		local e = Instance.new("UIStroke");
		e.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		e.Color = Color3.fromRGB(255, 170, 210);
		e.Thickness = 1.5;
		e.Transparency = .1;
		e.Parent = Q;
		local P = Instance.new("UIGradient");
		P.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		P.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		P.Rotation = 22;
		P.Parent = Q;
		_G._MasaRegAccent(Q, P, "slide");
		local m = {};
		local function Z(g)
			local u = 1;
			for B, a in ipairs(R) do
				if a == g then
					u = B;
					break;
				end;
			end;
			tween(Q, { Position = UDim2.new(h * ((u - 1)), 4, 0, 4) }, .18);
			for g, B in ipairs(m) do
				local a = (g == u);
				tween(B, { TextTransparency = a and 0 or .5, TextStrokeTransparency = a and .2 or .38 }, .14);
			end;
		end;
		local function F(g)
			local u = false;
			for B, a in ipairs(R) do
				if a == g then
					u = true;
					break;
				end;
			end;
			if not u then
				g = "NORMAL";
			end;
			_G._MasaTPDownMethod = g;
			Z(g);
			saveMasaConfig();
		end;
		for g, u in ipairs(R) do
			local B = Instance.new("TextLabel");
			B.BackgroundTransparency = 1;
			B.Text = O[g];
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .2;
			B.TextSize = 11;
			B.Font = Enum.Font.GothamBlack;
			B.TextXAlignment = Enum.TextXAlignment.Center;
			B.Size = UDim2.new(h, 0, 1, 0);
			B.Position = UDim2.new(h * ((g - 1)), 0, 0, 0);
			B.ZIndex = 8;
			B.Parent = i;
			m[g] = B;
			local a = Instance.new("TextButton");
			a.BackgroundTransparency = 1;
			a.Text = "";
			a.AutoButtonColor = false;
			a.Size = UDim2.new(h, 0, 1, 0);
			a.Position = UDim2.new(h * ((g - 1)), 0, 0, 0);
			a.ZIndex = 10;
			a.Parent = i;
			a.MouseButton1Click:Connect(function()
				F(u);
			end);
		end;
		local S = false;
		H.Activated:Connect(function()
			S = not S;
			_G._MasaExpand(i, S, 42, H);
		end);
		_G.MasaRefreshTPDownMethodSelector = function()
				Z(_G._MasaTPDownMethod or "NORMAL");
			end;
		Z(_G._MasaTPDownMethod or "NORMAL");
	end;
_G._MasaBuildTPDownMethodSelector(Movement, 8, 8);
_G._MasaBuildJumpModeSelector = function(g, u)
		local B = false;
		local a = Instance.new("TextButton");
		a.Name = "JumpModeArrow";
		a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		a.BackgroundTransparency = .18;
		a.BorderSizePixel = 0;
		a.Size = UDim2.new(0, 28, 0, 24);
		a.Position = UDim2.new(1, -90, .5, -12);
		a.Text = "\226\150\178";
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .3;
		a.TextSize = 15;
		a.Font = Enum.Font.GothamBold;
		a.AutoButtonColor = false;
		a.ZIndex = 8;
		a.Parent = g;
		corner(a, 7);
		stroke(a, HF.strokeSoft, 1, .45);
		local H = Instance.new("Frame");
		H.Name = "Jump Mode Selector";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = 15;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = false;
		H.Parent = u;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("Frame");
		i.Name = "SelectedSlide";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .1;
		i.Size = UDim2.new(.5, -3, 1, -8);
		i.Position = UDim2.new(0, 4, 0, 4);
		i.BorderSizePixel = 0;
		i.ZIndex = 5;
		i.Parent = H;
		corner(i, 13);
		local R = Instance.new("UIStroke");
		R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		R.Color = Color3.fromRGB(235, 235, 245);
		R.Thickness = 1;
		R.Transparency = .08;
		R.Parent = i;
		local O = Instance.new("UIGradient");
		O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		O.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		O.Parent = i;
		_G._MasaRegAccent(i, O, "slide");
		local c = Instance.new("TextLabel");
		c.Name = "HoldText";
		c.BackgroundTransparency = 1;
		c.Text = "HOLD";
		c.TextColor3 = HF.white;
		c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		c.TextStrokeTransparency = .2;
		c.TextSize = 11;
		c.Font = Enum.Font.GothamBlack;
		c.TextXAlignment = Enum.TextXAlignment.Center;
		c.Size = UDim2.new(.5, 0, 1, 0);
		c.Position = UDim2.new(0, 0, 0, 0);
		c.ZIndex = 8;
		c.Parent = H;
		local h = Instance.new("TextLabel");
		h.Name = "ManualText";
		h.BackgroundTransparency = 1;
		h.Text = "MANUAL";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .2;
		h.TextSize = 11;
		h.Font = Enum.Font.GothamBlack;
		h.TextXAlignment = Enum.TextXAlignment.Center;
		h.Size = UDim2.new(.5, 0, 1, 0);
		h.Position = UDim2.new(.5, 0, 0, 0);
		h.ZIndex = 8;
		h.Parent = H;
		local Q = Instance.new("TextButton");
		Q.Name = "HoldClick";
		Q.BackgroundTransparency = 1;
		Q.Text = "";
		Q.AutoButtonColor = false;
		Q.Size = UDim2.new(.5, 0, 1, 0);
		Q.Position = UDim2.new(0, 0, 0, 0);
		Q.ZIndex = 10;
		Q.Parent = H;
		local e = Instance.new("TextButton");
		e.Name = "ManualClick";
		e.BackgroundTransparency = 1;
		e.Text = "";
		e.AutoButtonColor = false;
		e.Size = UDim2.new(.5, 0, 1, 0);
		e.Position = UDim2.new(.5, 0, 0, 0);
		e.ZIndex = 10;
		e.Parent = H;
		local function P(g)
			local u = (g == "MANUAL");
			tween(i, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(c, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(h, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		local function m(g)
			if g ~= "MANUAL" then
				g = "HOLD";
			end;
			Jl = g;
			if Jl == "MANUAL" then
				_G.MasaStopNormalInfJumpHoldState();
			end;
			P(Jl);
			saveMasaConfig();
		end;
		_G.MasaRefreshInfJumpModeSelector = function()
				P(Jl);
			end;
		local function Z(g)
			B = g;
			_G._MasaExpand(H, g, 42, a);
		end;
		a.Activated:Connect(function()
			Z(not B);
		end);
		Q.MouseButton1Click:Connect(function()
			m("HOLD");
		end);
		e.MouseButton1Click:Connect(function()
			m("MANUAL");
		end);
		P(Jl);
	end;
section(Movement, "UTILITY", 13);
do
	local g = baseRow(Movement, "Instant Reset Method", 13);
	local u = Instance.new("Frame");
	u.Name = "Instant Reset Method Mode";
	u.BackgroundColor3 = HF.row;
	u.BackgroundTransparency = .28;
	u.Size = UDim2.new(1, -4, 0, 42);
	u.BorderSizePixel = 0;
	u.LayoutOrder = 13;
	u.ZIndex = 4;
	u.ClipsDescendants = true;
	u.Visible = false;
	u.Parent = Movement;
	corner(u, 14);
	stroke(u, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(u, nil, "soft");
	local B = Instance.new("Frame");
	B.Name = "SelectedSlide";
	B.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	B.BackgroundTransparency = .1;
	B.Size = UDim2.new(.5, -8, 1, -8);
	B.Position = UDim2.new(0, 4, 0, 4);
	B.BorderSizePixel = 0;
	B.ZIndex = 5;
	B.Parent = u;
	corner(B, 13);
	local a = Instance.new("UIStroke");
	a.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	a.Color = Color3.fromRGB(255, 170, 210);
	a.Thickness = 1.5;
	a.Transparency = .1;
	a.Parent = B;
	local H = Instance.new("UIGradient");
	H.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	H.Rotation = 22;
	H.Parent = B;
	_G._MasaRegAccent(B, H, "slide");
	local i = {};
	for g = 1, 2, 1 do
		local B = Instance.new("TextLabel");
		B.BackgroundTransparency = 1;
		B.Text = "V" .. g;
		B.TextColor3 = HF.white;
		B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		B.TextStrokeTransparency = .2;
		B.TextSize = 11;
		B.Font = Enum.Font.GothamBlack;
		B.TextXAlignment = Enum.TextXAlignment.Center;
		B.Size = UDim2.new(.5, 0, 1, 0);
		B.Position = UDim2.new(.5 * ((g - 1)), 0, 0, 0);
		B.ZIndex = 8;
		B.Parent = u;
		i[g] = B;
	end;
	local function R()
		local g = ((tonumber(_G.MasaInstantResetVersion) or 1)) == 2 and 2 or 1;
		tween(B, { Position = UDim2.new(.5 * ((g - 1)), 4, 0, 4) }, .18);
		for u, B in ipairs(i) do
			local a = (u == g);
			tween(B, { TextTransparency = a and 0 or .5, TextStrokeTransparency = a and .2 or .38 }, .14);
		end;
	end;
	_G.MasaRefreshInstantResetSelector = R;
	for g = 1, 2, 1 do
		local B = Instance.new("TextButton");
		B.BackgroundTransparency = 1;
		B.Text = "";
		B.AutoButtonColor = false;
		B.Size = UDim2.new(.5, 0, 1, 0);
		B.Position = UDim2.new(.5 * ((g - 1)), 0, 0, 0);
		B.ZIndex = 10;
		B.Parent = u;
		local a = g;
		B.MouseButton1Click:Connect(function()
			_G.MasaInstantResetVersion = a;
			R();
			saveMasaConfig();
		end);
	end;
	local O = Instance.new("TextButton");
	O.Name = "InstantResetMethodArrow";
	O.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	O.BackgroundTransparency = .18;
	O.BorderSizePixel = 0;
	O.Size = UDim2.new(0, 28, 0, 24);
	O.Position = UDim2.new(1, -40, .5, -12);
	O.Text = "\226\150\178";
	O.TextColor3 = HF.white;
	O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	O.TextStrokeTransparency = .3;
	O.TextSize = 15;
	O.Font = Enum.Font.GothamBold;
	O.AutoButtonColor = false;
	O.ZIndex = 8;
	O.Parent = g;
	corner(O, 7);
	stroke(O, HF.strokeSoft, 1, .45);
	local c = false;
	O.Activated:Connect(function()
		c = not c;
		_G._MasaExpand(u, c, 42, O);
	end);
	R();
end;
_G._MasaBuildDropMethodSelector(Movement, 13, 13);
do
	local g = { "AIMBOT", "TPBAT" };
	local u, B = toggleRow(Movement, "Auto After Drop", _G.MasaAfterDrop.enabled == true, 13);
	local a = Instance.new("Frame");
	a.Name = "Auto After Drop Mode";
	a.BackgroundColor3 = HF.row;
	a.BackgroundTransparency = .28;
	a.Size = UDim2.new(1, -4, 0, 42);
	a.BorderSizePixel = 0;
	a.LayoutOrder = 13;
	a.ZIndex = 4;
	a.ClipsDescendants = true;
	a.Visible = false;
	a.Parent = Movement;
	corner(a, 14);
	stroke(a, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(a, nil, "soft");
	local H = Instance.new("Frame");
	H.Name = "SelectedSlide";
	H.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	H.BackgroundTransparency = .1;
	H.Size = UDim2.new(.5, -8, 1, -8);
	H.Position = UDim2.new(0, 4, 0, 4);
	H.BorderSizePixel = 0;
	H.ZIndex = 5;
	H.Parent = a;
	corner(H, 13);
	local i = Instance.new("UIStroke");
	i.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	i.Color = Color3.fromRGB(255, 170, 210);
	i.Thickness = 1.5;
	i.Transparency = .1;
	i.Parent = H;
	local R = Instance.new("UIGradient");
	R.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	R.Rotation = 22;
	R.Parent = H;
	_G._MasaRegAccent(H, R, "slide");
	local O = {};
	for g = 1, 2, 1 do
		local u = Instance.new("TextLabel");
		u.BackgroundTransparency = 1;
		u.Text = "";
		u.TextColor3 = HF.white;
		u.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		u.TextStrokeTransparency = .2;
		u.TextSize = 11;
		u.Font = Enum.Font.GothamBlack;
		u.TextXAlignment = Enum.TextXAlignment.Center;
		u.Size = UDim2.new(.5, 0, 1, 0);
		u.Position = UDim2.new(.5 * ((g - 1)), 0, 0, 0);
		u.ZIndex = 8;
		u.Parent = a;
		O[g] = u;
	end;
	local function c()
		local g = (_G.MasaAfterDrop.action == "TPBAT") and 2 or 1;
		O[1].Text = "BAT AIMBOT " .. (((N == "V2") and "V2" or "V1"));
		O[2].Text = "TP BAT";
		tween(H, { Position = UDim2.new(.5 * ((g - 1)), 4, 0, 4) }, .18);
		for u, B in ipairs(O) do
			local a = (u == g);
			tween(B, { TextTransparency = a and 0 or .5, TextStrokeTransparency = a and .2 or .38 }, .14);
		end;
		if B then
			pcall(B, _G.MasaAfterDrop.enabled == true);
		end;
	end;
	_G.MasaRefreshAfterDropSelector = c;
	for g, u in ipairs(g) do
		local B = Instance.new("TextButton");
		B.BackgroundTransparency = 1;
		B.Text = "";
		B.AutoButtonColor = false;
		B.Size = UDim2.new(.5, 0, 1, 0);
		B.Position = UDim2.new(.5 * ((g - 1)), 0, 0, 0);
		B.ZIndex = 10;
		B.Parent = a;
		B.MouseButton1Click:Connect(function()
			_G.MasaAfterDrop.action = u;
			c();
			saveMasaConfig();
		end);
	end;
	local h = Instance.new("TextButton");
	h.Name = "AutoAfterDropArrow";
	h.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	h.BackgroundTransparency = .18;
	h.BorderSizePixel = 0;
	h.Size = UDim2.new(0, 28, 0, 24);
	h.Position = UDim2.new(1, -90, .5, -12);
	h.Text = "\226\150\178";
	h.TextColor3 = HF.white;
	h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	h.TextStrokeTransparency = .3;
	h.TextSize = 15;
	h.Font = Enum.Font.GothamBold;
	h.AutoButtonColor = false;
	h.ZIndex = 8;
	h.Parent = u;
	corner(h, 7);
	stroke(h, HF.strokeSoft, 1, .45);
	local Q = false;
	h.Activated:Connect(function()
		Q = not Q;
		_G._MasaExpand(a, Q, 42, h);
	end);
	local e = u and u:FindFirstChild("ToggleButton");
	if e then
		e.Activated:Connect(function()
			_G.MasaAfterDrop.enabled = not ((_G.MasaAfterDrop.enabled == true));
			if B then
				B(_G.MasaAfterDrop.enabled);
			end;
			saveMasaConfig();
		end);
	end;
	c();
end;
_, setInfJumpVisual = toggleRow(Movement, "Infinite Jump", yl, 14);
do
	local g = Movement:FindFirstChild("Infinite Jump");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			setInfJumpInternal(not yl);
			if setInfJumpVisual then
				setInfJumpVisual(yl == true);
			end;
			saveMasaConfig();
		end);
	end;
	if g then
		_G._MasaBuildJumpModeSelector(g, Movement);
	end;
end;
_, Z.setLookAtVisual = toggleRow(Movement, "Look At Enemy", _G.MasaLookAtEnabled, 15);
do
	local g = Movement:FindFirstChild("Look At Enemy");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			_G.MasaToggleLookAt(not _G.MasaLookAtEnabled);
			if Z.setLookAtVisual then
				Z.setLookAtVisual(_G.MasaLookAtEnabled == true);
			end;
			saveMasaConfig();
		end);
	end;
	if g then
		_G._MasaBuildLookAtRadiusSelector(g, Movement);
	end;
end;
_G._MasaBuildAntiRagdollModeSelector = function(g, u)
		local B = false;
		local a = Instance.new("TextButton");
		a.Name = "AntiRagdollModeArrow";
		a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		a.BackgroundTransparency = .18;
		a.BorderSizePixel = 0;
		a.Size = UDim2.new(0, 28, 0, 24);
		a.Position = UDim2.new(1, -90, .5, -12);
		a.Text = "\226\150\178";
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .3;
		a.TextSize = 15;
		a.Font = Enum.Font.GothamBold;
		a.AutoButtonColor = false;
		a.ZIndex = 8;
		a.Parent = g;
		corner(a, 7);
		stroke(a, HF.strokeSoft, 1, .45);
		local H = Instance.new("Frame");
		H.Name = "AntiRagdoll Mode Selector";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = 16.5;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = false;
		H.Parent = u;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("Frame");
		i.Name = "SelectedSlide";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .1;
		i.Size = UDim2.new(.5, -3, 1, -8);
		i.Position = UDim2.new(0, 4, 0, 4);
		i.BorderSizePixel = 0;
		i.ZIndex = 5;
		i.Parent = H;
		corner(i, 13);
		local R = Instance.new("UIStroke");
		R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		R.Color = Color3.fromRGB(255, 170, 210);
		R.Thickness = 1.5;
		R.Transparency = .1;
		R.Parent = i;
		local O = Instance.new("UIGradient");
		O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		O.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		O.Parent = i;
		_G._MasaRegAccent(i, O, "slide");
		O.Rotation = 22;
		local c = Instance.new("TextLabel");
		c.Name = "V1Text";
		c.BackgroundTransparency = 1;
		c.Text = "V1";
		c.TextColor3 = HF.white;
		c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		c.TextStrokeTransparency = .2;
		c.TextSize = 11;
		c.Font = Enum.Font.GothamBlack;
		c.TextXAlignment = Enum.TextXAlignment.Center;
		c.Size = UDim2.new(.5, 0, 1, 0);
		c.Position = UDim2.new(0, 0, 0, 0);
		c.ZIndex = 8;
		c.Parent = H;
		local h = Instance.new("TextLabel");
		h.Name = "V2Text";
		h.BackgroundTransparency = 1;
		h.Text = "V2";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .2;
		h.TextSize = 11;
		h.Font = Enum.Font.GothamBlack;
		h.TextXAlignment = Enum.TextXAlignment.Center;
		h.Size = UDim2.new(.5, 0, 1, 0);
		h.Position = UDim2.new(.5, 0, 0, 0);
		h.ZIndex = 8;
		h.Parent = H;
		local Q = Instance.new("TextButton");
		Q.Name = "V1Click";
		Q.BackgroundTransparency = 1;
		Q.Text = "";
		Q.AutoButtonColor = false;
		Q.Size = UDim2.new(.5, 0, 1, 0);
		Q.Position = UDim2.new(0, 0, 0, 0);
		Q.ZIndex = 10;
		Q.Parent = H;
		local e = Instance.new("TextButton");
		e.Name = "V2Click";
		e.BackgroundTransparency = 1;
		e.Text = "";
		e.AutoButtonColor = false;
		e.Size = UDim2.new(.5, 0, 1, 0);
		e.Position = UDim2.new(.5, 0, 0, 0);
		e.ZIndex = 10;
		e.Parent = H;
		local function P(g)
			local u = (g == "V2");
			tween(i, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(c, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(h, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		local function m(g)
			if g ~= "V2" then
				g = "V1";
			end;
			local u = gj;
			if u then
				cj();
			end;
			_G._MasaAntiRagdollMode = g;
			P(g);
			if u then
				Oj();
			end;
			saveMasaConfig();
		end;
		_G.MasaRefreshAntiRagdollModeSelector = function()
				P(_G._MasaAntiRagdollMode or "V1");
			end;
		local function Z(g)
			B = g;
			_G._MasaExpand(H, g, 42, a);
		end;
		a.Activated:Connect(function()
			Z(not B);
		end);
		Q.MouseButton1Click:Connect(function()
			m("V1");
		end);
		e.MouseButton1Click:Connect(function()
			m("V2");
		end);
		P(_G._MasaAntiRagdollMode or "V1");
	end;
_, setAntiRagdollVisual = toggleRow(Movement, "Anti Ragdoll", gj, 16);
do
	local g = Movement:FindFirstChild("Anti Ragdoll");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			hj(not gj);
			if setAntiRagdollVisual then
				setAntiRagdollVisual(gj == true);
			end;
			saveMasaConfig();
		end);
	end;
	if g then
		_G._MasaBuildAntiRagdollModeSelector(g, Movement);
	end;
end;
_, Z.setTPRagdollVisual = toggleRow(Movement, "TP Ragdoll", _G.MasaTPRagdollEnabled == true, 16);
do
	local g = Movement:FindFirstChild("TP Ragdoll");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			if _G.MasaTPRagdoll then
				_G.MasaTPRagdoll.set(not _G.MasaTPRagdollEnabled);
			end;
			if Z.setTPRagdollVisual then
				Z.setTPRagdollVisual(_G.MasaTPRagdollEnabled == true);
			end;
			saveMasaConfig();
		end);
	end;
end;
_, Z.setAntiDieVisual = toggleRow(Movement, "Anti Die", Bj, 17);
do
	local g = Movement:FindFirstChild("Anti Die");
	_masaBtn = g and g:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			local g = _G._MasaAntiDieUserWanted == true;
			if not g and _G._MasaAntiDieAutoOn then
				_G._MasaAntiDieAutoOn = false;
				_G._MasaAntiDieUserWanted = true;
				Bj = true;
				if Z.setAntiDieVisual then
					Z.setAntiDieVisual(true);
				end;
				saveMasaConfig();
				return;
			end;
			if g and (_G.MasaAntiDieLocked and _G.MasaAntiDieLocked()) then
				if Z.setAntiDieVisual then
					Z.setAntiDieVisual(true);
				end;
				return;
			end;
			Ij(not g);
			if Z.setAntiDieVisual then
				Z.setAntiDieVisual(_G._MasaAntiDieUserWanted == true);
			end;
			saveMasaConfig();
		end);
	end;
end;
_, _G.MasaSetNoPlayerCollisionVisual = toggleRow(Movement, "No Player Collision", _G.MasaNoPlayerCollisionEnabled, 18);
do
	_masaBtn = Movement:FindFirstChild("No Player Collision") and (Movement:FindFirstChild("No Player Collision")):FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			_G.MasaNoPlayerCollisionEnabled = not _G.MasaNoPlayerCollisionEnabled;
			if _G.MasaSetNoPlayerCollisionVisual then
				_G.MasaSetNoPlayerCollisionVisual(_G.MasaNoPlayerCollisionEnabled);
			end;
			if _G.MasaNoPlayerCollisionEnabled then
				if enableNoPlayerCollision then
					enableNoPlayerCollision();
				end;
			else
				if disableNoPlayerCollision then
					disableNoPlayerCollision();
				end;
			end;
			saveMasaConfig();
		end);
	end;
end;
_, Z.setUnwalkVisual = toggleRow(Movement, "Unwalk", Ol, 19);
do
	_masaBtn = Movement:FindFirstChild("Unwalk") and (Movement:FindFirstChild("Unwalk")):FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			if Ol then
				Lj();
			else
				pj();
			end;
			if Z.setUnwalkVisual then
				Z.setUnwalkVisual(Ol);
			end;
			saveMasaConfig();
		end);
	end;
end;
_, Z.setSafeModeVisual = toggleRow(Movement, "Safe Mode", T, 20);
do
	_masaBtn = Movement:FindFirstChild("Safe Mode") and (Movement:FindFirstChild("Safe Mode")):FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			T = not T;
			if Z.setSafeModeVisual then
				Z.setSafeModeVisual(T);
			end;
			if T and _G.MasaSafeModeForceStop then
				_G.MasaSafeModeForceStop("SAFE MODE");
			end;
			saveMasaConfig();
		end);
	end;
end;
lj();
task.wait();
Combat = tF.COMBAT;
_G.MasaColorPresets = {
		Color3.fromRGB(255, 255, 255),
		Color3.fromRGB(230, 230, 230),
		Color3.fromRGB(50, 50, 50),
		Color3.fromRGB(0, 0, 0),
		Color3.fromRGB(139, 69, 19),
		Color3.fromRGB(220, 20, 60),
		Color3.fromRGB(255, 0, 0),
		Color3.fromRGB(255, 80, 80),
		Color3.fromRGB(255, 128, 0),
		Color3.fromRGB(255, 140, 0),
		Color3.fromRGB(255, 200, 0),
		Color3.fromRGB(255, 215, 0),
		Color3.fromRGB(0, 255, 0),
		Color3.fromRGB(80, 255, 120),
		Color3.fromRGB(0, 128, 128),
		Color3.fromRGB(64, 224, 208),
		Color3.fromRGB(0, 255, 255),
		Color3.fromRGB(0, 180, 255),
		Color3.fromRGB(0, 100, 255),
		Color3.fromRGB(59, 130, 246),
		Color3.fromRGB(255, 105, 180),
		Color3.fromRGB(255, 0, 255),
		Color3.fromRGB(255, 105, 180),
		Color3.fromRGB(255, 180, 200),
	};
_G._MasaBuildColorPickerRow = function(g)
		local u = baseRow(g.parent, g.rowName, g.rowOrder);
		u.Size = UDim2.new(1, -4, 0, 42);
		u.ClipsDescendants = true;
		u.Visible = false;
		if g.anchorRow then
			local B = false;
			local a = Instance.new("TextButton");
			a.Name = "ColorArrow";
			a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			a.BackgroundTransparency = .18;
			a.BorderSizePixel = 0;
			a.Size = UDim2.new(0, 28, 0, 24);
			a.Position = UDim2.new(1, -90, .5, -12);
			a.Text = "\226\150\178";
			a.TextColor3 = HF.white;
			a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			a.TextStrokeTransparency = .3;
			a.TextSize = 15;
			a.Font = Enum.Font.GothamBold;
			a.AutoButtonColor = false;
			a.ZIndex = 8;
			a.Parent = g.anchorRow;
			corner(a, 7);
			stroke(a, HF.strokeSoft, 1, .45);
			a.Activated:Connect(function()
				B = not B;
				_G._MasaExpand(u, B, 42, a);
			end);
		end;
		local a = Instance.new("Frame");
		a.Name = "ColorPreview";
		a.Size = UDim2.new(0, 28, 0, 28);
		a.Position = UDim2.new(1, -114, .5, -14);
		a.BackgroundColor3 = g.getColor() or Color3.fromRGB(230, 230, 230);
		a.BorderSizePixel = 0;
		a.ZIndex = 6;
		a.Parent = u;
		(Instance.new("UICorner", a)).CornerRadius = UDim.new(1, 0);
		local H = Instance.new("UIStroke");
		H.Color = Color3.fromRGB(255, 255, 255);
		H.Thickness = 1.5;
		H.Transparency = .3;
		H.Parent = a;
		local i = Instance.new("Frame");
		i.Name = "ColorButtonHolder";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .28;
		i.BorderSizePixel = 0;
		i.Size = UDim2.new(0, 66, 0, 30);
		i.Position = UDim2.new(1, -73, .5, -15);
		i.ClipsDescendants = true;
		i.ZIndex = 6;
		i.Parent = u;
		corner(i, 15);
		stroke(i, Color3.fromRGB(255, 170, 210), 1.5, .15);
		local R = Instance.new("UIGradient");
		R.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		R.Rotation = 18;
		R.Parent = i;
		_G._MasaRegAccent(i, R, "pick");
		local O = Instance.new("TextButton");
		O.Name = "ColorButton";
		O.BackgroundTransparency = 1;
		O.Text = "PICK";
		O.TextColor3 = HF.white;
		O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		O.TextStrokeTransparency = .3;
		O.TextSize = 12;
		O.Font = Enum.Font.GothamBlack;
		O.TextXAlignment = Enum.TextXAlignment.Center;
		O.Size = UDim2.new(1, 0, 1, 0);
		O.Position = UDim2.new(0, 0, 0, 0);
		O.BorderSizePixel = 0;
		O.ZIndex = 8;
		O.AutoButtonColor = false;
		O.Parent = i;
		O.MouseEnter:Connect(function()
			tween(i, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
		end);
		O.MouseLeave:Connect(function()
			tween(i, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
		end);
		local function c(g)
			if g then
				a.BackgroundColor3 = g;
			end;
		end;
		local h = nil;
		local function Q()
			if h and h.Parent then
				(B:Create(h.Frame, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
				task.delay(.25, function()
					if h and h.Parent then
						h:Destroy();
					end;
					h = nil;
				end);
			end;
		end;
		local function e(u)
			c(u);
			if g.onColor then
				g.onColor(u);
			end;
		end;
		O.Activated:Connect(function()
			if h and h.Parent then
				Q();
				return;
			end;
			h = Instance.new("ScreenGui");
			h.Name = "MasaHubColorPicker";
			h.ResetOnSpawn = false;
			h.IgnoreGuiInset = true;
			h.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			h.DisplayOrder = 9999;
			h.Parent = m;
			local u = Instance.new("Frame");
			u.Name = "Backdrop";
			u.Size = UDim2.new(1, 0, 1, 0);
			u.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			u.BackgroundTransparency = .5;
			u.BorderSizePixel = 0;
			u.ZIndex = 1;
			u.Parent = h;
			local H = Instance.new("Frame");
			H.Name = "Frame";
			H.Size = UDim2.new(0, 320, 0, 420);
			H.Position = UDim2.new(.5, -160, .5, -210);
			H.BackgroundColor3 = Color3.fromRGB(10, 10, 12);
			H.BorderSizePixel = 0;
			H.ZIndex = 2;
			H.Parent = h;
			corner(H, 16);
			stroke(H, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local i = Instance.new("Frame");
			i.Name = "TitleBar";
			i.Size = UDim2.new(1, 0, 0, 44);
			i.BackgroundColor3 = Color3.fromRGB(14, 14, 17);
			i.BackgroundTransparency = .1;
			i.BorderSizePixel = 0;
			i.ZIndex = 3;
			i.Parent = H;
			corner(i, 16);
			local R = Instance.new("TextLabel");
			R.Name = "Title";
			R.Size = UDim2.new(1, -60, 1, 0);
			R.Position = UDim2.new(0, 16, 0, 0);
			R.BackgroundTransparency = 1;
			R.Text = g.title or "COLOR";
			R.TextColor3 = Color3.fromRGB(255, 255, 255);
			R.Font = Enum.Font.GothamBlack;
			R.TextSize = 15;
			R.TextXAlignment = Enum.TextXAlignment.Left;
			R.ZIndex = 4;
			R.Parent = i;
			local O = Instance.new("TextButton");
			O.Name = "CloseBtn";
			O.Size = UDim2.new(0, 32, 0, 32);
			O.Position = UDim2.new(1, -40, 0, 6);
			O.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			O.BorderSizePixel = 0;
			O.Text = "X";
			O.TextColor3 = Color3.fromRGB(255, 255, 255);
			O.Font = Enum.Font.GothamBlack;
			O.TextSize = 13;
			O.AutoButtonColor = false;
			O.ZIndex = 4;
			O.Parent = i;
			corner(O, 8);
			stroke(O, Color3.fromRGB(90, 90, 105), 1, .4);
			O.MouseEnter:Connect(function()
				tween(O, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
			end);
			O.MouseLeave:Connect(function()
				tween(O, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
			end);
			O.Activated:Connect(Q);
			local c = Instance.new("Frame");
			c.Name = "CurrentPreview";
			c.Size = UDim2.new(0, 64, 0, 64);
			c.Position = UDim2.new(.5, -32, 0, 60);
			c.BackgroundColor3 = a.BackgroundColor3;
			c.BorderSizePixel = 0;
			c.ZIndex = 3;
			c.Parent = H;
			(Instance.new("UICorner", c)).CornerRadius = UDim.new(1, 0);
			local P = Instance.new("UIStroke");
			P.Color = Color3.fromRGB(255, 255, 255);
			P.Thickness = 2;
			P.Transparency = .2;
			P.Parent = c;
			local Z = Instance.new("Frame");
			Z.Name = "ColorGrid";
			Z.Size = UDim2.new(1, -24, 0, 240);
			Z.Position = UDim2.new(0, 12, 0, 140);
			Z.BackgroundTransparency = 1;
			Z.BorderSizePixel = 0;
			Z.ZIndex = 3;
			Z.Parent = H;
			local F = Instance.new("UIGridLayout");
			F.CellSize = UDim2.new(0, 42, 0, 42);
			F.CellPadding = UDim2.new(0, 8, 0, 8);
			F.FillDirection = Enum.FillDirection.Horizontal;
			F.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			F.SortOrder = Enum.SortOrder.LayoutOrder;
			F.Parent = Z;
			for g, u in ipairs(_G.MasaColorPresets) do
				local B = Instance.new("TextButton");
				B.Name = "Color_" .. g;
				B.Size = UDim2.new(1, 0, 1, 0);
				B.BackgroundColor3 = u;
				B.BorderSizePixel = 0;
				B.Text = "";
				B.AutoButtonColor = false;
				B.LayoutOrder = g;
				B.ZIndex = 4;
				B.Parent = Z;
				(Instance.new("UICorner", B)).CornerRadius = UDim.new(0, 14);
				local a = Instance.new("UIGradient");
				a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.5, u), ColorSequenceKeypoint.new(1, u) });
				a.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .6), NumberSequenceKeypoint.new(.5, 0), NumberSequenceKeypoint.new(1, 0) });
				a.Rotation = 125;
				a.Parent = B;
				local H = Instance.new("UIStroke");
				H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				H.Color = Color3.fromRGB(255, 255, 255);
				H.Thickness = 1.5;
				H.Transparency = .65;
				H.Parent = B;
				B.MouseEnter:Connect(function()
					tween(B, { Size = UDim2.new(1, 8, 1, 8), Position = UDim2.new(0, -4, 0, -4) }, .12);
					tween(H, { Transparency = 0, Thickness = 2.6 }, .12);
				end);
				B.MouseLeave:Connect(function()
					tween(B, { Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0) }, .12);
					tween(H, { Transparency = .65, Thickness = 1.5 }, .12);
				end);
				B.Activated:Connect(function()
					e(u);
					c.BackgroundColor3 = u;
					Q();
				end);
			end;
			local S = Instance.new("Frame");
			S.Name = "RGBFrame";
			S.Size = UDim2.new(1, -24, 0, 36);
			S.Position = UDim2.new(0, 12, 1, -52);
			S.BackgroundTransparency = 1;
			S.ZIndex = 3;
			S.Parent = H;
			local r = Instance.new("TextBox");
			r.Name = "R";
			r.Size = UDim2.new(0, 80, 1, 0);
			r.Position = UDim2.new(0, 0, 0, 0);
			r.BackgroundColor3 = Color3.fromRGB(20, 20, 24);
			r.Text = tostring(math.floor(a.BackgroundColor3.R * 255));
			r.TextColor3 = Color3.fromRGB(255, 100, 100);
			r.Font = Enum.Font.GothamBold;
			r.TextSize = 13;
			r.ClearTextOnFocus = false;
			r.ZIndex = 4;
			r.Parent = S;
			corner(r, 8);
			stroke(r, Color3.fromRGB(255, 100, 100), 1, .4);
			local U = Instance.new("TextBox");
			U.Name = "G";
			U.Size = UDim2.new(0, 80, 1, 0);
			U.Position = UDim2.new(.5, -40, 0, 0);
			U.BackgroundColor3 = Color3.fromRGB(20, 20, 24);
			U.Text = tostring(math.floor(a.BackgroundColor3.G * 255));
			U.TextColor3 = Color3.fromRGB(100, 255, 100);
			U.Font = Enum.Font.GothamBold;
			U.TextSize = 13;
			U.ClearTextOnFocus = false;
			U.ZIndex = 4;
			U.Parent = S;
			corner(U, 8);
			stroke(U, Color3.fromRGB(100, 255, 100), 1, .4);
			local I = Instance.new("TextBox");
			I.Name = "B";
			I.Size = UDim2.new(0, 80, 1, 0);
			I.Position = UDim2.new(1, -80, 0, 0);
			I.BackgroundColor3 = Color3.fromRGB(20, 20, 24);
			I.Text = tostring(math.floor(a.BackgroundColor3.B * 255));
			I.TextColor3 = Color3.fromRGB(100, 100, 255);
			I.Font = Enum.Font.GothamBold;
			I.TextSize = 13;
			I.ClearTextOnFocus = false;
			I.ZIndex = 4;
			I.Parent = S;
			corner(I, 8);
			stroke(I, Color3.fromRGB(100, 100, 255), 1, .4);
			local function X()
				local g = math.clamp(tonumber(r.Text) or 0, 0, 255);
				local u = math.clamp(tonumber(U.Text) or 0, 0, 255);
				local B = math.clamp(tonumber(I.Text) or 0, 0, 255);
				local a = Color3.fromRGB(g, u, B);
				e(a);
				c.BackgroundColor3 = a;
				r.Text = tostring(g);
				U.Text = tostring(u);
				I.Text = tostring(B);
			end;
			r.FocusLost:Connect(X);
			U.FocusLost:Connect(X);
			I.FocusLost:Connect(X);
			u.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					Q();
				end;
			end);
			H.Size = UDim2.new(0, 0, 0, 0);
			H.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(H, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 320, 0, 420), Position = UDim2.new(.5, -160, .5, -210) })):Play();
		end);
		return u, c;
	end;
section(Combat, "AUTO STEAL", 1);
autoStealSelectorRow(Combat, 2);
_masaRow, setAutoStealVisual = toggleRow(Combat, "Auto Steal", X, 3);
do
	_masaBtn = _masaRow and _masaRow:FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			X = not X;
			if setAutoStealVisual then
				setAutoStealVisual(X);
			end;
			if _G.MasaAutoStealSync then
				_G.MasaAutoStealSync();
			end;
			saveMasaConfig();
		end);
	end;
end;
_, radiusBox = textboxRow(Combat, "Radius", tostring(t), 4);
E = radiusBox;
if w == "Semi" and k == "V2" then
	radiusBox.Text = tostring(_G.MasaStealRadii.SemiV2Radius or 60);
elseif w == "Semi" then
	radiusBox.Text = tostring(_G.MasaStealRadii.Semi or 60);
else
	radiusBox.Text = tostring(_G.MasaStealRadii.Normal or 62);
end;
radiusBox.FocusLost:Connect(function()
	local g = tonumber(radiusBox.Text);
	_G.MasaStealRadii = _G.MasaStealRadii or {
			Normal = 62,
			Semi = 60,
			SemiV2Radius = 60,
			SemiV2SemiRadius = 8,
		};
	if w == "Semi" and k == "V2" then
		if g and (g > 0 and g <= 500) then
			_G.MasaStealRadii.SemiV2Radius = g;
			if _G.MasaSemiV2SetRadius then
				_G.MasaSemiV2SetRadius(g);
			end;
		end;
		radiusBox.Text = tostring(_G.MasaStealRadii.SemiV2Radius or 60);
	else
		if g and (g > 0 and g <= 500) then
			t = g;
		end;
		_G.MasaStealRadii[w] = t;
		radiusBox.Text = tostring(t);
		if _G.MasaNormalAutoStealSetRadius then
			_G.MasaNormalAutoStealSetRadius(_G.MasaStealRadii.Normal or 62);
		end;
		if _G.MasaSemiAutoStealSetRadius then
			_G.MasaSemiAutoStealSetRadius(_G.MasaStealRadii.Semi or 60);
		end;
	end;
	if _G.MasaAutoStealSync then
		_G.MasaAutoStealSync();
	end;
	saveMasaConfig();
end);
((function()
	local g = Instance.new("Frame");
	g.Name = "Semi Sub Mode";
	g.BackgroundColor3 = HF.row;
	g.BackgroundTransparency = .28;
	g.Size = UDim2.new(1, -4, 0, 42);
	g.BorderSizePixel = 0;
	g.LayoutOrder = 2.5;
	g.ZIndex = 4;
	g.ClipsDescendants = true;
	g.Visible = w == "Semi";
	g.Parent = Combat;
	corner(g, 14);
	stroke(g, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(g, nil, "soft");
	local u = Instance.new("Frame");
	u.Name = "SelectedSlide";
	u.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	u.BackgroundTransparency = .1;
	u.Size = UDim2.new(.33333333333333, -3, 1, -8);
	u.Position = UDim2.new(0, 4, 0, 4);
	u.BorderSizePixel = 0;
	u.ZIndex = 5;
	u.Parent = g;
	corner(u, 13);
	local B = Instance.new("UIStroke");
	B.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	B.Color = Color3.fromRGB(255, 170, 210);
	B.Thickness = 1.5;
	B.Transparency = .1;
	B.Parent = u;
	local a = Instance.new("UIGradient");
	a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	a.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
	a.Parent = u;
	_G._MasaRegAccent(u, a, "slide");
	a.Rotation = 22;
	local H = { "V1", "V2", "V3" };
	local i = 1 / #H;
	local R = {};
	for u, B in ipairs(H) do
		local a = Instance.new("TextLabel");
		a.Name = B .. "Text";
		a.BackgroundTransparency = 1;
		a.Text = "SEMI " .. B;
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .2;
		a.TextSize = 11;
		a.Font = Enum.Font.GothamBlack;
		a.TextXAlignment = Enum.TextXAlignment.Center;
		a.Size = UDim2.new(i, 0, 1, 0);
		a.Position = UDim2.new(i * ((u - 1)), 0, 0, 0);
		a.ZIndex = 8;
		a.Parent = g;
		R[u] = a;
		local H = Instance.new("TextButton");
		H.Name = B .. "Click";
		H.BackgroundTransparency = 1;
		H.Text = "";
		H.AutoButtonColor = false;
		H.Size = UDim2.new(i, 0, 1, 0);
		H.Position = UDim2.new(i * ((u - 1)), 0, 0, 0);
		H.ZIndex = 10;
		H.Parent = g;
		local O = B;
		H.MouseButton1Click:Connect(function()
			if _G.MasaSetSemiSubMode then
				_G.MasaSetSemiSubMode(O);
			end;
		end);
	end;
	local function O(g)
		for u, B in ipairs(H) do
			if B == g then
				return u;
			end;
		end;
		return 1;
	end;
	local function c(g)
		local B = O(g);
		tween(u, { Position = UDim2.new(i * ((B - 1)), (B == 1) and 4 or -1, 0, 4), Size = UDim2.new(i, -3, 1, -8) }, .18);
		for g, u in ipairs(R) do
			local a = (g == B);
			tween(u, { TextTransparency = a and 0 or .5, TextStrokeTransparency = a and .2 or .38 }, .14);
		end;
	end;
	local function h()
		if k == "V2" then
			if E then
				E.Text = tostring((_G.MasaStealRadii and _G.MasaStealRadii.SemiV2Radius) or 60);
			end;
		else
			t = (_G.MasaStealRadii and _G.MasaStealRadii.Semi) or 60;
			if E then
				E.Text = tostring(t);
			end;
		end;
	end;
	local function Q(g)
		if g ~= "V2" and g ~= "V3" then
			g = "V1";
		end;
		k = g;
		c(k);
		h();
		if _G.MasaRefreshSemiStealRows then
			_G.MasaRefreshSemiStealRows();
		end;
	end;
	local function e(g)
		Q(g);
		task.spawn(function()
			saveMasaConfig();
			if _G.MasaAutoStealSync then
				_G.MasaAutoStealSync();
			end;
		end);
	end;
	Q(k);
	_G.MasaSemiSubHolder = g;
	_G.MasaSetSemiSubMode = e;
	_G.MasaSetSemiSubModeVisual = Q;
end))();
((function()
	local g = _G.MasaSemiSteal;
	local function u(u, B)
		return g and g[u] or B;
	end;
	local function B(u, B)
		if g then
			g[u] = B;
		end;
	end;
	local H, i = textboxRow(Combat, "Delay Radius", tostring(u("autoGrabSetDelayRadius", 8)), 4.1);
	_G.MasaDelayRadBox = i;
	i.FocusLost:Connect(function()
		local g = tonumber(i.Text);
		if g and (g > 0 and g <= 500) then
			B("autoGrabSetDelayRadius", g);
		end;
		i.Text = tostring(u("autoGrabSetDelayRadius", 8));
		saveMasaConfig();
	end);
	local R, O = textboxRow(Combat, "Stop Time (s)", tostring(u("autoGrabStopTime", 1.29)), 4.2);
	_G.MasaStopTimeBox = O;
	O.FocusLost:Connect(function()
		local g = tonumber(O.Text);
		if g and (g > 0 and g <= 1.29) then
			B("autoGrabStopTime", g);
		end;
		O.Text = tostring(u("autoGrabStopTime", 1.29));
		saveMasaConfig();
	end);
	local c, h = textboxRow(Combat, "Stop Time (%)", tostring(u("autoGrabStopPercent", 75)), 4.25);
	_G.MasaStopPctBox = h;
	h.FocusLost:Connect(function()
		local g = tonumber(h.Text);
		if g and (g > 0 and g <= 100) then
			B("autoGrabStopPercent", g);
		end;
		h.Text = tostring(u("autoGrabStopPercent", 75));
		saveMasaConfig();
	end);
	local Q = tostring(tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or 8);
	local P, m = textboxRow(Combat, "Semi Radius", Q, 4.15);
	_G.MasaSemiV2RadBox = m;
	m.FocusLost:Connect(function()
		local g = tonumber(m.Text);
		if g and (g > 0 and g <= 500) then
			_G.MasaStealRadii = _G.MasaStealRadii or {};
			_G.MasaStealRadii.SemiV2SemiRadius = g;
			if _G.MasaSemiV2SetSemiRadius then
				_G.MasaSemiV2SetSemiRadius(g);
			end;
		end;
		m.Text = tostring((_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or 8);
		saveMasaConfig();
	end);
	local Z = nil;
	local F = nil;
	local function S()
		if k == "V2" then
			return tonumber(_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or 8;
		end;
		return tonumber(u("autoGrabSetDelayRadius", 8)) or 8;
	end;
	local function r()
		if F then
			pcall(function()
				F:Disconnect();
			end);
			F = nil;
		end;
		if Z then
			pcall(function()
				Z:Destroy();
			end);
			Z = nil;
		end;
	end;
	local function U()
		local g = workspace.CurrentCamera;
		if not g then
			return;
		end;
		for g, u in ipairs(g:GetChildren()) do
			if u ~= Z and (typeof(u) == "Instance" and string.sub(u.Name, 1, 20) == "MasaRadiusCircl") then
				pcall(function()
					u:Destroy();
				end);
			end;
		end;
	end;
	local function I()
		if Z and Z.Parent then
			return Z;
		end;
		U();
		local g = Instance.new("Part");
		g.Name = "MasaRadiusCircle";
		g.Shape = Enum.PartType.Cylinder;
		g.Anchored = true;
		g.CanCollide = false;
		g.CanQuery = false;
		g.CanTouch = false;
		g.CastShadow = false;
		g.Massless = true;
		g.Material = Enum.Material.Neon;
		g.Color = _G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230);
		g.Transparency = .72;
		g.Size = Vector3.new(.12, 2, 2);
		g.Parent = workspace.CurrentCamera;
		Z = g;
		return g;
	end;
	local function X()
		if not ((_G.MasaRadiusCircleEnabled == true)) then
			r();
			return;
		end;
		if w ~= "Semi" then
			if Z then
				Z.Transparency = 1;
			end;
			return;
		end;
		local g = e.Character;
		local u = g and g:FindFirstChild("HumanoidRootPart");
		local B = g and g:FindFirstChildOfClass("Humanoid");
		if not u then
			if Z then
				Z.Transparency = 1;
			end;
			return;
		end;
		local a = I();
		a.Transparency = .72;
		local H = math.clamp(S(), .5, 500) * 2;
		a.Size = Vector3.new(.12, H, H);
		local i = (u.Position.Y - (u.Size.Y * .5)) - (((B and B.HipHeight) or 2));
		local R = _G._AmbRCLastY;
		if R and math.abs(i - R) < 1.5 then
			i = R + ((i - R)) * .4;
		end;
		_G._AmbRCLastY = i;
		a.CFrame = CFrame.new(u.Position.X, i + .2, u.Position.Z) * CFrame.Angles(0, 0, math.rad(90));
	end;
	local function t(g)
		_G.MasaRadiusCircleEnabled = g and true or false;
		if _G.MasaRadiusCircleEnabled then
			if not F then
				F = a.RenderStepped:Connect(function()
						local g = pcall(X);
						if not g and Z then
							Z.Transparency = 1;
						end;
					end);
			end;
		else
			r();
		end;
	end;
	_G.MasaSetRadiusCircle = t;
	_G.MasaSetRadiusCircleColor = function(g)
			if typeof(g) ~= "Color3" then
				return;
			end;
			_G.MasaRadiusCircleColor = g;
			if Z and Z.Parent then
				pcall(function()
					Z.Color = g;
				end);
			end;
		end;
	local V, E = nil, nil;
	_G._MasaBuildRadiusCircleRow = function(g)
			if V then
				return V;
			end;
			local u, B = toggleRow(Combat, "Radius Circle", _G.MasaRadiusCircleEnabled == true, g or 3);
			V = u;
			_G.MasaRadiusCircleSetVisual = B;
			local a = u and u:FindFirstChild("ToggleButton");
			if a then
				a.Activated:Connect(function()
					local g = not ((_G.MasaRadiusCircleEnabled == true));
					t(g);
					if B then
						B(g);
					end;
					saveMasaConfig();
				end);
			end;
			local H, i = _G._MasaBuildColorPickerRow({
					parent = Combat,
					anchorRow = u,
					rowName = "Radius Circle Color",
					rowOrder = g or 3,
					title = "RADIUS CIRCLE COLOR",
					getColor = function()
						return _G.MasaRadiusCircleColor or Color3.fromRGB(230, 230, 230);
					end,
					onColor = function(g)
						if _G.MasaSetRadiusCircleColor then
							_G.MasaSetRadiusCircleColor(g);
						end;
						saveMasaConfig();
					end,
				});
			E = H;
			_G.MasaRadiusCircleSetColorPreview = i;
			if _G.MasaRefreshSemiStealRows then
				_G.MasaRefreshSemiStealRows();
			end;
			return u;
		end;
	t(_G.MasaRadiusCircleEnabled == true);
	local function N()
		local u = w == "Semi";
		local B = u and k == "V2";
		local a = u and k == "V3";
		local H = u and (not B and not a);
		if _G.MasaSemiSubHolder then
			_G.MasaSemiSubHolder.Visible = u;
		end;
		if i and i.Parent then
			i.Parent.Visible = H or a;
		end;
		if O and O.Parent then
			O.Parent.Visible = H;
		end;
		if h and h.Parent then
			h.Parent.Visible = a;
		end;
		if m and m.Parent then
			m.Parent.Visible = B;
		end;
		if V then
			V.Visible = u;
		end;
		if E and not u then
			E.Visible = false;
		end;
		if g then
			if H then
				O.Text = tostring(g.autoGrabStopTime or 1.29);
			end;
			if a then
				h.Text = tostring(g.autoGrabStopPercent or 75);
			end;
			if H or a then
				i.Text = tostring(g.autoGrabSetDelayRadius or 8);
			end;
		end;
		if B then
			m.Text = tostring((_G.MasaStealRadii and _G.MasaStealRadii.SemiV2SemiRadius) or 8);
		end;
	end;
	N();
	_G.MasaRefreshSemiStealRows = N;
end))();
do
	local g, u = toggleRow(Combat, "Synchronize After Hit", _G._MasaSyncAfterHit.enabled, 3);
	_G._MasaSyncAfterHit.setVisual = u;
	local B = g and g:FindFirstChild("ToggleButton");
	if B then
		B.Activated:Connect(function()
			_G._MasaSyncAfterHit.enabled = not _G._MasaSyncAfterHit.enabled;
			if _G._MasaSyncAfterHit.setVisual then
				_G._MasaSyncAfterHit.setVisual(_G._MasaSyncAfterHit.enabled);
			end;
			if _G._MasaSyncAfterHit.enabled then
				Dj();
			else
				Kj();
			end;
			saveMasaConfig();
		end);
	end;
	if _G._MasaSyncAfterHit.setVisual then
		_G._MasaSyncAfterHit.setVisual(_G._MasaSyncAfterHit.enabled);
	end;
end;
if _G._MasaBuildRadiusCircleRow then
	_G._MasaBuildRadiusCircleRow(3);
end;
_G._MasaBuildAimbotChaseSelector = function(g, u, B, a)
		local H = Instance.new("Frame");
		H.Name = "Aimbot Chase " .. u;
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = a;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = (N == u);
		H.Parent = g;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("Frame");
		i.Name = "SelectedSlide";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .1;
		i.Size = UDim2.new(.5, -3, 1, -8);
		i.Position = UDim2.new(0, 4, 0, 4);
		i.BorderSizePixel = 0;
		i.ZIndex = 5;
		i.Parent = H;
		corner(i, 13);
		local R = Instance.new("UIStroke");
		R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		R.Color = Color3.fromRGB(255, 170, 210);
		R.Thickness = 1.5;
		R.Transparency = .1;
		R.Parent = i;
		local O = Instance.new("UIGradient");
		O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		O.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		O.Rotation = 22;
		O.Parent = i;
		_G._MasaRegAccent(i, O, "slide");
		local function c(g, u)
			local B = Instance.new("TextLabel");
			B.BackgroundTransparency = 1;
			B.Text = g;
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .2;
			B.TextSize = 11;
			B.Font = Enum.Font.GothamBlack;
			B.TextXAlignment = Enum.TextXAlignment.Center;
			B.Size = UDim2.new(.5, 0, 1, 0);
			B.Position = UDim2.new(u, 0, 0, 0);
			B.ZIndex = 8;
			B.Parent = H;
			return B;
		end;
		local function h(g)
			local u = Instance.new("TextButton");
			u.BackgroundTransparency = 1;
			u.Text = "";
			u.AutoButtonColor = false;
			u.Size = UDim2.new(.5, 0, 1, 0);
			u.Position = UDim2.new(g, 0, 0, 0);
			u.ZIndex = 10;
			u.Parent = H;
			return u;
		end;
		local Q = c("NORMAL", 0);
		local e = c("BYPASS", .5);
		local P = h(0);
		local m = h(.5);
		local function Z(g)
			local u = (g == "BYPASS");
			tween(i, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(Q, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(e, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		local function F(g)
			if g ~= "BYPASS" then
				g = "NORMAL";
			end;
			_G._MasaAimbotChase = _G._MasaAimbotChase or { V1 = "NORMAL", V2 = "NORMAL" };
			_G._MasaAimbotChase[u] = g;
			Z(g);
			saveMasaConfig();
		end;
		P.MouseButton1Click:Connect(function()
			F("NORMAL");
		end);
		m.MouseButton1Click:Connect(function()
			F("BYPASS");
		end);
		_G["_MasaAimbotChaseHolder" .. u] = H;
		_G["_MasaRefreshAimbotChase" .. u] = function()
				Z((_G._MasaAimbotChase and _G._MasaAimbotChase[u]) or "NORMAL");
			end;
		Z((_G._MasaAimbotChase and _G._MasaAimbotChase[u]) or "NORMAL");
		return H;
	end;
section(Combat, "BAT AIMBOT", 5);
_G.MasaAimbotSelectorRow(Combat, 6);
_G._MasaBuildAimbotChaseSelector(Combat, "V1", nil, 6.1);
_G._MasaBuildAimbotChaseSelector(Combat, "V2", nil, 6.1);
_G.MasaRefreshAimbotChaseRows = function()
		if _G._MasaAimbotChaseHolderV1 then
			_G._MasaAimbotChaseHolderV1.Visible = (N ~= "V2");
		end;
		if _G._MasaAimbotChaseHolderV2 then
			_G._MasaAimbotChaseHolderV2.Visible = (N == "V2");
		end;
	end;
_G.MasaRefreshAimbotChaseRows();
_G.MasaAimbotSetVisual = nil;
if _G.MasaRefreshAimbotVisual then
	_G.MasaRefreshAimbotVisual();
end;
_G.MasaNormalAutoSwingRow, _G.MasaNormalAutoSwingSetVisual, _G.MasaNormalAutoSwingBtn = _G.MasaActionToggleRow(Combat, "Auto Swing", d, 7);
do
	if _G.MasaNormalAutoSwingBtn then
		_G.MasaNormalAutoSwingBtn.MouseButton1Click:Connect(function()
			if _G.MasaAutoSwingClickBusy then
				return;
			end;
			_G.MasaAutoSwingClickBusy = true;
			d = not d;
			if _G.MasaNormalAutoSwingSetVisual then
				_G.MasaNormalAutoSwingSetVisual(d);
			end;
			saveMasaConfig();
			task.delay(.12, function()
				_G.MasaAutoSwingClickBusy = false;
			end);
		end);
	end;
end;
_G.MasaMirrorTPDownRow, _G.MasaMirrorTPDownSetVisual, _G.MasaMirrorTPDownBtn = _G.MasaActionToggleRow(Combat, "Mirror TP Down (Recommended)", C, 7.1);
local LF = _G.MasaMirrorTPDownRow and _G.MasaMirrorTPDownRow:FindFirstChild("Label");
if LF then
	LF.TextSize = 10;
end;
if _G.MasaMirrorTPDownBtn then
	_G.MasaMirrorTPDownBtn.MouseButton1Click:Connect(function()
		if _G.MasaMirrorTPDownClickBusy then
			return;
		end;
		_G.MasaMirrorTPDownClickBusy = true;
		_G.MasaSetMirrorTPDown(not C);
		saveMasaConfig();
		task.delay(.12, function()
			_G.MasaMirrorTPDownClickBusy = false;
		end);
	end);
end;
aimbotSpeedRow, aimbotSpeedBox = textboxRow(Combat, "Bat Aimbot V1 Speed", tostring(n), 8);
_G.MasaAimbotSpeedBox = aimbotSpeedBox;
jF = aimbotSpeedRow and aimbotSpeedRow:FindFirstChild("Label");
refreshAimbotModeLabels();
aimbotSpeedBox.FocusLost:Connect(function()
	local g = tonumber(aimbotSpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		_G.MasaSetSelectedAimbotSpeedValues(g, nil);
	end;
	if _G.MasaRefreshAimbotSpeedBoxes then
		_G.MasaRefreshAimbotSpeedBoxes();
	else
		aimbotSpeedBox.Text = tostring(n);
	end;
	saveMasaConfig();
end);
laggerAimbotSpeedRow, laggerAimbotSpeedBox = textboxRow(Combat, "Bat Aimbot V1 Lagger Speed", tostring(A), 9);
_G.MasaLaggerAimbotSpeedBox = laggerAimbotSpeedBox;
qF = laggerAimbotSpeedRow and laggerAimbotSpeedRow:FindFirstChild("Label");
refreshAimbotModeLabels();
if _G.MasaRefreshAimbotSpeedBoxes then
	_G.MasaRefreshAimbotSpeedBoxes();
end;
laggerAimbotSpeedBox.FocusLost:Connect(function()
	local g = tonumber(laggerAimbotSpeedBox.Text);
	if g and (g > 0 and g <= 250) then
		_G.MasaSetSelectedAimbotSpeedValues(nil, g);
	end;
	if _G.MasaRefreshAimbotSpeedBoxes then
		_G.MasaRefreshAimbotSpeedBoxes();
	else
		laggerAimbotSpeedBox.Text = tostring(A);
	end;
	saveMasaConfig();
end);
section(Combat, "TP BAT", 10);
((function()
	_G.MasaTPBatVersion = math.clamp(tonumber(_G.MasaTPBatVersion) or 1, 1, 3);
	local g = false;
	local u = baseRow(Combat, "TP Bat Versions", 10);
	local B = Instance.new("TextButton");
	B.Name = "TPBatVersionsArrow";
	B.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	B.BackgroundTransparency = .18;
	B.BorderSizePixel = 0;
	B.Size = UDim2.new(0, 28, 0, 24);
	B.Position = UDim2.new(1, -40, .5, -12);
	B.Text = "\226\150\178";
	B.TextColor3 = HF.white;
	B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	B.TextStrokeTransparency = .3;
	B.TextSize = 15;
	B.Font = Enum.Font.GothamBold;
	B.AutoButtonColor = false;
	B.ZIndex = 8;
	B.Parent = u;
	corner(B, 7);
	stroke(B, HF.strokeSoft, 1, .45);
	local a = 46;
	local H = Instance.new("Frame");
	H.Name = "TP Bat Versions Options";
	H.BackgroundTransparency = 1;
	H.Size = UDim2.new(1, 0, 0, a);
	H.BorderSizePixel = 0;
	H.LayoutOrder = 10;
	H.ZIndex = 4;
	H.ClipsDescendants = true;
	H.Visible = false;
	H.Parent = Combat;
	local i = { "V1", "V2", "V3" };
	local R = #i;
	local O = 1 / R;
	local c = Instance.new("Frame");
	c.Name = "TPBatVersionSelector";
	c.BackgroundColor3 = HF.row;
	c.BackgroundTransparency = .28;
	c.Size = UDim2.new(1, -4, 0, 42);
	c.Position = UDim2.new(0, 2, 0, 2);
	c.BorderSizePixel = 0;
	c.ZIndex = 4;
	c.ClipsDescendants = true;
	c.Parent = H;
	corner(c, 14);
	stroke(c, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(c, nil, "soft");
	local h = Instance.new("Frame");
	h.Name = "TPBatVersionSlide";
	h.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	h.BackgroundTransparency = .1;
	h.AnchorPoint = Vector2.new(.5, .5);
	h.Size = UDim2.new(O, -4, 1, -8);
	h.Position = UDim2.new(O * .5, 0, .5, 0);
	h.BorderSizePixel = 0;
	h.ZIndex = 5;
	h.Parent = c;
	corner(h, 13);
	local Q = Instance.new("UIStroke");
	Q.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	Q.Color = Color3.fromRGB(255, 170, 210);
	Q.Thickness = 1.5;
	Q.Transparency = .1;
	Q.Parent = h;
	local e = Instance.new("UIGradient");
	e.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	e.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
	e.Rotation = 22;
	e.Parent = h;
	_G._MasaRegAccent(h, e, "slide");
	local P = {};
	for g, u in ipairs(i) do
		local B = Instance.new("TextLabel");
		B.Name = "TPBatVersionLabel_" .. tostring(g);
		B.BackgroundTransparency = 1;
		B.Text = u;
		B.TextColor3 = HF.white;
		B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		B.TextStrokeTransparency = .2;
		B.TextSize = 11;
		B.Font = Enum.Font.GothamBlack;
		B.TextXAlignment = Enum.TextXAlignment.Center;
		B.AnchorPoint = Vector2.new(.5, .5);
		B.Size = UDim2.new(O, 0, 1, 0);
		B.Position = UDim2.new(O * ((g - .5)), 0, .5, 0);
		B.ZIndex = 8;
		B.Parent = c;
		P[g] = B;
		local a = Instance.new("TextButton");
		a.Name = "TPBatVersionClick_" .. tostring(g);
		a.BackgroundTransparency = 1;
		a.Text = "";
		a.AutoButtonColor = false;
		a.AnchorPoint = Vector2.new(.5, .5);
		a.Size = UDim2.new(O, 0, 1, 0);
		a.Position = UDim2.new(O * ((g - .5)), 0, .5, 0);
		a.ZIndex = 10;
		a.Parent = c;
		local H = g;
		a.MouseButton1Click:Connect(function()
			if _G.MasaSetTPBatVersion then
				_G.MasaSetTPBatVersion(H);
			else
				_G.MasaTPBatVersion = H;
				if _G._MasaTPBatSetVersionVisual then
					_G._MasaTPBatSetVersionVisual(H);
				end;
			end;
		end);
	end;
	local function m(g)
		g = math.clamp(tonumber(g) or 1, 1, R);
		_G._MasaTPBatVisIndex = g;
		tween(h, { Position = UDim2.new(O * ((g - .5)), 0, .5, 0), Size = UDim2.new(O, -4, 1, -8) }, .18);
		for u, B in ipairs(P) do
			local a = (u == g);
			tween(B, { TextTransparency = a and 0 or .22, TextStrokeTransparency = a and .2 or .45 }, .14);
		end;
	end;
	_G._MasaTPBatSetVersionVisual = m;
	B.Activated:Connect(function()
		g = not g;
		_G._MasaExpand(H, g, a, B);
	end);
	m(_G.MasaTPBatVersion or 1);
end))();
_G.MasaTPBatAutoSwingRow, _G.MasaTPBatAutoSwingSetVisual, _G.MasaTPBatAutoSwingBtn = _G.MasaActionToggleRow(Combat, "Auto Swing", j, 11);
do
	if _G.MasaTPBatAutoSwingBtn then
		_G.MasaTPBatAutoSwingBtn.MouseButton1Click:Connect(function()
			if _G.MasaTPBatAutoSwingClickBusy then
				return;
			end;
			_G.MasaTPBatAutoSwingClickBusy = true;
			j = not j;
			if _G.MasaTPBatAutoSwingSetVisual then
				_G.MasaTPBatAutoSwingSetVisual(j);
			end;
			saveMasaConfig();
			task.delay(.12, function()
				_G.MasaTPBatAutoSwingClickBusy = false;
			end);
		end);
	end;
end;
_G.MasaTPBatCameraLockRow, _G.MasaTPBatCameraLockSetVisual, _G.MasaTPBatCameraLockBtn = _G.MasaActionToggleRow(Combat, "Camera Lock", _G._MasaGetTPBatCameraLock and _G._MasaGetTPBatCameraLock() or false, 12);
do
	if _G.MasaTPBatCameraLockBtn then
		_G.MasaTPBatCameraLockBtn.MouseButton1Click:Connect(function()
			if _G.MasaTPBatCameraLockClickBusy then
				return;
			end;
			_G.MasaTPBatCameraLockClickBusy = true;
			local g = not ((_G._MasaGetTPBatCameraLock and _G._MasaGetTPBatCameraLock() or false));
			if _G._MasaSetTPBatCameraLock then
				_G._MasaSetTPBatCameraLock(g);
			end;
			if _G.MasaTPBatCameraLockSetVisual then
				_G.MasaTPBatCameraLockSetVisual(g);
			end;
			saveMasaConfig();
			task.delay(.12, function()
				_G.MasaTPBatCameraLockClickBusy = false;
			end);
		end);
	end;
end;
_G.MasaTPBatSetVisual = function(g)
 
	end;
_G._MasaBuildBatCounterModeSelector = function(g, u)
		local B = false;
		local a = Instance.new("TextButton");
		a.Name = "BatCounterModeArrow";
		a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		a.BackgroundTransparency = .18;
		a.BorderSizePixel = 0;
		a.Size = UDim2.new(0, 28, 0, 24);
		a.Position = UDim2.new(1, -90, .5, -12);
		a.Text = "\226\150\178";
		a.TextColor3 = HF.white;
		a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		a.TextStrokeTransparency = .3;
		a.TextSize = 15;
		a.Font = Enum.Font.GothamBold;
		a.AutoButtonColor = false;
		a.ZIndex = 8;
		a.Parent = g;
		corner(a, 7);
		stroke(a, HF.strokeSoft, 1, .45);
		local H = Instance.new("Frame");
		H.Name = "Bat Counter Mode Selector";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .28;
		H.Size = UDim2.new(1, -4, 0, 42);
		H.BorderSizePixel = 0;
		H.LayoutOrder = 12;
		H.ZIndex = 4;
		H.ClipsDescendants = true;
		H.Visible = false;
		H.Parent = u;
		corner(H, 14);
		stroke(H, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(H, nil, "soft");
		local i = Instance.new("Frame");
		i.Name = "SelectedSlide";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .1;
		i.Size = UDim2.new(.5, -3, 1, -8);
		i.Position = UDim2.new(0, 4, 0, 4);
		i.BorderSizePixel = 0;
		i.ZIndex = 5;
		i.Parent = H;
		corner(i, 13);
		local R = Instance.new("UIStroke");
		R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		R.Color = Color3.fromRGB(235, 235, 245);
		R.Thickness = 1;
		R.Transparency = .08;
		R.Parent = i;
		local O = Instance.new("UIGradient");
		O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		O.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		O.Parent = i;
		_G._MasaRegAccent(i, O, "slide");
		local c = Instance.new("TextLabel");
		c.Name = "V1Text";
		c.BackgroundTransparency = 1;
		c.Text = "COUNTER V1";
		c.TextColor3 = HF.white;
		c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		c.TextStrokeTransparency = .2;
		c.TextSize = 11;
		c.Font = Enum.Font.GothamBlack;
		c.TextXAlignment = Enum.TextXAlignment.Center;
		c.Size = UDim2.new(.5, 0, 1, 0);
		c.Position = UDim2.new(0, 0, 0, 0);
		c.ZIndex = 8;
		c.Parent = H;
		local h = Instance.new("TextLabel");
		h.Name = "V2Text";
		h.BackgroundTransparency = 1;
		h.Text = "COUNTER V2";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .2;
		h.TextSize = 11;
		h.Font = Enum.Font.GothamBlack;
		h.TextXAlignment = Enum.TextXAlignment.Center;
		h.Size = UDim2.new(.5, 0, 1, 0);
		h.Position = UDim2.new(.5, 0, 0, 0);
		h.ZIndex = 8;
		h.Parent = H;
		local Q = Instance.new("TextButton");
		Q.Name = "V1Click";
		Q.BackgroundTransparency = 1;
		Q.Text = "";
		Q.AutoButtonColor = false;
		Q.Size = UDim2.new(.5, 0, 1, 0);
		Q.Position = UDim2.new(0, 0, 0, 0);
		Q.ZIndex = 10;
		Q.Parent = H;
		local e = Instance.new("TextButton");
		e.Name = "V2Click";
		e.BackgroundTransparency = 1;
		e.Text = "";
		e.AutoButtonColor = false;
		e.Size = UDim2.new(.5, 0, 1, 0);
		e.Position = UDim2.new(.5, 0, 0, 0);
		e.ZIndex = 10;
		e.Parent = H;
		local function P(g)
			local u = (g == "V2");
			tween(i, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
			tween(c, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
			tween(h, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
		end;
		local function m(g)
			if g ~= "V2" then
				g = "V1";
			end;
			L = g;
			P(L);
			saveMasaConfig();
		end;
		_G.MasaRefreshBatCounterModeSelector = function()
				P(L);
			end;
		local function Z(g)
			B = g;
			_G._MasaExpand(H, g, 42, a);
		end;
		a.Activated:Connect(function()
			Z(not B);
		end);
		Q.MouseButton1Click:Connect(function()
			m("V1");
		end);
		e.MouseButton1Click:Connect(function()
			m("V2");
		end);
		P(L);
	end;
section(Combat, "COUNTERS", 12);
do
	local g, u = toggleRow(Combat, "Anti Bat", _G.MasaAntiBatEnabled == true, 13);
	Z.setAntiBatVisual = u;
	local B = g and g:FindFirstChild("ToggleButton");
	if B then
		B.Activated:Connect(function()
			local g = not ((_G.MasaAntiBatEnabled == true));
			if _G.MasaAntiBat then
				_G.MasaAntiBat.setEnabled(g);
			end;
			if u then
				u(g);
			end;
			saveMasaConfig();
		end);
	end;
end;
((function()
	local g = false;
	local u = baseRow(Combat, "Anti TP Bat", 12);
	local B = u:FindFirstChildOfClass("UIStroke");
	local a = Instance.new("TextButton");
	a.Name = "AntiTPBatArrow";
	a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
	a.BackgroundTransparency = .18;
	a.BorderSizePixel = 0;
	a.Size = UDim2.new(0, 28, 0, 24);
	a.Position = UDim2.new(1, -40, .5, -12);
	a.Text = "\226\150\178";
	a.TextColor3 = HF.white;
	a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	a.TextStrokeTransparency = .3;
	a.TextSize = 15;
	a.Font = Enum.Font.GothamBold;
	a.AutoButtonColor = false;
	a.ZIndex = 8;
	a.Parent = u;
	corner(a, 7);
	stroke(a, HF.strokeSoft, 1, .45);
	local H = 84;
	local i = Instance.new("Frame");
	i.Name = "Anti TP Bat Options";
	i.BackgroundTransparency = 1;
	i.Size = UDim2.new(1, 0, 0, H);
	i.BorderSizePixel = 0;
	i.LayoutOrder = 12;
	i.ZIndex = 4;
	i.ClipsDescendants = true;
	i.Visible = false;
	i.Parent = Combat;
	local R = Instance.new("Frame");
	R.Name = "SpamRow";
	R.BackgroundColor3 = HF.row;
	R.BackgroundTransparency = .3;
	R.Size = UDim2.new(1, -4, 0, 34);
	R.Position = UDim2.new(0, 2, 0, 48);
	R.BorderSizePixel = 0;
	R.ZIndex = 4;
	R.Parent = i;
	corner(R, 9);
	stroke(R, HF.strokeSoft, 1.15, .38);
	local O = Instance.new("TextLabel");
	O.Name = "Label";
	O.BackgroundTransparency = 1;
	O.Text = "Spam";
	O.TextColor3 = Color3.fromRGB(245, 245, 255);
	O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
	O.TextStrokeTransparency = .25;
	O.TextSize = 12;
	O.Font = Enum.Font.GothamSemibold;
	O.TextXAlignment = Enum.TextXAlignment.Left;
	O.Position = UDim2.new(0, 12, 0, 0);
	O.Size = UDim2.new(1, -132, 1, 0);
	O.ZIndex = 5;
	O.Parent = R;
	local c = Instance.new("TextButton");
	c.Name = "ToggleButton";
	c.BackgroundTransparency = 1;
	c.Text = "";
	c.Size = UDim2.new(1, 0, 1, 0);
	c.AutoButtonColor = false;
	c.ZIndex = 7;
	c.Parent = R;
	local h = Instance.new("Frame");
	h.Name = "Track";
	h.BackgroundColor3 = HF.toggleBg;
	h.BackgroundTransparency = .12;
	h.Size = UDim2.new(0, 48, 0, 24);
	h.Position = UDim2.new(1, -58, .5, -12);
	h.BorderSizePixel = 0;
	h.ZIndex = 5;
	h.Parent = c;
	corner(h, 12);
	stroke(h, HF.strokeSoft, 1.3, .4);
	local Q = Instance.new("Frame");
	Q.Name = "Fill";
	Q.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	Q.BackgroundTransparency = 1;
	Q.Size = UDim2.new(1, 0, 1, 0);
	Q.BorderSizePixel = 0;
	Q.ZIndex = 5;
	Q.Parent = h;
	corner(Q, 11);
	local e = Instance.new("UIGradient");
	e.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	e.Rotation = 18;
	e.Parent = Q;
	local P = Instance.new("Frame");
	P.Name = "Knob";
	P.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	P.Size = UDim2.new(0, 18, 0, 18);
	P.Position = UDim2.new(0, 3, .5, -9);
	P.BorderSizePixel = 0;
	P.ZIndex = 7;
	P.Parent = h;
	corner(P, 999);
	local m = Instance.new("UIStroke");
	m.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	m.Color = Color3.fromRGB(255, 192, 203);
	m.Thickness = 1.4;
	m.Transparency = .15;
	m.Parent = P;
	local Z = Instance.new("Frame");
	Z.Name = "Shine";
	Z.BackgroundColor3 = HF.white;
	Z.BackgroundTransparency = .55;
	Z.Size = UDim2.new(1, -5, 0, 5);
	Z.Position = UDim2.new(0, 2.5, 0, 2.5);
	Z.BorderSizePixel = 0;
	Z.ZIndex = 8;
	Z.Parent = P;
	corner(Z, 5);
	_G._MasaRegAccent(Q, e, "toggle", h, P, R);
	local F = h:FindFirstChildOfClass("UIStroke");
	local S = R:FindFirstChildOfClass("UIStroke");
	local function r(g)
		g = g and true or false;
		local u, B = _G._MasaToggleOnColor();
		tween(P, { Position = g and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9) });
		tween(h, { BackgroundTransparency = g and 0 or .12, BackgroundColor3 = g and u or HF.toggleBg });
		tween(Q, { BackgroundTransparency = g and 0 or 1 });
		tween(m, { Color = g and B or Color3.fromRGB(255, 192, 203) });
		if F then
			tween(F, { Color = g and B or HF.strokeSoft, Transparency = g and 0 or .4, Thickness = 1.4 });
		end;
		if S then
			tween(S, { Color = g and u or HF.strokeSoft, Transparency = g and .08 or .38, Thickness = 1.25 });
		end;
	end;
	_G._MasaAntiTPBatSetSpamVisual = r;
	c.Activated:Connect(function()
		local g = not ((_G.MasaAntiTPBatSpam == true));
		if _G.MasaAntiTPBat then
			_G.MasaAntiTPBat.setSpam(g);
		else
			_G.MasaAntiTPBatSpam = g;
		end;
		r(g);
	end);
	local U = {
			"V1",
			"V2",
			"V3",
			"V4",
		};
	local I = #U;
	local X = Instance.new("Frame");
	X.Name = "AntiTPBatVersionSelector";
	X.BackgroundColor3 = HF.row;
	X.BackgroundTransparency = .28;
	X.Size = UDim2.new(1, -4, 0, 42);
	X.Position = UDim2.new(0, 2, 0, 2);
	X.BorderSizePixel = 0;
	X.ZIndex = 4;
	X.ClipsDescendants = true;
	X.Parent = i;
	corner(X, 14);
	stroke(X, Color3.fromRGB(59, 130, 246), 1.4, .32);
	_G._MasaRegAccent(X, nil, "soft");
	local w = Instance.new("Frame");
	w.Name = "AntiTPBatSlide";
	w.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
	w.BackgroundTransparency = .1;
	w.AnchorPoint = Vector2.new(.5, .5);
	w.Size = UDim2.new(1 / I, -4, 1, -8);
	w.Position = UDim2.new(.5 / I, 0, .5, 0);
	w.BorderSizePixel = 0;
	w.ZIndex = 5;
	w.Parent = X;
	corner(w, 13);
	local k = Instance.new("UIStroke");
	k.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	k.Color = Color3.fromRGB(255, 170, 210);
	k.Thickness = 1.5;
	k.Transparency = .1;
	k.Parent = w;
	local t = Instance.new("UIGradient");
	t.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
	t.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
	t.Rotation = 22;
	t.Parent = w;
	_G._MasaRegAccent(w, t, "slide");
	local V = {};
	local E = 1 / I;
	for g, u in ipairs(U) do
		local B = Instance.new("TextLabel");
		B.Name = "AntiTPBatLabel_" .. tostring(g);
		B.BackgroundTransparency = 1;
		B.Text = u;
		B.TextColor3 = HF.white;
		B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		B.TextStrokeTransparency = .2;
		B.TextSize = 11;
		B.Font = Enum.Font.GothamBlack;
		B.TextXAlignment = Enum.TextXAlignment.Center;
		B.AnchorPoint = Vector2.new(.5, .5);
		B.Size = UDim2.new(E, 0, 1, 0);
		B.Position = UDim2.new(E * ((g - .5)), 0, .5, 0);
		B.ZIndex = 8;
		B.Parent = X;
		V[g] = B;
		local a = Instance.new("TextButton");
		a.Name = "AntiTPBatClick_" .. tostring(g);
		a.BackgroundTransparency = 1;
		a.Text = "";
		a.AutoButtonColor = false;
		a.AnchorPoint = Vector2.new(.5, .5);
		a.Size = UDim2.new(E, 0, 1, 0);
		a.Position = UDim2.new(E * ((g - .5)), 0, .5, 0);
		a.ZIndex = 10;
		a.Parent = X;
		local H = g;
		a.MouseButton1Click:Connect(function()
			if _G.MasaAntiTPBat then
				_G.MasaAntiTPBat.setVersion(H);
			else
				_G.MasaAntiTPBatVersion = H;
			end;
		end);
	end;
	local function N(g)
		g = math.clamp(tonumber(g) or 1, 1, I);
		local u = .18;
		_G._MasaAntiTPBatVisIndex = g;
		tween(w, { Position = UDim2.new(E * ((g - .5)), 0, .5, 0), Size = UDim2.new(E, -4, 1, -8) }, u);
		for u, B in ipairs(V) do
			local a = (u == g);
			tween(B, { TextTransparency = a and 0 or .22, TextStrokeTransparency = a and .2 or .45 }, .14);
		end;
	end;
	_G._MasaAntiTPBatSetVersionVisual = N;
	local function n(g)
		g = g and true or false;
		local u = _G._MasaToggleOnColor();
		if B then
			tween(B, { Color = g and u or HF.strokeSoft, Transparency = g and .08 or .38, Thickness = 1.25 });
		end;
	end;
	_G._MasaAntiTPBatSetRowVisual = n;
	a.Activated:Connect(function()
		g = not g;
		_G._MasaExpand(i, g, H, a);
	end);
	r(_G.MasaAntiTPBatSpam == true);
	N(_G.MasaAntiTPBatVersion or 1);
	n(_G.MasaAntiTPBatEnabled == true);
end))();
do
	local g, u = toggleRow(Combat, "Anti Void", _G.MasaAntiVoidEnabled == true, 14);
	Z.setAntiVoidVisual = u;
	local B = g and g:FindFirstChild("ToggleButton");
	if B then
		B.Activated:Connect(function()
			local g = not ((_G.MasaAntiVoidEnabled == true));
			if _G.MasaAntiVoid then
				_G.MasaAntiVoid.setEnabled(g);
			end;
			if u then
				u(g);
			end;
			saveMasaConfig();
		end);
	end;
end;
_, setBatCounterVisual = toggleRow(Combat, "Bat Counter", p, 12);
do
	_masaBtn = Combat:FindFirstChild("Bat Counter") and (Combat:FindFirstChild("Bat Counter")):FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			p = not p;
			if setBatCounterVisual then
				setBatCounterVisual(p);
			end;
			if p then
				if _G.MasaStartBatCounter then
					_G.MasaStartBatCounter();
				end;
			else
				if _G.MasaStopBatCounter then
					_G.MasaStopBatCounter();
				end;
			end;
			saveMasaConfig();
		end);
	end;
	local g = Combat:FindFirstChild("Bat Counter");
	if g then
		_G._MasaBuildBatCounterModeSelector(g, Combat);
	end;
end;
_, setMedCounterVisual = toggleRow(Combat, "Med Counter", b, 15);
do
	_masaBtn = Combat:FindFirstChild("Med Counter") and (Combat:FindFirstChild("Med Counter")):FindFirstChild("ToggleButton");
	if _masaBtn then
		_masaBtn.Activated:Connect(function()
			b = not b;
			if setMedCounterVisual then
				setMedCounterVisual(b);
			end;
			if b then
				if _G.MasaStartMedCounter then
					_G.MasaStartMedCounter(e.Character);
				end;
			else
				if _G.MasaStopMedCounter then
					_G.MasaStopMedCounter();
				end;
			end;
			saveMasaConfig();
		end);
	end;
end;
task.wait();
Keybinds = tF.KEYBINDS;
section(Keybinds, "MOVEMENT KEYBINDS", 1);
speedKeybindRow(Keybinds, "Speed Key", "SpeedToggle", 2);
speedKeybindRow(Keybinds, "Lagger Mode Key", "LaggerToggle", 3);
tpDownKeybindRow(Keybinds, 4);
speedKeybindRow(Keybinds, "Drop Brainrot", "DropBrainrot", 5);
section(Keybinds, "COMBAT KEYBINDS", 6);
aimbotKeybindRow = speedKeybindRow(Keybinds, "Bat Aimbot V1", "Aimbot", 7);
pF = aimbotKeybindRow and aimbotKeybindRow:FindFirstChild("Label");
refreshAimbotModeLabels();
speedKeybindRow(Keybinds, "TP Bat", "TPBat", 8);
speedKeybindRow(Keybinds, "Anti TP Bat", "AntiTPBat", 9);
speedKeybindRow(Keybinds, "Float", "Float", 9);
speedKeybindRow(Keybinds, "Auto Play", "AutoPlay", 10);
speedKeybindRow(Keybinds, "Instant Reset", "InstantReset", 12);
do
	THEME_ACCENT = THEME_ACCENT or Color3.fromRGB(230, 230, 230);
	THEME_ACCENT_DIM = THEME_ACCENT_DIM or Color3.fromRGB(145, 145, 145);
	PlayerESP = PlayerESP or { enabled = false, playerData = {}, conns = {} };
	BoxedESPOptions = BoxedESPOptions or { box = false, tracker = false, trackerColor = Color3.fromRGB(230, 230, 230) };
	BoxedESPData = BoxedESPData or {};
	BoxedESPConn = BoxedESPConn or nil;
	stretchRezConn = stretchRezConn or nil;
	G = G or nil;
	noCamCollisionConn = noCamCollisionConn or nil;
	noCamCollisionParts = noCamCollisionParts or {};
	_masaCustomFontOrig = _masaCustomFontOrig or {};
	_masaCustomFontConn = _masaCustomFontConn or nil;
	_masaCustomFont = _masaCustomFont or nil;
	function startPlayerESP()
		if PlayerESP.enabled then
			return;
		end;
		PlayerESP.enabled = true;
		function cleanup(g)
			local u = PlayerESP.playerData[g];
			if not u then
				return;
			end;
			pcall(function()
				if u.highlight then
					u.highlight:Destroy();
				end;
			end);
			pcall(function()
				if u.billboard then
					u.billboard:Destroy();
				end;
			end);
			if u.conns then
				for g, u in ipairs(u.conns) do
					pcall(function()
						u:Disconnect();
					end);
				end;
			end;
			PlayerESP.playerData[g] = nil;
		end;
		function setup(g, u)
			if not PlayerESP.enabled or g == e then
				return;
			end;
			cleanup(g);
			local B = u and ((u:FindFirstChild("HumanoidRootPart") or u:WaitForChild("HumanoidRootPart", 5)));
			local H = u and ((u:FindFirstChild("Head") or u:WaitForChild("Head", 5)));
			if not B or not H then
				return;
			end;
			local i = Instance.new("Highlight");
			i.Name = "MasaHubESP";
			i.Adornee = u;
			i.FillColor = Color3.fromRGB(35, 35, 35);
			i.FillTransparency = .72;
			i.OutlineColor = Color3.fromRGB(245, 245, 245);
			i.OutlineTransparency = 0;
			i.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
			i.Parent = u;
			local R = Instance.new("BillboardGui");
			R.Name = "MasaHubESPTag";
			R.Adornee = H;
			R.Size = UDim2.new(0, 124, 0, 34);
			R.StudsOffset = Vector3.new(0, 2.7, 0);
			R.AlwaysOnTop = true;
			R.LightInfluence = 0;
			R.Parent = H;
			local O = Instance.new("Frame", R);
			O.Size = UDim2.new(1, 0, 1, 0);
			O.BackgroundTransparency = 1;
			O.BorderSizePixel = 0;
			(Instance.new("UICorner", O)).CornerRadius = UDim.new(0, 9);
			local c = Instance.new("TextLabel", O);
			c.Size = UDim2.new(1, -10, 0, 17);
			c.Position = UDim2.new(0, 5, 0, 2);
			c.BackgroundTransparency = 1;
			c.TextColor3 = Color3.fromRGB(255, 255, 255);
			c.Font = Enum.Font.GothamBlack;
			c.TextSize = 22;
			c.TextStrokeTransparency = .38;
			local h = Instance.new("UIGradient", c);
			h.Rotation = 0;
			h.Transparency = NumberSequence.new(0);
			h.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
			local Q = a.Heartbeat:Connect(function()
					if not PlayerESP.enabled or not B.Parent then
						return;
					end;
					local g = B.AssemblyLinearVelocity or B.Velocity;
					c.Text = string.format("%d speed", math.floor((Vector3.new(g.X, 0, g.Z)).Magnitude + .5));
				end);
			PlayerESP.playerData[g] = { highlight = i, billboard = R, conns = { Q } };
		end;
		for g, u in ipairs(g:GetPlayers()) do
			if u ~= e then
				if u.Character then
					setup(u, u.Character);
				end;
				table.insert(PlayerESP.conns, u.CharacterAdded:Connect(function(g)
					task.defer(setup, u, g);
				end));
			end;
		end;
		table.insert(PlayerESP.conns, g.PlayerAdded:Connect(function(g)
			if g ~= e then
				table.insert(PlayerESP.conns, g.CharacterAdded:Connect(function(u)
					task.defer(setup, g, u);
				end));
			end;
		end));
		table.insert(PlayerESP.conns, g.PlayerRemoving:Connect(cleanup));
	end;
	function stopPlayerESP()
		PlayerESP.enabled = false;
		for g, u in ipairs(PlayerESP.conns or {}) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		PlayerESP.conns = {};
		for g, u in pairs(PlayerESP.playerData or {}) do
			pcall(function()
				if u.highlight then
					u.highlight:Destroy();
				end;
			end);
			pcall(function()
				if u.billboard then
					u.billboard:Destroy();
				end;
			end);
			if u.conns then
				for g, u in ipairs(u.conns) do
					pcall(function()
						u:Disconnect();
					end);
				end;
			end;
		end;
		PlayerESP.playerData = {};
	end;
	function _masaEspColor()
		if BoxedESPOptions and BoxedESPOptions.trackerColor then
			return BoxedESPOptions.trackerColor;
		end;
		return THEME_ACCENT or Color3.fromRGB(230, 230, 230);
	end;
	function _safeDrawing(g, u)
		if not Drawing or not Drawing.new then
			return nil;
		end;
		local B, a = pcall(function()
				return Drawing.new(g);
			end);
		if not B or not a then
			return nil;
		end;
		for g, u in pairs(u or {}) do
			pcall(function()
				a[g] = u;
			end);
		end;
		return a;
	end;
	function _cleanupBoxedESPPlayer(g)
		local u = BoxedESPData[g];
		if not u then
			return;
		end;
		for g, u in pairs(u) do
			pcall(function()
				u.Visible = false;
				if u.Remove then
					u:Remove();
				end;
			end);
		end;
		BoxedESPData[g] = nil;
	end;
	function _cleanupBoxedESP()
		for g, u in pairs(BoxedESPData) do
			_cleanupBoxedESPPlayer(g);
		end;
	end;
	local function u(g, u)
		local B = g.ViewportSize;
		local a = Vector2.new(B.X / 2, B.Y / 2);
		local H = g:WorldToViewportPoint(u);
		local i = Vector2.new(H.X, H.Y);
		if H.Z > 0 then
			local g = 50;
			if i.X >= -g and (i.X <= B.X + g and (i.Y >= -g and i.Y <= B.Y + g)) then
				return i;
			end;
		end;
		local R = i - a;
		if H.Z <= 0 then
			local B = g.CFrame.Position;
			local a = ((u - B)).Unit;
			local H = g.CFrame.RightVector;
			local i = g.CFrame.UpVector;
			local O = a:Dot(H);
			local c = a:Dot(i);
			R = Vector2.new(O, -c) * 1000;
		end;
		local O = R.Magnitude;
		if O < .001 then
			return Vector2.new(a.X, B.Y - 20);
		end;
		R = R / O;
		local c = 20;
		local h = (B.X / 2) - c;
		local Q = (B.Y / 2) - c;
		local e = math.huge;
		local P = math.huge;
		if math.abs(R.X) > .001 then
			e = h / math.abs(R.X);
		end;
		if math.abs(R.Y) > .001 then
			P = Q / math.abs(R.Y);
		end;
		local m = math.min(e, P);
		return Vector2.new(math.clamp(a.X + R.X * m, c, B.X - c), math.clamp(a.Y + R.Y * m, c, B.Y - c));
	end;
	function _updateBoxedESP()
		local u = workspace.CurrentCamera;
		if not u then
			return;
		end;
		local B = BoxedESPOptions and BoxedESPOptions.tracker == true;
		if not B then
			_cleanupBoxedESP();
			return;
		end;
		local function a()
			local g = e.Character;
			if not g then
				return Vector2.new(u.ViewportSize.X / 2, u.ViewportSize.Y);
			end;
			local B = g:FindFirstChild("HumanoidRootPart");
			if not B then
				return Vector2.new(u.ViewportSize.X / 2, u.ViewportSize.Y);
			end;
			local a, H = u:WorldToViewportPoint(B.Position - Vector3.new(0, 1, 0));
			if H then
				return Vector2.new(a.X, a.Y);
			end;
			return Vector2.new(u.ViewportSize.X / 2, u.ViewportSize.Y - 10);
		end;
		local H = a();
		for g, B in ipairs(g:GetPlayers()) do
			if B == e then
				continue;
			end;
			local a = B.Character;
			if not a then
				_cleanupBoxedESPPlayer(B);
				continue;
			end;
			local i = a:FindFirstChild("HumanoidRootPart");
			local R = a:FindFirstChild("Head");
			local O = a:FindFirstChildOfClass("Humanoid");
			if not i or not R then
				_cleanupBoxedESPPlayer(B);
				continue;
			end;
			if O and O.Health <= 0 then
				_cleanupBoxedESPPlayer(B);
				continue;
			end;
			local c = ((i.Position + R.Position)) / 2;
			c = c + Vector3.new(0, -0.7, 0);
			if _G.MasaAntiVoid then
				local g, u = _G.MasaAntiVoid.posFor(B, i.Position);
				if u then
					c = g + Vector3.new(0, 1.2, 0);
				end;
			end;
			local h = u:WorldToViewportPoint(c);
			if h.Z <= 0 then
				_cleanupBoxedESPPlayer(B);
				continue;
			end;
			local Q = BoxedESPData[B];
			if not Q then
				Q = { tracker = _safeDrawing("Line", {
							Thickness = 2.5,
							Transparency = .4,
							Color = _masaEspColor(),
							Visible = false,
						}) };
				BoxedESPData[B] = Q;
			end;
			local P = _masaEspColor();
			if Q.tracker then
				Q.tracker.Color = P;
				Q.tracker.Thickness = 2.5;
				Q.tracker.From = H;
				Q.tracker.To = Vector2.new(h.X, h.Y);
				Q.tracker.Visible = true;
			end;
		end;
		for g, u in pairs(BoxedESPData) do
			if not g.Parent then
				_cleanupBoxedESPPlayer(g);
			end;
		end;
	end;
	local B = nil;
	function refreshBoxedESP()
		local g = BoxedESPOptions and BoxedESPOptions.tracker == true;
		_G.MasaTrackerActive = g;
		if BoxedESPConn then
			BoxedESPConn:Disconnect();
			BoxedESPConn = nil;
		end;
		if g then
			if stretchCurrentIndex ~= 1 then
				_G.MasaTrackerSavedStretchIndex = stretchCurrentIndex;
				_G._masaStretchUILock = true;
				Cj(1);
				_G._masaStretchUILock = false;
				task.defer(function()
					if _G.MasaTrackerSavedStretchIndex and _G.MasaTrackerSavedStretchIndex ~= 1 then
						local g = _G.MasaTrackerSavedStretchIndex;
						Cj(g);
					end;
				end);
			else
				_G.MasaTrackerSavedStretchIndex = nil;
			end;
			BoxedESPConn = a.RenderStepped:Connect(_updateBoxedESP);
		else
			_cleanupBoxedESP();
			_G.MasaTrackerSavedStretchIndex = nil;
		end;
	end;
	g.PlayerRemoving:Connect(_cleanupBoxedESPPlayer);
	SKY_PRESETS_LIST = SKY_PRESETS_LIST or { "Off" };
	SKY_PRESETS = SKY_PRESETS or { Off = { kind = "off" } };
	SKY_PRESET_COLORS = SKY_PRESET_COLORS or {};
	function _vC3(g)
		return Color3.fromRGB(g[1], g[2], g[3]);
	end;
	function _v4mpClearSky()
		for g, u in ipairs(i:GetChildren()) do
			if u:GetAttribute("_MasaHubSky") then
				pcall(function()
					u:Destroy();
				end);
			end;
		end;
		local g = workspace:FindFirstChildOfClass("Terrain");
		if g then
			for g, u in ipairs(g:GetChildren()) do
				if u:GetAttribute("_MasaHubSky") then
					pcall(function()
						u:Destroy();
					end);
				end;
			end;
		end;
	end;
	function applyCustomSky(g)
		Sl = ((g == "Off" or not SKY_PRESETS or not SKY_PRESETS[g])) and "Off" or g;
	end;
	function enableCustomFov()
		gl = true;
		workspace.CurrentCamera.FieldOfView = ul;
		if customFovConn then
			customFovConn:Disconnect();
		end;
		customFovConn = a.RenderStepped:Connect(function()
				if not gl then
					customFovConn:Disconnect();
					customFovConn = nil;
					return;
				end;
				workspace.CurrentCamera.FieldOfView = ul;
			end);
	end;
	function disableCustomFov()
		gl = false;
		if customFovConn then
			customFovConn:Disconnect();
			customFovConn = nil;
		end;
		workspace.CurrentCamera.FieldOfView = o and 107 or 70;
	end;
	local H;
	do
		local u = { Enabled = false, SavedTracks = {}, Connections = {} };
		local function B(u)
			for g, B in ipairs(g:GetPlayers()) do
				if B.Character and u:IsDescendantOf(B.Character) then
					return true;
				end;
			end;
			return false;
		end;
		local function a(g)
			pcall(function()
				for a, H in ipairs(g:GetPlayingAnimationTracks()) do
					if not B(g) then
						u.SavedTracks[#u.SavedTracks + 1] = { track = H, speed = H.Speed };
						H:Stop(0);
					end;
				end;
			end);
		end;
		local function i()
			for g, u in ipairs(R:GetDescendants()) do
				if u:IsA("Animator") then
					a(u);
				end;
			end;
		end;
		local function O()
			for g, u in ipairs(u.SavedTracks) do
				pcall(function()
					if u.track and u.track.Parent then
						u.track:Play(0);
						u.track:AdjustSpeed(u.speed);
					end;
				end);
			end;
			u.SavedTracks = {};
		end;
		H = function(g)
				u.Enabled = g;
				for g, u in ipairs(u.Connections) do
					pcall(function()
						u:Disconnect();
					end);
				end;
				u.Connections = {};
				if g then
					i();
					u.Connections[#u.Connections + 1] = R.DescendantAdded:Connect(function(g)
							task.defer(function()
								if not u.Enabled then
									return;
								end;
								if g:IsA("Animator") then
									a(g);
								elseif g:IsA("AnimationTrack") then
									local u = g.Parent;
									if u and u:IsA("Animator") then
										a(u);
									end;
								end;
							end);
						end);
				else
					O();
				end;
			end;
	end;
	local function O(g)
		pcall(function()
			if g:GetAttribute("_MasaHubSky") ~= nil then
				return;
			end;
			if g:IsA("Sky") or g:IsA("Atmosphere") or g:IsA("Clouds") then
				return;
			end;
			if Sl ~= "Off" and g.Parent == i then
				if g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect") or g:IsA("BrightnessEffect") or g:IsA("DitheringEffect") then
					return;
				end;
			end;
			if g:IsA("Accessory") or g:IsA("Hat") then
				local u = e.Character;
				if u and g:IsDescendantOf(u) then
					return;
				end;
				g:Destroy();
			elseif g:IsA("BasePart") then
				g.Material = Enum.Material.Plastic;
				g.Reflectance = 0;
				g.CastShadow = false;
				g.TopSurface = Enum.SurfaceType.Smooth;
				g.BottomSurface = Enum.SurfaceType.Smooth;
				g.FrontSurface = Enum.SurfaceType.Smooth;
				g.BackSurface = Enum.SurfaceType.Smooth;
				g.LeftSurface = Enum.SurfaceType.Smooth;
				g.RightSurface = Enum.SurfaceType.Smooth;
				for g, u in ipairs(g:GetChildren()) do
					if u:IsA("Decal") or u:IsA("Texture") then
						u.Transparency = .5;
					end;
				end;
			elseif g:IsA("Decal") or g:IsA("Texture") then
				g.Transparency = .5;
			elseif g:IsA("ParticleEmitter") or g:IsA("Trail") or g:IsA("Beam") or g:IsA("Fire") or g:IsA("Smoke") or g:IsA("Sparkles") then
				g.Enabled = false;
			elseif g:IsA("PointLight") or g:IsA("SpotLight") or g:IsA("SurfaceLight") then
				g.Enabled = false;
			elseif g:IsA("SelectionBox") and g.Name ~= "MasaHubESP" then
				pcall(function()
					g:Destroy();
				end);
			end;
		end);
	end;
	function enableAntiLag()
		x = true;
		J = true;
		_G._MasaDefLightBrightness = _G._MasaDefLightBrightness or i.Brightness;
		_G._MasaDefLightClock = _G._MasaDefLightClock or i.ClockTime;
		_G._MasaDefLightAmbient = _G._MasaDefLightAmbient or i.OutdoorAmbient;
		pcall(function()
			(settings()).Rendering.QualityLevel = 1;
			(settings()).Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Disabled;
		end);
		if Sl == "Off" then
			i.GlobalShadows = false;
			i.FogEnd = 10000000000;
			i.FogStart = 0;
			i.Brightness = 1;
			i.EnvironmentDiffuseScale = 0;
			i.EnvironmentSpecularScale = 0;
			i.ShadowSoftness = 0;
			i.ExposureCompensation = 0;
			pcall(function()
				i.Technology = Enum.Technology.Compatibility;
			end);
			for g, u in pairs(i:GetChildren()) do
				pcall(function()
					if u:GetAttribute("_MasaVivid") then
						return;
					end;
					if u:IsA("BlurEffect") or u:IsA("SunRaysEffect") or u:IsA("ColorCorrectionEffect") or u:IsA("BloomEffect") or u:IsA("DepthOfFieldEffect") or u:IsA("BrightnessEffect") or u:IsA("DitheringEffect") then
						u.Enabled = false;
					end;
				end);
			end;
		end;
		for g, u in ipairs(workspace:GetDescendants()) do
			O(u);
		end;
		for g, u in pairs(workspace:GetDescendants()) do
			pcall(function()
				if u:IsA("ParticleEmitter") then
					u.Enabled = false;
				elseif u:IsA("Decal") then
					u.Transparency = 1;
				elseif u:IsA("BasePart") then
					local g = e.Character;
					if g and u:IsDescendantOf(g) then
						return;
					end;
					u.Material = Enum.Material.Plastic;
					u.Reflectance = 0;
					u.CastShadow = false;
					u.TopSurface = Enum.SurfaceType.Smooth;
					u.BottomSurface = Enum.SurfaceType.Smooth;
					u.FrontSurface = Enum.SurfaceType.Smooth;
					u.BackSurface = Enum.SurfaceType.Smooth;
					u.LeftSurface = Enum.SurfaceType.Smooth;
					u.RightSurface = Enum.SurfaceType.Smooth;
				end;
			end);
		end;
		pcall(function()
			workspace.Terrain.WaterWaveSize = 0;
			workspace.Terrain.WaterWaveSpeed = 0;
			workspace.Terrain.WaterReflectance = 0;
			workspace.Terrain.WaterTransparency = 0;
			workspace.Terrain.Decoration = false;
		end);
		if G then
			G:Disconnect();
		end;
		G = workspace.DescendantAdded:Connect(function(g)
				if g:GetAttribute("_MasaHubSky") then
					return;
				end;
				if g:IsA("Sky") or g:IsA("Atmosphere") or g:IsA("Clouds") then
					return;
				end;
				if J then
					O(g);
				end;
			end);
		H(true);
	end;
	function disableAntiLag()
		x = false;
		J = false;
		if G then
			G:Disconnect();
			G = nil;
		end;
		if Sl == "Off" then
			pcall(function()
				if _G._MasaDefLightBrightness then
					i.Brightness = _G._MasaDefLightBrightness;
				end;
				if _G._MasaDefLightClock then
					i.ClockTime = _G._MasaDefLightClock;
				end;
				if _G._MasaDefLightAmbient then
					i.OutdoorAmbient = _G._MasaDefLightAmbient;
				end;
				i.ExposureCompensation = 0;
				i.GlobalShadows = true;
			end);
		end;
	end;
	_G._MasaXRayFolders = {
			"Base",
			"PlotSign",
			"FriendPanel",
			"Cash",
			"Laser",
			"Decorations",
			"Skin",
			"Unlock",
			"Purchases",
		};
	_G._MasaXRayOrigTrans = {};
	_G._MasaXRayConns = {};
	_G._MasaXRayLoopId = 0;
	do
		local function g(g, u, B)
			if not g then
				return;
			end;
			if B and B ~= _G._MasaXRayLoopId then
				return;
			end;
			local function a(g)
				if g:IsA("BasePart") then
					if _G._MasaXRayOrigTrans[g] == nil then
						_G._MasaXRayOrigTrans[g] = g.Transparency;
					end;
					local B = _G._MasaXRayOrigTrans[g];
					if B < 1 then
						local a = B + ((1 - B)) * u;
						if math.abs(g.Transparency - a) > .01 then
							g.Transparency = a;
						end;
					end;
				elseif g:IsA("TextLabel") or g:IsA("TextButton") then
					if _G._MasaXRayOrigTrans[g] == nil then
						_G._MasaXRayOrigTrans[g] = { text = g.TextTransparency, bg = g.BackgroundTransparency };
					end;
					local B = _G._MasaXRayOrigTrans[g];
					if B.text < 1 then
						local a = B.text + ((1 - B.text)) * u;
						if math.abs(g.TextTransparency - a) > .01 then
							g.TextTransparency = a;
						end;
					end;
					if B.bg < 1 then
						local a = B.bg + ((1 - B.bg)) * u;
						if math.abs(g.BackgroundTransparency - a) > .01 then
							g.BackgroundTransparency = a;
						end;
					end;
				elseif g:IsA("Frame") or g:IsA("ScrollingFrame") then
					if _G._MasaXRayOrigTrans[g] == nil then
						_G._MasaXRayOrigTrans[g] = g.BackgroundTransparency;
					end;
					local B = _G._MasaXRayOrigTrans[g];
					if B < 1 then
						local a = B + ((1 - B)) * u;
						if math.abs(g.BackgroundTransparency - a) > .01 then
							g.BackgroundTransparency = a;
						end;
					end;
				elseif g:IsA("ImageLabel") or g:IsA("ImageButton") then
					if _G._MasaXRayOrigTrans[g] == nil then
						_G._MasaXRayOrigTrans[g] = { img = g.ImageTransparency, bg = g.BackgroundTransparency };
					end;
					local B = _G._MasaXRayOrigTrans[g];
					if B.img < 1 then
						local a = B.img + ((1 - B.img)) * u;
						if math.abs(g.ImageTransparency - a) > .01 then
							g.ImageTransparency = a;
						end;
					end;
					if B.bg < 1 then
						local a = B.bg + ((1 - B.bg)) * u;
						if math.abs(g.BackgroundTransparency - a) > .01 then
							g.BackgroundTransparency = a;
						end;
					end;
				end;
			end;
			a(g);
			local H = g:GetDescendants();
			for g, u in ipairs(H) do
				a(u);
				if g % 300 == 0 then
					task.wait();
					if B and B ~= _G._MasaXRayLoopId then
						return;
					end;
				end;
			end;
		end;
		local function u(u, B, a)
			if not u then
				return;
			end;
			if a ~= _G._MasaXRayLoopId then
				return;
			end;
			g(u, B, a);
			if a ~= _G._MasaXRayLoopId then
				return;
			end;
			table.insert(_G._MasaXRayConns, u.DescendantAdded:Connect(function(u)
				if a ~= _G._MasaXRayLoopId then
					return;
				end;
				g(u, B, a);
			end));
		end;
		local function B(g, B, a)
			if not g then
				return;
			end;
			if a ~= _G._MasaXRayLoopId then
				return;
			end;
			for H, i in ipairs(_G._MasaXRayFolders) do
				if a ~= _G._MasaXRayLoopId then
					return;
				end;
				u(g:FindFirstChild(i), B, a);
			end;
			if a ~= _G._MasaXRayLoopId then
				return;
			end;
			table.insert(_G._MasaXRayConns, g.ChildAdded:Connect(function(g)
				if a ~= _G._MasaXRayLoopId then
					return;
				end;
				for H, i in ipairs(_G._MasaXRayFolders) do
					if g.Name == i then
						u(g, B, a);
						break;
					end;
				end;
			end));
			local H = g:FindFirstChild("AnimalPodiums");
			if H then
				local function g(g)
					for g, H in ipairs(g:GetChildren()) do
						if H.Name == "Claim" then
							u(H, B, a);
						elseif H.Name == "Base" then
							u(H:FindFirstChild("Decorations"), B, a);
						elseif H:IsA("Model") and H.Name ~= "Decorations" then
							u(H, B, a);
						end;
					end;
				end;
				for u, B in ipairs(H:GetChildren()) do
					g(B);
				end;
				table.insert(_G._MasaXRayConns, H.ChildAdded:Connect(function(u)
					if a ~= _G._MasaXRayLoopId then
						return;
					end;
					task.wait(.1);
					if a ~= _G._MasaXRayLoopId then
						return;
					end;
					g(u);
				end));
			end;
		end;
		local function a(g, u)
			local a = workspace:FindFirstChild("Plots");
			if not a then
				return;
			end;
			for a, H in ipairs(a:GetChildren()) do
				if u ~= _G._MasaXRayLoopId then
					return;
				end;
				B(H, g, u);
				task.wait();
			end;
			table.insert(_G._MasaXRayConns, a.ChildAdded:Connect(function(a)
				if u ~= _G._MasaXRayLoopId then
					return;
				end;
				task.wait(.2);
				B(a, g, u);
			end));
		end;
		function setXRay(g)
			for g, u in ipairs(_G._MasaXRayConns) do
				if typeof(u) == "RBXScriptConnection" then
					u:Disconnect();
				end;
			end;
			_G._MasaXRayConns = {};
			_G._MasaXRayLoopId = _G._MasaXRayLoopId + 1;
			local u = _G._MasaXRayLoopId;
			if g then
				local g = .5;
				task.spawn(function()
					while u == _G._MasaXRayLoopId and not workspace:FindFirstChild("Plots") do
						task.wait(.5);
					end;
					if u ~= _G._MasaXRayLoopId then
						return;
					end;
					pcall(a, g, u);
				end);
			else
				local g = _G._MasaXRayOrigTrans;
				_G._MasaXRayOrigTrans = {};
				for g, u in pairs(g) do
					pcall(function()
						if g:IsA("BasePart") then
							g.Transparency = u;
						elseif g:IsA("TextLabel") or g:IsA("TextButton") then
							g.TextTransparency = u.text;
							g.BackgroundTransparency = u.bg;
						elseif g:IsA("Frame") or g:IsA("ScrollingFrame") then
							g.BackgroundTransparency = u;
						elseif g:IsA("ImageLabel") or g:IsA("ImageButton") then
							g.ImageTransparency = u.img;
							g.BackgroundTransparency = u.bg;
						end;
					end);
				end;
			end;
		end;
	end;
	_G._MasaBrainrotXRay = {
			enabled = false,
			trans = .5,
			names = nil,
			saved = {},
			conns = {},
			scanId = 0,
		};
	_G._MasaBrainrotXRay.loadNames = function()
			local g = _G._MasaBrainrotXRay;
			if g.names then
				return g.names;
			end;
			local u = {};
			pcall(function()
				local g = h:FindFirstChild("Datas");
				local B = g and g:FindFirstChild("Animals");
				if B and B:IsA("ModuleScript") then
					for g in pairs(require(B)) do
						u[g] = true;
					end;
				end;
			end);
			g.names = u;
			return u;
		end;
	_G._MasaBrainrotXRay.isHitbox = function(g)
			local u = string.lower(g.Name);
			return ((string.find(u, "hit") or string.find(u, "target") or string.find(u, "box") or string.find(u, "root") or string.find(u, "collect") or string.find(u, "prompt"))) ~= nil;
		end;
	_G._MasaBrainrotXRay.applyOne = function(g)
			local u = _G._MasaBrainrotXRay;
			if not ((g:IsA("BasePart") or g:IsA("Decal") or g:IsA("Texture"))) then
				return;
			end;
			local B = u.saved[g];
			if B == nil then
				B = g.Transparency;
				if B > .5 and (B < .99 and (g:IsA("BasePart") and u.isHitbox(g))) then
					B = 1;
				end;
				u.saved[g] = B;
			end;
			if B < .5 and g.Transparency ~= u.trans then
				g.Transparency = u.trans;
			end;
		end;
	_G._MasaBrainrotXRay.applyModel = function(g)
			local u = _G._MasaBrainrotXRay;
			for g, B in ipairs(g:GetDescendants()) do
				u.applyOne(B);
			end;
		end;
	_G._MasaBrainrotXRay.isAnimal = function(g)
			local u = _G._MasaBrainrotXRay;
			return g:IsA("Model") and (u.names and u.names[g.Name] == true);
		end;
	_G._MasaBrainrotXRay.animalAncestor = function(g)
			local u = _G._MasaBrainrotXRay;
			local B = g.Parent;
			for g = 1, 5, 1 do
				if not B or B == workspace then
					return nil;
				end;
				if B:IsA("Model") and (u.names and u.names[B.Name]) then
					return B;
				end;
				B = B.Parent;
			end;
			return nil;
		end;
	_G._MasaBrainrotXRay.restoreAll = function()
			local g = _G._MasaBrainrotXRay;
			local u = g.saved;
			g.saved = {};
			for g, u in pairs(u) do
				pcall(function()
					if g and g.Parent then
						g.Transparency = u;
					end;
				end);
			end;
		end;
	function _G.MasaSetBrainrotXRay(g)
		local u = _G._MasaBrainrotXRay;
		g = g and true or false;
		u.enabled = g;
		_G.MasaBrainrotXRayEnabled = g;
		for g, u in ipairs(u.conns) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		u.conns = {};
		u.scanId = u.scanId + 1;
		if not g then
			u.restoreAll();
			return;
		end;
		u.loadNames();
		local B = u.scanId;
		task.spawn(function()
			local g = 0;
			for a, H in ipairs(workspace:GetDescendants()) do
				if u.scanId ~= B then
					return;
				end;
				if u.isAnimal(H) then
					u.applyModel(H);
				end;
				g = g + 1;
				if g % 500 == 0 then
					task.wait();
				end;
			end;
		end);
		table.insert(u.conns, workspace.DescendantAdded:Connect(function(g)
			if not u.enabled then
				return;
			end;
			if g:IsA("Model") then
				if u.names and u.names[g.Name] then
					task.defer(function()
						if u.enabled and g.Parent then
							u.applyModel(g);
						end;
					end);
				end;
				return;
			end;
			if g:IsA("BasePart") or g:IsA("Decal") or g:IsA("Texture") then
				if u.animalAncestor(g) then
					u.applyOne(g);
				end;
			end;
		end));
	end;
	function enableVividGraphics()
		s = true;
		for g, u in ipairs(i:GetChildren()) do
			if u:GetAttribute("_MasaVivid") then
				u:Destroy();
			end;
		end;
		local g = Instance.new("ColorCorrectionEffect");
		g:SetAttribute("_MasaVivid", true);
		g.Parent = i;
		g.Saturation = _G._MasaVivid.saturation;
		g.Contrast = .4;
		g.Brightness = .05;
		g.TintColor = Color3.fromRGB(255, 240, 220);
		local u = Instance.new("BloomEffect");
		u:SetAttribute("_MasaVivid", true);
		u.Parent = i;
		u.Intensity = _G._MasaVivid.bloomIntensity;
		u.Size = _G._MasaVivid.bloomSize;
		u.Threshold = 1;
		local B = Instance.new("Atmosphere");
		B:SetAttribute("_MasaVivid", true);
		B.Parent = i;
		B.Density = .3;
		B.Offset = .25;
		B.Color = Color3.fromRGB(199, 199, 255);
		B.Decay = Color3.fromRGB(106, 112, 125);
		B.Glare = .2;
		B.Haze = 1;
		local a = Instance.new("SunRaysEffect");
		a:SetAttribute("_MasaVivid", true);
		a.Parent = i;
		a.Intensity = _G._MasaVivid.sunIntensity;
		a.Spread = .8;
		local H = Instance.new("DepthOfFieldEffect");
		H:SetAttribute("_MasaVivid", true);
		H.Parent = i;
		H.FocusDistance = _G._MasaVivid.dofFocus;
		H.InFocusRadius = 10;
		H.NearIntensity = .2;
		H.FarIntensity = .4;
		if Y then
			pcall(function()
				task.cancel(Y);
			end);
			Y = nil;
		end;
		Y = task.spawn(function()
				while s do
					if g and g.Parent then
						g.Contrast = .35 + math.sin(tick() * 2) * .05;
					end;
					task.wait(.03);
				end;
			end);
	end;
	function disableVividGraphics()
		s = false;
		if Y then
			pcall(function()
				task.cancel(Y);
			end);
			Y = nil;
		end;
		for g, u in ipairs(i:GetChildren()) do
			if u:GetAttribute("_MasaVivid") then
				pcall(function()
					u:Destroy();
				end);
			end;
		end;
	end;
end;
do
	local g = "rbxassetid://1095708";
	local u = nil;
	local function B()
		for g, u in ipairs(z) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		z = {};
	end;
	local function a(g)
		local u = g:FindFirstChild("face");
		if u then
			u:Destroy();
		end;
	end;
	local function H(u)
		if not u then
			return;
		end;
		if u:FindFirstChild("HeadlessMesh") then
			return;
		end;
		u.Transparency = 1;
		u.CanCollide = false;
		a(u);
		local B = Instance.new("SpecialMesh");
		B.Name = "HeadlessMesh";
		B.MeshType = Enum.MeshType.FileMesh;
		B.MeshId = g;
		B.Scale = Vector3.new(.001, .001, .001);
		B.Parent = u;
		local H = (u:GetPropertyChangedSignal("Transparency")):Connect(function()
				if u.Transparency ~= 1 then
					u.Transparency = 1;
				end;
			end);
		table.insert(z, H);
		local i = u.ChildAdded:Connect(function(g)
				if g.Name == "face" and g:IsA("Decal") then
					g:Destroy();
				end;
			end);
		table.insert(z, i);
	end;
	local function i(g)
		if not g then
			return;
		end;
		B();
		local u = g:FindFirstChild("Head");
		task.wait(.1);
		if u and l then
			H(u);
		end;
	end;
	function enableHeadless()
		l = true;
		if u then
			pcall(function()
				u:Disconnect();
			end);
		end;
		local g = e.Character;
		if g then
			i(g);
		end;
		u = e.CharacterAdded:Connect(function(g)
				_G._MasaWaitCharReady(g, 10);
				if l then
					i(g);
				end;
			end);
		if Z.setHeadlessVisual then
			Z.setHeadlessVisual(true);
		end;
	end;
	function disableHeadless()
		l = false;
		B();
		if u then
			pcall(function()
				u:Disconnect();
			end);
			u = nil;
		end;
		pcall(function()
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChild("Head");
			if not u then
				return;
			end;
			local B = u:FindFirstChild("HeadlessMesh");
			if B then
				B:Destroy();
			end;
			u.Transparency = 0;
			u.CanCollide = true;
		end);
		if Z.setHeadlessVisual then
			Z.setHeadlessVisual(false);
		end;
	end;
end;
do
	local g = "rbxassetid://101851696";
	local u = "rbxassetid://101851254";
	local B = Color3.fromRGB(64, 64, 64);
	local a = nil;
	local function H()
		for g, u in ipairs(f) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		f = {};
	end;
	local function i(a)
		local H = a:FindFirstChild("Right Leg");
		if not H then
			return;
		end;
		if H:FindFirstChild("KorbloxMesh") then
			return;
		end;
		for g, u in ipairs(H:GetChildren()) do
			if u:IsA("SpecialMesh") or u:IsA("CharacterMesh") then
				u:Destroy();
			end;
		end;
		H.Color = B;
		local i = (H:GetPropertyChangedSignal("Color")):Connect(function()
				if H.Color ~= B then
					H.Color = B;
				end;
			end);
		table.insert(f, i);
		local R = Instance.new("SpecialMesh");
		R.Name = "KorbloxMesh";
		R.MeshType = Enum.MeshType.FileMesh;
		R.MeshId = g;
		R.TextureId = u;
		R.Scale = Vector3.new(1, 1, 1);
		R.Parent = H;
	end;
	local function R(a)
		local H = a:FindFirstChild("RightUpperLeg");
		if not H then
			return;
		end;
		if a:FindFirstChild("KorbloxLeg") then
			return;
		end;
		H.Transparency = 1;
		local i = a:FindFirstChild("RightLowerLeg");
		local R = a:FindFirstChild("RightFoot");
		if i then
			i.Transparency = 1;
		end;
		if R then
			R.Transparency = 1;
		end;
		local O = Instance.new("Part");
		O.Name = "KorbloxLeg";
		O.Size = Vector3.new(1, 2, 1);
		O.Anchored = false;
		O.CanCollide = false;
		O.Color = B;
		O.Parent = a;
		local c = Instance.new("SpecialMesh");
		c.MeshType = Enum.MeshType.FileMesh;
		c.MeshId = g;
		c.TextureId = u;
		c.Scale = Vector3.new(1, 1, 1);
		c.Parent = O;
		local h = Instance.new("Weld");
		h.Part0 = H;
		h.Part1 = O;
		h.C0 = CFrame.new(0, -0.45, 0);
		h.Parent = O;
	end;
	local function O(g)
		if not g then
			return;
		end;
		H();
		local u = g:FindFirstChildOfClass("Humanoid");
		if not u then
			return;
		end;
		task.wait(.1);
		if not M then
			return;
		end;
		if u.RigType == Enum.HumanoidRigType.R6 then
			i(g);
		elseif u.RigType == Enum.HumanoidRigType.R15 then
			R(g);
		end;
	end;
	function enableKorblox()
		M = true;
		if a then
			pcall(function()
				a:Disconnect();
			end);
		end;
		local g = e.Character;
		if g then
			O(g);
		end;
		a = e.CharacterAdded:Connect(function(g)
				_G._MasaWaitCharReady(g, 10);
				if M then
					O(g);
				end;
			end);
		if Z.setKorbloxVisual then
			Z.setKorbloxVisual(true);
		end;
	end;
	function disableKorblox()
		M = false;
		H();
		if a then
			pcall(function()
				a:Disconnect();
			end);
			a = nil;
		end;
		pcall(function()
			local g = e.Character;
			if not g then
				return;
			end;
			local u = g:FindFirstChild("Right Leg");
			if u then
				local g = u:FindFirstChild("KorbloxMesh");
				if g then
					g:Destroy();
				end;
			end;
			local B = g:FindFirstChild("KorbloxLeg");
			if B then
				B:Destroy();
			end;
			local a = g:FindFirstChild("RightUpperLeg");
			local H = g:FindFirstChild("RightLowerLeg");
			local i = g:FindFirstChild("RightFoot");
			if a then
				a.Transparency = 0;
			end;
			if H then
				H.Transparency = 0;
			end;
			if i then
				i.Transparency = 0;
			end;
		end);
		if Z.setKorbloxVisual then
			Z.setKorbloxVisual(false);
		end;
	end;
end;
do
	function enableCustomFont()
		customFontVisualEnabled = false;
		if V then
			V.customFontEnabled = false;
		end;
	end;
	function disableCustomFont()
		customFontVisualEnabled = false;
		if V then
			V.customFontEnabled = false;
		end;
	end;
end;
V = V or {};
V.skyTheme = Sl or V.skyTheme or "Off";
V.customFontEnabled = false;
V.potatoGraphicsEnabled = V.potatoGraphicsEnabled or false;
_G._MasaNC = _G._MasaNC or {
		targetZoom = 10,
		currentZoom = 10,
		zoomConn = nil,
		watchConns = {},
		resync = true,
	};
function enableNoCamCollision()
	Bl = true;
	local g = _G._MasaNC;
	local B = workspace.CurrentCamera;
	g.targetZoom = math.clamp(10, e.CameraMinZoomDistance, e.CameraMaxZoomDistance);
	g.currentZoom = g.targetZoom;
	g.resync = true;
	if g.zoomConn then
		g.zoomConn:Disconnect();
	end;
	g.zoomConn = u.InputChanged:Connect(function(u, B)
			if not Bl then
				return;
			end;
			if B then
				return;
			end;
			if u.UserInputType == Enum.UserInputType.MouseWheel then
				local B = e.CameraMinZoomDistance;
				local a = e.CameraMaxZoomDistance;
				g.targetZoom = math.clamp(g.targetZoom - (u.Position.Z * 4), B, a);
			end;
		end);
	for g, u in ipairs(g.watchConns or {}) do
		pcall(function()
			u:Disconnect();
		end);
	end;
	g.watchConns = {};
	local function H()
		g.resync = true;
	end;
	table.insert(g.watchConns, (e:GetPropertyChangedSignal("CameraMinZoomDistance")):Connect(H));
	table.insert(g.watchConns, (e:GetPropertyChangedSignal("CameraMaxZoomDistance")):Connect(H));
	table.insert(g.watchConns, (workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(H));
	table.insert(g.watchConns, e.CharacterAdded:Connect(H));
	if B then
		table.insert(g.watchConns, (B:GetPropertyChangedSignal("CameraType")):Connect(H));
		table.insert(g.watchConns, (B:GetPropertyChangedSignal("CameraSubject")):Connect(H));
	end;
	pcall(function()
		a:UnbindFromRenderStep("MasaNoCamCollision");
	end);
	a:BindToRenderStep("MasaNoCamCollision", Enum.RenderPriority.Camera.Value + 1, function(u)
		if not Bl then
			return;
		end;
		local B = workspace.CurrentCamera;
		if not B then
			return;
		end;
		if B.CameraType == Enum.CameraType.Scriptable then
			g.resync = true;
			return;
		end;
		if B.CameraSubject == nil then
			g.resync = true;
			return;
		end;
		local a = e.Character;
		local H = a and a:FindFirstChild("HumanoidRootPart");
		if not H then
			g.resync = true;
			return;
		end;
		local i = e.CameraMinZoomDistance;
		local R = e.CameraMaxZoomDistance;
		if R <= 1 then
			g.resync = true;
			return;
		end;
		local O = ((B.CFrame.Position - B.Focus.Position)).Magnitude;
		if O < .6 then
			g.resync = true;
			return;
		end;
		if g.resync or O > g.currentZoom + .5 then
			g.targetZoom = math.clamp(O, i, R);
			g.currentZoom = g.targetZoom;
			g.resync = false;
		end;
		g.targetZoom = math.clamp(g.targetZoom, i, R);
		g.currentZoom = g.currentZoom + ((g.targetZoom - g.currentZoom)) * math.min(u * 15, 1);
		B.CFrame = (B.Focus * B.CFrame.Rotation) * CFrame.new(0, 0, g.currentZoom);
	end);
end;
function disableNoCamCollision()
	Bl = false;
	pcall(function()
		a:UnbindFromRenderStep("MasaNoCamCollision");
	end);
	if _G._MasaNC.zoomConn then
		_G._MasaNC.zoomConn:Disconnect();
		_G._MasaNC.zoomConn = nil;
	end;
	for g, u in ipairs(_G._MasaNC.watchConns or {}) do
		pcall(function()
			u:Disconnect();
		end);
	end;
	_G._MasaNC.watchConns = {};
	noCamCollisionParts = {};
end;
SKY_PRESETS_LIST = {
		"Off",
		"Night",
		"Aurora",
		"Sunset",
		"Galaxy",
		"Cyber",
		"Sakura",
		"Pink Night",
		"Blood Moon",
		"Emerald Dawn",
		"Volcanic",
		"Arctic",
		"Midnight Ocean",
		"Vaporwave",
		"Toxic",
		"Solar Eclipse",
		"Hellscape",
		"Heaven",
		"Storm",
		"Sunrise",
		"Deep Space",
		"Lavender Dream",
		"Inferno",
		"Mint Sky",
		"Clear Sky",
		"Golden Hour",
		"Moonlight",
		"Cotton Candy",
		"Monochrome",
		"Rainbow",
		"Ultraviolet",
		"Blue Hour",
		"Nebula",
		"Thunderhead",
		"Fuchsia Dawn",
		"Ice Cavern",
		"Crimson Dusk",
		"Neon Rain",
		"Copper Sky",
		"Pearl Rose",
		"Red Giant",
		"Moonfall",
		"Ashfall",
		"Marshlight",
		"Abyss",
		"Timelapse",
		"Lightning",
		"Pulsar",
		"Ionosphere",
		"Midnight Sun",
		"Polar Night",
		"Infrared",
		"Sepia",
		"Chrome",
		"Supernova",
		"Mars",
		"Titan",
		"Dreamcore",
		"Ember Night",
	};
SKY_PRESET_COLORS = {
		Off = { 120, 120, 120 },
		Night = { 120, 60, 180 },
		Aurora = { 150, 90, 200 },
		Sunset = { 255, 140, 60 },
		Galaxy = { 40, 20, 90 },
		Cyber = { 0, 200, 255 },
		Sakura = { 255, 180, 205 },
		["Pink Night"] = { 255, 80, 180 },
		["Blood Moon"] = { 200, 40, 40 },
		["Emerald Dawn"] = { 80, 200, 140 },
		Volcanic = { 220, 90, 30 },
		Arctic = { 170, 215, 255 },
		["Midnight Ocean"] = { 30, 80, 160 },
		Vaporwave = { 255, 100, 220 },
		Toxic = { 150, 210, 90 },
		["Solar Eclipse"] = { 255, 150, 40 },
		Hellscape = { 210, 50, 20 },
		Heaven = { 255, 250, 225 },
		Storm = { 90, 95, 115 },
		Sunrise = { 255, 180, 100 },
		["Deep Space"] = { 20, 10, 45 },
		["Lavender Dream"] = { 190, 160, 255 },
		Inferno = { 225, 100, 40 },
		["Mint Sky"] = { 165, 250, 215 },
		["Clear Sky"] = { 110, 190, 255 },
		["Golden Hour"] = { 255, 190, 110 },
		Moonlight = { 170, 190, 225 },
		["Cotton Candy"] = { 255, 180, 225 },
		Monochrome = { 152, 152, 152 },
		Rainbow = { 255, 90, 120 },
		Ultraviolet = { 150, 40, 240 },
		["Blue Hour"] = { 80, 120, 190 },
		Nebula = { 190, 70, 205 },
		Thunderhead = { 130, 145, 215 },
		["Fuchsia Dawn"] = { 255, 45, 160 },
		["Ice Cavern"] = { 150, 215, 240 },
		["Crimson Dusk"] = { 200, 50, 80 },
		["Neon Rain"] = { 0, 230, 210 },
		["Copper Sky"] = { 200, 115, 60 },
		["Pearl Rose"] = { 255, 215, 228 },
		["Red Giant"] = { 215, 75, 45 },
		Moonfall = { 185, 200, 235 },
		Ashfall = { 112, 104, 98 },
		Marshlight = { 96, 150, 105 },
		Abyss = { 15, 70, 80 },
		Timelapse = { 255, 160, 90 },
		Lightning = { 200, 215, 255 },
		Pulsar = { 120, 160, 255 },
		Ionosphere = { 90, 235, 175 },
		["Midnight Sun"] = { 255, 205, 120 },
		["Polar Night"] = { 60, 80, 130 },
		Infrared = { 255, 60, 60 },
		Sepia = { 190, 150, 100 },
		Chrome = { 190, 200, 215 },
		Supernova = { 255, 245, 220 },
		Mars = { 215, 150, 105 },
		Titan = { 200, 140, 60 },
		Dreamcore = { 215, 190, 255 },
		["Ember Night"] = { 235, 110, 45 },
	};
SKY_PRESETS = {
		Off = { kind = "off" },
		Night = {
			clock = 22,
			brightness = 2,
			ambient = { 110, 100, 130 },
			outAmb = { 120, 110, 140 },
			sky = {
				stars = 4000,
				moon = 18,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .45,
				color = { 120, 60, 180 },
				decay = { 60, 20, 100 },
				glare = .5,
				haze = 1.2,
			},
		},
		Aurora = {
			clock = 14,
			brightness = 2.2,
			ambient = { 140, 130, 150 },
			outAmb = { 150, 140, 160 },
			atm = {
				dens = .35,
				color = { 220, 140, 200 },
				decay = { 200, 120, 160 },
				glare = 1.2,
				haze = 1.6,
			},
			clouds = { cover = .5, dens = .5, color = { 240, 230, 245 } },
		},
		Sunset = {
			clock = 17.2,
			brightness = 2.5,
			ambient = { 170, 120, 100 },
			outAmb = { 180, 130, 110 },
			sky = { stars = 0, sun = 25, moon = 0 },
			atm = {
				dens = .5,
				color = { 255, 130, 60 },
				decay = { 255, 80, 30 },
				glare = 2,
				haze = 2.5,
			},
			clouds = { cover = .55, dens = .55, color = { 255, 200, 140 } },
		},
		Galaxy = {
			clock = 0,
			brightness = 1.5,
			ambient = { 70, 60, 100 },
			outAmb = { 80, 70, 110 },
			sky = { stars = 10000, moon = 30, sun = 0 },
			atm = {
				dens = .15,
				color = { 40, 20, 80 },
				decay = { 20, 10, 50 },
				glare = .3,
				haze = .5,
			},
		},
		Cyber = {
			clock = 21,
			brightness = 2.2,
			ambient = { 90, 130, 170 },
			outAmb = { 100, 140, 180 },
			sky = { stars = 2000, moon = 12 },
			atm = {
				dens = .4,
				color = { 0, 200, 255 },
				decay = { 150, 0, 255 },
				glare = 2,
				haze = 2,
			},
			clouds = { cover = .4, dens = .6, color = { 100, 200, 255 } },
		},
		Sakura = {
			clock = 11,
			brightness = 3.5,
			ambient = { 170, 150, 160 },
			outAmb = { 180, 160, 170 },
			sky = { sun = 8 },
			atm = {
				dens = .3,
				color = { 255, 200, 220 },
				decay = { 255, 170, 200 },
				glare = 1,
				haze = 1.5,
			},
			clouds = { cover = .6, dens = .4, color = { 255, 250, 252 } },
		},
		["Pink Night"] = {
			clock = 23,
			brightness = 2.2,
			ambient = { 120, 60, 110 },
			outAmb = { 140, 70, 120 },
			sky = {
				stars = 5000,
				moon = 22,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .5,
				color = { 255, 80, 180 },
				decay = { 140, 30, 100 },
				glare = .7,
				haze = 1.4,
			},
			clouds = { cover = .3, dens = .5, color = { 180, 90, 150 } },
		},
		["Blood Moon"] = {
			clock = 22.5,
			brightness = 1.4,
			ambient = { 120, 50, 50 },
			outAmb = { 130, 60, 60 },
			sky = {
				stars = 1500,
				moon = 28,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .5,
				color = { 180, 50, 50 },
				decay = { 100, 30, 30 },
				glare = .9,
				haze = 1.5,
			},
			clouds = { cover = .4, dens = .55, color = { 110, 40, 40 } },
		},
		["Emerald Dawn"] = {
			clock = 6.5,
			brightness = 2.8,
			ambient = { 130, 170, 140 },
			outAmb = { 140, 180, 150 },
			sky = { sun = 18, moon = 0, stars = 0 },
			atm = {
				dens = .4,
				color = { 80, 200, 140 },
				decay = { 40, 150, 90 },
				glare = 1.8,
				haze = 2.2,
			},
			clouds = { cover = .5, dens = .5, color = { 200, 255, 220 } },
		},
		Volcanic = {
			clock = 19,
			brightness = 1.6,
			ambient = { 170, 90, 50 },
			outAmb = { 180, 100, 60 },
			sky = { stars = 200, sun = 12, moon = 0 },
			atm = {
				dens = .55,
				color = { 200, 80, 30 },
				decay = { 150, 50, 20 },
				glare = 1.5,
				haze = 2,
			},
			clouds = { cover = .6, dens = .7, color = { 120, 50, 30 } },
		},
		Arctic = {
			clock = 9,
			brightness = 3.2,
			ambient = { 200, 220, 235 },
			outAmb = { 210, 230, 245 },
			sky = { sun = 10, stars = 0, moon = 0 },
			atm = {
				dens = .3,
				color = { 180, 220, 255 },
				decay = { 140, 200, 240 },
				glare = 1.5,
				haze = 1.8,
			},
			clouds = { cover = .7, dens = .6, color = { 250, 253, 255 } },
		},
		["Midnight Ocean"] = {
			clock = 1.5,
			brightness = 1.7,
			ambient = { 60, 90, 130 },
			outAmb = { 70, 100, 140 },
			sky = {
				stars = 6000,
				moon = 24,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .5,
				color = { 20, 60, 140 },
				decay = { 10, 30, 90 },
				glare = .6,
				haze = 1.5,
			},
		},
		Vaporwave = {
			clock = 19.5,
			brightness = 2.4,
			ambient = { 180, 120, 200 },
			outAmb = { 190, 130, 210 },
			sky = { stars = 1000, moon = 14 },
			atm = {
				dens = .45,
				color = { 255, 100, 220 },
				decay = { 120, 60, 255 },
				glare = 2.2,
				haze = 2.4,
			},
			clouds = { cover = .5, dens = .55, color = { 200, 150, 255 } },
		},
		Toxic = {
			clock = 13,
			brightness = 2.2,
			ambient = { 145, 170, 110 },
			outAmb = { 155, 180, 120 },
			atm = {
				dens = .4,
				color = { 130, 200, 90 },
				decay = { 90, 160, 60 },
				glare = 1.2,
				haze = 1.8,
			},
			clouds = { cover = .55, dens = .55, color = { 190, 230, 150 } },
		},
		["Solar Eclipse"] = {
			clock = 12,
			brightness = .9,
			ambient = { 50, 40, 60 },
			outAmb = { 60, 50, 70 },
			sky = { stars = 3500, sun = 22, moon = 0 },
			atm = {
				dens = .5,
				color = { 255, 140, 40 },
				decay = { 30, 20, 40 },
				glare = 2.8,
				haze = 1.8,
			},
		},
		Hellscape = {
			clock = 18,
			brightness = 1.4,
			ambient = { 170, 70, 40 },
			outAmb = { 180, 80, 50 },
			sky = { stars = 100, sun = 30, moon = 0 },
			atm = {
				dens = .5,
				color = { 200, 50, 20 },
				decay = { 110, 30, 10 },
				glare = 1.8,
				haze = 2.5,
			},
			clouds = { cover = .8, dens = .8, color = { 90, 30, 20 } },
		},
		Heaven = {
			clock = 12,
			brightness = 4,
			ambient = { 240, 235, 210 },
			outAmb = { 250, 245, 220 },
			sky = { sun = 16, moon = 0, stars = 0 },
			atm = {
				dens = .25,
				color = { 255, 250, 220 },
				decay = { 255, 240, 200 },
				glare = 3,
				haze = 1.5,
			},
			clouds = { cover = .85, dens = .5, color = { 255, 255, 255 } },
		},
		Storm = {
			clock = 15,
			brightness = 1.4,
			ambient = { 90, 90, 110 },
			outAmb = { 100, 100, 120 },
			sky = { stars = 0, sun = 6, moon = 0 },
			atm = {
				dens = .65,
				color = { 80, 90, 120 },
				decay = { 40, 50, 80 },
				glare = .5,
				haze = 3,
			},
			clouds = { cover = .95, dens = .95, color = { 60, 65, 80 } },
		},
		Sunrise = {
			clock = 6.2,
			brightness = 2.8,
			ambient = { 220, 180, 130 },
			outAmb = { 230, 190, 140 },
			sky = { sun = 22, stars = 0, moon = 0 },
			atm = {
				dens = .45,
				color = { 255, 180, 100 },
				decay = { 255, 140, 80 },
				glare = 2.4,
				haze = 2.2,
			},
			clouds = { cover = .4, dens = .4, color = { 255, 220, 180 } },
		},
		["Deep Space"] = {
			clock = 0,
			brightness = 1,
			ambient = { 30, 25, 50 },
			outAmb = { 40, 35, 60 },
			sky = { stars = 15000, moon = 0, sun = 0 },
			atm = {
				dens = .08,
				color = { 15, 5, 40 },
				decay = { 5, 0, 20 },
				glare = .2,
				haze = .3,
			},
		},
		["Lavender Dream"] = {
			clock = 18.5,
			brightness = 2.6,
			ambient = { 180, 160, 220 },
			outAmb = { 190, 170, 230 },
			sky = { stars = 800, moon = 16, sun = 0 },
			atm = {
				dens = .4,
				color = { 200, 160, 255 },
				decay = { 160, 120, 220 },
				glare = 1.4,
				haze = 1.8,
			},
			clouds = { cover = .55, dens = .5, color = { 220, 200, 255 } },
		},
		Inferno = {
			clock = 17.5,
			brightness = 1.8,
			ambient = { 200, 100, 50 },
			outAmb = { 210, 110, 60 },
			sky = { sun = 26, moon = 0, stars = 0 },
			atm = {
				dens = .5,
				color = { 220, 100, 40 },
				decay = { 180, 70, 20 },
				glare = 2,
				haze = 2.4,
			},
			clouds = { cover = .6, dens = .6, color = { 180, 90, 50 } },
		},
		["Mint Sky"] = {
			clock = 10,
			brightness = 3.2,
			ambient = { 180, 230, 210 },
			outAmb = { 190, 240, 220 },
			sky = { sun = 10 },
			atm = {
				dens = .32,
				color = { 150, 255, 210 },
				decay = { 100, 220, 180 },
				glare = 1.6,
				haze = 1.6,
			},
			clouds = { cover = .55, dens = .45, color = { 240, 255, 250 } },
		},
		["Clear Sky"] = {
			clock = 13.5,
			brightness = 3,
			ambient = { 180, 200, 220 },
			outAmb = { 190, 210, 230 },
			sky = { sun = 12, stars = 0, moon = 0 },
			atm = {
				dens = .28,
				color = { 140, 200, 255 },
				decay = { 90, 160, 230 },
				glare = 1.4,
				haze = 1.4,
			},
			clouds = { cover = .25, dens = .35, color = { 255, 255, 255 } },
		},
		["Golden Hour"] = {
			clock = 16.6,
			brightness = 2.2,
			ambient = { 195, 168, 132 },
			outAmb = { 205, 178, 142 },
			sky = { sun = 15, stars = 0, moon = 0 },
			atm = {
				dens = .36,
				color = { 240, 195, 140 },
				decay = { 205, 150, 95 },
				glare = 1.3,
				haze = 1.6,
			},
			clouds = { cover = .4, dens = .4, color = { 245, 225, 200 } },
		},
		Moonlight = {
			clock = 23.5,
			brightness = 1.8,
			ambient = { 140, 150, 175 },
			outAmb = { 150, 160, 185 },
			sky = {
				stars = 7000,
				moon = 26,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .4,
				color = { 170, 190, 225 },
				decay = { 60, 75, 110 },
				glare = .8,
				haze = 1.4,
			},
			clouds = { cover = .35, dens = .45, color = { 150, 165, 195 } },
		},
		["Cotton Candy"] = {
			clock = 18,
			brightness = 3,
			ambient = { 225, 190, 225 },
			outAmb = { 235, 200, 235 },
			sky = { sun = 10, stars = 0, moon = 0 },
			atm = {
				dens = .35,
				color = { 255, 180, 225 },
				decay = { 160, 200, 255 },
				glare = 1.6,
				haze = 1.8,
			},
			clouds = { cover = .6, dens = .45, color = { 255, 230, 245 } },
		},
		Monochrome = {
			clock = 13,
			brightness = 1.9,
			ambient = { 148, 148, 148 },
			outAmb = { 158, 158, 158 },
			sky = { sun = 0, stars = 0, moon = 0 },
			atm = {
				dens = .5,
				color = { 125, 125, 125 },
				decay = { 178, 178, 178 },
				glare = 0,
				haze = 2.4,
			},
			clouds = { cover = .85, dens = .75, color = { 142, 142, 142 } },
		},
		Rainbow = {
			clock = 17.4,
			brightness = 2.6,
			ambient = { 200, 185, 215 },
			outAmb = { 210, 195, 225 },
			sky = { sun = 18, stars = 0, moon = 0 },
			atm = {
				dens = .3,
				color = { 130, 70, 255 },
				decay = { 255, 120, 50 },
				glare = 1.8,
				haze = 3,
			},
			clouds = { cover = .35, dens = .4, color = { 255, 235, 250 } },
			rainbow = true,
		},
		Ultraviolet = {
			clock = 12,
			brightness = 2.2,
			ambient = { 150, 130, 195 },
			outAmb = { 160, 140, 205 },
			sky = { sun = 10, stars = 0, moon = 0 },
			atm = {
				dens = .5,
				color = { 115, 35, 205 },
				decay = { 170, 120, 235 },
				glare = 1.4,
				haze = 2.3,
			},
			clouds = { cover = .35, dens = .45, color = { 205, 170, 250 } },
		},
		["Blue Hour"] = {
			clock = 19.6,
			brightness = 1.9,
			ambient = { 95, 115, 150 },
			outAmb = { 105, 125, 160 },
			sky = { stars = 600, sun = 0, moon = 0 },
			atm = {
				dens = .45,
				color = { 70, 110, 175 },
				decay = { 150, 170, 205 },
				glare = .8,
				haze = 1.8,
			},
			clouds = { cover = .3, dens = .4, color = { 120, 140, 175 } },
		},
		Nebula = {
			clock = .5,
			brightness = 1.6,
			ambient = { 95, 70, 120 },
			outAmb = { 105, 80, 130 },
			sky = { stars = 12000, moon = 10, sun = 0 },
			atm = {
				dens = .3,
				color = { 190, 60, 200 },
				decay = { 40, 170, 190 },
				glare = 1.6,
				haze = 1.2,
			},
			clouds = { cover = .45, dens = .65, color = { 150, 70, 200 } },
		},
		Thunderhead = {
			clock = 16,
			brightness = 1.5,
			ambient = { 105, 110, 140 },
			outAmb = { 115, 120, 150 },
			sky = { sun = 5, stars = 0, moon = 0 },
			atm = {
				dens = .7,
				color = { 150, 165, 255 },
				decay = { 45, 50, 75 },
				glare = 3,
				haze = 2.8,
			},
			clouds = { cover = .95, dens = .9, color = { 70, 75, 100 } },
		},
		["Fuchsia Dawn"] = {
			clock = 6.4,
			brightness = 2.2,
			ambient = { 212, 145, 175 },
			outAmb = { 222, 155, 185 },
			sky = { sun = 12, stars = 0, moon = 0 },
			atm = {
				dens = .5,
				color = { 240, 55, 155 },
				decay = { 215, 110, 160 },
				glare = 1.3,
				haze = 2.3,
			},
			clouds = { cover = .45, dens = .5, color = { 255, 175, 205 } },
		},
		["Ice Cavern"] = {
			clock = 5,
			brightness = 1.5,
			ambient = { 130, 175, 200 },
			outAmb = { 140, 185, 210 },
			sky = { stars = 1200, moon = 8, sun = 0 },
			atm = {
				dens = .55,
				color = { 110, 200, 230 },
				decay = { 200, 235, 250 },
				glare = .9,
				haze = 2.6,
			},
			clouds = { cover = .6, dens = .6, color = { 190, 225, 240 } },
		},
		["Crimson Dusk"] = {
			clock = 18.8,
			brightness = 1.9,
			ambient = { 165, 80, 90 },
			outAmb = { 175, 90, 100 },
			sky = { sun = 9, stars = 300, moon = 0 },
			atm = {
				dens = .55,
				color = { 190, 40, 70 },
				decay = { 90, 25, 80 },
				glare = 1.6,
				haze = 2.2,
			},
			clouds = { cover = .55, dens = .6, color = { 150, 55, 75 } },
		},
		["Neon Rain"] = {
			clock = 21.5,
			brightness = 1.6,
			ambient = { 80, 95, 125 },
			outAmb = { 90, 105, 135 },
			sky = { stars = 300, moon = 0, sun = 0 },
			atm = {
				dens = .6,
				color = { 0, 230, 210 },
				decay = { 225, 40, 175 },
				glare = 2.6,
				haze = 2.8,
			},
			clouds = { cover = .9, dens = .85, color = { 55, 65, 90 } },
		},
		["Copper Sky"] = {
			clock = 15.5,
			brightness = 2,
			ambient = { 185, 120, 75 },
			outAmb = { 195, 130, 85 },
			sky = { sun = 13, stars = 0, moon = 0 },
			atm = {
				dens = .5,
				color = { 200, 110, 55 },
				decay = { 150, 80, 45 },
				glare = 1.5,
				haze = 2.6,
			},
			clouds = { cover = .65, dens = .6, color = { 190, 140, 100 } },
		},
		["Pearl Rose"] = {
			clock = 9.5,
			brightness = 3.4,
			ambient = { 240, 220, 228 },
			outAmb = { 248, 228, 236 },
			sky = { sun = 0, stars = 0, moon = 0 },
			atm = {
				dens = .38,
				color = { 255, 205, 220 },
				decay = { 250, 240, 242 },
				glare = .9,
				haze = 2,
			},
			clouds = { cover = .9, dens = .55, color = { 255, 245, 250 } },
		},
		["Red Giant"] = {
			clock = 17.6,
			brightness = 1.5,
			ambient = { 150, 75, 60 },
			outAmb = { 160, 85, 70 },
			sky = { sun = 75, stars = 400, moon = 0 },
			atm = {
				dens = .55,
				color = { 150, 40, 30 },
				decay = { 235, 120, 70 },
				glare = 2.2,
				haze = 2.6,
			},
			clouds = { cover = .35, dens = .5, color = { 150, 75, 55 } },
		},
		Moonfall = {
			clock = 1,
			brightness = 1.5,
			ambient = { 125, 140, 175 },
			outAmb = { 135, 150, 185 },
			sky = {
				stars = 9000,
				moon = 75,
				sun = 0,
				moonTex = true,
			},
			atm = {
				dens = .45,
				color = { 90, 115, 165 },
				decay = { 185, 200, 230 },
				glare = 1.1,
				haze = 1.8,
			},
			clouds = { cover = .3, dens = .45, color = { 150, 165, 200 } },
		},
		Ashfall = {
			clock = 15,
			brightness = 1.2,
			ambient = { 92, 86, 80 },
			outAmb = { 104, 98, 92 },
			sky = { sun = 4, stars = 0, moon = 0 },
			noAtm = true,
			shadows = false,
			exposure = -0.35,
			fog = { 10, 260, { 104, 97, 90 } },
			clouds = { cover = .9, dens = .85, color = { 86, 80, 74 } },
		},
		Marshlight = {
			clock = 6.8,
			brightness = 1.6,
			ambient = { 104, 132, 104 },
			outAmb = { 116, 144, 116 },
			sky = { sun = 8, stars = 0, moon = 0 },
			noAtm = true,
			envD = .8,
			fog = { 15, 200, { 88, 140, 98 } },
			clouds = { cover = .75, dens = .7, color = { 120, 150, 125 } },
		},
		Abyss = {
			clock = 12,
			brightness = 1.4,
			ambient = { 30, 80, 92 },
			outAmb = { 36, 92, 104 },
			sky = { sun = 3, stars = 0, moon = 0 },
			noAtm = true,
			shadows = false,
			exposure = -0.4,
			envD = .5,
			envS = .2,
			fog = { 0, 90, { 12, 62, 74 } },
		},
		Timelapse = {
			clock = 5,
			brightness = 2.4,
			ambient = { 170, 160, 165 },
			outAmb = { 180, 170, 175 },
			sky = {
				sun = 16,
				stars = 2500,
				moon = 14,
				moonTex = true,
			},
			drift = 1.875,
			atm = {
				dens = .35,
				color = { 190, 150, 190 },
				decay = { 210, 140, 110 },
				glare = 1.6,
				haze = 1.8,
			},
			clouds = { cover = .45, dens = .5, color = { 235, 225, 235 } },
		},
		Lightning = {
			clock = 19.2,
			brightness = 1.6,
			ambient = { 95, 100, 125 },
			outAmb = { 105, 110, 135 },
			sky = { sun = 0, stars = 0, moon = 0 },
			flash = {
				peak = 3.4,
				gapMin = 2.2,
				gapMax = 6.5,
				bursts = 3,
			},
			atm = {
				dens = .68,
				color = { 160, 175, 255 },
				decay = { 40, 44, 66 },
				glare = 0,
				haze = 2.8,
			},
			clouds = { cover = .95, dens = .92, color = { 62, 66, 88 } },
		},
		Pulsar = {
			clock = 0,
			brightness = 1.8,
			ambient = { 70, 90, 150 },
			outAmb = { 80, 100, 160 },
			sky = { stars = 11000, moon = 0, sun = 0 },
			pulse = { min = .6, max = 4.2, period = 4 },
			atm = {
				dens = .25,
				color = { 60, 100, 235 },
				decay = { 200, 220, 255 },
				glare = 2,
				haze = 1,
			},
		},
		Ionosphere = {
			clock = 1.2,
			brightness = 1.7,
			ambient = { 100, 155, 110 },
			outAmb = { 110, 165, 120 },
			sky = { stars = 8000, moon = 8, sun = 0 },
			atm = {
				dens = .42,
				color = { 60, 235, 140 },
				decay = { 18, 85, 45 },
				glare = 1.8,
				haze = 1.5,
			},
		},
		["Midnight Sun"] = {
			clock = 0,
			brightness = 2.6,
			ambient = { 215, 185, 140 },
			outAmb = { 225, 195, 150 },
			sky = { sun = 20, stars = 0, moon = 0 },
			lat = 89,
			atm = {
				dens = .42,
				color = { 255, 190, 110 },
				decay = { 235, 150, 90 },
				glare = 2.2,
				haze = 2.2,
			},
			clouds = { cover = .4, dens = .45, color = { 255, 225, 190 } },
		},
		["Polar Night"] = {
			clock = 12,
			brightness = 1.3,
			ambient = { 62, 80, 120 },
			outAmb = { 72, 90, 130 },
			sky = { stars = 2200, sun = 10, moon = 6 },
			lat = -88,
			exposure = -0.25,
			atm = {
				dens = .5,
				color = { 45, 70, 130 },
				decay = { 120, 150, 200 },
				glare = .6,
				haze = 2.2,
			},
			clouds = { cover = .55, dens = .5, color = { 80, 100, 140 } },
		},
		Infrared = {
			clock = 13,
			brightness = 2.2,
			ambient = { 120, 60, 70 },
			outAmb = { 130, 70, 80 },
			sky = { sun = 10, stars = 0, moon = 0 },
			shiftTop = { 120, 0, 0 },
			shiftBot = { 0, 20, 90 },
			envS = .3,
			atm = {
				dens = .3,
				color = { 90, 20, 40 },
				decay = { 200, 60, 60 },
				glare = 1.4,
				haze = 1.4,
			},
		},
		Sepia = {
			clock = 14,
			brightness = 2,
			ambient = { 160, 140, 110 },
			outAmb = { 170, 150, 120 },
			sky = { sun = 9, stars = 0, moon = 0 },
			shiftTop = { 90, 55, 10 },
			shiftBot = { 35, 20, 5 },
			envD = .45,
			envS = .1,
			atm = {
				dens = .45,
				color = { 185, 150, 100 },
				decay = { 150, 115, 70 },
				glare = 1,
				haze = 2.4,
			},
			clouds = { cover = .5, dens = .5, color = { 205, 185, 150 } },
		},
		Chrome = {
			clock = 12,
			brightness = 2.8,
			ambient = { 150, 160, 175 },
			outAmb = { 160, 170, 185 },
			sky = { sun = 14, stars = 0, moon = 0 },
			envD = .15,
			envS = 3,
			exposure = .2,
			atm = {
				dens = .3,
				color = { 175, 190, 210 },
				decay = { 120, 135, 160 },
				glare = 2.6,
				haze = 1.2,
			},
		},
		Supernova = {
			clock = 12,
			brightness = 4.5,
			ambient = { 255, 245, 225 },
			outAmb = { 255, 250, 235 },
			sky = { sun = 130, stars = 0, moon = 0 },
			exposure = .9,
			atm = {
				dens = .2,
				color = { 255, 250, 235 },
				decay = { 255, 210, 150 },
				glare = 5,
				haze = 1.6,
			},
		},
		Mars = {
			clock = 11,
			brightness = 1.9,
			ambient = { 190, 145, 110 },
			outAmb = { 200, 155, 120 },
			sky = { sun = 7, stars = 0, moon = 0 },
			lat = 2,
			envS = .2,
			shiftTop = { 70, 30, 0 },
			atm = {
				dens = .38,
				color = { 205, 150, 105 },
				decay = { 175, 120, 80 },
				glare = 1.1,
				haze = 2,
			},
		},
		Titan = {
			clock = 12,
			brightness = .9,
			ambient = { 150, 100, 45 },
			outAmb = { 160, 110, 55 },
			sky = { sun = 0, stars = 0, moon = 0 },
			noAtm = true,
			shadows = false,
			exposure = -0.15,
			envD = 1.3,
			envS = 0,
			fog = { 0, 150, { 168, 108, 38 } },
		},
		Dreamcore = {
			clock = 13,
			brightness = 2.6,
			ambient = { 215, 200, 240 },
			outAmb = { 225, 210, 250 },
			sky = { sun = 0, stars = 0, moon = 0 },
			shadows = false,
			envD = 1.8,
			envS = 0,
			shiftTop = { 60, 30, 80 },
			exposure = .3,
			atm = {
				dens = .3,
				color = { 215, 185, 255 },
				decay = { 235, 215, 255 },
				glare = .6,
				haze = 2.6,
			},
			clouds = { cover = .7, dens = .35, color = { 250, 240, 255 } },
		},
		["Ember Night"] = {
			clock = 23,
			brightness = 1.2,
			ambient = { 80, 45, 30 },
			outAmb = { 92, 52, 34 },
			sky = { stars = 2600, moon = 0, sun = 0 },
			shiftBot = { 120, 45, 0 },
			exposure = -0.2,
			atm = {
				dens = .55,
				color = { 25, 18, 22 },
				decay = { 225, 95, 35 },
				glare = 1.8,
				haze = 2.4,
			},
			clouds = { cover = .5, dens = .6, color = { 70, 40, 30 } },
		},
	};
function _vC3(g)
	return Color3.fromRGB(g[1], g[2], g[3]);
end;
function _v4mpClearSky()
	for g, u in ipairs(i:GetChildren()) do
		if u:GetAttribute("_MasaHubSky") then
			pcall(function()
				u:Destroy();
			end);
		end;
	end;
	local g = workspace:FindFirstChildOfClass("Terrain");
	if g then
		for g, u in ipairs(g:GetChildren()) do
			if u:GetAttribute("_MasaHubSky") then
				pcall(function()
					u:Destroy();
				end);
			end;
		end;
	end;
end;
local function bF()
	for g, u in ipairs(rl) do
		pcall(u.Disconnect, u);
	end;
	rl = {};
end;
local function TF()
	if #Ul > 0 then
		return;
	end;
	local function g(g, u)
		if not g then
			return;
		end;
		local B = { class = g.ClassName, parent = u, properties = {} };
		if g:IsA("Sky") then
			B.properties.StarCount = g.StarCount;
			B.properties.MoonAngularSize = g.MoonAngularSize;
			B.properties.SunAngularSize = g.SunAngularSize;
			B.properties.MoonTextureId = g.MoonTextureId;
		elseif g:IsA("Atmosphere") then
			B.properties.Density = g.Density;
			B.properties.Color = g.Color;
			B.properties.Decay = g.Decay;
			B.properties.Glare = g.Glare;
			B.properties.Haze = g.Haze;
		elseif g:IsA("Clouds") then
			B.properties.Cover = g.Cover;
			B.properties.Density = g.Density;
			B.properties.Color = g.Color;
		end;
		table.insert(Ul, B);
	end;
	local u = i:FindFirstChildWhichIsA("Sky");
	if u then
		g(u, i);
	end;
	local B = i:FindFirstChildWhichIsA("Atmosphere");
	if B then
		g(B, i);
	end;
	local a = workspace:FindFirstChildOfClass("Terrain");
	if a then
		local u = a:FindFirstChildWhichIsA("Clouds");
		if u then
			g(u, a);
		end;
	end;
end;
local function WF()
	for g, u in ipairs(Ul) do
		local B = u.parent;
		if not B then
			continue;
		end;
		local a = Instance.new(u.class);
		for g, u in pairs(u.properties) do
			a[g] = u;
		end;
		a.Parent = B;
	end;
	Ul = {};
end;
local function DF()
	local function g(g)
		if g and not g:GetAttribute("_MasaHubSky") then
			g:Destroy();
		end;
	end;
	for u, B in ipairs(i:GetChildren()) do
		if B:IsA("Sky") or B:IsA("Atmosphere") then
			g(B);
		end;
	end;
	local u = workspace:FindFirstChildOfClass("Terrain");
	if u then
		for u, B in ipairs(u:GetChildren()) do
			if B:IsA("Clouds") then
				g(B);
			end;
		end;
	end;
end;
function applyCustomSky(g)
	Sl = g;
	_v4mpClearSky();
	bF();
	_G._MasaSkyRainbowToken = ((_G._MasaSkyRainbowToken or 0)) + 1;
	_G._MasaSkyDynToken = ((_G._MasaSkyDynToken or 0)) + 1;
	local u = workspace:FindFirstChild("MasaSkyFlash");
	while u do
		pcall(function()
			u:Destroy();
		end);
		u = workspace:FindFirstChild("MasaSkyFlash");
	end;
	if g == "Off" then
		WF();
		if not x then
			i.FogEnd = 100000;
			i.FogStart = 0;
			i.FogColor = Color3.fromRGB(192, 192, 192);
			i.Brightness = 2;
			i.ClockTime = 14;
			i.GlobalShadows = true;
			i.ExposureCompensation = 0;
			i.ColorShift_Top = Color3.fromRGB(0, 0, 0);
			i.ColorShift_Bottom = Color3.fromRGB(0, 0, 0);
			i.GeographicLatitude = 41.733;
			i.EnvironmentDiffuseScale = 1;
			i.EnvironmentSpecularScale = 1;
		end;
		V.skyTheme = "Off";
		if Il then
			Il.Text = "Off";
		end;
		return;
	end;
	local B = SKY_PRESETS[g];
	if not B then
		V.skyTheme = "Off";
		return;
	end;
	TF();
	DF();
	if B.fog then
		i.FogStart = B.fog[1];
		i.FogEnd = B.fog[2];
		i.FogColor = _vC3(B.fog[3]);
	else
		i.FogEnd = 100000;
		i.FogStart = 0;
		i.FogColor = Color3.fromRGB(200, 200, 200);
	end;
	i.GlobalShadows = (B.shadows ~= false);
	i.ExposureCompensation = B.exposure or 0;
	i.ColorShift_Top = B.shiftTop and _vC3(B.shiftTop) or Color3.fromRGB(0, 0, 0);
	i.ColorShift_Bottom = B.shiftBot and _vC3(B.shiftBot) or Color3.fromRGB(0, 0, 0);
	i.GeographicLatitude = B.lat or 41.733;
	i.EnvironmentDiffuseScale = B.envD or 1;
	i.EnvironmentSpecularScale = B.envS or 1;
	i.ClockTime = B.clock or 14;
	_G._MasaSkyClk = B.clock or 14;
	i.Brightness = B.brightness or 2;
	if B.outAmb then
		i.OutdoorAmbient = _vC3(B.outAmb);
	end;
	if B.ambient then
		i.Ambient = _vC3(B.ambient);
	end;
	local function H()
		_v4mpClearSky();
		if B.sky then
			local g = Instance.new("Sky");
			g:SetAttribute("_MasaHubSky", true);
			if B.sky.stars then
				g.StarCount = B.sky.stars;
			end;
			if B.sky.moon then
				g.MoonAngularSize = B.sky.moon;
			end;
			if B.sky.sun then
				g.SunAngularSize = B.sky.sun;
			end;
			if B.sky.moonTex then
				g.MoonTextureId = "rbxasset://sky/moon.jpg";
			end;
			g.Parent = i;
		end;
		local g = nil;
		if not B.noAtm then
			g = Instance.new("Atmosphere");
			g:SetAttribute("_MasaHubSky", true);
			if B.atm then
				g.Density = B.atm.dens or .3;
				g.Color = _vC3(B.atm.color);
				g.Decay = _vC3(B.atm.decay);
				g.Glare = B.atm.glare or 1;
				g.Haze = B.atm.haze or 1;
			end;
			g.Parent = i;
		end;
		local u = workspace:FindFirstChildOfClass("Terrain");
		if B.clouds and u then
			local g = Instance.new("Clouds");
			g:SetAttribute("_MasaHubSky", true);
			g.Cover = B.clouds.cover or .5;
			g.Density = B.clouds.dens or .5;
			g.Color = _vC3(B.clouds.color);
			g.Parent = u;
		end;
		if B.rainbow and g then
			local u = ((_G._MasaSkyRainbowToken or 0)) + 1;
			_G._MasaSkyRainbowToken = u;
			local B = 34;
			local H = .55;
			task.spawn(function()
				while _G._MasaSkyRainbowToken == u do
					if not ((g and g.Parent)) then
						break;
					end;
					local u = ((os.clock() % B)) / B;
					pcall(function()
						g.Color = Color3.fromHSV(u, .75, 1);
						g.Decay = Color3.fromHSV(((u + H)) % 1, .8, 1);
					end);
					a.Heartbeat:Wait();
				end;
			end);
		end;
		if B.drift or B.flash or B.pulse then
			local g = ((_G._MasaSkyDynToken or 0)) + 1;
			_G._MasaSkyDynToken = g;
			local u = B.brightness or 2;
			task.spawn(function()
				local H = os.clock() + 1.5;
				local R = _G._MasaSkyClk or (B.clock or 14);
				local O, c;
				if B.flash then
					O = Instance.new("Part");
					O.Name = "MasaSkyFlash";
					O.Anchored = true;
					O.CanCollide = false;
					O.CanQuery = false;
					O.CanTouch = false;
					O.CastShadow = false;
					O.Transparency = 1;
					O.Size = Vector3.new(1, 1, 1);
					O.Parent = workspace;
					c = Instance.new("PointLight");
					c.Color = Color3.fromRGB(205, 220, 255);
					c.Range = 60;
					c.Brightness = 0;
					c.Shadows = false;
					c.Enabled = false;
					c.Parent = O;
				end;
				while _G._MasaSkyDynToken == g do
					local h = a.Heartbeat:Wait();
					if B.drift then
						R = ((R + B.drift * h)) % 24;
						_G._MasaSkyClk = R;
						i.ClockTime = R;
					end;
					if B.pulse then
						local g = ((math.sin(((os.clock() * math.pi) * 2) / B.pulse.period) + 1)) * .5;
						i.Brightness = B.pulse.min + ((B.pulse.max - B.pulse.min)) * g;
					end;
					if B.flash and os.clock() >= H then
						local a, R = B.flash.gapMin or 2, B.flash.gapMax or 6;
						H = (os.clock() + a) + math.random() * ((R - a));
						if O then
							local g = workspace.CurrentCamera;
							if g then
								local u = (math.random() * math.pi) * 2;
								local B = 28 + math.random() * 26;
								O.Position = g.CFrame.Position + Vector3.new(math.cos(u) * B, 16 + math.random() * 16, math.sin(u) * B);
							end;
						end;
						task.spawn(function()
							for a = 1, (B.flash.bursts or 2), 1 do
								if _G._MasaSkyDynToken ~= g then
									return;
								end;
								if c then
									c.Brightness = 14;
									c.Enabled = true;
								end;
								i.Brightness = B.flash.peak or 6;
								task.wait(.05);
								if _G._MasaSkyDynToken ~= g then
									return;
								end;
								if c then
									c.Enabled = false;
								end;
								i.Brightness = u;
								task.wait(.06 + math.random() * .1);
							end;
						end);
					end;
				end;
				if O then
					pcall(function()
						O:Destroy();
					end);
				end;
			end);
		end;
	end;
	H();
	local function R(g)
		return function()
			if Sl == "Off" then
				return;
			end;
			local u = SKY_PRESETS[Sl];
			if not u then
				return;
			end;
			local B = i[g];
			local a;
			if g == "ClockTime" then
				a = u.drift and ((_G._MasaSkyClk or u.clock or 14)) or (u.clock or 14);
			elseif g == "Brightness" then
				if u.flash or u.pulse then
					return;
				end;
				a = u.brightness or 2;
			elseif g == "OutdoorAmbient" then
				a = u.outAmb and _vC3(u.outAmb);
			elseif g == "Ambient" then
				a = u.ambient and _vC3(u.ambient);
			end;
			if a then
				local u = pcall(function()
						if typeof(B) == "number" then
							if math.abs(B - a) > .001 then
								i[g] = a;
							end;
						else
							i[g] = a;
						end;
					end);
			end;
		end;
	end;
	for g, u in ipairs({
		"ClockTime",
		"Brightness",
		"OutdoorAmbient",
		"Ambient",
	}) do
		local B = (i:GetPropertyChangedSignal(u)):Connect(R(u));
		table.insert(rl, B);
	end;
	local function O(g)
		if Sl == "Off" then
			return;
		end;
		if g:GetAttribute("_MasaHubSky") then
			return;
		end;
		if g:IsA("Sky") or g:IsA("Atmosphere") or g:IsA("Clouds") then
			pcall(function()
				g:Destroy();
			end);
			task.defer(H);
		end;
	end;
	local c = i.DescendantAdded:Connect(O);
	table.insert(rl, c);
	local h = workspace:FindFirstChildOfClass("Terrain");
	if h then
		local g = h.DescendantAdded:Connect(O);
		table.insert(rl, g);
	end;
	local function Q(g)
		if Sl == "Off" then
			return;
		end;
		if g:GetAttribute("_MasaHubSky") then
			task.defer(H);
		end;
	end;
	local function e(g)
		local u = g.AncestryChanged:Connect(function(u, B)
				if not B then
					Q(g);
				end;
			end);
		table.insert(rl, u);
	end;
	for g, u in ipairs(i:GetDescendants()) do
		if u:GetAttribute("_MasaHubSky") then
			e(u);
		end;
	end;
	if h then
		for g, u in ipairs(h:GetDescendants()) do
			if u:GetAttribute("_MasaHubSky") then
				e(u);
			end;
		end;
	end;
	V.skyTheme = g;
	if Il then
		Il.Text = g;
	end;
end;
function enableUltraMode()
	V.ultraModeEnabled = true;
	applyKTMOptimization();
end;
function disableUltraMode()
	V.ultraModeEnabled = false;
end;
function enableRemoveAccessories()
	V.removeAccessoriesEnabledSep = true;
	J = true;
	removeAllAccessories();
	if not V.removeAccCharConns then
		V.removeAccCharConns = {};
	end;
	if V.removeAccConn then
		V.removeAccConn:Disconnect();
	end;
	V.removeAccConn = g.PlayerAdded:Connect(function(g)
			if V.removeAccCharConns[g] then
				pcall(function()
					V.removeAccCharConns[g]:Disconnect();
				end);
			end;
			V.removeAccCharConns[g] = g.CharacterAdded:Connect(function(g)
					task.wait(.5);
					if V.removeAccessoriesEnabledSep or J then
						for g, u in ipairs(g:GetDescendants()) do
							processAntiLagDescendant(u);
						end;
					end;
				end);
		end);
	if V.removeAccRemovingConn then
		V.removeAccRemovingConn:Disconnect();
	end;
	V.removeAccRemovingConn = g.PlayerRemoving:Connect(function(g)
			if V.removeAccCharConns and V.removeAccCharConns[g] then
				pcall(function()
					V.removeAccCharConns[g]:Disconnect();
				end);
				V.removeAccCharConns[g] = nil;
			end;
		end);
	if G then
		G:Disconnect();
	end;
	G = R.DescendantAdded:Connect(function(g)
			if antiLagEnabled or V.ultraModeEnabled or J or V.removeAccessoriesEnabledSep then
				processAntiLagDescendant(g);
			end;
		end);
end;
function disableRemoveAccessories()
	V.removeAccessoriesEnabledSep = false;
	J = false;
	if V.removeAccConn then
		V.removeAccConn:Disconnect();
		V.removeAccConn = nil;
	end;
	if V.removeAccRemovingConn then
		V.removeAccRemovingConn:Disconnect();
		V.removeAccRemovingConn = nil;
	end;
	if V.removeAccCharConns then
		for g, u in pairs(V.removeAccCharConns) do
			pcall(function()
				u:Disconnect();
			end);
		end;
		table.clear(V.removeAccCharConns);
	end;
	if not antiLagEnabled and (not V.ultraModeEnabled and G) then
		G:Disconnect();
		G = nil;
	end;
end;
function enableCustomFont()
	customFontVisualEnabled = false;
	if V then
		V.customFontEnabled = false;
	end;
end;
function disableCustomFont()
	customFontVisualEnabled = false;
	if V then
		V.customFontEnabled = false;
	end;
end;
__masa_src_enableNoCamCollision = enableNoCamCollision;
function enableNoCamCollision()
	__masa_src_enableNoCamCollision();
	Bl = true;
end;
__masa_src_disableNoCamCollision = disableNoCamCollision;
function disableNoCamCollision()
	__masa_src_disableNoCamCollision();
	Bl = false;
end;
_G.MasaRainbowJoystickEnabled = _G.MasaRainbowJoystickEnabled == true;
((function()
	local g = {};
	local u = nil;
	local B = {};
	local H, i;
	local function R()
		for g, u in pairs(B) do
			if g and g.Parent then
				pcall(function()
					g[u.prop] = u.orig;
				end);
			end;
		end;
		B = {};
	end;
	local function O(g)
		if B[g] then
			return;
		end;
		if g:IsA("ImageLabel") or g:IsA("ImageButton") then
			B[g] = { prop = "ImageColor3", orig = g.ImageColor3 };
		elseif g:IsA("Frame") then
			B[g] = { prop = "BackgroundColor3", orig = g.BackgroundColor3 };
		end;
	end;
	local function c()
		local g = P:FindFirstChild("TouchGui");
		if not g then
			return;
		end;
		for g, u in ipairs(g:GetDescendants()) do
			if u:IsA("ImageLabel") or u:IsA("Frame") then
				local g = u.Name:lower();
				if g:find("thumbstick") or g:find("stick") then
					O(u);
				end;
			end;
		end;
		local u = g:FindFirstChild("TouchControlFrame");
		if u then
			for g, u in ipairs(u:GetDescendants()) do
				if u:IsA("ImageButton") then
					O(u);
					for g, u in ipairs(u:GetDescendants()) do
						if u:IsA("ImageLabel") then
							O(u);
						end;
					end;
					break;
				end;
			end;
		end;
	end;
	i = function()
			for g, u in ipairs(g) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			g = {};
			if u then
				pcall(function()
					u:Disconnect();
				end);
				u = nil;
			end;
			R();
		end;
	H = function()
			i();
			c();
			table.insert(g, P.ChildAdded:Connect(function(g)
				if g.Name == "TouchGui" and _G.MasaRainbowJoystickEnabled then
					task.wait(.2);
					if _G.MasaRainbowJoystickEnabled then
						H();
					end;
				end;
			end));
			local R = P:FindFirstChild("TouchGui");
			if R then
				table.insert(g, R.DescendantAdded:Connect(function()
					task.wait(.2);
					if _G.MasaRainbowJoystickEnabled then
						c();
					end;
				end));
			end;
			u = a.RenderStepped:Connect(function()
					local g = tick() * 2;
					local u = Color3.new(math.sin(g) * .5 + .5, math.sin(g + 2) * .5 + .5, math.sin(g + 4) * .5 + .5);
					for g, a in pairs(B) do
						if g and g.Parent then
							g[a.prop] = u;
						else
							B[g] = nil;
						end;
					end;
				end);
		end;
	function _G.MasaSetRainbowJoystick(g)
		g = g and true or false;
		_G.MasaRainbowJoystickEnabled = g;
		if g then
			H();
		else
			i();
		end;
	end;
end))();
if _G.MasaRainbowJoystickEnabled then
	pcall(_G.MasaSetRainbowJoystick, true);
end;
function __MasaDuelsSetupVisualsUI()
	local g = tF.VISUALS;
	local u = SKY_PRESETS_LIST or {
			"Off",
			"Night",
			"Aurora",
			"Sunset",
			"Galaxy",
			"Cyber",
			"Sakura",
		};
	local H = 1;
	for g, u in ipairs(u) do
		if u == Sl then
			H = g;
			break;
		end;
	end;
	function skyThemeSelectorRow(g, u)
		local a = baseRow(g, "Sky Theme", u);
		a.Size = UDim2.new(1, -4, 0, 42);
		a.ClipsDescendants = true;
		local H = a:FindFirstChild("Label");
		if H then
			H.Size = UDim2.new(0, 92, 1, 0);
			H.TextSize = 11;
		end;
		local i = Instance.new("Frame");
		i.Name = "SkyValueHolder";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .28;
		i.BorderSizePixel = 0;
		i.Size = UDim2.new(0, 124, 0, 30);
		i.Position = UDim2.new(1, -132, .5, -15);
		i.ClipsDescendants = true;
		i.ZIndex = 7;
		i.Parent = a;
		corner(i, 15);
		stroke(i, Color3.fromRGB(255, 170, 210), 1.5, .15);
		local R = Instance.new("UIGradient");
		R.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		R.Rotation = 18;
		R.Parent = i;
		_G._MasaRegAccent(i, R, "pick");
		Il = Instance.new("TextLabel");
		Il.Name = "SkyValue";
		Il.BackgroundTransparency = 1;
		Il.Text = Sl or "Off";
		Il.TextColor3 = HF.white;
		Il.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		Il.TextStrokeTransparency = .22;
		Il.TextSize = 11;
		Il.Font = Enum.Font.GothamBlack;
		Il.TextXAlignment = Enum.TextXAlignment.Center;
		Il.Size = UDim2.new(1, 0, 1, 0);
		Il.ZIndex = 9;
		Il.Parent = i;
		local O = Instance.new("TextButton");
		O.Name = "OpenSkyPicker";
		O.BackgroundTransparency = 1;
		O.Text = "";
		O.Size = UDim2.new(1, 0, 1, 0);
		O.AutoButtonColor = false;
		O.ZIndex = 10;
		O.Parent = i;
		O.MouseEnter:Connect(function()
			tween(i, { Size = UDim2.new(0, 130, 0, 32), Position = UDim2.new(1, -135, .5, -16) }, .12);
		end);
		O.MouseLeave:Connect(function()
			tween(i, { Size = UDim2.new(0, 124, 0, 30), Position = UDim2.new(1, -132, .5, -15) }, .12);
		end);
		local function c(g)
			local u = SKY_PRESET_COLORS and SKY_PRESET_COLORS[g];
			if u then
				return Color3.fromRGB(u[1], u[2], u[3]);
			end;
			return Color3.fromRGB(128, 128, 128);
		end;
		local h = nil;
		local function Q()
			if h and h.Parent then
				local g = B:Create(h.Frame, TweenInfo.new(.2), { BackgroundTransparency = 1 });
				g:Play();
				g.Completed:Connect(function()
					h:Destroy();
					h = nil;
				end);
			end;
		end;
		O.Activated:Connect(function()
			if h and h.Parent then
				Q();
				return;
			end;
			h = Instance.new("ScreenGui");
			h.Name = "MasaHubSkyPicker";
			h.ResetOnSpawn = false;
			h.IgnoreGuiInset = true;
			h.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			h.DisplayOrder = 9999;
			h.Parent = m;
			local g = Instance.new("Frame");
			g.Name = "Backdrop";
			g.Size = UDim2.new(1, 0, 1, 0);
			g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			g.BackgroundTransparency = .45;
			g.BorderSizePixel = 0;
			g.ZIndex = 1;
			g.Parent = h;
			local u = Instance.new("Frame");
			u.Name = "Frame";
			u.Size = UDim2.new(0, 380, 0, 520);
			u.Position = UDim2.new(.5, -190, .5, -260);
			u.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
			u.BorderSizePixel = 0;
			u.ZIndex = 2;
			u.Parent = h;
			corner(u, 16);
			stroke(u, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local a = Instance.new("Frame");
			a.Name = "TitleBar";
			a.Size = UDim2.new(1, 0, 0, 48);
			a.Position = UDim2.new(0, 0, 0, 0);
			a.BackgroundColor3 = Color3.fromRGB(12, 12, 15);
			a.BackgroundTransparency = .15;
			a.BorderSizePixel = 0;
			a.ZIndex = 3;
			a.Parent = u;
			corner(a, 16);
			local H = Instance.new("TextLabel");
			H.Name = "Title";
			H.Size = UDim2.new(1, -60, 1, 0);
			H.Position = UDim2.new(0, 18, 0, 0);
			H.BackgroundTransparency = 1;
			H.Text = "SELECT SKY PRESET";
			H.TextColor3 = Color3.fromRGB(255, 255, 255);
			H.Font = Enum.Font.GothamBlack;
			H.TextSize = 16;
			H.TextXAlignment = Enum.TextXAlignment.Left;
			H.ZIndex = 4;
			H.Parent = a;
			local i = Instance.new("TextButton");
			i.Name = "CloseBtn";
			i.Size = UDim2.new(0, 36, 0, 36);
			i.Position = UDim2.new(1, -44, 0, 6);
			i.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			i.BackgroundTransparency = .1;
			i.BorderSizePixel = 0;
			i.Text = "X";
			i.TextColor3 = Color3.fromRGB(255, 255, 255);
			i.Font = Enum.Font.GothamBlack;
			i.TextSize = 14;
			i.AutoButtonColor = false;
			i.ZIndex = 4;
			i.Parent = a;
			corner(i, 10);
			stroke(i, Color3.fromRGB(90, 90, 105), 1, .4);
			i.MouseEnter:Connect(function()
				tween(i, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
			end);
			i.MouseLeave:Connect(function()
				tween(i, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
			end);
			i.Activated:Connect(Q);
			local R = Instance.new("ScrollingFrame");
			R.Name = "Scroll";
			R.Size = UDim2.new(1, -16, 1, -64);
			R.Position = UDim2.new(0, 8, 0, 56);
			R.BackgroundTransparency = 1;
			R.BorderSizePixel = 0;
			R.ScrollBarThickness = 4;
			R.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90);
			R.CanvasSize = UDim2.new(0, 0, 0, 0);
			R.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			R.ZIndex = 3;
			R.Parent = u;
			local O = Instance.new("UIGridLayout");
			O.CellSize = UDim2.new(0, 108, 0, 108);
			O.CellPadding = UDim2.new(0, 10, 0, 10);
			O.FillDirection = Enum.FillDirection.Horizontal;
			O.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			O.SortOrder = Enum.SortOrder.LayoutOrder;
			O.Parent = R;
			local e = Instance.new("UIPadding", R);
			e.PaddingLeft = UDim.new(0, 8);
			e.PaddingRight = UDim.new(0, 8);
			e.PaddingTop = UDim.new(0, 8);
			e.PaddingBottom = UDim.new(0, 8);
			for g, u in ipairs(SKY_PRESETS_LIST) do
				local B = Instance.new("TextButton");
				B.Name = "Preset_" .. u;
				B.Size = UDim2.new(1, 0, 1, 0);
				B.BackgroundColor3 = Color3.fromRGB(14, 14, 18);
				B.BackgroundTransparency = 0;
				B.BorderSizePixel = 0;
				B.Text = "";
				B.AutoButtonColor = false;
				B.LayoutOrder = g;
				B.ZIndex = 4;
				B.ClipsDescendants = true;
				B.Parent = R;
				corner(B, 18);
				local a = c(u);
				local H = (Sl == u);
				local i = Instance.new("UIGradient");
				i.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, a), ColorSequenceKeypoint.new(.55, Color3.fromRGB(math.floor(a.R * 110), math.floor(a.G * 110), math.floor(a.B * 110))), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 14)) });
				i.Rotation = 90;
				i.Parent = B;
				local O = Instance.new("UIStroke");
				O.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				O.Color = H and Color3.fromRGB(255, 255, 255) or a;
				O.Thickness = H and 2.4 or 1.2;
				O.Transparency = H and 0 or .55;
				O.Parent = B;
				local h = Instance.new("Frame");
				h.Name = "ColorCircle";
				h.Size = UDim2.new(0, 40, 0, 40);
				h.Position = UDim2.new(.5, -20, 0, 18);
				h.BackgroundColor3 = a;
				h.BorderSizePixel = 0;
				h.ZIndex = 5;
				h.Parent = B;
				(Instance.new("UICorner", h)).CornerRadius = UDim.new(0, 12);
				local e = Instance.new("UIGradient");
				if u == "Rainbow" then
					e.Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 60, 60)),
							ColorSequenceKeypoint.new(.2, Color3.fromRGB(255, 180, 40)),
							ColorSequenceKeypoint.new(.4, Color3.fromRGB(90, 220, 90)),
							ColorSequenceKeypoint.new(.6, Color3.fromRGB(60, 200, 255)),
							ColorSequenceKeypoint.new(.8, Color3.fromRGB(120, 110, 255)),
							ColorSequenceKeypoint.new(1, Color3.fromRGB(230, 90, 220)),
						});
				else
					e.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.45, a), ColorSequenceKeypoint.new(1, a) });
				end;
				if u ~= "Rainbow" then
					e.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .55), NumberSequenceKeypoint.new(.45, 0), NumberSequenceKeypoint.new(1, 0) });
				end;
				e.Rotation = 125;
				e.Parent = h;
				local P = Instance.new("UIStroke");
				P.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				P.Color = Color3.fromRGB(255, 255, 255);
				P.Thickness = H and 2 or 1.2;
				P.Transparency = H and .05 or .45;
				P.Parent = h;
				local m = Instance.new("TextLabel");
				m.Name = "Name";
				m.Size = UDim2.new(1, -8, 0, 24);
				m.Position = UDim2.new(0, 4, 1, -32);
				m.BackgroundTransparency = 1;
				m.Text = string.upper(u);
				m.TextColor3 = Color3.fromRGB(255, 255, 255);
				m.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				m.TextStrokeTransparency = .4;
				m.Font = Enum.Font.GothamBlack;
				m.TextSize = 10;
				m.TextWrapped = true;
				m.ZIndex = 6;
				m.Parent = B;
				B.MouseEnter:Connect(function()
					tween(O, { Transparency = 0, Thickness = 2.4 }, .12);
					tween(h, { Size = UDim2.new(0, 46, 0, 46), Position = UDim2.new(.5, -23, 0, 15) }, .12);
				end);
				B.MouseLeave:Connect(function()
					tween(O, { Transparency = H and 0 or .55, Thickness = H and 2.4 or 1.2 }, .12);
					tween(h, { Size = UDim2.new(0, 40, 0, 40), Position = UDim2.new(.5, -20, 0, 18) }, .12);
				end);
				B.Activated:Connect(function()
					Sl = u;
					if Il then
						Il.Text = Sl;
					end;
					if applyCustomSky then
						applyCustomSky(Sl);
					end;
					saveMasaConfig();
					Q();
				end);
			end;
			g.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					Q();
				end;
			end);
			u.Size = UDim2.new(0, 0, 0, 0);
			u.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(u, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 380, 0, 520), Position = UDim2.new(.5, -190, .5, -260) })):Play();
		end);
		return a;
	end;
	section(g, "ESP", 1);
	do
		local u, B = toggleRow(g, "ESP", W, 3);
		Z.setPlayerESPVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				W = not W;
				_G.MasaESPOn = W;
				if W then
					if startPlayerESP then
						startPlayerESP();
					end;
					if BoxedESPOptions then
						BoxedESPOptions.box = true;
					end;
				else
					if stopPlayerESP then
						stopPlayerESP();
					end;
					if BoxedESPOptions then
						BoxedESPOptions.box = false;
					end;
				end;
				if refreshBoxedESP then
					refreshBoxedESP();
				end;
				if B then
					B(W);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Show Tracker", D, 2);
		Z.setTrackerESPVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				D = not D;
				if BoxedESPOptions then
					BoxedESPOptions.tracker = D;
				end;
				if refreshBoxedESP then
					refreshBoxedESP();
				end;
				if B then
					B(D);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local function u(g)
			BoxedESPOptions.trackerColor = g;
			for u, B in pairs(BoxedESPData or {}) do
				if B.tracker then
					pcall(function()
						B.tracker.Color = g;
					end);
				end;
				if B.box then
					pcall(function()
						B.box.Color = g;
					end);
				end;
			end;
			saveMasaConfig();
		end;
		local B, a = _G._MasaBuildColorPickerRow({
				parent = g,
				anchorRow = g:FindFirstChild("Show Tracker"),
				rowName = "Tracker Color",
				rowOrder = 2,
				title = "TRACKER COLOR",
				getColor = function()
					return (BoxedESPOptions and BoxedESPOptions.trackerColor) or Color3.fromRGB(230, 230, 230);
				end,
				onColor = u,
			});
		_G.MasaColorPreview = B:FindFirstChild("ColorPreview");
		_G.MasaUpdateTrackerColor = function(g)
				a(g);
				u(g);
			end;
	end;
	do
		local u, B = _G.MasaActionToggleRow(g, "Ragdoll Countdown", K, 3);
		Z.setRagdollCountdownVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				K = not K;
				if K then
					hookRagdollCountdown(e.Character);
					_G.MasaStartEnemyRagdollCountdown();
				else
					stopRagdollCountdown();
					_G.MasaStopEnemyRagdollCountdown();
				end;
				if B then
					B(K);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	section(g, "SKY THEME", 5);
	skyThemeSelectorRow(g, 6);
	section(g, "PERFORMANCE", 7);
	do
		local u, B = toggleRow(g, "Anti Lag", x, 9);
		Z.setAntiLagVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				if x then
					disableAntiLag();
				else
					enableAntiLag();
				end;
				if B then
					B(x);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, a = toggleRow(g, "Vivid Graphics", s, 8);
		Z.setVividGraphicsVisual = a;
		local H = u and u:FindFirstChild("ToggleButton");
		if H then
			H.Activated:Connect(function()
				if s then
					disableVividGraphics();
				else
					enableVividGraphics();
				end;
				if a then
					a(s);
				end;
				saveMasaConfig();
			end);
		end;
		local R = baseRow(g, "Vivid Graphics Changer", 8);
		R.Size = UDim2.new(1, -4, 0, 42);
		R.ClipsDescendants = true;
		R.Visible = false;
		do
			local g = false;
			local B = Instance.new("TextButton");
			B.Name = "VividChangerArrow";
			B.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			B.BackgroundTransparency = .18;
			B.BorderSizePixel = 0;
			B.Size = UDim2.new(0, 28, 0, 24);
			B.Position = UDim2.new(1, -90, .5, -12);
			B.Text = "\226\150\178";
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .3;
			B.TextSize = 15;
			B.Font = Enum.Font.GothamBold;
			B.AutoButtonColor = false;
			B.ZIndex = 8;
			B.Parent = u;
			corner(B, 7);
			stroke(B, HF.strokeSoft, 1, .45);
			B.Activated:Connect(function()
				g = not g;
				_G._MasaExpand(R, g, 42, B);
			end);
		end;
		local O = Instance.new("Frame");
		O.Name = "VividButtonHolder";
		O.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		O.BackgroundTransparency = .28;
		O.BorderSizePixel = 0;
		O.Size = UDim2.new(0, 66, 0, 30);
		O.Position = UDim2.new(1, -73, .5, -15);
		O.ClipsDescendants = true;
		O.ZIndex = 9;
		O.Parent = R;
		corner(O, 15);
		stroke(O, Color3.fromRGB(255, 170, 210), 1.5, .15);
		local c = Instance.new("UIGradient");
		c.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		c.Rotation = 18;
		c.Parent = O;
		_G._MasaRegAccent(O, c, "pick");
		local h = Instance.new("TextButton");
		h.Name = "VividPickBtn";
		h.BackgroundTransparency = 1;
		h.Text = "PICK";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .3;
		h.TextSize = 12;
		h.Font = Enum.Font.GothamBlack;
		h.TextXAlignment = Enum.TextXAlignment.Center;
		h.Size = UDim2.new(1, 0, 1, 0);
		h.Position = UDim2.new(0, 0, 0, 0);
		h.BorderSizePixel = 0;
		h.ZIndex = 10;
		h.AutoButtonColor = false;
		h.Parent = O;
		h.MouseEnter:Connect(function()
			tween(O, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
		end);
		h.MouseLeave:Connect(function()
			tween(O, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
		end);
		local function Q()
			if _G._MasaVivid.pickerGui and _G._MasaVivid.pickerGui.Parent then
				local g = _G._MasaVivid.pickerGui:FindFirstChild("Frame");
				if g then
					(B:Create(g, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
				end;
				task.delay(.25, function()
					if _G._MasaVivid.pickerGui and _G._MasaVivid.pickerGui.Parent then
						_G._MasaVivid.pickerGui:Destroy();
					end;
					_G._MasaVivid.pickerGui = nil;
				end);
			end;
		end;
		local function e(g, u, B, a, H, i, R, O, c)
			local h = Instance.new("Frame");
			h.Name = u;
			h.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
			h.BackgroundTransparency = .1;
			h.BorderSizePixel = 0;
			h.Size = UDim2.new(1, -24, 0, 38);
			h.Position = UDim2.new(0, 12, 0, c);
			h.ZIndex = 4;
			h.Parent = g;
			corner(h, 9);
			stroke(h, Color3.fromRGB(90, 90, 105), 1, .45);
			local Q = Instance.new("TextLabel");
			Q.BackgroundTransparency = 1;
			Q.Text = u;
			Q.TextColor3 = Color3.fromRGB(210, 210, 220);
			Q.Font = Enum.Font.GothamBold;
			Q.TextSize = 13;
			Q.TextXAlignment = Enum.TextXAlignment.Left;
			Q.Position = UDim2.new(0, 10, 0, 0);
			Q.Size = UDim2.new(1, -140, 1, 0);
			Q.ZIndex = 5;
			Q.Parent = h;
			local e = Instance.new("TextButton");
			e.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
			e.BackgroundTransparency = .05;
			e.BorderSizePixel = 0;
			e.Text = "-";
			e.TextColor3 = Color3.fromRGB(245, 245, 255);
			e.TextSize = 15;
			e.Font = Enum.Font.GothamBlack;
			e.TextXAlignment = Enum.TextXAlignment.Center;
			e.TextYAlignment = Enum.TextYAlignment.Center;
			e.AutoButtonColor = false;
			e.Size = UDim2.new(0, 26, 0, 24);
			e.Position = UDim2.new(1, -120, .5, -12);
			e.ZIndex = 6;
			e.Parent = h;
			corner(e, 7);
			stroke(e, Color3.fromRGB(90, 90, 105), 1, .5);
			local P = Instance.new("TextLabel");
			P.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
			P.BackgroundTransparency = 0;
			P.BorderSizePixel = 0;
			P.Text = string.format(O, B());
			P.TextColor3 = Color3.fromRGB(255, 255, 255);
			P.Font = Enum.Font.GothamBlack;
			P.TextSize = 12;
			P.TextXAlignment = Enum.TextXAlignment.Center;
			P.Size = UDim2.new(0, 46, 0, 24);
			P.Position = UDim2.new(1, -88, .5, -12);
			P.ZIndex = 6;
			P.Parent = h;
			corner(P, 7);
			stroke(P, Color3.fromRGB(90, 90, 105), 1, .5);
			local m = Instance.new("TextButton");
			m.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
			m.BackgroundTransparency = .05;
			m.BorderSizePixel = 0;
			m.Text = "+";
			m.TextColor3 = Color3.fromRGB(245, 245, 255);
			m.TextSize = 14;
			m.Font = Enum.Font.GothamBold;
			m.TextXAlignment = Enum.TextXAlignment.Center;
			m.TextYAlignment = Enum.TextYAlignment.Center;
			m.LineHeight = .85;
			m.AutoButtonColor = false;
			m.Size = UDim2.new(0, 26, 0, 24);
			m.Position = UDim2.new(1, -36, .5, -12);
			m.ZIndex = 6;
			m.Parent = h;
			corner(m, 7);
			stroke(m, Color3.fromRGB(90, 90, 105), 1, .5);
			local function Z(g)
				local u = math.floor(1 / R + .5);
				local B = math.clamp(math.floor(g * u + .5) / u, H, i);
				a(B);
				P.Text = string.format(O, B);
			end;
			e.MouseButton1Click:Connect(function()
				Z(B() - R);
			end);
			m.MouseButton1Click:Connect(function()
				Z(B() + R);
			end);
			for g, u in ipairs({ e, m }) do
				u.MouseEnter:Connect(function()
					tween(u, { BackgroundColor3 = Color3.fromRGB(30, 30, 40) }, .1);
				end);
				u.MouseLeave:Connect(function()
					tween(u, { BackgroundColor3 = Color3.fromRGB(8, 8, 14) }, .1);
				end);
			end;
		end;
		h.MouseButton1Click:Connect(function()
			if _G._MasaVivid.pickerGui and _G._MasaVivid.pickerGui.Parent then
				Q();
				return;
			end;
			_G._MasaVivid.pickerGui = Instance.new("ScreenGui");
			_G._MasaVivid.pickerGui.Name = "MasaHubVividPicker";
			_G._MasaVivid.pickerGui.ResetOnSpawn = false;
			_G._MasaVivid.pickerGui.IgnoreGuiInset = true;
			_G._MasaVivid.pickerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			_G._MasaVivid.pickerGui.DisplayOrder = 9999;
			_G._MasaVivid.pickerGui.Parent = m;
			local g = Instance.new("Frame");
			g.Name = "Backdrop";
			g.Size = UDim2.new(1, 0, 1, 0);
			g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			g.BackgroundTransparency = .5;
			g.BorderSizePixel = 0;
			g.ZIndex = 1;
			g.Parent = _G._MasaVivid.pickerGui;
			local u = 348;
			local a = Instance.new("Frame");
			a.Name = "Frame";
			a.Size = UDim2.new(0, 330, 0, u);
			a.Position = UDim2.new(.5, -165, .5, -u / 2);
			a.BackgroundColor3 = Color3.fromRGB(10, 10, 12);
			a.BorderSizePixel = 0;
			a.ZIndex = 2;
			a.Parent = _G._MasaVivid.pickerGui;
			corner(a, 16);
			stroke(a, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local H = Instance.new("Frame");
			H.Name = "TitleBar";
			H.Size = UDim2.new(1, 0, 0, 48);
			H.BackgroundColor3 = Color3.fromRGB(14, 14, 17);
			H.BackgroundTransparency = .1;
			H.BorderSizePixel = 0;
			H.ZIndex = 3;
			H.Parent = a;
			corner(H, 16);
			local R = Instance.new("TextLabel");
			R.Name = "Title";
			R.Size = UDim2.new(1, -60, 1, 0);
			R.Position = UDim2.new(0, 16, 0, 0);
			R.BackgroundTransparency = 1;
			R.Text = "VIVID GRAPHICS CHANGER";
			R.TextColor3 = Color3.fromRGB(255, 255, 255);
			R.Font = Enum.Font.GothamBlack;
			R.TextSize = 13;
			R.TextXAlignment = Enum.TextXAlignment.Left;
			R.ZIndex = 4;
			R.Parent = H;
			local O = Instance.new("TextButton");
			O.Name = "CloseBtn";
			O.Size = UDim2.new(0, 32, 0, 32);
			O.Position = UDim2.new(1, -40, 0, 8);
			O.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			O.BorderSizePixel = 0;
			O.Text = "X";
			O.TextColor3 = Color3.fromRGB(255, 255, 255);
			O.Font = Enum.Font.GothamBlack;
			O.TextSize = 13;
			O.AutoButtonColor = false;
			O.ZIndex = 4;
			O.Parent = H;
			corner(O, 8);
			stroke(O, Color3.fromRGB(90, 90, 105), 1, .4);
			O.MouseEnter:Connect(function()
				tween(O, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
			end);
			O.MouseLeave:Connect(function()
				tween(O, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
			end);
			O.Activated:Connect(Q);
			local c = 56;
			local P = 50;
			e(a, "Saturation", function()
				return _G._MasaVivid.saturation;
			end, function(g)
				_G._MasaVivid.saturation = g;
				if s then
					for u, B in ipairs(i:GetChildren()) do
						if B:IsA("ColorCorrectionEffect") and B:GetAttribute("_MasaVivid") then
							B.Saturation = g;
						end;
					end;
				end;
				saveMasaConfig();
			end, 0, 2, .1, "%.1f", c);
			e(a, "Bloom Intensity", function()
				return _G._MasaVivid.bloomIntensity;
			end, function(g)
				_G._MasaVivid.bloomIntensity = g;
				if s then
					for u, B in ipairs(i:GetChildren()) do
						if B:IsA("BloomEffect") and B:GetAttribute("_MasaVivid") then
							B.Intensity = g;
						end;
					end;
				end;
				saveMasaConfig();
			end, 0, 3, .1, "%.1f", c + P);
			e(a, "Bloom Size", function()
				return _G._MasaVivid.bloomSize;
			end, function(g)
				_G._MasaVivid.bloomSize = g;
				if s then
					for u, B in ipairs(i:GetChildren()) do
						if B:IsA("BloomEffect") and B:GetAttribute("_MasaVivid") then
							B.Size = g;
						end;
					end;
				end;
				saveMasaConfig();
			end, 1, 56, 1, "%.0f", c + P * 2);
			e(a, "Sun Rays", function()
				return _G._MasaVivid.sunIntensity;
			end, function(g)
				_G._MasaVivid.sunIntensity = g;
				if s then
					for u, B in ipairs(i:GetChildren()) do
						if B:IsA("SunRaysEffect") and B:GetAttribute("_MasaVivid") then
							B.Intensity = g;
						end;
					end;
				end;
				saveMasaConfig();
			end, 0, 1, .05, "%.2f", c + P * 3);
			e(a, "DOF Focus Dist", function()
				return _G._MasaVivid.dofFocus;
			end, function(g)
				_G._MasaVivid.dofFocus = g;
				if s then
					for u, B in ipairs(i:GetChildren()) do
						if B:IsA("DepthOfFieldEffect") and B:GetAttribute("_MasaVivid") then
							B.FocusDistance = g;
						end;
					end;
				end;
				saveMasaConfig();
			end, 1, 100, 1, "%.0f", c + P * 4);
			local Z = Instance.new("Frame");
			Z.Name = "ResetHolder";
			Z.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			Z.BackgroundTransparency = 0;
			Z.BorderSizePixel = 0;
			Z.Size = UDim2.new(1, -24, 0, 36);
			Z.Position = UDim2.new(0, 12, 1, -45);
			Z.ZIndex = 4;
			Z.Parent = a;
			corner(Z, 18);
			stroke(Z, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local F = Instance.new("UIGradient");
			F.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			F.Rotation = 18;
			F.Parent = Z;
			_G._MasaRegAccent(Z, F, "button");
			local S = Instance.new("TextButton");
			S.Name = "ResetToDefault";
			S.BackgroundTransparency = 1;
			S.Text = "RESET TO DEFAULT";
			S.TextColor3 = Color3.fromRGB(245, 245, 255);
			S.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			S.TextStrokeTransparency = .25;
			S.TextSize = 12;
			S.Font = Enum.Font.GothamBlack;
			S.Size = UDim2.new(1, 0, 1, 0);
			S.Position = UDim2.new(0, 0, 0, 0);
			S.AutoButtonColor = false;
			S.ZIndex = 5;
			S.Parent = Z;
			local r = Z:FindFirstChildOfClass("UIStroke");
			S.MouseEnter:Connect(function()
				tween(Z, { Size = UDim2.new(1, -18, 0, 38), Position = UDim2.new(0, 9, 1, -46) }, .12);
				if r then
					tween(r, { Transparency = 0, Thickness = 2.2 }, .12);
				end;
			end);
			S.MouseLeave:Connect(function()
				tween(Z, { Size = UDim2.new(1, -24, 0, 36), Position = UDim2.new(0, 12, 1, -45) }, .12);
				if r then
					tween(r, { Transparency = .15, Thickness = 1.5 }, .12);
				end;
			end);
			S.MouseButton1Click:Connect(function()
				_G._MasaVivid.saturation = .6;
				_G._MasaVivid.bloomIntensity = .8;
				_G._MasaVivid.bloomSize = 24;
				_G._MasaVivid.sunIntensity = .2;
				_G._MasaVivid.dofFocus = 25;
				if s then
					for g, u in ipairs(i:GetChildren()) do
						if u:GetAttribute("_MasaVivid") then
							if u:IsA("ColorCorrectionEffect") then
								u.Saturation = .6;
							elseif u:IsA("BloomEffect") then
								u.Intensity = .8;
								u.Size = 24;
							elseif u:IsA("SunRaysEffect") then
								u.Intensity = .2;
							elseif u:IsA("DepthOfFieldEffect") then
								u.FocusDistance = 25;
							end;
						end;
					end;
				end;
				saveMasaConfig();
				Q();
				task.delay(.28, function()
					if h and h.Parent then
						h.MouseButton1Click:Fire();
					end;
				end);
			end);
			g.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					Q();
				end;
			end);
			a.Size = UDim2.new(0, 0, 0, 0);
			a.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(a, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 330, 0, u), Position = UDim2.new(.5, -165, .5, -u / 2) })):Play();
		end);
	end;
	do
		local u, B = toggleRow(g, "X-Ray", v, 10);
		Z.setXRayVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				v = not v;
				pcall(setXRay, v);
				if B then
					B(v);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Brainrot X-Ray", _G.MasaBrainrotXRayEnabled == true, 10);
		Z.setBrainrotXRayVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				local g = not ((_G.MasaBrainrotXRayEnabled == true));
				if _G.MasaSetBrainrotXRay then
					_G.MasaSetBrainrotXRay(g);
				end;
				if B then
					B(g);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Kick Warning", _G._MasaKickWarn.enabled, 8);
		Z.setKickWarningVisual = B;
		local a = Instance.new("Frame");
		a.Name = "Kick Warning Options";
		a.BackgroundTransparency = 1;
		a.Size = UDim2.new(1, 0, 0, 38);
		a.BorderSizePixel = 0;
		a.LayoutOrder = 8;
		a.ZIndex = 4;
		a.ClipsDescendants = true;
		a.Visible = false;
		a.Parent = g;
		local H = Instance.new("Frame");
		H.Name = "UltimateAntiKickRow";
		H.BackgroundColor3 = HF.row;
		H.BackgroundTransparency = .3;
		H.Size = UDim2.new(1, -8, 0, 34);
		H.Position = UDim2.new(0, 4, 0, 2);
		H.BorderSizePixel = 0;
		H.ZIndex = 4;
		H.Parent = a;
		corner(H, 9);
		local i = stroke(H, HF.strokeSoft, 1.15, .38);
		H.MouseEnter:Connect(function()
			tween(H, { BackgroundTransparency = .22 });
		end);
		H.MouseLeave:Connect(function()
			tween(H, { BackgroundTransparency = .3 });
		end);
		local R = Instance.new("TextLabel");
		R.BackgroundTransparency = 1;
		R.Text = "Ultimate Anti Kick";
		R.TextColor3 = Color3.fromRGB(245, 245, 255);
		R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		R.TextStrokeTransparency = .25;
		R.TextSize = 12;
		R.Font = Enum.Font.GothamSemibold;
		R.TextXAlignment = Enum.TextXAlignment.Left;
		R.Position = UDim2.new(0, 12, 0, 0);
		R.Size = UDim2.new(1, -70, 1, 0);
		R.ZIndex = 5;
		R.Parent = H;
		local O = Instance.new("Frame");
		O.Name = "Track";
		O.BackgroundColor3 = HF.toggleBg;
		O.BackgroundTransparency = .12;
		O.Size = UDim2.new(0, 48, 0, 24);
		O.Position = UDim2.new(1, -58, .5, -12);
		O.BorderSizePixel = 0;
		O.ZIndex = 5;
		O.Parent = H;
		corner(O, 12);
		local c = stroke(O, HF.strokeSoft, 1.3, .4);
		local h = Instance.new("Frame");
		h.Name = "Fill";
		h.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		h.BackgroundTransparency = (_G.MasaUAKEnabled == true) and 0 or 1;
		h.Size = UDim2.new(1, 0, 1, 0);
		h.BorderSizePixel = 0;
		h.ZIndex = 5;
		h.Parent = O;
		corner(h, 11);
		local Q = Instance.new("UIGradient");
		Q.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		Q.Rotation = 18;
		Q.Parent = h;
		local P = Instance.new("Frame");
		P.Name = "Knob";
		P.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		P.Size = UDim2.new(0, 18, 0, 18);
		P.Position = (_G.MasaUAKEnabled == true) and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9);
		P.BorderSizePixel = 0;
		P.ZIndex = 7;
		P.Parent = O;
		corner(P, 999);
		local m = Instance.new("UIStroke");
		m.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		m.Color = (_G.MasaUAKEnabled == true) and Color3.fromRGB(255, 170, 210) or Color3.fromRGB(255, 192, 203);
		m.Thickness = 1.4;
		m.Transparency = .15;
		m.Parent = P;
		local F = Instance.new("Frame");
		F.BackgroundColor3 = HF.white;
		F.BackgroundTransparency = .55;
		F.Size = UDim2.new(1, -5, 0, 5);
		F.Position = UDim2.new(0, 2.5, 0, 2.5);
		F.BorderSizePixel = 0;
		F.ZIndex = 8;
		F.Parent = P;
		corner(F, 5);
		_G._MasaRegAccent(h, Q, "toggle", O, P, H);
		local function S(g)
			local u, B = _G._MasaToggleOnColor();
			tween(P, { Position = g and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9) });
			tween(O, { BackgroundTransparency = g and 0 or .12, BackgroundColor3 = g and u or HF.toggleBg });
			tween(h, { BackgroundTransparency = g and 0 or 1 });
			tween(m, { Color = g and B or Color3.fromRGB(255, 192, 203) });
			tween(c, { Color = g and B or HF.strokeSoft, Transparency = g and 0 or .4, Thickness = 1.4 });
			tween(i, { Color = g and u or HF.strokeSoft, Transparency = g and .08 or .38, Thickness = 1.25 });
		end;
		_G.MasaRefreshUAKVisual = function()
				S(_G.MasaUAKEnabled == true);
			end;
		local r = Instance.new("TextButton");
		r.Name = "ToggleButton";
		r.BackgroundTransparency = 1;
		r.Text = "";
		r.Size = UDim2.new(1, 0, 1, 0);
		r.AutoButtonColor = false;
		r.ZIndex = 9;
		r.Parent = H;
		r.Activated:Connect(function()
			_G.MasaUAKEnabled = not ((_G.MasaUAKEnabled == true));
			if not _G.MasaUAKEnabled and _G.MasaUltimateAntiKick then
				pcall(_G.MasaUltimateAntiKick.clear);
			end;
			S(_G.MasaUAKEnabled);
			saveMasaConfig();
		end);
		S(_G.MasaUAKEnabled == true);
		local U = Instance.new("TextButton");
		U.Name = "KickWarningArrow";
		U.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		U.BackgroundTransparency = .18;
		U.BorderSizePixel = 0;
		U.Size = UDim2.new(0, 28, 0, 24);
		U.Position = UDim2.new(1, -90, .5, -12);
		U.Text = "\226\150\178";
		U.TextColor3 = HF.white;
		U.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		U.TextStrokeTransparency = .3;
		U.TextSize = 15;
		U.Font = Enum.Font.GothamBold;
		U.AutoButtonColor = false;
		U.ZIndex = 8;
		U.Parent = u;
		corner(U, 7);
		stroke(U, HF.strokeSoft, 1, .45);
		local I = false;
		U.Activated:Connect(function()
			I = not I;
			_G._MasaExpand(a, I, 38, U);
		end);
		local X = u and u:FindFirstChild("ToggleButton");
		if X then
			X.Activated:Connect(function()
				_G._MasaKickWarn.enabled = not _G._MasaKickWarn.enabled;
				if not _G._MasaKickWarn.enabled then
					if _G.MasaDestroyKickWarning then
						_G.MasaDestroyKickWarning();
					end;
				else
					local g = e.Character;
					local u = g and g:FindFirstChildOfClass("Humanoid");
					_G._MasaKickWarn.wasLow = (u ~= nil) and (u.WalkSpeed < 25) or false;
				end;
				if B then
					B(_G._MasaKickWarn.enabled);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "High Ping Warning", y, 8);
		Z.setHighPingWarningVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				y = not y;
				if not y then
					local g = m:FindFirstChild("MasaHubPingWarning");
					if g then
						pcall(function()
							g:Destroy();
						end);
					end;
					_G._MasaHPWNextAllowed = 0;
				end;
				if B then
					B(y);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	section(g, "ANIMATION PACKS", 10);
	do
		local u = {
				"NONE",
				"1",
				"2",
				"3",
				"4",
				"5",
				"CUS\nTOM",
			};
		local B = #u;
		local a = Instance.new("Frame");
		a.Name = "Animation Pack Selector";
		a.BackgroundColor3 = HF.row;
		a.BackgroundTransparency = .28;
		a.Size = UDim2.new(1, -4, 0, 42);
		a.BorderSizePixel = 0;
		a.LayoutOrder = 10;
		a.ZIndex = 4;
		a.ClipsDescendants = true;
		a.Parent = g;
		corner(a, 14);
		stroke(a, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(a, nil, "soft");
		local H = Instance.new("Frame");
		H.Name = "AnimSlide";
		H.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		H.BackgroundTransparency = .1;
		H.AnchorPoint = Vector2.new(.5, .5);
		H.Size = UDim2.new(1 / B, -4, 1, -8);
		H.Position = UDim2.new(.5 / B, 0, .5, 0);
		H.BorderSizePixel = 0;
		H.ZIndex = 5;
		H.Parent = a;
		corner(H, 13);
		local i = Instance.new("UIStroke");
		i.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		i.Color = Color3.fromRGB(255, 170, 210);
		i.Thickness = 1.5;
		i.Transparency = .1;
		i.Parent = H;
		local R = Instance.new("UIGradient");
		R.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		R.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
		R.Parent = H;
		_G._MasaRegAccent(H, R, "slide");
		R.Rotation = 22;
		local O = {};
		local c = 1 / B;
		for g, u in ipairs(u) do
			local B = Instance.new("TextLabel");
			B.Name = "AnimPackLabel_" .. tostring(g);
			B.BackgroundTransparency = 1;
			B.Text = u;
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .2;
			B.TextSize = 10;
			B.Font = Enum.Font.GothamBlack;
			B.TextXAlignment = Enum.TextXAlignment.Center;
			B.TextYAlignment = Enum.TextYAlignment.Center;
			B.LineHeight = .92;
			B.AnchorPoint = Vector2.new(.5, .5);
			B.Size = UDim2.new(c, 0, 1, 0);
			B.Position = UDim2.new(c * ((g - .5)), 0, .5, 0);
			B.ZIndex = 8;
			B.Parent = a;
			O[g] = B;
			local H = Instance.new("TextButton");
			H.Name = "AnimPackClick_" .. tostring(g);
			H.BackgroundTransparency = 1;
			H.Text = "";
			H.AutoButtonColor = false;
			H.AnchorPoint = Vector2.new(.5, .5);
			H.Size = UDim2.new(c, 0, 1, 0);
			H.Position = UDim2.new(c * ((g - .5)), 0, .5, 0);
			H.ZIndex = 10;
			H.Parent = a;
			local i = g;
			H.MouseButton1Click:Connect(function()
				if _G.MasaSetAnimPack then
					_G.MasaSetAnimPack(i);
				end;
			end);
		end;
		local function h(g)
			g = math.clamp(tonumber(g) or 1, 1, B);
			local u = 1 / B;
			local a = cl or 1;
			local i = math.abs(g - a);
			local R = (i <= 1) and .18 or math.clamp(.08 * i + .1, .18, .42);
			tween(H, { Position = UDim2.new(u * ((g - .5)), 0, .5, 0), Size = UDim2.new(u, -4, 1, -8) }, R);
			for u, B in ipairs(O) do
				local a = (u == g);
				tween(B, { TextTransparency = a and 0 or .22, TextStrokeTransparency = a and .2 or .45 }, .14);
			end;
		end;
		Fl = h;
		h(cl or 1);
	end;
	((function()
		local u = _G.MasaCustomAnimSlots;
		local a = _G.MasaCustomAnimLabels;
		local H = baseRow(g, "Custom Animation Pack", 10);
		H.Size = UDim2.new(1, -4, 0, 42);
		H.ClipsDescendants = true;
		H.Visible = false;
		local i = Instance.new("Frame");
		i.Name = "CustomAnimBtnHolder";
		i.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		i.BackgroundTransparency = .28;
		i.BorderSizePixel = 0;
		i.Size = UDim2.new(0, 66, 0, 30);
		i.Position = UDim2.new(1, -73, .5, -15);
		i.ClipsDescendants = true;
		i.ZIndex = 6;
		i.Parent = H;
		corner(i, 15);
		stroke(i, Color3.fromRGB(255, 170, 210), 1.5, .15);
		local R = Instance.new("UIGradient");
		R.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		R.Rotation = 18;
		R.Parent = i;
		_G._MasaRegAccent(i, R, "pick");
		local O = Instance.new("TextButton");
		O.Name = "CustomAnimButton";
		O.BackgroundTransparency = 1;
		O.Text = "PICK";
		O.TextColor3 = HF.white;
		O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		O.TextStrokeTransparency = .3;
		O.TextSize = 12;
		O.Font = Enum.Font.GothamBlack;
		O.TextXAlignment = Enum.TextXAlignment.Center;
		O.Size = UDim2.new(1, 0, 1, 0);
		O.Position = UDim2.new(0, 0, 0, 0);
		O.BorderSizePixel = 0;
		O.ZIndex = 8;
		O.AutoButtonColor = false;
		O.Parent = i;
		O.MouseEnter:Connect(function()
			tween(i, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
		end);
		O.MouseLeave:Connect(function()
			tween(i, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
		end);
		local function c()
 
		end;
		_G.MasaCustomAnimRefreshRow = c;
		_G.MasaCustomAnimSetRowVisible = function(g, u)
				g = g and true or false;
				if u == false then
					H.Visible = g;
					H.Size = UDim2.new(1, -4, 0, g and 42 or 0);
					return;
				end;
				if g then
					if H.Visible and H.Size.Y.Offset >= 42 then
						return;
					end;
					H.Visible = true;
					H.Size = UDim2.new(1, -4, 0, 0);
					tween(H, { Size = UDim2.new(1, -4, 0, 42) }, .22);
				else
					if not H.Visible then
						return;
					end;
					tween(H, { Size = UDim2.new(1, -4, 0, 0) }, .18);
					task.delay(.19, function()
						if H.Parent and H.Size.Y.Offset <= 1 then
							H.Visible = false;
						end;
					end);
				end;
			end;
		_G.MasaCustomAnimSetRowVisible(cl == 7, false);
		local h = nil;
		local Q = {};
		local e = 0;
		local function P()
			if h and h.Parent then
				local g = h:FindFirstChild("Frame");
				if g then
					(B:Create(g, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
				end;
				local u = h;
				h = nil;
				Q = {};
				e = tick();
				task.delay(.25, function()
					pcall(function()
						u:Destroy();
					end);
				end);
			end;
		end;
		_G.MasaCustomAnimClose = P;
		local function Z(g)
			local u = Q[g];
			if not u then
				return;
			end;
			local B = _G.MasaCustomAnimIds[g] or "";
			if B ~= "" then
				u.mark.Text = "\226\156\147";
				u.mark.TextSize = 18;
				u.mark.TextColor3 = Color3.fromRGB(120, 220, 150);
				u.sub.Text = B;
				u.sub.TextSize = 9;
				u.sub.TextColor3 = Color3.fromRGB(120, 220, 150);
				u.stroke.Color = Color3.fromRGB(120, 220, 150);
				u.stroke.Thickness = 1.5;
				u.stroke.Transparency = .12;
				u.clear.Visible = true;
			else
				u.mark.Text = "+";
				u.mark.TextSize = 24;
				u.mark.TextColor3 = Color3.fromRGB(200, 200, 215);
				u.sub.Text = "ADD";
				u.sub.TextSize = 10;
				u.sub.TextColor3 = Color3.fromRGB(140, 140, 155);
				u.stroke.Color = Color3.fromRGB(50, 50, 58);
				u.stroke.Thickness = 1;
				u.stroke.Transparency = .5;
				u.clear.Visible = false;
			end;
			c();
		end;
		local function F(g)
			if not h or not h.Parent then
				return;
			end;
			local u = h:FindFirstChild("Frame");
			if not u then
				return;
			end;
			local H = Instance.new("Frame");
			H.Name = "AddAnimMiniOverlay";
			H.Size = UDim2.new(1, 0, 1, 0);
			H.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			H.BackgroundTransparency = .48;
			H.BorderSizePixel = 0;
			H.ZIndex = 100;
			H.Parent = u;
			local i = Instance.new("UICorner");
			i.CornerRadius = UDim.new(0, 16);
			i.Parent = H;
			local R = Instance.new("TextButton");
			R.Size = UDim2.new(1, 0, 1, 0);
			R.BackgroundTransparency = 1;
			R.Text = "";
			R.AutoButtonColor = false;
			R.ZIndex = 100;
			R.Parent = H;
			R.MouseButton1Click:Connect(function()
				H:Destroy();
			end);
			local O = Instance.new("Frame");
			O.Name = "AddAnimPanel";
			O.AnchorPoint = Vector2.new(.5, .5);
			O.Position = UDim2.new(.5, 0, .5, 0);
			O.Size = UDim2.new(0, 300, 0, 158);
			O.BackgroundColor3 = Color3.fromRGB(6, 6, 9);
			O.BorderSizePixel = 0;
			O.ZIndex = 101;
			O.ClipsDescendants = true;
			O.Parent = H;
			corner(O, 16);
			stroke(O, HF.stroke, 1.1, .3);
			local c = Instance.new("Frame");
			c.Size = UDim2.new(1, 0, 0, 42);
			c.BackgroundColor3 = Color3.fromRGB(10, 10, 14);
			c.BackgroundTransparency = .1;
			c.BorderSizePixel = 0;
			c.ZIndex = 102;
			c.Parent = O;
			corner(c, 16);
			local Q = Instance.new("TextLabel");
			Q.Size = UDim2.new(1, -52, 1, 0);
			Q.Position = UDim2.new(0, 14, 0, 0);
			Q.BackgroundTransparency = 1;
			Q.Text = "ASSET ID  \226\128\148  " .. ((a[g] or g));
			Q.TextColor3 = HF.white;
			Q.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			Q.TextStrokeTransparency = .3;
			Q.Font = Enum.Font.GothamBlack;
			Q.TextSize = 13;
			Q.TextXAlignment = Enum.TextXAlignment.Left;
			Q.ZIndex = 103;
			Q.Parent = c;
			local e = Instance.new("TextButton");
			e.Size = UDim2.new(0, 28, 0, 28);
			e.Position = UDim2.new(1, -36, .5, -14);
			e.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			e.BackgroundTransparency = .28;
			e.BorderSizePixel = 0;
			e.Text = "-";
			e.TextColor3 = HF.white;
			e.TextSize = 18;
			e.Font = Enum.Font.GothamSemibold;
			e.AutoButtonColor = false;
			e.ZIndex = 104;
			e.Parent = c;
			corner(e, 8);
			stroke(e, HF.stroke, 1, .35);
			e.MouseButton1Click:Connect(function()
				H:Destroy();
			end);
			local P = Instance.new("Frame");
			P.Size = UDim2.new(1, -28, 0, 1);
			P.Position = UDim2.new(0, 14, 0, 42);
			P.BackgroundColor3 = Color3.fromRGB(70, 70, 82);
			P.BackgroundTransparency = .45;
			P.BorderSizePixel = 0;
			P.ZIndex = 102;
			P.Parent = O;
			local m = Instance.new("Frame");
			m.Size = UDim2.new(1, -24, 0, 36);
			m.Position = UDim2.new(0, 12, 0, 52);
			m.BackgroundColor3 = HF.row2;
			m.BackgroundTransparency = .1;
			m.BorderSizePixel = 0;
			m.ZIndex = 102;
			m.Parent = O;
			corner(m, 9);
			stroke(m, HF.strokeSoft, 1, .38);
			local F = Instance.new("TextBox");
			F.Name = "AssetInput";
			F.Size = UDim2.new(1, -16, 1, 0);
			F.Position = UDim2.new(0, 8, 0, 0);
			F.BackgroundTransparency = 1;
			F.BorderSizePixel = 0;
			F.PlaceholderText = "Insert The Asset ID";
			F.PlaceholderColor3 = Color3.fromRGB(80, 80, 92);
			F.Text = _G.MasaCustomAnimIds[g] or "";
			F.TextColor3 = HF.white;
			F.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			F.TextStrokeTransparency = .4;
			F.Font = Enum.Font.GothamSemibold;
			F.TextSize = 12;
			F.ClearTextOnFocus = false;
			F.ZIndex = 103;
			F.Parent = m;
			local S = Instance.new("TextLabel");
			S.Size = UDim2.new(1, -24, 0, 14);
			S.Position = UDim2.new(0, 12, 0, 94);
			S.BackgroundTransparency = 1;
			S.Text = "";
			S.TextColor3 = Color3.fromRGB(255, 75, 75);
			S.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			S.TextStrokeTransparency = .4;
			S.Font = Enum.Font.GothamSemibold;
			S.TextSize = 10;
			S.TextXAlignment = Enum.TextXAlignment.Left;
			S.ZIndex = 102;
			S.Parent = O;
			local r = Instance.new("Frame");
			r.Size = UDim2.new(1, -24, 0, 32);
			r.Position = UDim2.new(0, 12, 0, 114);
			r.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			r.BackgroundTransparency = .28;
			r.BorderSizePixel = 0;
			r.ZIndex = 102;
			r.Parent = O;
			corner(r, 9);
			stroke(r, Color3.fromRGB(235, 235, 245), 1, .28);
			local U = Instance.new("TextButton");
			U.Size = UDim2.new(1, 0, 1, 0);
			U.BackgroundTransparency = 1;
			U.BorderSizePixel = 0;
			U.Text = "CONFIRM";
			U.TextColor3 = HF.white;
			U.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			U.TextStrokeTransparency = .22;
			U.Font = Enum.Font.GothamBlack;
			U.TextSize = 11;
			U.AutoButtonColor = false;
			U.ZIndex = 103;
			U.Parent = r;
			U.MouseEnter:Connect(function()
				(B:Create(r, TweenInfo.new(.12), { BackgroundTransparency = .1 })):Play();
			end);
			U.MouseLeave:Connect(function()
				(B:Create(r, TweenInfo.new(.12), { BackgroundTransparency = .28 })):Play();
			end);
			local I = false;
			local function X()
				if I then
					return;
				end;
				local u = F.Text:match("^%s*(.-)%s*$");
				if u == "" then
					S.Text = "Invalid Asset Please Try Again";
					return;
				end;
				local a = u:match("^(%d+)$") or u:match("rbxassetid://(%d+)$");
				if not a then
					S.Text = "Invalid Asset Please Try Again";
					return;
				end;
				I = true;
				S.Text = "";
				U.Text = "CHECKING...";
				(B:Create(r, TweenInfo.new(.12), { BackgroundTransparency = .55 })):Play();
				task.spawn(function()
					local u = "rbxassetid://" .. a;
					local i = false;
					pcall(function()
						local g = game:GetObjects(u);
						if g then
							for g, u in pairs(g) do
								if u:IsA("Animation") then
									i = true;
									return;
								end;
								local B = u:FindFirstChildWhichIsA("Animation", true);
								if B then
									i = true;
									return;
								end;
							end;
						end;
					end);
					if not i then
						local g = Instance.new("ImageLabel");
						g.Image = u;
						g.Parent = H;
						local B = tick() + 4;
						repeat
							task.wait(.05);
						until g.IsLoaded or tick() > B;
						i = g.IsLoaded;
						g:Destroy();
					end;
					if not H or not H.Parent then
						return;
					end;
					if i then
						_G.MasaCustomAnimIds[g] = a;
						Z(g);
						saveMasaConfig();
						if _G.MasaReloadCustomAnimPack then
							pcall(_G.MasaReloadCustomAnimPack);
						end;
						H:Destroy();
					else
						I = false;
						S.Text = "Invalid Asset Please Try Again";
						U.Text = "CONFIRM";
						(B:Create(r, TweenInfo.new(.12), { BackgroundTransparency = .28 })):Play();
					end;
				end);
			end;
			U.MouseButton1Click:Connect(X);
			F.FocusLost:Connect(function(g)
				if g then
					X();
				end;
			end);
			task.delay(.05, function()
				if F and F.Parent then
					F:CaptureFocus();
				end;
			end);
		end;
		O.Activated:Connect(function()
			if h and h.Parent then
				P();
				return;
			end;
			if tick() - e < .25 then
				return;
			end;
			h = Instance.new("ScreenGui");
			h.Name = "MasaHubCustomAnimPicker";
			h.ResetOnSpawn = false;
			h.IgnoreGuiInset = true;
			h.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			h.DisplayOrder = 9999;
			h.Parent = m;
			local g = Instance.new("Frame");
			g.Name = "Backdrop";
			g.Size = UDim2.new(1, 0, 1, 0);
			g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			g.BackgroundTransparency = .5;
			g.BorderSizePixel = 0;
			g.ZIndex = 1;
			g.Parent = h;
			g.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					P();
				end;
			end);
			local H = Instance.new("Frame");
			H.Name = "Frame";
			H.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
			H.BorderSizePixel = 0;
			H.ZIndex = 2;
			H.Parent = h;
			corner(H, 16);
			stroke(H, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local i = Instance.new("Frame");
			i.Size = UDim2.new(1, 0, 0, 48);
			i.BackgroundColor3 = Color3.fromRGB(12, 12, 15);
			i.BackgroundTransparency = .15;
			i.BorderSizePixel = 0;
			i.ZIndex = 3;
			i.Parent = H;
			corner(i, 16);
			local R = Instance.new("TextLabel");
			R.BackgroundTransparency = 1;
			R.Text = "CUSTOM ANIMATION PACK";
			R.TextColor3 = Color3.fromRGB(255, 255, 255);
			R.Font = Enum.Font.GothamBlack;
			R.TextSize = 16;
			R.TextXAlignment = Enum.TextXAlignment.Left;
			R.Size = UDim2.new(1, -60, 1, 0);
			R.Position = UDim2.new(0, 18, 0, 0);
			R.ZIndex = 4;
			R.Parent = i;
			local O = Instance.new("TextButton");
			O.Name = "CloseBtn";
			O.Size = UDim2.new(0, 36, 0, 36);
			O.Position = UDim2.new(1, -44, 0, 6);
			O.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			O.BackgroundTransparency = .1;
			O.BorderSizePixel = 0;
			O.Text = "X";
			O.TextColor3 = Color3.fromRGB(255, 255, 255);
			O.Font = Enum.Font.GothamBlack;
			O.TextSize = 14;
			O.AutoButtonColor = false;
			O.ZIndex = 4;
			O.Parent = i;
			corner(O, 10);
			stroke(O, Color3.fromRGB(90, 90, 105), 1, .4);
			O.MouseEnter:Connect(function()
				(B:Create(O, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(180, 50, 50) })):Play();
			end);
			O.MouseLeave:Connect(function()
				(B:Create(O, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(25, 25, 28) })):Play();
			end);
			O.Activated:Connect(P);
			local c = Instance.new("ScrollingFrame");
			c.Name = "Scroll";
			c.Size = UDim2.new(1, -16, 1, -64);
			c.Position = UDim2.new(0, 8, 0, 56);
			c.BackgroundTransparency = 1;
			c.BorderSizePixel = 0;
			c.ScrollBarThickness = 4;
			c.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90);
			c.CanvasSize = UDim2.new(0, 0, 0, 0);
			c.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			c.ZIndex = 3;
			c.Parent = H;
			local S = Instance.new("UIGridLayout");
			S.CellSize = UDim2.new(0, 165, 0, 76);
			S.CellPadding = UDim2.new(0, 8, 0, 8);
			S.FillDirection = Enum.FillDirection.Horizontal;
			S.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			S.SortOrder = Enum.SortOrder.LayoutOrder;
			S.Parent = c;
			local r = Instance.new("UIPadding", c);
			r.PaddingLeft = UDim.new(0, 8);
			r.PaddingTop = UDim.new(0, 8);
			r.PaddingRight = UDim.new(0, 8);
			r.PaddingBottom = UDim.new(0, 8);
			Q = {};
			for g, u in ipairs(u) do
				local H = Instance.new("TextButton");
				H.Name = u;
				H.BackgroundColor3 = Color3.fromRGB(14, 14, 18);
				H.BorderSizePixel = 0;
				H.Text = "";
				H.AutoButtonColor = false;
				H.LayoutOrder = g;
				H.ZIndex = 3;
				H.Parent = c;
				corner(H, 12);
				local i = stroke(H, Color3.fromRGB(50, 50, 58), 1, .5);
				local R = Instance.new("TextLabel");
				R.BackgroundTransparency = 1;
				R.Text = a[u] or u;
				R.TextColor3 = HF.white;
				R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				R.TextStrokeTransparency = .3;
				R.Font = Enum.Font.GothamBlack;
				R.TextSize = 11;
				R.TextXAlignment = Enum.TextXAlignment.Left;
				R.Size = UDim2.new(1, -20, 0, 16);
				R.Position = UDim2.new(0, 12, 0, 8);
				R.ZIndex = 5;
				R.Parent = H;
				local O = Instance.new("TextLabel");
				O.BackgroundTransparency = 1;
				O.Font = Enum.Font.GothamBlack;
				O.TextXAlignment = Enum.TextXAlignment.Center;
				O.Size = UDim2.new(0, 30, 0, 30);
				O.Position = UDim2.new(0, 10, 0, 30);
				O.ZIndex = 5;
				O.Parent = H;
				local h = Instance.new("TextLabel");
				h.BackgroundTransparency = 1;
				h.Font = Enum.Font.GothamSemibold;
				h.TextXAlignment = Enum.TextXAlignment.Left;
				h.TextTruncate = Enum.TextTruncate.AtEnd;
				h.Size = UDim2.new(1, -78, 0, 30);
				h.Position = UDim2.new(0, 42, 0, 30);
				h.ZIndex = 5;
				h.Parent = H;
				local e = Instance.new("TextButton");
				e.Name = "Clear";
				e.Size = UDim2.new(0, 22, 0, 22);
				e.Position = UDim2.new(1, -26, 0, 5);
				e.BackgroundTransparency = 1;
				e.BorderSizePixel = 0;
				e.Text = "X";
				e.TextColor3 = Color3.fromRGB(255, 55, 55);
				e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				e.TextStrokeTransparency = 0;
				e.Font = Enum.Font.GothamBlack;
				e.TextSize = 14;
				e.AutoButtonColor = false;
				e.Visible = false;
				e.ZIndex = 9;
				e.Parent = H;
				e.MouseEnter:Connect(function()
					(B:Create(e, TweenInfo.new(.1), { TextColor3 = Color3.fromRGB(255, 110, 110) })):Play();
				end);
				e.MouseLeave:Connect(function()
					(B:Create(e, TweenInfo.new(.1), { TextColor3 = Color3.fromRGB(255, 55, 55) })):Play();
				end);
				e.MouseButton1Click:Connect(function()
					_G.MasaCustomAnimIds[u] = "";
					Z(u);
					saveMasaConfig();
					if _G.MasaReloadCustomAnimPack then
						pcall(_G.MasaReloadCustomAnimPack);
					end;
				end);
				H.MouseEnter:Connect(function()
					tween(H, { BackgroundColor3 = Color3.fromRGB(22, 22, 28) }, .12);
				end);
				H.MouseLeave:Connect(function()
					tween(H, { BackgroundColor3 = Color3.fromRGB(14, 14, 18) }, .12);
				end);
				H.Activated:Connect(function()
					F(u);
				end);
				Q[u] = {
						mark = O,
						sub = h,
						stroke = i,
						clear = e,
					};
				Z(u);
			end;
			H.Size = UDim2.new(0, 0, 0, 0);
			H.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(H, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 380, 0, 336), Position = UDim2.new(.5, -190, .5, -168) })):Play();
		end);
	end))();
	section(g, "AVATAR", 11);
	do
		_G._MasaAvatarChanger = {
				Hair = { enabled = false, savedId = nil, savedName = "" },
				Hats = { enabled = false, savedId = nil, savedName = "" },
				Face = { enabled = false, savedId = nil, savedName = "" },
				Neck = { enabled = false, savedId = nil, savedName = "" },
				Shoulder = { enabled = false, savedId = nil, savedName = "" },
				Front = { enabled = false, savedId = nil, savedName = "" },
				Back = { enabled = false, savedId = nil, savedName = "" },
				Waist = { enabled = false, savedId = nil, savedName = "" },
				Shirts = { enabled = false, savedId = nil, savedName = "" },
				Pants = { enabled = false, savedId = nil, savedName = "" },
				["T-Shirts"] = { enabled = false, savedId = nil, savedName = "" },
				Jackets = { enabled = false, savedId = nil, savedName = "" },
				Sweaters = { enabled = false, savedId = nil, savedName = "" },
				Bottoms = { enabled = false, savedId = nil, savedName = "" },
			};
		if type(_G._MasaAvatarChangerPending) == "table" then
			for g, u in pairs(_G._MasaAvatarChangerPending) do
				if _G._MasaAvatarChanger[g] then
					_G._MasaAvatarChanger[g].enabled = u.enabled == true;
					_G._MasaAvatarChanger[g].savedId = tonumber(u.savedId);
					_G._MasaAvatarChanger[g].savedName = tostring(u.savedName or "");
				end;
			end;
			_G._MasaAvatarChangerPending = nil;
		end;
		local u = {
				{ Name = "Hair", AssetTypes = { Enum.AvatarAssetType.HairAccessory } },
				{ Name = "Hats", AssetTypes = { Enum.AvatarAssetType.Hat } },
				{ Name = "Face", AssetTypes = { Enum.AvatarAssetType.FaceAccessory } },
				{ Name = "Neck", AssetTypes = { Enum.AvatarAssetType.NeckAccessory } },
				{ Name = "Shoulder", AssetTypes = { Enum.AvatarAssetType.ShoulderAccessory } },
				{ Name = "Front", AssetTypes = { Enum.AvatarAssetType.FrontAccessory } },
				{ Name = "Back", AssetTypes = { Enum.AvatarAssetType.BackAccessory } },
				{ Name = "Waist", AssetTypes = { Enum.AvatarAssetType.WaistAccessory } },
				{ Name = "Shirts", AssetTypes = { Enum.AvatarAssetType.Shirt } },
				{ Name = "Pants", AssetTypes = { Enum.AvatarAssetType.Pants } },
				{ Name = "T-Shirts", AssetTypes = { Enum.AvatarAssetType.TShirt } },
				{ Name = "Jackets", AssetTypes = { Enum.AvatarAssetType.JacketAccessory } },
				{ Name = "Sweaters", AssetTypes = { Enum.AvatarAssetType.SweaterAccessory } },
				{ Name = "Bottoms", AssetTypes = { Enum.AvatarAssetType.ShortsAccessory } },
			};
		local a = 0;
		local H = {};
		local i = _G._MasaWaitCharReady;
		local function R(g, u, B, R)
			if not g then
				return false;
			end;
			if R == nil then
				R = a;
			end;
			local O, c = pcall(function()
					local O;
					local c = H[g];
					if c then
						O = { c:Clone() };
					else
						O = game:GetObjects("rbxassetid://" .. tostring(g));
						if O and O[1] then
							H[g] = O[1]:Clone();
						end;
					end;
					if R ~= a then
						return false;
					end;
					local h = e.Character;
					if not h or not h.Parent then
						return false;
					end;
					if not i(h, 5) then
						return false;
					end;
					if R ~= a then
						return false;
					end;
					if not O or #O == 0 then
						return false;
					end;
					local Q = O[1];
					if Q:IsA("Folder") or Q:IsA("Model") then
						local g = Q:FindFirstChildOfClass("Accessory") or Q:FindFirstChildOfClass("Shirt") or Q:FindFirstChildOfClass("Pants") or Q:FindFirstChildOfClass("ShirtGraphic");
						if g then
							Q = g;
						end;
					end;
					if Q:IsA("Shirt") then
						for g, u in pairs(h:GetChildren()) do
							if u:IsA("Shirt") then
								u:Destroy();
							end;
						end;
						Q.Name = "ACShirt";
						Q.Parent = h;
						return true;
					elseif Q:IsA("Pants") then
						for g, u in pairs(h:GetChildren()) do
							if u:IsA("Pants") then
								u:Destroy();
							end;
						end;
						Q.Name = "ACPants";
						Q.Parent = h;
						return true;
					elseif Q:IsA("ShirtGraphic") then
						for g, u in pairs(h:GetChildren()) do
							if u:IsA("ShirtGraphic") then
								u:Destroy();
							end;
						end;
						Q.Name = "ACTShirt";
						Q.Parent = h;
						return true;
					end;
					if Q:IsA("Accessory") then
						local g = Q:FindFirstChild("Handle");
						if g then
							if u == Enum.AvatarAssetType.HairAccessory then
								for g, u in pairs(h:GetChildren()) do
									if u:IsA("Accessory") and (((u.Name:lower()):find("hair") or (u:FindFirstChild("Handle") and u.Handle:FindFirstChild("HairAttachment")))) then
										u:Destroy();
									end;
								end;
							else
								for g, u in pairs(h:GetChildren()) do
									if u:IsA("Accessory") and ((u.Name == B or u.Name == "AC" .. B)) then
										u:Destroy();
									end;
								end;
							end;
							local a = g:FindFirstChildOfClass("Attachment");
							local H = h:FindFirstChild("Head");
							local i = nil;
							if a then
								for g, u in pairs(h:GetChildren()) do
									if u:IsA("BasePart") then
										i = u:FindFirstChild(a.Name);
										if i then
											H = u;
											break;
										end;
									end;
								end;
							end;
							if not H then
								H = h:FindFirstChild("HumanoidRootPart");
							end;
							if not H then
								return false;
							end;
							Q.Name = "AC" .. B;
							Q.Parent = h;
							g.CFrame = H.CFrame;
							for g, u in pairs(g:GetChildren()) do
								if u:IsA("Weld") or u:IsA("ManualWeld") or u:IsA("WeldConstraint") then
									u:Destroy();
								end;
							end;
							local R = Instance.new("Weld");
							R.Name = "ACManualWeld";
							R.Part0 = g;
							R.Part1 = H;
							if a and i then
								R.C0 = a.CFrame;
								R.C1 = i.CFrame;
							else
								R.C0 = CFrame.new(0, .5, 0);
							end;
							R.Parent = g;
							return true;
						end;
					end;
					return false;
				end);
			return O and c == true;
		end;
		local function O(g, u)
			local B = e.Character;
			if not B then
				return;
			end;
			pcall(function()
				if g == Enum.AvatarAssetType.Shirt then
					for g, B in pairs(B:GetChildren()) do
						if B:IsA("Shirt") and ((B.Name == "ACShirt" or B.Name == u)) then
							B:Destroy();
						end;
					end;
				elseif g == Enum.AvatarAssetType.Pants then
					for g, B in pairs(B:GetChildren()) do
						if B:IsA("Pants") and ((B.Name == "ACPants" or B.Name == u)) then
							B:Destroy();
						end;
					end;
				elseif g == Enum.AvatarAssetType.TShirt then
					for g, B in pairs(B:GetChildren()) do
						if B:IsA("ShirtGraphic") and ((B.Name == "ACTShirt" or B.Name == u)) then
							B:Destroy();
						end;
					end;
				else
					for g, B in pairs(B:GetChildren()) do
						if B:IsA("Accessory") and ((B.Name == "AC" .. u or B.Name == u)) then
							B:Destroy();
						end;
					end;
				end;
			end);
		end;
		local function c()
			pcall(saveMasaConfig);
		end;
		local function h(g)
			if g == nil then
				g = a;
			end;
			local B = e.Character;
			if not B then
				return;
			end;
			if not i(B, 10) then
				return;
			end;
			if g ~= a then
				return;
			end;
			for u, B in ipairs(u) do
				if g ~= a then
					return;
				end;
				local H = _G._MasaAvatarChanger[B.Name];
				if H and (H.enabled and H.savedId) then
					for u = 1, 3, 1 do
						if g ~= a then
							return;
						end;
						if R(H.savedId, B.AssetTypes[1], H.savedName, g) then
							break;
						end;
						task.wait(.25 * u);
					end;
					task.wait(.05);
				end;
			end;
		end;
		task.spawn(function()
			if not e.Character then
				return;
			end;
			h(a);
		end);
		e.CharacterAdded:Connect(function()
			a = a + 1;
			local g = a;
			task.spawn(function()
				h(g);
			end);
		end);
		((function()
			local g = {};
			local B = {};
			local H = {};
			local i = false;
			local O;
			local function c(g)
				if i then
					return;
				end;
				i = true;
				task.delay(g or .1, function()
					i = false;
					pcall(O);
				end);
			end;
			local function h(g, u)
				local B = g.AssetTypes[1];
				if B == Enum.AvatarAssetType.Shirt then
					return "ACShirt", "Shirt";
				elseif B == Enum.AvatarAssetType.Pants then
					return "ACPants", "Pants";
				elseif B == Enum.AvatarAssetType.TShirt then
					return "ACTShirt", "ShirtGraphic";
				end;
				return "AC" .. tostring(u.savedName or ""), "Accessory";
			end;
			local function Q(g, u, B)
				local a, H = h(u, B);
				for g, u in ipairs(g:GetChildren()) do
					if u:IsA(H) and ((u.Name == a or u.Name == B.savedName)) then
						return true;
					end;
				end;
				return false;
			end;
			function O()
				local H = e.Character;
				if not H or not H.Parent then
					return;
				end;
				local i = H:FindFirstChildOfClass("Humanoid");
				if i and i.Health <= 0 then
					return;
				end;
				local O = tick();
				for u, i in ipairs(u) do
					local c = _G._MasaAvatarChanger[i.Name];
					if c and (c.enabled and c.savedId) then
						if Q(H, i, c) then
							B[i.Name] = nil;
						else
							local u = B[i.Name] or 0;
							local H = math.min(.6 * (2 ^ math.min(u, 5)), 20);
							if (O - ((g[i.Name] or 0))) > H then
								g[i.Name] = O;
								local u = a;
								local H = i.Name;
								local h, Q, e = c.savedId, i.AssetTypes[1], c.savedName;
								task.spawn(function()
									if u ~= a then
										return;
									end;
									if R(h, Q, e, u) then
										B[H] = nil;
									else
										B[H] = ((B[H] or 0)) + 1;
									end;
								end);
							end;
						end;
					end;
				end;
			end;
			_G._MasaAvatarChangerRecheck = function()
					B = {};
					pcall(O);
				end;
			local function P(g)
				for g, u in ipairs(H) do
					pcall(function()
						u:Disconnect();
					end);
				end;
				H = {};
				if not g then
					return;
				end;
				table.insert(H, g.ChildRemoved:Connect(function(g)
					if g:IsA("Accessory") or g:IsA("Shirt") or g:IsA("Pants") or g:IsA("ShirtGraphic") then
						c(.05);
					end;
				end));
				local u = g:FindFirstChildOfClass("Humanoid");
				if u then
					table.insert(H, u.HealthChanged:Connect(function()
						c(.15);
					end));
				end;
			end;
			P(e.Character);
			e.CharacterAdded:Connect(function(g)
				task.delay(.6, function()
					P(g);
				end);
			end);
			task.spawn(function()
				while true do
					task.wait(1);
					pcall(O);
				end;
			end);
		end))();
		local Q = {};
		local P = nil;
		local Z = nil;
		local F = nil;
		local S = 0;
		local function r()
			if P and P.Parent then
				P:Destroy();
				F = Z;
				S = tick();
			end;
			P = nil;
			Z = nil;
		end;
		local function U(g, u)
			if P and (P.Parent and Z == g) then
				r();
				return;
			end;
			if F == g and (tick() - S) < .25 then
				F = nil;
				return;
			end;
			r();
			F = nil;
			Z = g;
			P = Instance.new("ScreenGui");
			P.Name = "MasaHubAVChanger";
			P.ResetOnSpawn = false;
			P.IgnoreGuiInset = true;
			P.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			P.DisplayOrder = 9998;
			P.Parent = m;
			local a = Instance.new("Frame");
			a.Name = "Backdrop";
			a.Size = UDim2.new(1, 0, 1, 0);
			a.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			a.BackgroundTransparency = .45;
			a.BorderSizePixel = 0;
			a.ZIndex = 1;
			a.Parent = P;
			local H = Instance.new("Frame");
			H.Name = "Frame";
			H.Size = UDim2.new(0, 370, 0, 510);
			H.Position = UDim2.new(.5, -185, .5, -255);
			H.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
			H.BorderSizePixel = 0;
			H.ZIndex = 2;
			H.Parent = P;
			corner(H, 16);
			stroke(H, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local i = Instance.new("Frame");
			i.Size = UDim2.new(1, 0, 0, 48);
			i.BackgroundColor3 = Color3.fromRGB(12, 12, 15);
			i.BackgroundTransparency = .15;
			i.BorderSizePixel = 0;
			i.ZIndex = 3;
			i.Parent = H;
			corner(i, 16);
			local h = Instance.new("TextLabel");
			h.Size = UDim2.new(1, -60, 1, 0);
			h.Position = UDim2.new(0, 18, 0, 0);
			h.BackgroundTransparency = 1;
			h.Text = g .. " Changer";
			h.TextColor3 = Color3.fromRGB(255, 255, 255);
			h.Font = Enum.Font.GothamBlack;
			h.TextSize = 15;
			h.TextXAlignment = Enum.TextXAlignment.Left;
			h.ZIndex = 4;
			h.Parent = i;
			local Q = Instance.new("TextButton");
			Q.Size = UDim2.new(0, 36, 0, 36);
			Q.Position = UDim2.new(1, -44, 0, 6);
			Q.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			Q.BackgroundTransparency = .1;
			Q.BorderSizePixel = 0;
			Q.Text = "X";
			Q.TextColor3 = Color3.fromRGB(255, 255, 255);
			Q.Font = Enum.Font.GothamBlack;
			Q.TextSize = 14;
			Q.AutoButtonColor = false;
			Q.ZIndex = 4;
			Q.Parent = i;
			corner(Q, 10);
			stroke(Q, Color3.fromRGB(90, 90, 105), 1, .4);
			Q.MouseEnter:Connect(function()
				tween(Q, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
			end);
			Q.MouseLeave:Connect(function()
				tween(Q, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
			end);
			Q.Activated:Connect(r);
			local e = Instance.new("TextBox");
			e.Size = UDim2.new(1, -24, 0, 30);
			e.Position = UDim2.new(0, 12, 0, 55);
			e.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
			e.BackgroundTransparency = .1;
			e.BorderSizePixel = 0;
			e.PlaceholderText = "Search...";
			e.PlaceholderColor3 = Color3.fromRGB(110, 110, 120);
			e.Text = "";
			e.TextColor3 = Color3.fromRGB(245, 245, 255);
			e.Font = Enum.Font.GothamSemibold;
			e.TextSize = 12;
			e.ClearTextOnFocus = false;
			e.ZIndex = 4;
			e.Parent = H;
			corner(e, 8);
			stroke(e, Color3.fromRGB(70, 70, 85), 1, .4);
			local U = Instance.new("TextLabel");
			U.Size = UDim2.new(1, -24, 0, 22);
			U.Position = UDim2.new(0, 12, 0, 92);
			U.BackgroundTransparency = 1;
			U.Text = "Loading...";
			U.TextColor3 = Color3.fromRGB(150, 150, 160);
			U.Font = Enum.Font.GothamSemibold;
			U.TextSize = 11;
			U.ZIndex = 4;
			U.Parent = H;
			local I = Instance.new("ScrollingFrame");
			I.Size = UDim2.new(1, -12, 1, -100);
			I.Position = UDim2.new(0, 6, 0, 96);
			I.BackgroundTransparency = 1;
			I.BorderSizePixel = 0;
			I.ScrollBarThickness = 4;
			I.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90);
			I.CanvasSize = UDim2.new(0, 0, 0, 0);
			I.AutomaticCanvasSize = Enum.AutomaticSize.Y;
			I.ZIndex = 3;
			I.Parent = H;
			local X = Instance.new("UIGridLayout");
			X.CellSize = UDim2.new(0, 100, 0, 120);
			X.CellPadding = UDim2.new(0, 8, 0, 8);
			X.FillDirection = Enum.FillDirection.Horizontal;
			X.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			X.SortOrder = Enum.SortOrder.LayoutOrder;
			X.Parent = I;
			local w = Instance.new("UIPadding");
			w.PaddingTop = UDim.new(0, 8);
			w.PaddingBottom = UDim.new(0, 8);
			w.PaddingLeft = UDim.new(0, 6);
			w.PaddingRight = UDim.new(0, 6);
			w.Parent = I;
			local k = 0;
			local t = nil;
			local V = false;
			local function E(B)
				k = k + 1;
				local a = Instance.new("TextButton");
				a.Name = "AC_Item_" .. tostring(B.Id);
				a.BackgroundColor3 = Color3.fromRGB(16, 16, 20);
				a.BackgroundTransparency = .05;
				a.BorderSizePixel = 0;
				a.Text = "";
				a.AutoButtonColor = false;
				a.LayoutOrder = k;
				a.ZIndex = 4;
				a.Parent = I;
				corner(a, 10);
				local H = Instance.new("UIStroke");
				H.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				H.Color = Color3.fromRGB(50, 50, 62);
				H.Thickness = 1;
				H.Transparency = .5;
				H.Parent = a;
				local i = Instance.new("ImageLabel");
				i.Size = UDim2.new(1, -8, 0, 72);
				i.Position = UDim2.new(0, 4, 0, 4);
				i.BackgroundColor3 = Color3.fromRGB(22, 22, 28);
				i.BorderSizePixel = 0;
				i.ZIndex = 5;
				i.Image = "rbxthumb://type=Asset&id=" .. (tostring(B.Id) .. "&w=150&h=150");
				i.ScaleType = Enum.ScaleType.Fit;
				i.Parent = a;
				corner(i, 7);
				local h = Instance.new("TextLabel");
				h.Size = UDim2.new(1, -6, 0, 30);
				h.Position = UDim2.new(0, 3, 0, 78);
				h.BackgroundTransparency = 1;
				h.Text = B.Name or "?";
				h.TextColor3 = Color3.fromRGB(225, 225, 235);
				h.Font = Enum.Font.GothamSemibold;
				h.TextSize = 9;
				h.TextWrapped = true;
				h.TextXAlignment = Enum.TextXAlignment.Center;
				h.TextYAlignment = Enum.TextYAlignment.Top;
				h.ZIndex = 5;
				h.Parent = a;
				a.MouseEnter:Connect(function()
					tween(a, { BackgroundColor3 = Color3.fromRGB(30, 30, 38) }, .1);
					tween(H, { Color = Color3.fromRGB(200, 200, 210), Transparency = .15 }, .1);
				end);
				a.MouseLeave:Connect(function()
					local u = _G._MasaAvatarChanger[g];
					local i = u and u.savedId == B.Id;
					tween(a, { BackgroundColor3 = i and Color3.fromRGB(20, 36, 20) or Color3.fromRGB(16, 16, 20) }, .1);
					tween(H, { Color = i and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(50, 50, 62), Transparency = i and .15 or .5 }, .1);
				end);
				local Q = _G._MasaAvatarChanger[g];
				if Q and Q.savedId == B.Id then
					a.BackgroundColor3 = Color3.fromRGB(20, 36, 20);
					H.Color = Color3.fromRGB(120, 220, 120);
					H.Transparency = .15;
				end;
				a.Activated:Connect(function()
					local a = _G._MasaAvatarChanger[g];
					if not a then
						return;
					end;
					if a.enabled and (a.savedId and a.savedName ~= "") then
						O(u[1], a.savedName);
					end;
					a.savedId = B.Id;
					a.savedName = B.Name or "";
					if a.enabled then
						local g, a, H = B.Id, u[1], B.Name or "";
						task.spawn(function()
							R(g, a, H);
						end);
					end;
					c();
					for g, u in ipairs(I:GetChildren()) do
						if u:IsA("TextButton") then
							local g = u:FindFirstChildOfClass("UIStroke");
							local a = (u.Name == "AC_Item_" .. tostring(B.Id));
							tween(u, { BackgroundColor3 = a and Color3.fromRGB(20, 36, 20) or Color3.fromRGB(16, 16, 20) }, .14);
							if g then
								tween(g, { Color = a and Color3.fromRGB(120, 220, 120) or Color3.fromRGB(50, 50, 62), Transparency = a and .15 or .5 }, .14);
							end;
						end;
					end;
				end);
			end;
			local function N(g)
				for g, u in ipairs(I:GetChildren()) do
					if u:IsA("TextButton") then
						u:Destroy();
					end;
				end;
				k = 0;
				t = nil;
				V = false;
				U.Text = "Loading...";
				U.Visible = true;
				task.spawn(function()
					local B, a = pcall(function()
							local B = CatalogSearchParams.new();
							B.AssetTypes = u;
							if g and g ~= "" then
								B.SearchKeyword = g;
							end;
							return (game:GetService("AvatarEditorService")):SearchCatalog(B);
						end);
					if not B or not a then
						U.Text = "Error loading.";
						return;
					end;
					t = a;
					local H = a:GetCurrentPage();
					U.Visible = #H == 0;
					U.Text = #H == 0 and "No results." or "";
					for g, u in ipairs(H) do
						E(u);
					end;
				end);
			end;
			(I:GetPropertyChangedSignal("CanvasPosition")):Connect(function()
				if V or not t then
					return;
				end;
				local g = I.CanvasPosition.Y;
				local u = I.CanvasSize.Y.Offset;
				local B = I.AbsoluteSize.Y;
				if u > 0 and (g + B >= u - 100 and not t.IsFinished) then
					V = true;
					task.spawn(function()
						local g = pcall(function()
								t:AdvanceToNextPageAsync();
							end);
						if g then
							for g, u in ipairs(t:GetCurrentPage()) do
								E(u);
							end;
						end;
						V = false;
					end);
				end;
			end);
			local n = nil;
			(e:GetPropertyChangedSignal("Text")):Connect(function()
				if n then
					task.cancel(n);
				end;
				n = task.delay(.5, function()
						N(e.Text);
					end);
			end);
			a.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					r();
				end;
			end);
			H.Size = UDim2.new(0, 0, 0, 0);
			H.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(H, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 370, 0, 510), Position = UDim2.new(.5, -185, .5, -255) })):Play();
			N("");
		end;
		local I = baseRow(g, "Avatar Changer", 11.5);
		I.LayoutOrder = 11.5;
		local X = Instance.new("TextButton");
		X.Name = "AvatarChangerArrow";
		X.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		X.BackgroundTransparency = .18;
		X.BorderSizePixel = 0;
		X.Size = UDim2.new(0, 28, 0, 24);
		X.Position = UDim2.new(1, -38, .5, -12);
		X.Text = "\226\150\178";
		X.TextColor3 = HF.white;
		X.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		X.TextStrokeTransparency = .3;
		X.TextSize = 15;
		X.Font = Enum.Font.GothamBold;
		X.AutoButtonColor = false;
		X.ZIndex = 8;
		X.Parent = I;
		corner(X, 7);
		stroke(X, HF.strokeSoft, 1, .45);
		local w = Instance.new("Frame");
		w.Name = "AvatarChangerSubHolder";
		w.BackgroundTransparency = 1;
		w.BorderSizePixel = 0;
		w.Size = UDim2.new(1, -4, 0, 0);
		w.LayoutOrder = 11.6;
		w.ZIndex = 4;
		w.Visible = false;
		w.AutomaticSize = Enum.AutomaticSize.Y;
		w.Parent = g;
		local k = Instance.new("UIListLayout");
		k.Padding = UDim.new(0, 5);
		k.SortOrder = Enum.SortOrder.LayoutOrder;
		k.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		k.Parent = w;
		local t = Instance.new("UIPadding");
		t.PaddingTop = UDim.new(0, 2);
		t.PaddingBottom = UDim.new(0, 2);
		t.Parent = w;
		for g, u in ipairs(u) do
			local B = u.Name;
			local a = u.AssetTypes;
			local H = _G._MasaAvatarChanger[B];
			local i = Instance.new("Frame");
			i.Name = "AC_Sub_" .. B;
			i.BackgroundColor3 = HF.row;
			i.BackgroundTransparency = .3;
			i.Size = UDim2.new(1, -8, 0, 34);
			i.BorderSizePixel = 0;
			i.LayoutOrder = g;
			i.ZIndex = 4;
			i.Parent = w;
			corner(i, 9);
			local h = stroke(i, HF.strokeSoft, 1.15, .38);
			i.MouseEnter:Connect(function()
				tween(i, { BackgroundTransparency = .22 });
			end);
			i.MouseLeave:Connect(function()
				tween(i, { BackgroundTransparency = .3 });
			end);
			local e = Instance.new("TextLabel");
			e.BackgroundTransparency = 1;
			e.Text = B;
			e.TextColor3 = Color3.fromRGB(245, 245, 255);
			e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			e.TextStrokeTransparency = .25;
			e.TextSize = 12;
			e.Font = Enum.Font.GothamSemibold;
			e.TextXAlignment = Enum.TextXAlignment.Left;
			e.Position = UDim2.new(0, 12, 0, 0);
			e.Size = UDim2.new(1, -132, 1, 0);
			e.ZIndex = 5;
			e.Parent = i;
			local P = Instance.new("Frame");
			P.Name = "Track";
			P.BackgroundColor3 = HF.toggleBg;
			P.BackgroundTransparency = .12;
			P.Size = UDim2.new(0, 44, 0, 22);
			P.Position = UDim2.new(1, -52, .5, -11);
			P.BorderSizePixel = 0;
			P.ZIndex = 5;
			P.Parent = i;
			corner(P, 11);
			local m = stroke(P, HF.strokeSoft, 1.3, .4);
			local Z = Instance.new("Frame");
			Z.Name = "Fill";
			Z.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			Z.BackgroundTransparency = H.enabled and 0 or 1;
			Z.Size = UDim2.new(1, 0, 1, 0);
			Z.BorderSizePixel = 0;
			Z.ZIndex = 5;
			Z.Parent = P;
			corner(Z, 11);
			local F = Instance.new("UIGradient");
			F.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			F.Rotation = 18;
			F.Parent = Z;
			local S = Instance.new("Frame");
			S.Name = "Knob";
			S.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			S.Size = UDim2.new(0, 16, 0, 16);
			S.Position = H.enabled and UDim2.new(1, -19, .5, -8) or UDim2.new(0, 3, .5, -8);
			S.BorderSizePixel = 0;
			S.ZIndex = 7;
			S.Parent = P;
			corner(S, 999);
			local r = Instance.new("UIStroke");
			r.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			r.Color = H.enabled and Color3.fromRGB(255, 170, 210) or Color3.fromRGB(255, 192, 203);
			r.Thickness = 1.4;
			r.Transparency = .15;
			r.Parent = S;
			local I = Instance.new("Frame");
			I.BackgroundColor3 = HF.white;
			I.BackgroundTransparency = .55;
			I.Size = UDim2.new(1, -5, 0, 5);
			I.Position = UDim2.new(0, 2.5, 0, 2.5);
			I.BorderSizePixel = 0;
			I.ZIndex = 8;
			I.Parent = S;
			corner(I, 5);
			_G._MasaRegAccent(Z, F, "toggle", P, S, i);
			local function X(g)
				tween(S, { Position = g and UDim2.new(1, -19, .5, -8) or UDim2.new(0, 3, .5, -8) });
				local u, B = _G._MasaToggleOnColor();
				tween(P, { BackgroundTransparency = g and 0 or .12, BackgroundColor3 = g and u or HF.toggleBg });
				tween(Z, { BackgroundTransparency = g and 0 or 1 });
				tween(r, { Color = g and B or Color3.fromRGB(255, 192, 203) });
				tween(m, { Color = g and B or HF.strokeSoft, Transparency = g and 0 or .4, Thickness = 1.4 });
				tween(h, { Color = g and u or HF.strokeSoft, Transparency = g and .08 or .38, Thickness = 1.25 });
			end;
			Q[B] = X;
			X(H.enabled);
			local k = Instance.new("TextButton");
			k.Name = "ToggleButton";
			k.BackgroundTransparency = 1;
			k.Text = "";
			k.Size = UDim2.new(1, 0, 1, 0);
			k.Position = UDim2.new(0, 0, 0, 0);
			k.AutoButtonColor = false;
			k.ZIndex = 7;
			k.Parent = i;
			do
				local g = B;
				local u = a;
				k.Activated:Connect(function()
					local B = _G._MasaAvatarChanger[g];
					if not B then
						return;
					end;
					B.enabled = not B.enabled;
					X(B.enabled);
					if B.enabled and B.savedId then
						local g, a, H = B.savedId, u[1], B.savedName;
						task.spawn(function()
							R(g, a, H);
						end);
					else
						if B.savedId then
							O(u[1], B.savedName);
						end;
					end;
					c();
				end);
			end;
			local t = Instance.new("Frame");
			t.Name = "PickHolder";
			t.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			t.BackgroundTransparency = .28;
			t.BorderSizePixel = 0;
			t.Size = UDim2.new(0, 48, 0, 26);
			t.Position = UDim2.new(1, -118, .5, -13);
			t.ClipsDescendants = true;
			t.ZIndex = 8;
			t.Parent = i;
			corner(t, 13);
			stroke(t, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local V = Instance.new("UIGradient");
			V.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			V.Rotation = 18;
			V.Parent = t;
			_G._MasaRegAccent(t, V, "pick");
			local E = Instance.new("TextButton");
			E.Name = "PickBtn";
			E.BackgroundTransparency = 1;
			E.Text = "PICK";
			E.TextColor3 = HF.white;
			E.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			E.TextStrokeTransparency = .3;
			E.TextSize = 11;
			E.Font = Enum.Font.GothamBlack;
			E.TextXAlignment = Enum.TextXAlignment.Center;
			E.Size = UDim2.new(1, 0, 1, 0);
			E.Position = UDim2.new(0, 0, 0, 0);
			E.BorderSizePixel = 0;
			E.ZIndex = 9;
			E.AutoButtonColor = false;
			E.Parent = t;
			E.MouseEnter:Connect(function()
				tween(t, { Size = UDim2.new(0, 54, 0, 28), Position = UDim2.new(1, -121, .5, -14) }, .12);
			end);
			E.MouseLeave:Connect(function()
				tween(t, { Size = UDim2.new(0, 48, 0, 26), Position = UDim2.new(1, -118, .5, -13) }, .12);
			end);
			do
				local g = B;
				local u = a;
				E.Activated:Connect(function()
					U(g, u);
				end);
			end;
		end;
		local V = false;
		local function E(u)
			V = u;
			_G._MasaExpandAuto(w, u, k, X);
			_G._MasaClampCanvas(g);
		end;
		X.Activated:Connect(function()
			E(not V);
		end);
		_G._MasaAvatarChangerReset = function()
				for g, u in ipairs(u) do
					local B = _G._MasaAvatarChanger[u.Name];
					if B then
						if B.enabled and B.savedId then
							O(u.AssetTypes[1], B.savedName);
						end;
						B.enabled = false;
						B.savedId = nil;
						B.savedName = "";
						if Q[u.Name] then
							Q[u.Name](false);
						end;
					end;
				end;
				c();
			end;
	end;
	do
		local u, B = toggleRow(g, "Enable Headless", l, 12);
		Z.setHeadlessVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				if l then
					disableHeadless();
				else
					enableHeadless();
				end;
				if B then
					B(l);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Enable Korblox", M, 12);
		Z.setKorbloxVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				if M then
					disableKorblox();
				else
					enableKorblox();
				end;
				if B then
					B(M);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	section(g, "TOOLS", 12);
	do
		local u, H = toggleRow(g, "Custom Tools", _G.MasaCustomToolsEnabled == true, 12);
		Z.setCustomToolsVisual = H;
		local i = u and u:FindFirstChild("ToggleButton");
		if i then
			i.Activated:Connect(function()
				local g = not ((_G.MasaCustomToolsEnabled == true));
				if _G.MasaCustomTools then
					_G.MasaCustomTools.setEnabled(g);
				end;
				if H then
					H(g);
				end;
				saveMasaConfig();
			end);
		end;
		local R = baseRow(g, "Custom Tools Selector", 12);
		R.Size = UDim2.new(1, -4, 0, 42);
		R.ClipsDescendants = true;
		R.Visible = false;
		do
			local g = false;
			local B = Instance.new("TextButton");
			B.Name = "CustomToolsArrow";
			B.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			B.BackgroundTransparency = .18;
			B.BorderSizePixel = 0;
			B.Size = UDim2.new(0, 28, 0, 24);
			B.Position = UDim2.new(1, -90, .5, -12);
			B.Text = "\226\150\178";
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .3;
			B.TextSize = 15;
			B.Font = Enum.Font.GothamBold;
			B.AutoButtonColor = false;
			B.ZIndex = 8;
			B.Parent = u;
			corner(B, 7);
			stroke(B, HF.strokeSoft, 1, .45);
			B.Activated:Connect(function()
				g = not g;
				_G._MasaExpand(R, g, 42, B);
			end);
		end;
		local O = Instance.new("Frame");
		O.Name = "CustomToolsPickHolder";
		O.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		O.BackgroundTransparency = .28;
		O.BorderSizePixel = 0;
		O.Size = UDim2.new(0, 66, 0, 30);
		O.Position = UDim2.new(1, -73, .5, -15);
		O.ClipsDescendants = true;
		O.ZIndex = 9;
		O.Parent = R;
		corner(O, 15);
		stroke(O, Color3.fromRGB(255, 170, 210), 1.5, .15);
		local c = Instance.new("UIGradient");
		c.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		c.Rotation = 18;
		c.Parent = O;
		_G._MasaRegAccent(O, c, "pick");
		local h = Instance.new("TextButton");
		h.Name = "CustomToolsPick";
		h.BackgroundTransparency = 1;
		h.Text = "PICK";
		h.TextColor3 = HF.white;
		h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		h.TextStrokeTransparency = .3;
		h.TextSize = 12;
		h.Font = Enum.Font.GothamBlack;
		h.Size = UDim2.new(1, 0, 1, 0);
		h.BorderSizePixel = 0;
		h.ZIndex = 10;
		h.AutoButtonColor = false;
		h.Parent = O;
		h.MouseEnter:Connect(function()
			tween(O, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
		end);
		h.MouseLeave:Connect(function()
			tween(O, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
		end);
		local Q = nil;
		local function e()
			if Q and Q.Parent then
				local g = Q:FindFirstChild("Frame");
				if g then
					(B:Create(g, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
				end;
				task.delay(.25, function()
					if Q and Q.Parent then
						Q:Destroy();
					end;
					Q = nil;
				end);
			end;
		end;
		h.Activated:Connect(function()
			if Q and Q.Parent then
				e();
				return;
			end;
			Q = Instance.new("ScreenGui");
			Q.Name = "MasaCustomToolsPicker";
			Q.ResetOnSpawn = false;
			Q.IgnoreGuiInset = true;
			Q.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
			Q.DisplayOrder = 9999;
			Q.Parent = m;
			local g = Instance.new("Frame");
			g.Name = "Backdrop";
			g.Size = UDim2.new(1, 0, 1, 0);
			g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			g.BackgroundTransparency = .5;
			g.BorderSizePixel = 0;
			g.ZIndex = 1;
			g.Parent = Q;
			local u = Instance.new("Frame");
			u.Name = "Frame";
			u.Size = UDim2.new(0, 420, 0, 470);
			u.Position = UDim2.new(.5, -210, .5, -235);
			u.BackgroundColor3 = Color3.fromRGB(10, 10, 12);
			u.BorderSizePixel = 0;
			u.ZIndex = 2;
			u.Parent = Q;
			corner(u, 16);
			stroke(u, Color3.fromRGB(90, 90, 105), 1.2, .3);
			local H = Instance.new("Frame");
			H.Size = UDim2.new(1, 0, 0, 44);
			H.BackgroundColor3 = Color3.fromRGB(14, 14, 17);
			H.BackgroundTransparency = .1;
			H.BorderSizePixel = 0;
			H.ZIndex = 3;
			H.Parent = u;
			corner(H, 16);
			local i = Instance.new("TextLabel");
			i.Size = UDim2.new(1, -60, 1, 0);
			i.Position = UDim2.new(0, 16, 0, 0);
			i.BackgroundTransparency = 1;
			i.Text = "CUSTOM TOOLS SELECTOR";
			i.TextColor3 = Color3.fromRGB(255, 255, 255);
			i.Font = Enum.Font.GothamBlack;
			i.TextSize = 15;
			i.TextXAlignment = Enum.TextXAlignment.Left;
			i.ZIndex = 4;
			i.Parent = H;
			local R = Instance.new("TextButton");
			R.Size = UDim2.new(0, 32, 0, 32);
			R.Position = UDim2.new(1, -40, 0, 6);
			R.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
			R.BorderSizePixel = 0;
			R.Text = "X";
			R.TextColor3 = Color3.fromRGB(255, 255, 255);
			R.Font = Enum.Font.GothamBlack;
			R.TextSize = 13;
			R.AutoButtonColor = false;
			R.ZIndex = 4;
			R.Parent = H;
			corner(R, 8);
			stroke(R, Color3.fromRGB(90, 90, 105), 1, .4);
			R.MouseEnter:Connect(function()
				tween(R, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
			end);
			R.MouseLeave:Connect(function()
				tween(R, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
			end);
			R.Activated:Connect(e);
			local O = Instance.new("Frame");
			O.Name = "Sections";
			O.BackgroundColor3 = Color3.fromRGB(18, 18, 23);
			O.BackgroundTransparency = .25;
			O.Size = UDim2.new(1, -24, 0, 38);
			O.Position = UDim2.new(0, 12, 0, 58);
			O.BorderSizePixel = 0;
			O.ZIndex = 3;
			O.ClipsDescendants = true;
			O.Parent = u;
			corner(O, 10);
			local c = Instance.new("Frame");
			c.Name = "Slide";
			c.BackgroundColor3 = Color3.fromRGB(236, 238, 245);
			c.BackgroundTransparency = 0;
			c.AnchorPoint = Vector2.new(.5, .5);
			c.Size = UDim2.new(.5, 0, 1, 0);
			c.Position = UDim2.new(.25, 0, .5, 0);
			c.BorderSizePixel = 0;
			c.ZIndex = 4;
			c.Parent = O;
			corner(c, 10);
			local h = Instance.new("UIGradient");
			h.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(206, 210, 224)) });
			h.Rotation = 90;
			h.Parent = c;
			local P = { { key = "Bat", text = "BAT" }, { key = "Medusa", text = "MEDUSA" } };
			local Z = {};
			for g, u in ipairs(P) do
				local B = Instance.new("TextLabel");
				B.BackgroundTransparency = 1;
				B.Text = u.text;
				B.TextColor3 = HF.white;
				B.TextStrokeTransparency = 1;
				B.TextSize = 12;
				B.Font = Enum.Font.GothamBlack;
				B.AnchorPoint = Vector2.new(.5, .5);
				B.Size = UDim2.new(.5, 0, 1, 0);
				B.Position = UDim2.new(.25 + .5 * ((g - 1)), 0, .5, 0);
				B.ZIndex = 6;
				B.Parent = O;
				Z[g] = B;
			end;
			local F = Instance.new("Frame");
			F.Name = "Page";
			F.BackgroundTransparency = 1;
			F.Size = UDim2.new(1, -24, 1, -118);
			F.Position = UDim2.new(0, 12, 0, 106);
			F.ClipsDescendants = true;
			F.ZIndex = 3;
			F.Parent = u;
			local S = {};
			local r = nil;
			local function U(g, u, B)
				local a = Instance.new("Frame");
				a.Name = "Skin_" .. u;
				a.BackgroundColor3 = Color3.fromRGB(14, 14, 18);
				a.BackgroundTransparency = .15;
				a.Size = UDim2.new(0, 148, 0, 172);
				a.BorderSizePixel = 0;
				a.ZIndex = 4;
				a.Visible = false;
				a.Parent = F;
				corner(a, 14);
				local H = stroke(a, HF.strokeSoft, 1.3, .5);
				local i = Instance.new("ViewportFrame");
				i.Name = "Preview";
				i.BackgroundColor3 = Color3.fromRGB(8, 8, 11);
				i.BackgroundTransparency = .25;
				i.Size = UDim2.new(1, -16, 0, 116);
				i.Position = UDim2.new(0, 8, 0, 8);
				i.BorderSizePixel = 0;
				i.ZIndex = 5;
				i.Ambient = Color3.fromRGB(190, 190, 200);
				i.LightColor = Color3.fromRGB(255, 255, 255);
				i.LightDirection = Vector3.new(-0.4, -1, -0.6);
				i.Parent = a;
				corner(i, 12);
				local R = Instance.new("Part");
				R.Name = "Preview";
				R.Anchored = true;
				R.CanCollide = false;
				R.Size = Vector3.new(1, 1, 1);
				R.CFrame = CFrame.new(0, 0, 0);
				R.Parent = i;
				local O = Instance.new("SpecialMesh");
				O.MeshType = Enum.MeshType.FileMesh;
				O.MeshId = g.mesh;
				O.TextureId = g.tex;
				O.Scale = g.scale;
				O.Parent = R;
				local c = Instance.new("Camera");
				c.FieldOfView = 45;
				c.Parent = i;
				i.CurrentCamera = c;
				local h = Instance.new("TextLabel");
				h.BackgroundTransparency = 1;
				h.Text = g.label;
				h.TextColor3 = HF.white;
				h.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				h.TextStrokeTransparency = .35;
				h.TextSize = 12;
				h.Font = Enum.Font.GothamBlack;
				h.TextWrapped = true;
				h.Size = UDim2.new(1, -12, 0, 36);
				h.Position = UDim2.new(0, 6, 0, 130);
				h.ZIndex = 6;
				h.Parent = a;
				local Q = Instance.new("TextButton");
				Q.BackgroundTransparency = 1;
				Q.Text = "";
				Q.AutoButtonColor = false;
				Q.Size = UDim2.new(1, 0, 1, 0);
				Q.ZIndex = 8;
				Q.Parent = a;
				local e = {
						card = a,
						cat = g.cat,
						key = u,
						part = R,
						stroke = H,
						idx = B,
						vp = i,
						cam = c,
						def = g,
					};
				local P = g.view or 4;
				c.CFrame = CFrame.new(Vector3.new(0, P * .35, P), Vector3.new(0, 0, 0));
				local function m()
					local B = (_G.MasaCustomToolSkins[g.cat] == u);
					tween(H, { Color = B and HF.white or HF.strokeSoft, Transparency = B and 0 or .5, Thickness = B and 2.2 or 1.3 }, .14);
					tween(a, { BackgroundTransparency = B and 0 or .15 }, .14);
				end;
				e.refresh = m;
				Q.MouseEnter:Connect(function()
					local g = e.baseW or a.Size.X.Offset;
					local u = e.baseX or a.Position.X.Offset;
					tween(a, { Size = UDim2.new(0, g + 4, 0, 176), Position = UDim2.new(0, u - 2, 0, 8) }, .12);
				end);
				Q.MouseLeave:Connect(function()
					local g = e.baseW or a.Size.X.Offset;
					local u = e.baseX or a.Position.X.Offset;
					tween(a, { Size = UDim2.new(0, g, 0, 172), Position = UDim2.new(0, u, 0, 10) }, .12);
				end);
				Q.MouseButton1Click:Connect(function()
					if _G.MasaSetCustomToolSkin then
						_G.MasaSetCustomToolSkin(g.cat, u);
					end;
					for g, u in ipairs(S) do
						u.refresh();
					end;
				end);
				m();
				return e;
			end;
			for g, u in pairs(_G.MasaCustomToolAssets or {}) do
				S[#S + 1] = U(u, g, #S + 1);
			end;
			r = a.RenderStepped:Connect(function(g)
					for u, B in ipairs(S) do
						if B.card.Visible and B.part.Parent then
							B.part.CFrame = B.part.CFrame * CFrame.Angles(0, g * 1.2, 0);
						end;
					end;
				end);
			Q.AncestryChanged:Connect(function(g, u)
				if not u and r then
					pcall(function()
						r:Disconnect();
					end);
					r = nil;
				end;
			end);
			local I = "Bat";
			local X = 396;
			local w = 14;
			local k = 9;
			local function t(g, u, B)
				local a = {};
				for u, B in ipairs(S) do
					if B.cat == g then
						a[#a + 1] = B;
					end;
				end;
				local H = #a;
				if H == 0 then
					return a;
				end;
				local i = math.floor((((X - k * 2) - w * ((H - 1)))) / H);
				for g, a in ipairs(a) do
					local H = k + ((g - 1)) * ((i + w));
					a.card.Size = UDim2.new(0, i, 0, 172);
					a.baseW = i;
					a.baseX = H;
					a.card.Visible = true;
					if B then
						a.card.Position = UDim2.new(0, H + ((u and 300 or -300)), 0, 10);
						tween(a.card, { Position = UDim2.new(0, H, 0, 10) }, .24);
					else
						a.card.Position = UDim2.new(0, H, 0, 10);
					end;
				end;
				return a;
			end;
			local V = 0;
			local function E(g, u)
				if g == I and u then
					return;
				end;
				local B = (g == "Medusa");
				V = V + 1;
				local a = V;
				local H = {};
				for u, B in ipairs(S) do
					if B.cat ~= g and B.card.Visible then
						H[#H + 1] = B;
					end;
				end;
				I = g;
				if u then
					for g, u in ipairs(H) do
						local a = u.card.Position.X.Offset;
						tween(u.card, { Position = UDim2.new(0, a + ((B and -300 or 300)), 0, 10) }, .18);
					end;
					task.delay(.14, function()
						if a ~= V then
							return;
						end;
						for g, u in ipairs(H) do
							if u.card.Parent then
								u.card.Visible = false;
							end;
						end;
					end);
				else
					for g, u in ipairs(H) do
						u.card.Visible = false;
					end;
				end;
				t(g, B, u);
				local i = (g == "Bat") and 1 or 2;
				tween(c, { Position = UDim2.new(.25 + .5 * ((i - 1)), 0, .5, 0) }, .2);
				for g, u in ipairs(Z) do
					tween(u, { TextColor3 = (g == i) and Color3.fromRGB(22, 22, 28) or Color3.fromRGB(225, 225, 235), TextTransparency = (g == i) and 0 or .35 }, .16);
				end;
			end;
			for g, u in ipairs(P) do
				local B = Instance.new("TextButton");
				B.BackgroundTransparency = 1;
				B.Text = "";
				B.AutoButtonColor = false;
				B.AnchorPoint = Vector2.new(.5, .5);
				B.Size = UDim2.new(.5, 0, 1, 0);
				B.Position = UDim2.new(.25 + .5 * ((g - 1)), 0, .5, 0);
				B.ZIndex = 8;
				B.Parent = O;
				local a = u.key;
				B.MouseButton1Click:Connect(function()
					E(a, true);
				end);
			end;
			g.InputBegan:Connect(function(g)
				if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
					e();
				end;
			end);
			task.defer(function()
				for g, u in ipairs(S) do
					u.card.Visible = false;
				end;
				E("Bat", false);
			end);
			u.Size = UDim2.new(0, 0, 0, 0);
			u.Position = UDim2.new(.5, 0, .5, 0);
			(B:Create(u, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 420, 0, 470), Position = UDim2.new(.5, -210, .5, -235) })):Play();
		end);
	end;
	do
		local u, B = toggleRow(g, "Rainbow Tools", _G.MasaRainbowToolsEnabled == true, 12);
		Z.setRainbowToolsVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				local g = not ((_G.MasaRainbowToolsEnabled == true));
				if _G.MasaRainbowTools then
					_G.MasaRainbowTools.setEnabled(g);
				end;
				if B then
					B(g);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Transparent Tools", _G.MasaTransparentToolsEnabled == true, 12);
		Z.setTransparentToolsVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				local g = not ((_G.MasaTransparentToolsEnabled == true));
				if _G.MasaTransparentTools then
					_G.MasaTransparentTools.setEnabled(g);
				end;
				if B then
					B(g);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u, B = toggleRow(g, "Custom Sounds", _G.MasaCustomSoundsEnabled == true, 12);
		Z.setCustomSoundsVisual = B;
		local a = u and u:FindFirstChild("ToggleButton");
		if a then
			a.Activated:Connect(function()
				local g = not ((_G.MasaCustomSoundsEnabled == true));
				if _G.MasaCustomSounds then
					_G.MasaCustomSounds.setEnabled(g);
				end;
				if B then
					B(g);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	section(g, "CAMERA", 13);
	do
		local u = { { idx = 2, name = "X1.5" }, { idx = 3, name = "X2" }, { idx = 4, name = "X3" } };
		local B = #u;
		_G.MasaStretchPick = _G.MasaStretchPick or (((stretchCurrentIndex and stretchCurrentIndex > 1)) and stretchCurrentIndex or 2);
		local a, H = toggleRow(g, "Stretch Rez", stretchEnabled == true, 14);
		local i = Instance.new("Frame");
		i.Name = "Stretch Rez Options";
		i.BackgroundColor3 = HF.row;
		i.BackgroundTransparency = .28;
		i.Size = UDim2.new(1, -4, 0, 42);
		i.BorderSizePixel = 0;
		i.LayoutOrder = 14;
		i.ZIndex = 4;
		i.ClipsDescendants = true;
		i.Visible = false;
		i.Parent = g;
		corner(i, 14);
		stroke(i, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(i, nil, "soft");
		local R = Instance.new("Frame");
		R.Name = "SelectedSlide";
		R.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		R.BackgroundTransparency = .1;
		R.AnchorPoint = Vector2.new(.5, .5);
		R.Size = UDim2.new(1 / B, -4, 1, -8);
		R.Position = UDim2.new(.5 / B, 0, .5, 0);
		R.BorderSizePixel = 0;
		R.ZIndex = 5;
		R.Parent = i;
		corner(R, 13);
		local O = Instance.new("UIStroke");
		O.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		O.Color = Color3.fromRGB(255, 170, 210);
		O.Thickness = 1.5;
		O.Transparency = .1;
		O.Parent = R;
		local c = Instance.new("UIGradient");
		c.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		c.Rotation = 22;
		c.Parent = R;
		_G._MasaRegAccent(R, c, "slide");
		local h = {};
		local Q = 1 / B;
		for g, u in ipairs(u) do
			local B = Instance.new("TextLabel");
			B.BackgroundTransparency = 1;
			B.Text = u.name;
			B.TextColor3 = HF.white;
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .2;
			B.TextSize = 11;
			B.Font = Enum.Font.GothamBlack;
			B.AnchorPoint = Vector2.new(.5, .5);
			B.Size = UDim2.new(Q, 0, 1, 0);
			B.Position = UDim2.new(Q * ((g - .5)), 0, .5, 0);
			B.ZIndex = 8;
			B.Parent = i;
			h[g] = B;
			local a = Instance.new("TextButton");
			a.BackgroundTransparency = 1;
			a.Text = "";
			a.AutoButtonColor = false;
			a.AnchorPoint = Vector2.new(.5, .5);
			a.Size = UDim2.new(Q, 0, 1, 0);
			a.Position = UDim2.new(Q * ((g - .5)), 0, .5, 0);
			a.ZIndex = 10;
			a.Parent = i;
			local H = u.idx;
			a.MouseButton1Click:Connect(function()
				_G.MasaStretchPick = H;
				if stretchEnabled then
					Cj(H);
				end;
				if _G.MasaRefreshStretchSelector then
					_G.MasaRefreshStretchSelector();
				end;
				saveMasaConfig();
			end);
		end;
		local function e()
			local g = _G.MasaStretchPick or 2;
			local B = 1;
			for u, a in ipairs(u) do
				if a.idx == g then
					B = u;
					break;
				end;
			end;
			tween(R, { Position = UDim2.new(Q * ((B - .5)), 0, .5, 0), Size = UDim2.new(Q, -4, 1, -8) }, .18);
			for g, u in ipairs(h) do
				tween(u, { TextTransparency = (g == B) and 0 or .45, TextStrokeTransparency = (g == B) and .2 or .45 }, .14);
			end;
			if H then
				pcall(H, stretchEnabled == true);
			end;
		end;
		_G.MasaRefreshStretchSelector = e;
		local P = a and a:FindFirstChild("ToggleButton");
		if P then
			P.Activated:Connect(function()
				if stretchEnabled then
					Cj(1);
				else
					Cj(_G.MasaStretchPick or 2);
				end;
				e();
				saveMasaConfig();
			end);
		end;
		local m = Instance.new("TextButton");
		m.Name = "StretchRezArrow";
		m.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		m.BackgroundTransparency = .18;
		m.BorderSizePixel = 0;
		m.Size = UDim2.new(0, 28, 0, 24);
		m.Position = UDim2.new(1, -90, .5, -12);
		m.Text = "\226\150\178";
		m.TextColor3 = HF.white;
		m.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		m.TextStrokeTransparency = .3;
		m.TextSize = 15;
		m.Font = Enum.Font.GothamBold;
		m.AutoButtonColor = false;
		m.ZIndex = 8;
		m.Parent = a;
		corner(m, 7);
		stroke(m, HF.strokeSoft, 1, .45);
		local Z = false;
		m.Activated:Connect(function()
			Z = not Z;
			_G._MasaExpand(i, Z, 42, m);
		end);
		e();
	end;
	do
		local function u()
			if Hl then
				pcall(function()
					Hl:Disconnect();
				end);
				Hl = nil;
			end;
			if not il or not il.Parent then
				il = i:FindFirstChildOfClass("BlurEffect");
				if not il then
					il = Instance.new("BlurEffect");
					il.Name = "MasaMotionBlur";
				end;
			end;
			il.Size = 0;
			il.Enabled = true;
			il.Parent = i;
			local g = R.CurrentCamera;
			local u = g.CFrame;
			Rl = 0;
			Hl = a.RenderStepped:Connect(function(g)
					if not al then
						if Hl then
							pcall(function()
								Hl:Disconnect();
							end);
							Hl = nil;
						end;
						if il and il.Parent then
							il.Size = 0;
							il.Enabled = false;
						end;
						return;
					end;
					local B = R.CurrentCamera;
					if not B then
						return;
					end;
					local a = B.CFrame;
					local H = a.LookVector:Dot(u.LookVector);
					local i = math.acos(math.clamp(H, -1, 1));
					local O = math.deg(i);
					local c = O * 20;
					local h = math.min(c, 7);
					Rl = Rl + ((h - Rl)) * math.min(1, g * 10);
					if il and il.Parent then
						il.Size = Rl;
					end;
					u = a;
				end);
		end;
		local function B()
			if Hl then
				pcall(function()
					Hl:Disconnect();
				end);
				Hl = nil;
			end;
			if il and il.Parent then
				il.Size = 0;
				il.Enabled = false;
			end;
			Rl = 0;
		end;
		local H, O = toggleRow(g, "Motion Blur", al, 15);
		Z.setMotionBlurVisual = O;
		local c = H and H:FindFirstChild("ToggleButton");
		if c then
			c.Activated:Connect(function()
				al = not al;
				if al then
					u();
				else
					B();
				end;
				if O then
					O(al);
				end;
				saveMasaConfig();
			end);
		end;
		if al then
			u();
		end;
	end;
	do
		local u, B = toggleRow(g, "No Cam Collision", Bl, 16);
		Z.setNoCamCollisionVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				if Bl then
					disableNoCamCollision();
				else
					enableNoCamCollision();
				end;
				if B then
					B(Bl);
				end;
				saveMasaConfig();
			end);
		end;
	end;
	do
		local u = false;
		local B, a = toggleRow(g, "FOV", gl, 14);
		Z.setFOVVisual = a;
		_masaBtn = B and B:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				if gl then
					disableCustomFov();
				else
					enableCustomFov();
				end;
				if a then
					a(gl);
				end;
				saveMasaConfig();
			end);
		end;
		local H = Instance.new("TextButton");
		H.Name = "FOVArrow";
		H.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		H.BackgroundTransparency = .18;
		H.BorderSizePixel = 0;
		H.Size = UDim2.new(0, 28, 0, 24);
		H.Position = UDim2.new(1, -90, .5, -12);
		H.Text = "\226\150\178";
		H.TextColor3 = HF.white;
		H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		H.TextStrokeTransparency = .3;
		H.TextSize = 15;
		H.Font = Enum.Font.GothamBold;
		H.AutoButtonColor = false;
		H.ZIndex = 8;
		H.Parent = B;
		corner(H, 7);
		stroke(H, HF.strokeSoft, 1, .45);
		local i = Instance.new("Frame");
		i.Name = "FOV Value Holder";
		i.BackgroundColor3 = HF.row;
		i.BackgroundTransparency = .28;
		i.Size = UDim2.new(1, -4, 0, 42);
		i.BorderSizePixel = 0;
		i.LayoutOrder = 14;
		i.ZIndex = 4;
		i.ClipsDescendants = true;
		i.Visible = false;
		i.Parent = g;
		corner(i, 14);
		stroke(i, Color3.fromRGB(59, 130, 246), 1.4, .32);
		_G._MasaRegAccent(i, nil, "soft");
		local R = Instance.new("TextLabel");
		R.Name = "Label";
		R.BackgroundTransparency = 1;
		R.Text = "FOV Value";
		R.TextColor3 = HF.white;
		R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		R.TextStrokeTransparency = .25;
		R.TextSize = 11;
		R.Font = Enum.Font.GothamSemibold;
		R.TextXAlignment = Enum.TextXAlignment.Left;
		R.Size = UDim2.new(.55, 0, 1, 0);
		R.Position = UDim2.new(0, 12, 0, 0);
		R.ZIndex = 8;
		R.Parent = i;
		local O = Instance.new("TextBox");
		O.Name = "FOVValueBox";
		O.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
		O.BackgroundTransparency = .18;
		O.Text = tostring(ul);
		O.TextColor3 = HF.white;
		O.TextSize = 12;
		O.Font = Enum.Font.GothamSemibold;
		O.ClearTextOnFocus = false;
		O.Size = UDim2.new(0, 58, 0, 24);
		O.Position = UDim2.new(1, -68, .5, -12);
		O.BorderSizePixel = 0;
		O.ZIndex = 6;
		O.Parent = i;
		corner(O, 7);
		stroke(O, HF.strokeSoft, 1, .45);
		_G.MasaFovValueBox = O;
		_G.MasaRefreshFovValueBox = function()
				pcall(function()
					O.Text = tostring(ul);
				end);
			end;
		O.FocusLost:Connect(function()
			local g = tonumber(O.Text);
			if g and (g >= 30 and g <= 120) then
				ul = g;
				if gl and workspace.CurrentCamera then
					workspace.CurrentCamera.FieldOfView = ul;
				end;
			end;
			O.Text = tostring(ul);
			saveMasaConfig();
		end);
		H.Activated:Connect(function()
			u = not u;
			_G._MasaExpand(i, u, 42, H);
		end);
	end;
	section(g, "RAINBOW MOBILE JOYSTICK", 18);
	do
		local u, B = toggleRow(g, "Rainbow Mobile Joystick", _G.MasaRainbowJoystickEnabled == true, 19);
		Z.setRainbowJoystickVisual = B;
		_masaBtn = u and u:FindFirstChild("ToggleButton");
		if _masaBtn then
			_masaBtn.Activated:Connect(function()
				local g = not ((_G.MasaRainbowJoystickEnabled == true));
				if _G.MasaSetRainbowJoystick then
					pcall(_G.MasaSetRainbowJoystick, g);
				end;
				if B then
					B(_G.MasaRainbowJoystickEnabled == true);
				end;
				saveMasaConfig();
			end);
		end;
		if B then
			B(_G.MasaRainbowJoystickEnabled == true);
		end;
	end;
end;
Settings = tF.SETTINGS;
Ej = tonumber(savedConfig.masaGuiScaleValue) or .75;
Ej = math.clamp(tonumber(Ej) or .5, .5, 1.5);
Nj = tonumber(savedConfig.masaProgressBarScaleValue) or .85;
masaMainScale = OF:FindFirstChild("MasaMainScale") or Instance.new("UIScale");
masaMainScale.Name = "MasaMainScale";
masaMainScale.Scale = Ej;
masaMainScale.Parent = OF;
local function KF()
	local g = m:FindFirstChild("MasaHubStealBarGui");
	local u = g and g:FindFirstChild("StealBar");
	if not u then
		return;
	end;
	local B = u:FindFirstChild("MasaProgressBarScale") or Instance.new("UIScale");
	B.Name = "MasaProgressBarScale";
	B.Scale = Nj;
	B.Parent = u;
	for g, u in ipairs(u:GetDescendants()) do
		if u:IsA("TextLabel") or u:IsA("TextButton") or u:IsA("TextBox") then
			local g = u:GetAttribute("AmbBaseTextSize");
			if not g then
				g = u.TextSize;
				u:SetAttribute("AmbBaseTextSize", g);
			end;
			pcall(function()
				u.TextSize = math.max(1, math.floor(g * Nj + .5));
			end);
		end;
	end;
end;
_G.MasaApplyProgressBarScale = KF;
_G.__MasaDuelsSetupSettingsUI = function()
		section(Settings, "GUI SETTINGS", 1);
		do
			local g, u = toggleRow(Settings, "Lock GUI", _G.MasaGuiLocked == true, 1.2);
			setLockGuiVisual = u;
			local B = g and g:FindFirstChild("ToggleButton");
			if B then
				B.Activated:Connect(function()
					_G.MasaGuiLocked = not ((_G.MasaGuiLocked == true));
					if MasaUpdateGuiLockVisual then
						MasaUpdateGuiLockVisual();
					end;
					saveMasaConfig();
				end);
			end;
		end;
		do
			local g, u = toggleRow(Settings, "Halloween Theme", _G.MasaHalloweenTheme == true, 1.3);
			local B = g and g:FindFirstChild("ToggleButton");
			if B then
				B.Activated:Connect(function()
					_G.MasaHalloweenTheme = not ((_G.MasaHalloweenTheme == true));
					if u then
						u(_G.MasaHalloweenTheme == true);
					end;
					if _G.MasaApplyHalloweenTheme then
						pcall(_G.MasaApplyHalloweenTheme);
					end;
					saveMasaConfig();
				end);
			end;
		end;
		do
			local g, u = _G.MasaActionToggleRow(Settings, "Hide Mobile Buttons", _G.MasaHideMobileButtons == true, 9);
			setHideMobileButtonsVisual = u;
			local B = g and g:FindFirstChild("ToggleButton");
			if B then
				B.Activated:Connect(function()
					_G.MasaHideMobileButtons = not ((_G.MasaHideMobileButtons == true));
					if u then
						u(_G.MasaHideMobileButtons == true);
					end;
					if _G.MasaApplyMobileButtonsHidden then
						_G.MasaApplyMobileButtonsHidden();
					end;
					saveMasaConfig();
				end);
			end;
			local a = {
					{ key = "drop", label = "Drop BR" },
					{ key = "autoPlay", label = "Auto Play" },
					{ key = "tpBat", label = "TP Bat" },
					{ key = "aimbot", label = "Bat Aimbot", dyn = "aimbot" },
					{ key = "antiTPBat", label = "Anti TP Bat" },
					{ key = "float", label = "Float" },
					{ key = "instantReset", label = "Instant Reset" },
					{ key = "tp", label = "TP Down" },
					{ key = "carry", label = "Carry Speed" },
					{ key = "laggerNormal", label = "Lagger Normal" },
					{ key = "laggerCarry", label = "Lagger Carry" },
				};
			local H, i = 34, 6;
			local R = (#a * H + ((#a - 1)) * i) + 8;
			local function O(g)
				if g.dyn == "aimbot" then
					return g.label .. (" " .. (((N == "V2") and "V2" or "V1")));
				end;
				return g.label;
			end;
			local c = Instance.new("Frame");
			c.Name = "Hide Mobile Buttons Options";
			c.BackgroundTransparency = 1;
			c.Size = UDim2.new(1, 0, 0, R);
			c.BorderSizePixel = 0;
			c.LayoutOrder = 9;
			c.ZIndex = 4;
			c.ClipsDescendants = true;
			c.Visible = false;
			c.Parent = Settings;
			local h = Instance.new("UIListLayout");
			h.Padding = UDim.new(0, i);
			h.SortOrder = Enum.SortOrder.LayoutOrder;
			h.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			h.Parent = c;
			local Q = Instance.new("UIPadding");
			Q.PaddingTop = UDim.new(0, 4);
			Q.Parent = c;
			for g, u in ipairs(a) do
				local B = Instance.new("Frame");
				B.Name = "HideOpt_" .. u.key;
				B.BackgroundColor3 = HF.row;
				B.BackgroundTransparency = .3;
				B.Size = UDim2.new(1, -8, 0, 34);
				B.BorderSizePixel = 0;
				B.LayoutOrder = g;
				B.ZIndex = 4;
				B.Parent = c;
				corner(B, 9);
				local a = stroke(B, HF.strokeSoft, 1.15, .38);
				B.MouseEnter:Connect(function()
					tween(B, { BackgroundTransparency = .22 });
				end);
				B.MouseLeave:Connect(function()
					tween(B, { BackgroundTransparency = .3 });
				end);
				local H = Instance.new("TextLabel");
				H.BackgroundTransparency = 1;
				H.Text = O(u);
				H.TextColor3 = Color3.fromRGB(245, 245, 255);
				H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				H.TextStrokeTransparency = .25;
				H.TextSize = 12;
				H.Font = Enum.Font.GothamSemibold;
				H.TextXAlignment = Enum.TextXAlignment.Left;
				H.Position = UDim2.new(0, 12, 0, 0);
				H.Size = UDim2.new(1, -70, 1, 0);
				H.ZIndex = 5;
				H.Parent = B;
				local i = _G.MasaMobileHideIncluded(u.key);
				local R = Instance.new("Frame");
				R.Name = "Track";
				R.BackgroundColor3 = HF.toggleBg;
				R.BackgroundTransparency = .12;
				R.Size = UDim2.new(0, 48, 0, 24);
				R.Position = UDim2.new(1, -58, .5, -12);
				R.BorderSizePixel = 0;
				R.ZIndex = 5;
				R.Parent = B;
				corner(R, 12);
				local h = stroke(R, HF.strokeSoft, 1.3, .4);
				local Q = Instance.new("Frame");
				Q.Name = "Fill";
				Q.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
				Q.BackgroundTransparency = i and 0 or 1;
				Q.Size = UDim2.new(1, 0, 1, 0);
				Q.BorderSizePixel = 0;
				Q.ZIndex = 5;
				Q.Parent = R;
				corner(Q, 11);
				local e = Instance.new("UIGradient");
				e.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
				e.Rotation = 18;
				e.Parent = Q;
				local P = Instance.new("Frame");
				P.Name = "Knob";
				P.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				P.Size = UDim2.new(0, 18, 0, 18);
				P.Position = i and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9);
				P.BorderSizePixel = 0;
				P.ZIndex = 7;
				P.Parent = R;
				corner(P, 999);
				local m = Instance.new("UIStroke");
				m.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				m.Color = i and Color3.fromRGB(255, 170, 210) or Color3.fromRGB(255, 192, 203);
				m.Thickness = 1.4;
				m.Transparency = .15;
				m.Parent = P;
				local Z = Instance.new("Frame");
				Z.BackgroundColor3 = HF.white;
				Z.BackgroundTransparency = .55;
				Z.Size = UDim2.new(1, -5, 0, 5);
				Z.Position = UDim2.new(0, 2.5, 0, 2.5);
				Z.BorderSizePixel = 0;
				Z.ZIndex = 8;
				Z.Parent = P;
				corner(Z, 5);
				_G._MasaRegAccent(Q, e, "toggle", R, P, B);
				local function F(g)
					local u, B = _G._MasaToggleOnColor();
					tween(P, { Position = g and UDim2.new(1, -21, .5, -9) or UDim2.new(0, 3, .5, -9) });
					tween(R, { BackgroundTransparency = g and 0 or .12, BackgroundColor3 = g and u or HF.toggleBg });
					tween(Q, { BackgroundTransparency = g and 0 or 1 });
					tween(m, { Color = g and B or Color3.fromRGB(255, 192, 203) });
					tween(h, { Color = g and B or HF.strokeSoft, Transparency = g and 0 or .4, Thickness = 1.4 });
					tween(a, { Color = g and u or HF.strokeSoft, Transparency = g and .08 or .38, Thickness = 1.25 });
				end;
				local S = Instance.new("TextButton");
				S.Name = "ToggleButton";
				S.BackgroundTransparency = 1;
				S.Text = "";
				S.Size = UDim2.new(1, 0, 1, 0);
				S.Position = UDim2.new(0, 0, 0, 0);
				S.AutoButtonColor = false;
				S.ZIndex = 9;
				S.Parent = B;
				S.Activated:Connect(function()
					local g = not _G.MasaMobileHideIncluded(u.key);
					_G.MasaMobileHideList[u.key] = g;
					F(g);
					if _G.MasaApplyMobileButtonsHidden then
						_G.MasaApplyMobileButtonsHidden();
					end;
					saveMasaConfig();
				end);
				_G["_AmbHideOptPaint_" .. u.key] = F;
				if u.dyn then
					_G["_AmbHideOptLabel_" .. u.key] = function()
							H.Text = O(u);
						end;
				end;
				F(i);
			end;
			_G.MasaRefreshMobileHideList = function()
					for g, u in ipairs(a) do
						local B = _G["_AmbHideOptPaint_" .. u.key];
						if B then
							pcall(B, _G.MasaMobileHideIncluded(u.key));
						end;
					end;
				end;
			local e = Instance.new("TextButton");
			e.Name = "HideMobileArrow";
			e.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			e.BackgroundTransparency = .18;
			e.BorderSizePixel = 0;
			e.Size = UDim2.new(0, 28, 0, 24);
			e.Position = UDim2.new(1, -90, .5, -12);
			e.Text = "\226\150\178";
			e.TextColor3 = HF.white;
			e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			e.TextStrokeTransparency = .3;
			e.TextSize = 15;
			e.Font = Enum.Font.GothamBold;
			e.AutoButtonColor = false;
			e.ZIndex = 8;
			e.Parent = g;
			corner(e, 7);
			stroke(e, HF.strokeSoft, 1, .45);
			local P = false;
			e.Activated:Connect(function()
				P = not P;
				_G._MasaExpand(c, P, R, e);
			end);
		end;
		local u = Instance.new("Frame");
		u.Name = "Background Image Picker";
		u.BackgroundColor3 = HF.row;
		u.BackgroundTransparency = .3;
		u.Visible = false;
		u.Size = UDim2.new(1, -4, 0, 0);
		u.BorderSizePixel = 0;
		u.LayoutOrder = 2;
		u.ZIndex = 4;
		u.Parent = Settings;
		corner(u, 9);
		stroke(u, HF.strokeSoft, 1.15, .38);
		local a = {};
		function updateBackgroundButtons()
			for g, u in pairs(a) do
				local B = (g == kj) and (Vj == nil);
				u.BackgroundTransparency = B and .12 or .42;
				local a = u:FindFirstChildOfClass("UIStroke");
				if a then
					a.Color = B and Color3.fromRGB(245, 245, 255) or HF.strokeSoft;
					a.Transparency = B and .12 or .55;
					a.Thickness = B and 1.15 or 1;
				end;
			end;
			if _G.MasaCustomBgPreviewUpdate then
				pcall(_G.MasaCustomBgPreviewUpdate);
			end;
		end;
		function makeImageButton(g, B)
			local H = Instance.new("Frame");
			H.Name = "Image " .. tostring(g);
			H.BackgroundColor3 = Color3.fromRGB(5, 5, 8);
			H.BackgroundTransparency = .35;
			H.BorderSizePixel = 0;
			H.Size = UDim2.new(0, 58, 0, 40);
			H.Position = UDim2.new(0, B, .5, -20);
			H.ZIndex = 6;
			H.ClipsDescendants = true;
			H.Parent = u;
			corner(H, 8);
			stroke(H, HF.strokeSoft, 1, .45);
			local i = Instance.new("ImageLabel");
			i.Name = "Preview";
			i.BackgroundTransparency = 1;
			i.Image = "rbxassetid://" .. ZF[g];
			i.ScaleType = Enum.ScaleType.Crop;
			i.Size = UDim2.new(1, 0, 1, 0);
			i.Position = UDim2.new(0, 0, 0, 0);
			i.ZIndex = 6;
			i.Parent = H;
			corner(i, 8);
			local R = Instance.new("TextButton");
			R.Name = "Click";
			R.BackgroundTransparency = 1;
			R.Text = "";
			R.AutoButtonColor = false;
			R.Size = UDim2.new(1, 0, 1, 0);
			R.Position = UDim2.new(0, 0, 0, 0);
			R.ZIndex = 7;
			R.Parent = H;
			a[g] = H;
			R.MouseButton1Click:Connect(function()
				applyBackground(g);
				updateBackgroundButtons();
			end);
		end;
		makeImageButton(1, 16);
		makeImageButton(2, 84);
		makeImageButton(3, 152);
		makeImageButton(4, 220);
		updateBackgroundButtons();
		do
			local g = baseRow(Settings, "Custom Background", 2);
			g.Visible = false;
			g.Size = UDim2.new(1, -4, 0, 0);
			local u = Instance.new("Frame");
			u.Name = "CustomBgPreview";
			u.Size = UDim2.new(0, 36, 0, 28);
			u.Position = UDim2.new(1, -124, .5, -14);
			u.BackgroundColor3 = Color3.fromRGB(20, 20, 22);
			u.BorderSizePixel = 0;
			u.ClipsDescendants = true;
			u.ZIndex = 6;
			u.Parent = g;
			(Instance.new("UICorner", u)).CornerRadius = UDim.new(0, 6);
			local a = Instance.new("UIStroke");
			a.Color = Color3.fromRGB(255, 255, 255);
			a.Thickness = 1.5;
			a.Transparency = .3;
			a.Parent = u;
			local H = Instance.new("ImageLabel");
			H.Name = "PreviewImg";
			H.Size = UDim2.new(1, 0, 1, 0);
			H.BackgroundTransparency = 1;
			H.ScaleType = Enum.ScaleType.Crop;
			H.Image = (Vj and "rbxassetid://" .. Vj) or "";
			H.Visible = Vj ~= nil;
			H.ZIndex = 7;
			H.Parent = u;
			(Instance.new("UICorner", H)).CornerRadius = UDim.new(0, 6);
			local i = Instance.new("TextLabel");
			i.Size = UDim2.new(1, 0, 1, 0);
			i.BackgroundTransparency = 1;
			i.Text = "\226\128\147";
			i.TextColor3 = Color3.fromRGB(90, 90, 100);
			i.Font = Enum.Font.GothamSemibold;
			i.TextSize = 14;
			i.TextXAlignment = Enum.TextXAlignment.Center;
			i.ZIndex = 7;
			i.Visible = Vj == nil;
			i.Parent = u;
			_G.MasaCustomBgPreviewUpdate = function()
					if Vj then
						H.Image = "rbxassetid://" .. Vj;
						H.Visible = true;
						i.Visible = false;
					else
						H.Image = "";
						H.Visible = false;
						i.Visible = true;
					end;
				end;
			local R = Instance.new("Frame");
			R.Name = "CustomBgBtnHolder";
			R.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			R.BackgroundTransparency = .28;
			R.BorderSizePixel = 0;
			R.Size = UDim2.new(0, 66, 0, 30);
			R.Position = UDim2.new(1, -73, .5, -15);
			R.ClipsDescendants = true;
			R.ZIndex = 6;
			R.Parent = g;
			corner(R, 15);
			stroke(R, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local O = Instance.new("UIGradient");
			O.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			O.Rotation = 18;
			O.Parent = R;
			_G._MasaRegAccent(R, O, "pick");
			local c = Instance.new("TextButton");
			c.Name = "CustomBgButton";
			c.BackgroundTransparency = 1;
			c.Text = "PICK";
			c.TextColor3 = HF.white;
			c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			c.TextStrokeTransparency = .3;
			c.TextSize = 12;
			c.Font = Enum.Font.GothamBlack;
			c.TextXAlignment = Enum.TextXAlignment.Center;
			c.Size = UDim2.new(1, 0, 1, 0);
			c.Position = UDim2.new(0, 0, 0, 0);
			c.BorderSizePixel = 0;
			c.ZIndex = 8;
			c.AutoButtonColor = false;
			c.Parent = R;
			c.MouseEnter:Connect(function()
				tween(R, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
			end);
			c.MouseLeave:Connect(function()
				tween(R, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
			end);
			local h = nil;
			local function Q()
				if h and h.Parent then
					local g = h:FindFirstChild("Frame");
					if g then
						(B:Create(g, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
					end;
					task.delay(.25, function()
						if h and h.Parent then
							h:Destroy();
						end;
						h = nil;
					end);
				end;
			end;
			local e = {};
			local function P(g)
				for g, u in ipairs(g:GetChildren()) do
					if not u:IsA("UIGridLayout") and not u:IsA("UIPadding") then
						u:Destroy();
					end;
				end;
				e = {};
				for u, a in ipairs(tj) do
					local H = Instance.new("Frame");
					H.Name = "CustomThumb_" .. tostring(u);
					H.Size = UDim2.new(0, 109, 0, 109);
					H.BackgroundColor3 = Color3.fromRGB(12, 12, 16);
					H.BackgroundTransparency = .1;
					H.BorderSizePixel = 0;
					H.ZIndex = 4;
					H.ClipsDescendants = false;
					H.LayoutOrder = u;
					H.Parent = g;
					corner(H, 12);
					local i = (Vj == a);
					local R = Instance.new("UIStroke");
					R.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					R.Color = i and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(50, 50, 58);
					R.Thickness = i and 1.8 or 1;
					R.Transparency = i and .05 or .5;
					R.Parent = H;
					local O = Instance.new("ImageLabel", H);
					O.Size = UDim2.new(1, 0, 1, 0);
					O.BackgroundTransparency = 1;
					O.Image = "rbxassetid://" .. a;
					O.ScaleType = Enum.ScaleType.Crop;
					O.ZIndex = 5;
					corner(O, 12);
					local c = Instance.new("TextButton", H);
					c.Name = "Remove";
					c.Size = UDim2.new(0, 22, 0, 22);
					c.Position = UDim2.new(1, -24, 0, 2);
					c.BackgroundTransparency = 1;
					c.BorderSizePixel = 0;
					c.Text = "X";
					c.TextColor3 = Color3.fromRGB(255, 55, 55);
					c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					c.TextStrokeTransparency = 0;
					c.Font = Enum.Font.GothamBlack;
					c.TextSize = 14;
					c.AutoButtonColor = false;
					c.ZIndex = 9;
					c.MouseEnter:Connect(function()
						(B:Create(c, TweenInfo.new(.1), { TextColor3 = Color3.fromRGB(255, 110, 110) })):Play();
					end);
					c.MouseLeave:Connect(function()
						(B:Create(c, TweenInfo.new(.1), { TextColor3 = Color3.fromRGB(255, 55, 55) })):Play();
					end);
					local Q = a;
					c.MouseButton1Click:Connect(function()
						for g, u in ipairs(tj) do
							if u == Q then
								table.remove(tj, g);
								break;
							end;
						end;
						if Vj == Q then
							Vj = nil;
							applyBackground(1);
						end;
						saveMasaConfig();
						if h and h.Parent then
							local g = h:FindFirstChild("Frame") and h.Frame:FindFirstChild("Scroll");
							if g then
								P(g);
							end;
						end;
					end);
					local m = Instance.new("TextButton", H);
					m.Name = "Click";
					m.Size = UDim2.new(1, -26, 1, 0);
					m.BackgroundTransparency = 1;
					m.Text = "";
					m.AutoButtonColor = false;
					m.ZIndex = 6;
					m.MouseEnter:Connect(function()
						(B:Create(H, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(35, 35, 42) })):Play();
					end);
					m.MouseLeave:Connect(function()
						(B:Create(H, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(12, 12, 16) })):Play();
					end);
					m.MouseButton1Click:Connect(function()
						applyCustomBackground(Q);
						if h and h.Parent then
							local g = h:FindFirstChild("Frame") and h.Frame:FindFirstChild("Scroll");
							if g then
								for g, u in ipairs(g:GetChildren()) do
									if u.Name:sub(1, 12) == "CustomThumb_" then
										local g = u:FindFirstChildOfClass("ImageLabel");
										local B = g and g.Image:match("rbxassetid://(.+)");
										local a = u:FindFirstChildOfClass("UIStroke");
										if a then
											local g = B == Q;
											a.Color = g and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(50, 50, 58);
											a.Thickness = g and 1.8 or 1;
											a.Transparency = g and .05 or .5;
										end;
									end;
								end;
							end;
						end;
					end);
					table.insert(e, { holder = H, id = a });
				end;
				local u = Instance.new("TextButton");
				u.Name = "AddCustomBg";
				u.Size = UDim2.new(0, 109, 0, 109);
				u.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
				u.BackgroundTransparency = .1;
				u.BorderSizePixel = 0;
				u.Text = "";
				u.AutoButtonColor = false;
				u.ZIndex = 4;
				u.LayoutOrder = #tj + 1;
				u.Parent = g;
				corner(u, 12);
				local a = Instance.new("UIStroke");
				a.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				a.Color = Color3.fromRGB(70, 70, 80);
				a.Thickness = 1;
				a.Transparency = .4;
				a.Parent = u;
				local H = Instance.new("Frame", u);
				H.Size = UDim2.new(1, 0, 0, 52);
				H.Position = UDim2.new(0, 0, .5, -26);
				H.BackgroundTransparency = 1;
				H.ZIndex = 5;
				local i = Instance.new("TextLabel", H);
				i.Size = UDim2.new(1, 0, 0, 30);
				i.Position = UDim2.new(0, 0, 0, 0);
				i.BackgroundTransparency = 1;
				i.Text = "+";
				i.TextColor3 = Color3.fromRGB(180, 180, 195);
				i.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				i.TextStrokeTransparency = .3;
				i.Font = Enum.Font.GothamBlack;
				i.TextSize = 28;
				i.TextXAlignment = Enum.TextXAlignment.Center;
				i.ZIndex = 5;
				local R = Instance.new("TextLabel", H);
				R.Size = UDim2.new(1, 0, 0, 18);
				R.Position = UDim2.new(0, 0, 0, 32);
				R.BackgroundTransparency = 1;
				R.Text = "ADD";
				R.TextColor3 = Color3.fromRGB(200, 200, 215);
				R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				R.TextStrokeTransparency = .22;
				R.Font = Enum.Font.GothamBold;
				R.TextSize = 11;
				R.TextXAlignment = Enum.TextXAlignment.Center;
				R.ZIndex = 5;
				u.MouseEnter:Connect(function()
					(B:Create(u, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(35, 35, 42) })):Play();
				end);
				u.MouseLeave:Connect(function()
					(B:Create(u, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(18, 18, 22) })):Play();
				end);
				u.Activated:Connect(function()
					if not h or not h.Parent then
						return;
					end;
					local g = h:FindFirstChild("Frame");
					if not g then
						return;
					end;
					local u = Instance.new("Frame");
					u.Name = "AddAssetMiniOverlay";
					u.Size = UDim2.new(1, 0, 1, 0);
					u.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					u.BackgroundTransparency = .48;
					u.BorderSizePixel = 0;
					u.ZIndex = 100;
					u.Parent = g;
					local a = Instance.new("UICorner");
					a.CornerRadius = UDim.new(0, 16);
					a.Parent = u;
					local H = Instance.new("TextButton");
					H.Size = UDim2.new(1, 0, 1, 0);
					H.BackgroundTransparency = 1;
					H.Text = "";
					H.AutoButtonColor = false;
					H.ZIndex = 100;
					H.Parent = u;
					H.MouseButton1Click:Connect(function()
						u:Destroy();
					end);
					local i = Instance.new("Frame");
					i.Name = "AddAssetPanel";
					i.AnchorPoint = Vector2.new(.5, .5);
					i.Position = UDim2.new(.5, 0, .5, 0);
					i.Size = UDim2.new(0, 300, 0, 158);
					i.BackgroundColor3 = Color3.fromRGB(6, 6, 9);
					i.BorderSizePixel = 0;
					i.ZIndex = 101;
					i.ClipsDescendants = true;
					i.Parent = u;
					corner(i, 16);
					stroke(i, HF.stroke, 1.1, .3);
					local R = Instance.new("Frame");
					R.Name = "Header";
					R.Size = UDim2.new(1, 0, 0, 42);
					R.Position = UDim2.new(0, 0, 0, 0);
					R.BackgroundColor3 = Color3.fromRGB(10, 10, 14);
					R.BackgroundTransparency = .1;
					R.BorderSizePixel = 0;
					R.ZIndex = 102;
					R.Parent = i;
					corner(R, 16);
					local O = Instance.new("TextLabel");
					O.Name = "Title";
					O.Size = UDim2.new(1, -52, 1, 0);
					O.Position = UDim2.new(0, 14, 0, 0);
					O.BackgroundTransparency = 1;
					O.Text = "ADD BACKGROUND";
					O.TextColor3 = HF.white;
					O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					O.TextStrokeTransparency = .3;
					O.Font = Enum.Font.GothamBlack;
					O.TextSize = 13;
					O.TextXAlignment = Enum.TextXAlignment.Left;
					O.ZIndex = 103;
					O.Parent = R;
					local c = Instance.new("TextButton");
					c.Name = "CloseX";
					c.Size = UDim2.new(0, 28, 0, 28);
					c.Position = UDim2.new(1, -36, .5, -14);
					c.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					c.BackgroundTransparency = .28;
					c.BorderSizePixel = 0;
					c.Text = "-";
					c.TextColor3 = HF.white;
					c.TextSize = 18;
					c.Font = Enum.Font.GothamSemibold;
					c.AutoButtonColor = false;
					c.ZIndex = 104;
					c.Parent = R;
					corner(c, 8);
					stroke(c, HF.stroke, 1, .35);
					c.MouseEnter:Connect(function()
						(B:Create(c, TweenInfo.new(.12), { BackgroundTransparency = .08 })):Play();
					end);
					c.MouseLeave:Connect(function()
						(B:Create(c, TweenInfo.new(.12), { BackgroundTransparency = .28 })):Play();
					end);
					c.MouseButton1Click:Connect(function()
						u:Destroy();
					end);
					local Q = Instance.new("Frame");
					Q.Size = UDim2.new(1, -28, 0, 1);
					Q.Position = UDim2.new(0, 14, 0, 42);
					Q.BackgroundColor3 = Color3.fromRGB(70, 70, 82);
					Q.BackgroundTransparency = .45;
					Q.BorderSizePixel = 0;
					Q.ZIndex = 102;
					Q.Parent = i;
					local e = Instance.new("Frame");
					e.Size = UDim2.new(1, -24, 0, 36);
					e.Position = UDim2.new(0, 12, 0, 52);
					e.BackgroundColor3 = HF.row2;
					e.BackgroundTransparency = .1;
					e.BorderSizePixel = 0;
					e.ZIndex = 102;
					e.Parent = i;
					corner(e, 9);
					stroke(e, HF.strokeSoft, 1, .38);
					local m = Instance.new("TextBox");
					m.Name = "AssetInput";
					m.Size = UDim2.new(1, -16, 1, 0);
					m.Position = UDim2.new(0, 8, 0, 0);
					m.BackgroundTransparency = 1;
					m.BorderSizePixel = 0;
					m.PlaceholderText = "Insert The Asset ID";
					m.PlaceholderColor3 = Color3.fromRGB(80, 80, 92);
					m.Text = "";
					m.TextColor3 = HF.white;
					m.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					m.TextStrokeTransparency = .4;
					m.Font = Enum.Font.GothamSemibold;
					m.TextSize = 12;
					m.ClearTextOnFocus = false;
					m.ZIndex = 103;
					m.Parent = e;
					local Z = Instance.new("TextLabel");
					Z.Size = UDim2.new(1, -24, 0, 14);
					Z.Position = UDim2.new(0, 12, 0, 94);
					Z.BackgroundTransparency = 1;
					Z.Text = "";
					Z.TextColor3 = Color3.fromRGB(255, 75, 75);
					Z.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					Z.TextStrokeTransparency = .4;
					Z.Font = Enum.Font.GothamSemibold;
					Z.TextSize = 10;
					Z.TextXAlignment = Enum.TextXAlignment.Left;
					Z.ZIndex = 102;
					Z.Parent = i;
					local F = Instance.new("Frame");
					F.Size = UDim2.new(1, -24, 0, 32);
					F.Position = UDim2.new(0, 12, 0, 114);
					F.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
					F.BackgroundTransparency = .28;
					F.BorderSizePixel = 0;
					F.ZIndex = 102;
					F.Parent = i;
					corner(F, 9);
					stroke(F, Color3.fromRGB(235, 235, 245), 1, .28);
					local S = Instance.new("TextButton");
					S.Name = "Confirm";
					S.Size = UDim2.new(1, 0, 1, 0);
					S.BackgroundTransparency = 1;
					S.BorderSizePixel = 0;
					S.Text = "CONFIRM";
					S.TextColor3 = HF.white;
					S.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					S.TextStrokeTransparency = .22;
					S.Font = Enum.Font.GothamBlack;
					S.TextSize = 11;
					S.AutoButtonColor = false;
					S.ZIndex = 103;
					S.Parent = F;
					S.MouseEnter:Connect(function()
						(B:Create(F, TweenInfo.new(.12), { BackgroundTransparency = .1 })):Play();
					end);
					S.MouseLeave:Connect(function()
						(B:Create(F, TweenInfo.new(.12), { BackgroundTransparency = .28 })):Play();
					end);
					local r = false;
					local function U()
						if r then
							return;
						end;
						local g = m.Text:match("^%s*(.-)%s*$");
						if g == "" then
							Z.Text = "Invalid Asset Please Try Again";
							return;
						end;
						local a = g:match("^(%d+)$") or g:match("rbxassetid://(%d+)$");
						if not a then
							Z.Text = "Invalid Asset Please Try Again";
							return;
						end;
						for g, u in ipairs(tj) do
							if u == a then
								Z.Text = "Already added.";
								return;
							end;
						end;
						r = true;
						Z.Text = "";
						S.Text = "CHECKING...";
						(B:Create(F, TweenInfo.new(.12), { BackgroundTransparency = .55 })):Play();
						task.spawn(function()
							local g = Instance.new("ImageLabel");
							g.Image = "rbxassetid://" .. a;
							g.Parent = u;
							local H = tick() + 4;
							repeat
								task.wait(.05);
							until g.IsLoaded or tick() > H;
							local i = g.IsLoaded;
							g:Destroy();
							if not u or not u.Parent then
								return;
							end;
							if i then
								table.insert(tj, a);
								saveMasaConfig();
								if h and h.Parent then
									local g = h:FindFirstChild("Frame") and h.Frame:FindFirstChild("Scroll");
									if g then
										P(g);
									end;
								end;
								u:Destroy();
							else
								r = false;
								Z.Text = "Invalid Asset Please Try Again";
								S.Text = "CONFIRM";
								(B:Create(F, TweenInfo.new(.12), { BackgroundTransparency = .28 })):Play();
							end;
						end);
					end;
					S.MouseButton1Click:Connect(U);
					m.FocusLost:Connect(function(g)
						if g then
							U();
						end;
					end);
					task.delay(.05, function()
						if m and m.Parent then
							m:CaptureFocus();
						end;
					end);
				end);
			end;
			c.Activated:Connect(function()
				if h and h.Parent then
					Q();
					return;
				end;
				h = Instance.new("ScreenGui");
				h.Name = "MasaHubCustomBgPicker";
				h.ResetOnSpawn = false;
				h.IgnoreGuiInset = true;
				h.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
				h.DisplayOrder = 9999;
				h.Parent = m;
				local g = Instance.new("Frame");
				g.Name = "Backdrop";
				g.Size = UDim2.new(1, 0, 1, 0);
				g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				g.BackgroundTransparency = .5;
				g.BorderSizePixel = 0;
				g.ZIndex = 1;
				g.Parent = h;
				local u = Instance.new("Frame");
				u.Name = "Frame";
				u.Size = UDim2.new(0, 380, 0, 520);
				u.Position = UDim2.new(.5, -190, .5, -260);
				u.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
				u.BorderSizePixel = 0;
				u.ZIndex = 2;
				u.Parent = h;
				corner(u, 16);
				stroke(u, Color3.fromRGB(90, 90, 105), 1.2, .3);
				local a = Instance.new("Frame");
				a.Name = "TitleBar";
				a.Size = UDim2.new(1, 0, 0, 48);
				a.Position = UDim2.new(0, 0, 0, 0);
				a.BackgroundColor3 = Color3.fromRGB(12, 12, 15);
				a.BackgroundTransparency = .15;
				a.BorderSizePixel = 0;
				a.ZIndex = 3;
				a.Parent = u;
				corner(a, 16);
				local H = Instance.new("TextLabel");
				H.Name = "Title";
				H.Size = UDim2.new(1, -60, 1, 0);
				H.Position = UDim2.new(0, 18, 0, 0);
				H.BackgroundTransparency = 1;
				H.Text = "BACKGROUND CHANGER";
				H.TextColor3 = Color3.fromRGB(255, 255, 255);
				H.Font = Enum.Font.GothamBlack;
				H.TextSize = 16;
				H.TextXAlignment = Enum.TextXAlignment.Left;
				H.ZIndex = 4;
				H.Parent = a;
				local i = Instance.new("TextButton");
				i.Name = "CloseBtn";
				i.Size = UDim2.new(0, 36, 0, 36);
				i.Position = UDim2.new(1, -44, 0, 6);
				i.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
				i.BackgroundTransparency = .1;
				i.BorderSizePixel = 0;
				i.Text = "X";
				i.TextColor3 = Color3.fromRGB(255, 255, 255);
				i.Font = Enum.Font.GothamBlack;
				i.TextSize = 14;
				i.AutoButtonColor = false;
				i.ZIndex = 4;
				i.Parent = a;
				corner(i, 10);
				stroke(i, Color3.fromRGB(90, 90, 105), 1, .4);
				i.MouseEnter:Connect(function()
					(B:Create(i, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(180, 50, 50) })):Play();
				end);
				i.MouseLeave:Connect(function()
					(B:Create(i, TweenInfo.new(.12), { BackgroundColor3 = Color3.fromRGB(25, 25, 28) })):Play();
				end);
				i.Activated:Connect(Q);
				local R = Instance.new("ScrollingFrame");
				R.Name = "Scroll";
				R.Size = UDim2.new(1, -16, 1, -64);
				R.Position = UDim2.new(0, 8, 0, 56);
				R.BackgroundTransparency = 1;
				R.BorderSizePixel = 0;
				R.ScrollBarThickness = 4;
				R.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90);
				R.CanvasSize = UDim2.new(0, 0, 0, 0);
				R.AutomaticCanvasSize = Enum.AutomaticSize.Y;
				R.ZIndex = 3;
				R.Parent = u;
				local O = Instance.new("UIGridLayout");
				O.CellSize = UDim2.new(0, 110, 0, 110);
				O.CellPadding = UDim2.new(0, 8, 0, 8);
				O.FillDirection = Enum.FillDirection.Horizontal;
				O.HorizontalAlignment = Enum.HorizontalAlignment.Center;
				O.SortOrder = Enum.SortOrder.LayoutOrder;
				O.Parent = R;
				local c = Instance.new("UIPadding", R);
				c.PaddingLeft = UDim.new(0, 8);
				c.PaddingTop = UDim.new(0, 8);
				c.PaddingRight = UDim.new(0, 8);
				c.PaddingBottom = UDim.new(0, 8);
				P(R);
				g.InputBegan:Connect(function(g)
					if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
						Q();
					end;
				end);
				u.Size = UDim2.new(0, 0, 0, 0);
				u.Position = UDim2.new(.5, 0, .5, 0);
				(B:Create(u, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 380, 0, 520), Position = UDim2.new(.5, -190, .5, -260) })):Play();
			end);
			_G.MasaCustomBgPreviewUpdate();
		end;
		_G.MasaFonts = _G.MasaFonts or {};
		_G.MasaFonts.orig = _G.MasaFonts.orig or {};
		_G.MasaFonts.conns = _G.MasaFonts.conns or {};
		_G.MasaFonts.size = _G.MasaFonts.size or {};
		_G.MasaFontChoice = _G.MasaFontChoice or "Default";
		_G.MasaFonts.WEIGHT_LABEL = {
				Thin = "Thin",
				ExtraLight = "ExLight",
				Light = "Light",
				Regular = "",
				Medium = "Medium",
				SemiBold = "SemiBold",
				Bold = "Bold",
				ExtraBold = "ExBold",
				Heavy = "Heavy",
			};
		function _G.MasaFonts.list()
			local g = _G.MasaFonts;
			if g.cache then
				return g.cache;
			end;
			local u = { { key = "Default", label = "Default", font = nil } };
			local B, a = {}, {};
			for g, u in ipairs(Enum.Font:GetEnumItems()) do
				if u.Name ~= "Unknown" then
					local g, H = pcall(function()
							return Font.fromEnum(u);
						end);
					if g and (H and (H.Family and not B[H.Family])) then
						B[H.Family] = true;
						local g = (tostring(H.Family)):match("([^/\\]+)%.json$") or (tostring(H.Family)):match("([^/\\]+)$") or u.Name;
						a[#a + 1] = { family = H.Family, nice = g };
					end;
				end;
			end;
			for B, a in ipairs(a) do
				for B, H in ipairs(Enum.FontWeight:GetEnumItems()) do
					for B, i in ipairs({ false, true }) do
						local R, O = pcall(function()
								return Font.new(a.family, H, i and Enum.FontStyle.Italic or Enum.FontStyle.Normal);
							end);
						if R and O then
							local B = g.WEIGHT_LABEL[H.Name] or H.Name;
							local R = a.nice;
							if B ~= "" then
								R = R .. (" " .. B);
							end;
							if i then
								R = R .. " Italic";
							end;
							u[#u + 1] = { key = a.family .. ("|" .. (H.Name .. ("|" .. ((i and "i" or "n"))))), label = R, font = O };
						end;
					end;
				end;
			end;
			g.cache = u;
			return u;
		end;
		function _G.MasaFonts.byKey(g)
			for u, B in ipairs(_G.MasaFonts.list()) do
				if B.key == g then
					return B;
				end;
			end;
			return nil;
		end;
		function _G.MasaFonts.roots()
			local g = {};
			if m then
				g[#g + 1] = m;
			end;
			local u = e.Character;
			local B = u and u:FindFirstChild("Head");
			local a = B and B:FindFirstChild("MasaHubOverheadInfo");
			if a then
				g[#g + 1] = a;
			end;
			return g;
		end;
		function _G.MasaFonts.isGlyph(g)
			local u = g.Text;
			if u == nil then
				return false;
			end;
			if string.match(u, "%w") then
				return false;
			end;
			local B, a = pcall(function()
					return utf8.len(u);
				end);
			return B and (a ~= nil and a <= 1);
		end;
		function _G.MasaFonts.applyOne(g, u)
			if not ((g:IsA("TextLabel") or g:IsA("TextButton") or g:IsA("TextBox"))) then
				return;
			end;
			if g:GetAttribute("AmbFontLock") then
				return;
			end;
			local B = _G.MasaFonts;
			if B.orig[g] == nil then
				B.orig[g] = g.FontFace;
				B.size[g] = g.TextSize;
			end;
			if B.isGlyph(g) then
				u = nil;
			end;
			pcall(function()
				g.FontFace = u or B.orig[g];
				if B.size[g] then
					g.TextSize = B.size[g];
				end;
			end);
		end;
		_G.MasaFonts.MIN_SIZE = 7;
		_G.MasaFonts.MARGIN = 8;
		_G.MasaFonts.MAX_GROW = 1.35;
		_G.MasaFonts.tconns = _G.MasaFonts.tconns or setmetatable({}, { __mode = "k" });
		_G.MasaFonts.lastLen = _G.MasaFonts.lastLen or setmetatable({}, { __mode = "k" });
		function _G.MasaFonts.params()
			local g = _G.MasaFonts;
			if g.gtbp == nil then
				local u, B = pcall(function()
						return Instance.new("GetTextBoundsParams");
					end);
				g.gtbp = (u and B) or false;
			end;
			return g.gtbp or nil;
		end;
		_G.MasaFonts.m = _G.MasaFonts.m or setmetatable({}, { __mode = "k" });
		_G.MasaFonts.aconns = _G.MasaFonts.aconns or setmetatable({}, { __mode = "k" });
		_G.MasaFonts.stamp = _G.MasaFonts.stamp or 0;
		function _G.MasaFonts.reclamp(g)
			local u = _G.MasaFonts;
			local B = u.m[g];
			if not B then
				return;
			end;
			if u.isGlyph(g) then
				if g.TextSize ~= B.base then
					g.TextSize = B.base;
				end;
				return;
			end;
			local a = B.s0;
			local H = g.AbsoluteSize;
			if H.X > 1 and H.Y > 1 then
				local i = g.AutomaticSize;
				local R = (i == Enum.AutomaticSize.X or i == Enum.AutomaticSize.XY);
				local O = (i == Enum.AutomaticSize.Y or i == Enum.AutomaticSize.XY);
				if not O then
					a = math.min(a, math.max(H.Y - 2, 1) / B.by);
				end;
				if not ((R or B.wrapped)) then
					a = math.min(a, math.max(H.X - math.min(u.MARGIN, H.X * .08), 1) / B.bx);
				end;
			end;
			local i = math.floor(B.base * a + .5);
			if i < u.MIN_SIZE then
				i = u.MIN_SIZE;
			end;
			if g.TextSize ~= i then
				g.TextSize = i;
			end;
		end;
		function _G.MasaFonts.measure(g)
			local u = _G.MasaFonts;
			local B = u.current();
			if not B then
				return false;
			end;
			local a = u.params();
			if not a then
				return false;
			end;
			u.tsvc = u.tsvc or game:GetService("TextService");
			local H = u.size[g];
			if not H then
				H = g.TextSize;
				u.size[g] = H;
			end;
			local i = g.Text;
			if i == nil or i == "" then
				u.m[g] = {
						base = H,
						bx = 1,
						by = 1,
						s0 = 1,
						stamp = u.stamp,
						text = i,
					};
				return true;
			end;
			local R = g.TextWrapped and g.AbsoluteSize.X > 1;
			a.Text = i;
			a.Size = H;
			a.Width = R and g.AbsoluteSize.X or 0;
			a.Font = B;
			local O, c = pcall(function()
					return u.tsvc:GetTextBoundsAsync(a);
				end);
			if not ((O and (c and (c.X > 0 and c.Y > 0)))) then
				return false;
			end;
			local h = 1;
			local Q = u.orig[g];
			if Q then
				a.Font = Q;
				local g, B = pcall(function()
						return u.tsvc:GetTextBoundsAsync(a);
					end);
				if g and (B and (B.X > 0 and B.Y > 0)) then
					h = R and (B.Y / c.Y) or (B.X / c.X);
				end;
			end;
			if h > u.MAX_GROW then
				h = u.MAX_GROW;
			end;
			u.m[g] = {
					base = H,
					bx = c.X,
					by = c.Y,
					s0 = h,
					wrapped = R,
					stamp = u.stamp,
					text = i,
				};
			return true;
		end;
		function _G.MasaFonts.fitOne(g)
			local u = _G.MasaFonts;
			if not u.current() then
				return;
			end;
			if g:GetAttribute("AmbFontLock") then
				return;
			end;
			if not ((g:IsA("TextLabel") or g:IsA("TextButton") or g:IsA("TextBox"))) then
				return;
			end;
			if g.TextScaled then
				return;
			end;
			if u.isGlyph(g) then
				return true;
			end;
			local B = u.m[g];
			if not ((B and (B.stamp == u.stamp and B.text == g.Text))) then
				if not u.measure(g) then
					return false;
				end;
			end;
			u.reclamp(g);
			return true;
		end;
		function _G.MasaFonts.watch(g)
			local u = _G.MasaFonts;
			if u.aconns[g] then
				return;
			end;
			u.aconns[g] = (g:GetPropertyChangedSignal("AbsoluteSize")):Connect(function()
					local u = _G.MasaFonts;
					if not u.current() then
						return;
					end;
					if u.m[g] then
						u.reclamp(g);
					else
						pcall(u.fitOne, g);
					end;
				end);
			if u.tconns[g] then
				return;
			end;
			u.tconns[g] = (g:GetPropertyChangedSignal("Text")):Connect(function()
					local u = _G.MasaFonts;
					if not u.current() then
						return;
					end;
					if u.lastLen[g] == #g.Text then
						return;
					end;
					u.lastLen[g] = #g.Text;
					pcall(u.applyOne, g, u.current());
					pcall(u.fitOne, g);
				end);
		end;
		function _G.MasaFonts.fit(g)
			local u = _G.MasaFonts;
			u.fitToken = ((u.fitToken or 0)) + 1;
			local B = u.fitToken;
			if not u.current() then
				return;
			end;
			u.tsvc = u.tsvc or game:GetService("TextService");
			task.spawn(function()
				local a = {};
				for g, u in ipairs(u.roots()) do
					for g, u in ipairs(u:GetDescendants()) do
						if ((u:IsA("TextLabel") or u:IsA("TextButton") or u:IsA("TextBox"))) and (not u.TextScaled and not u:GetAttribute("AmbFontLock")) then
							a[#a + 1] = u;
						end;
					end;
				end;
				for g, a in ipairs(a) do
					if u.fitToken ~= B then
						return;
					end;
					if a.Parent then
						u.fitOne(a);
						u.lastLen[a] = #a.Text;
						u.watch(a);
					end;
				end;
				g = ((tonumber(g) or 0)) + 1;
				if g < 3 then
					task.delay(g == 1 and .35 or 1.5, function()
						if u.fitToken ~= B then
							return;
						end;
						u.stamp = u.stamp + 1;
						u.fit(g);
					end);
				end;
			end);
		end;
		function _G.MasaFonts.current()
			local g = _G.MasaFontChoice;
			if not g or g == "Default" then
				return nil;
			end;
			local u = _G.MasaFonts.byKey(g);
			return u and u.font or nil;
		end;
		function _G.MasaFonts.applyAll()
			local g = _G.MasaFonts;
			local u = g.current();
			for B, a in ipairs(g.roots()) do
				g.applyOne(a, u);
				for B, a in ipairs(a:GetDescendants()) do
					g.applyOne(a, u);
				end;
			end;
			g.fit();
		end;
		function _G.MasaFonts.hook()
			local g = _G.MasaFonts;
			for g, u in ipairs(g.conns) do
				pcall(function()
					u:Disconnect();
				end);
			end;
			g.conns = {};
			for u, B in ipairs(g.roots()) do
				g.conns[#g.conns + 1] = B.DescendantAdded:Connect(function(u)
						if _G.MasaFontChoice == "Default" then
							return;
						end;
						g.applyOne(u, g.current());
						pcall(g.fitOne, u);
						pcall(g.watch, u);
					end);
			end;
		end;
		function _G.MasaFonts.set(g, u)
			_G.MasaFontChoice = g or "Default";
			_G.MasaFonts.stamp = ((_G.MasaFonts.stamp or 0)) + 1;
			_G.MasaFonts.applyAll();
			_G.MasaFonts.hook();
			if not u and saveMasaConfig then
				pcall(saveMasaConfig);
			end;
		end;
		task.spawn(function()
			pcall(_G.MasaFonts.list);
		end);
		if not _G.MasaFonts.charConn then
			_G.MasaFonts.charConn = e.CharacterAdded:Connect(function()
					task.delay(1.5, function()
						if _G.MasaFontChoice == "Default" then
							return;
						end;
						pcall(_G.MasaFonts.applyAll);
						pcall(_G.MasaFonts.hook);
					end);
				end);
		end;
		((function()
			local g = baseRow(Settings, "Custom Fonts", 3);
			g.Size = UDim2.new(1, -4, 0, 42);
			local u = Instance.new("Frame");
			u.Name = "CustomFontsBtnHolder";
			u.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			u.BackgroundTransparency = .28;
			u.BorderSizePixel = 0;
			u.Size = UDim2.new(0, 66, 0, 30);
			u.Position = UDim2.new(1, -73, .5, -15);
			u.ClipsDescendants = true;
			u.ZIndex = 6;
			u.Parent = g;
			corner(u, 15);
			stroke(u, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local a = Instance.new("UIGradient");
			a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			a.Rotation = 18;
			a.Parent = u;
			_G._MasaRegAccent(u, a, "pick");
			local H = Instance.new("TextButton");
			H.Name = "CustomFontsButton";
			H.BackgroundTransparency = 1;
			H.Text = "PICK";
			H.TextColor3 = HF.white;
			H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			H.TextStrokeTransparency = .3;
			H.TextSize = 12;
			H.Font = Enum.Font.GothamBlack;
			H.Size = UDim2.new(1, 0, 1, 0);
			H.BorderSizePixel = 0;
			H.ZIndex = 8;
			H.AutoButtonColor = false;
			H.Parent = u;
			H.MouseEnter:Connect(function()
				tween(u, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
			end);
			H.MouseLeave:Connect(function()
				tween(u, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
			end);
			local i = nil;
			local function R()
				if i and i.Parent then
					local g = B:Create(i.Frame, TweenInfo.new(.2), { BackgroundTransparency = 1 });
					g:Play();
					g.Completed:Connect(function()
						if i then
							pcall(function()
								i:Destroy();
							end);
							i = nil;
						end;
					end);
				end;
			end;
			_G.MasaFontPickerClose = R;
			H.Activated:Connect(function()
				if i and i.Parent then
					R();
					return;
				end;
				i = Instance.new("ScreenGui");
				i.Name = "MasaHubFontPicker";
				i.ResetOnSpawn = false;
				i.IgnoreGuiInset = true;
				i.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
				i.DisplayOrder = 9999;
				i.Parent = m;
				local g = i;
				local u = Instance.new("Frame");
				u.Name = "Backdrop";
				u.Size = UDim2.new(1, 0, 1, 0);
				u.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				u.BackgroundTransparency = .45;
				u.BorderSizePixel = 0;
				u.ZIndex = 1;
				u.Parent = g;
				local a = Instance.new("Frame");
				a.Name = "Frame";
				a.Size = UDim2.new(0, 380, 0, 520);
				a.Position = UDim2.new(.5, -190, .5, -260);
				a.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
				a.BorderSizePixel = 0;
				a.ZIndex = 2;
				a.Parent = g;
				corner(a, 16);
				stroke(a, Color3.fromRGB(90, 90, 105), 1.2, .3);
				local H = Instance.new("Frame");
				H.Name = "TitleBar";
				H.Size = UDim2.new(1, 0, 0, 48);
				H.Position = UDim2.new(0, 0, 0, 0);
				H.BackgroundColor3 = Color3.fromRGB(12, 12, 15);
				H.BackgroundTransparency = .15;
				H.BorderSizePixel = 0;
				H.ZIndex = 3;
				H.Parent = a;
				corner(H, 16);
				local O = Instance.new("TextLabel");
				O.Name = "Title";
				O.Size = UDim2.new(1, -60, 1, 0);
				O.Position = UDim2.new(0, 18, 0, 0);
				O.BackgroundTransparency = 1;
				O.Text = "SELECT FONT";
				O.TextColor3 = Color3.fromRGB(255, 255, 255);
				O.Font = Enum.Font.GothamBlack;
				O.TextSize = 16;
				O.TextXAlignment = Enum.TextXAlignment.Left;
				O.ZIndex = 4;
				O.Parent = H;
				local c = Instance.new("TextButton");
				c.Name = "CloseBtn";
				c.Size = UDim2.new(0, 36, 0, 36);
				c.Position = UDim2.new(1, -44, 0, 6);
				c.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
				c.BackgroundTransparency = .1;
				c.BorderSizePixel = 0;
				c.Text = "X";
				c.TextColor3 = Color3.fromRGB(255, 255, 255);
				c.Font = Enum.Font.GothamBlack;
				c.TextSize = 14;
				c.AutoButtonColor = false;
				c.ZIndex = 4;
				c.Parent = H;
				corner(c, 10);
				stroke(c, Color3.fromRGB(90, 90, 105), 1, .4);
				c.MouseEnter:Connect(function()
					tween(c, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
				end);
				c.MouseLeave:Connect(function()
					tween(c, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
				end);
				c.Activated:Connect(R);
				local h = Instance.new("ScrollingFrame");
				h.Name = "Scroll";
				h.Size = UDim2.new(1, -16, 1, -64);
				h.Position = UDim2.new(0, 8, 0, 56);
				h.BackgroundTransparency = 1;
				h.BorderSizePixel = 0;
				h.ScrollBarThickness = 4;
				h.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 90);
				h.ZIndex = 3;
				h.Parent = a;
				local Q, e, P = 3, 108, 10;
				local Z = e + P;
				local F = _G.MasaFonts.list();
				local S = math.ceil(#F / Q);
				h.CanvasSize = UDim2.new(0, 0, 0, 16 + S * Z);
				local r = {};
				local function U(g)
					local u = g:GetAttribute("FontIdx");
					return u and F[u] or nil;
				end;
				local function I()
					for g, u in ipairs(r) do
						local B = U(u);
						local a = (B ~= nil and _G.MasaFontChoice == B.key);
						local H = u:FindFirstChildOfClass("UIStroke");
						if H then
							tween(H, { Color = a and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(50, 50, 58), Transparency = a and 0 or .55, Thickness = a and 2.4 or 1.2 }, .12);
						end;
					end;
				end;
				local function X(g, u)
					local B = F[u];
					if not B then
						g:SetAttribute("FontIdx", nil);
						g.Visible = false;
						return;
					end;
					local a = math.floor(((u - 1)) / Q);
					local H = ((u - 1)) % Q;
					g.Position = UDim2.new(0, 10 + H * Z, 0, 8 + a * Z);
					g:SetAttribute("FontIdx", u);
					local i = g:FindFirstChild("Preview");
					if i then
						if B.font then
							i.FontFace = B.font;
						else
							i.Font = Enum.Font.GothamBlack;
						end;
					end;
					local R = g:FindFirstChild("FontName");
					if R then
						R.Text = B.label;
					end;
					g.Visible = true;
				end;
				for g = 1, ((math.ceil(456 / Z) + 2)) * Q, 1 do
					local u = Instance.new("TextButton");
					u.Name = "FontCard_" .. tostring(g);
					u.Size = UDim2.new(0, e, 0, e);
					u.BackgroundColor3 = Color3.fromRGB(14, 14, 18);
					u.BackgroundTransparency = 0;
					u.BorderSizePixel = 0;
					u.Text = "";
					u.AutoButtonColor = false;
					u.Visible = false;
					u.ZIndex = 4;
					u.ClipsDescendants = true;
					u.Parent = h;
					corner(u, 18);
					local B = Instance.new("UIStroke");
					B.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
					B.Color = Color3.fromRGB(50, 50, 58);
					B.Thickness = 1.2;
					B.Transparency = .55;
					B.Parent = u;
					local a = Instance.new("TextLabel");
					a.Name = "Preview";
					a.BackgroundTransparency = 1;
					a.Size = UDim2.new(1, -10, 0, 58);
					a.Position = UDim2.new(0, 5, 0, 8);
					a.Text = "Aa";
					a.TextColor3 = Color3.fromRGB(255, 255, 255);
					a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					a.TextStrokeTransparency = .4;
					a.TextSize = 34;
					a.Font = Enum.Font.GothamBlack;
					a.ZIndex = 5;
					a.Parent = u;
					a:SetAttribute("AmbFontLock", true);
					local H = Instance.new("TextLabel");
					H.Name = "FontName";
					H.Size = UDim2.new(1, -8, 0, 32);
					H.Position = UDim2.new(0, 4, 1, -36);
					H.BackgroundTransparency = 1;
					H.Text = "";
					H.TextColor3 = Color3.fromRGB(255, 255, 255);
					H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
					H.TextStrokeTransparency = .4;
					H.Font = Enum.Font.GothamBlack;
					H.TextSize = 9;
					H.TextWrapped = true;
					H.ZIndex = 6;
					H.Parent = u;
					H:SetAttribute("AmbFontLock", true);
					u.MouseEnter:Connect(function()
						tween(B, { Transparency = 0, Thickness = 2.4 }, .12);
						tween(a, { TextSize = 40 }, .12);
					end);
					u.MouseLeave:Connect(function()
						local g = U(u);
						local H = (g ~= nil and _G.MasaFontChoice == g.key);
						tween(B, { Transparency = H and 0 or .55, Thickness = H and 2.4 or 1.2 }, .12);
						tween(a, { TextSize = 34 }, .12);
					end);
					u.Activated:Connect(function()
						local g = U(u);
						if not g then
							return;
						end;
						_G.MasaFonts.set(g.key);
						I();
					end);
					r[#r + 1] = u;
				end;
				local w = -1;
				local function k()
					local g = math.max(0, math.floor(((h.CanvasPosition.Y - 8)) / Z) - 1);
					if g == w then
						return;
					end;
					w = g;
					for u, B in ipairs(r) do
						X(B, g * Q + u);
					end;
					I();
				end;
				(h:GetPropertyChangedSignal("CanvasPosition")):Connect(k);
				k();
				u.InputBegan:Connect(function(g)
					if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
						R();
					end;
				end);
				a.Size = UDim2.new(0, 0, 0, 0);
				a.Position = UDim2.new(.5, 0, .5, 0);
				(B:Create(a, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 380, 0, 520), Position = UDim2.new(.5, -190, .5, -260) })):Play();
			end);
		end))();
		((function()
			local g = #_G.MasaTitleStyles;
			local u = baseRow(Settings, "Title Style", 3);
			u.Visible = false;
			u.Size = UDim2.new(1, -4, 0, 0);
			u.Visible = false;
			u.Size = UDim2.new(1, -4, 0, 0);
			local B = u:FindFirstChild("Label");
			if B then
				B.Size = UDim2.new(1, -162, 1, 0);
			end;
			local a = Instance.new("TextButton");
			a.Name = "TitleStylePrev";
			a.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			a.BackgroundTransparency = .1;
			a.BorderSizePixel = 0;
			a.Text = "\226\151\128";
			a.TextColor3 = Color3.fromRGB(245, 245, 255);
			a.TextSize = 12;
			a.Font = Enum.Font.GothamBlack;
			a.AutoButtonColor = false;
			a.Size = UDim2.new(0, 24, 0, 24);
			a.Position = UDim2.new(1, -146, .5, -12);
			a.ZIndex = 6;
			a.Parent = u;
			corner(a, 7);
			stroke(a, HF.strokeSoft, 1, .5);
			local H = Instance.new("Frame");
			H.Name = "TitleStylePreview";
			H.BackgroundTransparency = 1;
			H.BorderSizePixel = 0;
			H.Size = UDim2.new(0, 82, 0, 36);
			H.Position = UDim2.new(1, -118, .5, -18);
			H.ClipsDescendants = true;
			H.ZIndex = 6;
			H.Parent = u;
			local i = Instance.new("ImageLabel");
			i.Name = "Img";
			i.BackgroundTransparency = 1;
			i.AnchorPoint = Vector2.new(.5, .5);
			i.Position = UDim2.new(.5, 0, .5, 0);
			i.Size = UDim2.new(1, 0, 1, 0);
			i.ScaleType = Enum.ScaleType.Fit;
			i.ZIndex = 7;
			i.Parent = H;
			local R = Instance.new("TextButton");
			R.Name = "TitleStyleNext";
			R.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			R.BackgroundTransparency = .1;
			R.BorderSizePixel = 0;
			R.Text = "\226\150\182";
			R.TextColor3 = Color3.fromRGB(245, 245, 255);
			R.TextSize = 12;
			R.Font = Enum.Font.GothamBlack;
			R.AutoButtonColor = false;
			R.Size = UDim2.new(0, 24, 0, 24);
			R.Position = UDim2.new(1, -36, .5, -12);
			R.ZIndex = 6;
			R.Parent = u;
			corner(R, 7);
			stroke(R, HF.strokeSoft, 1, .5);
			local function O()
				local u = math.clamp(math.floor(tonumber(_G.MasaTitleStyle) or 1), 1, g);
				local B = _G.MasaTitleStyles[u];
				if B then
					i.Image = B.image;
					local g = tonumber(B.prev) or 1;
					i.Size = UDim2.new(g, 0, g, 0);
				end;
			end;
			_G.MasaRefreshTitleStyleSelector = O;
			local function c(u)
				local B = math.clamp(math.floor(tonumber(_G.MasaTitleStyle) or 1), 1, g);
				B = ((((B - 1) + u)) % g) + 1;
				if _G.MasaApplyTitleStyle then
					_G.MasaApplyTitleStyle(B);
				end;
				O();
				saveMasaConfig();
			end;
			a.MouseButton1Click:Connect(function()
				c(-1);
			end);
			R.MouseButton1Click:Connect(function()
				c(1);
			end);
			O();
		end))();
		function stepperRow(g, u, B, a, H, i, R)
			local O = Instance.new("Frame");
			O.Name = u;
			O.BackgroundColor3 = HF.row;
			O.BackgroundTransparency = .22;
			O.Size = UDim2.new(1, -4, 0, 42);
			O.BorderSizePixel = 0;
			O.LayoutOrder = a;
			O.ZIndex = 4;
			O.Parent = g;
			corner(O, 10);
			stroke(O, HF.strokeSoft, 1.15, .32);
			local c = Instance.new("TextLabel");
			c.Name = "Label";
			c.BackgroundTransparency = 1;
			c.Text = u;
			c.TextColor3 = Color3.fromRGB(245, 245, 255);
			c.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			c.TextStrokeTransparency = .25;
			c.TextSize = 11;
			c.Font = Enum.Font.GothamMedium;
			c.TextXAlignment = Enum.TextXAlignment.Left;
			c.Position = UDim2.new(0, 12, 0, 0);
			c.Size = UDim2.new(1, -155, 1, 0);
			c.ZIndex = 5;
			c.Parent = O;
			local h = B;
			local Q = Instance.new("TextButton");
			Q.Name = "Minus";
			Q.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			Q.BackgroundTransparency = .1;
			Q.BorderSizePixel = 0;
			Q.Text = "-";
			Q.TextColor3 = Color3.fromRGB(245, 245, 255);
			Q.TextSize = 14;
			Q.Font = Enum.Font.GothamBlack;
			Q.AutoButtonColor = false;
			Q.Size = UDim2.new(0, 28, 0, 26);
			Q.Position = UDim2.new(1, -118, .5, -13);
			Q.ZIndex = 6;
			Q.Parent = O;
			corner(Q, 7);
			stroke(Q, HF.strokeSoft, 1, .5);
			local e = Instance.new("TextLabel");
			e.Name = "Value";
			e.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			e.BackgroundTransparency = .05;
			e.BorderSizePixel = 0;
			e.Text = string.format("%.2f", h);
			e.TextColor3 = Color3.fromRGB(245, 245, 255);
			e.TextSize = 13;
			e.Font = Enum.Font.GothamBlack;
			e.TextXAlignment = Enum.TextXAlignment.Center;
			e.Size = UDim2.new(0, 48, 0, 26);
			e.Position = UDim2.new(1, -84, .5, -13);
			e.ZIndex = 6;
			e.Parent = O;
			corner(e, 7);
			stroke(e, HF.strokeSoft, 1, .5);
			local P = Instance.new("TextButton");
			P.Name = "Plus";
			P.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			P.BackgroundTransparency = .1;
			P.BorderSizePixel = 0;
			P.Text = "+";
			P.TextColor3 = Color3.fromRGB(245, 245, 255);
			P.TextSize = 14;
			P.Font = Enum.Font.GothamBlack;
			P.AutoButtonColor = false;
			P.Size = UDim2.new(0, 28, 0, 26);
			P.Position = UDim2.new(1, -30, .5, -13);
			P.ZIndex = 6;
			P.Parent = O;
			corner(P, 7);
			stroke(P, HF.strokeSoft, 1, .5);
			local function m(g)
				h = math.clamp(math.floor((g * 100) + .5) / 100, i or .5, R or 1.5);
				e.Text = string.format("%.2f", h);
				if H then
					H(h);
				end;
			end;
			Q.MouseButton1Click:Connect(function()
				m(h - .05);
			end);
			P.MouseButton1Click:Connect(function()
				m(h + .05);
			end);
			return O;
		end;
		stepperRow(Settings, "GUI Scale", Ej, 4, function(g)
			Ej = g;
			masaMainScale.Scale = g;
			saveMasaConfig();
		end, .5, 1.5);
		stepperRow(Settings, "Progress Bar Size", Nj, 5, function(g)
			Nj = g;
			KF();
			saveMasaConfig();
		end, .5, 1.5);
		speedKeybindRow(Settings, "Toggle UI", "ToggleUI", 6);
		section(Settings, "FLOAT UI", 6.5);
		do
			local g, u = _G.MasaActionToggleRow(Settings, "Show Float UI", _G.MasaFloatUiVisible ~= false, 6.6);
			local B = g and g:FindFirstChild("ToggleButton");
			if B then
				B.Activated:Connect(function()
					local g = not ((_G.MasaFloatUiVisible ~= false));
					_G.MasaFloatUiVisible = g;
					if _G.MasaSetFloatUiVisible then
						_G.MasaSetFloatUiVisible(g);
					end;
					if u then
						u(g);
					end;
					saveMasaConfig();
				end);
			end;
			if u then
				u(_G.MasaFloatUiVisible ~= false);
			end;
		end;
		section(Settings, "MOBILE BUTTONS", 7);
		do
			local g = {
					"Rectangle",
					"Rounded",
					"Pill",
					"Circle",
				};
			local u = {
					"\226\150\173 Rectangle",
					"\226\151\137 Rounded",
					"\226\150\172 Pill",
					"\226\151\143 Circle",
				};
			local B = false;
			local a = Instance.new("Frame");
			a.Name = "Button Shape";
			a.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			a.BackgroundTransparency = 0;
			a.Size = UDim2.new(1, -4, 0, 42);
			a.BorderSizePixel = 0;
			a.LayoutOrder = 7.5;
			a.ZIndex = 4;
			a.Parent = Settings;
			corner(a, 10);
			stroke(a, Color3.fromRGB(255, 160, 200), 1.15, .12);
			do
				local g = Instance.new("UIGradient");
				g.Rotation = 0;
				g.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 220, 235)) });
				g.Parent = a;
			end;
			local H = Instance.new("TextLabel");
			H.BackgroundTransparency = 1;
			H.Text = "Button Shape";
			H.TextColor3 = Color3.fromRGB(12, 74, 110);
			H.TextSize = 12;
			H.Font = Enum.Font.GothamSemibold;
			H.TextXAlignment = Enum.TextXAlignment.Left;
			H.Position = UDim2.new(0, 12, 0, 0);
			H.Size = UDim2.new(0, 110, 1, 0);
			H.ZIndex = 5;
			H.Parent = a;
			local i = Instance.new("TextLabel");
			i.Name = "ShapePreviewLbl";
			i.BackgroundTransparency = 1;
			i.TextColor3 = Color3.fromRGB(220, 60, 140);
			i.TextSize = 10;
			i.Font = Enum.Font.GothamBold;
			i.TextXAlignment = Enum.TextXAlignment.Right;
			i.Position = UDim2.new(1, -46, 0, 0);
			i.Size = UDim2.new(0, 90, 1, 0);
			i.ZIndex = 5;
			i.Parent = a;
			local R = Instance.new("TextButton");
			R.Name = "ShapeArrow";
			R.BackgroundColor3 = Color3.fromRGB(255, 220, 235);
			R.BackgroundTransparency = .1;
			R.BorderSizePixel = 0;
			R.Size = UDim2.new(0, 28, 0, 26);
			R.Position = UDim2.new(1, -36, .5, -13);
			R.Text = "\226\150\182";
			R.TextColor3 = Color3.fromRGB(220, 60, 140);
			R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			R.TextStrokeTransparency = .5;
			R.TextSize = 12;
			R.Font = Enum.Font.GothamBold;
			R.AutoButtonColor = false;
			R.ZIndex = 6;
			R.Parent = a;
			corner(R, 7);
			stroke(R, Color3.fromRGB(255, 105, 180), 1.1, .3);
			local O = Instance.new("Frame");
			O.Name = "Shape Selector";
			O.BackgroundColor3 = Color3.fromRGB(10, 14, 26);
			O.BackgroundTransparency = .28;
			O.Size = UDim2.new(1, -4, 0, 42);
			O.BorderSizePixel = 0;
			O.LayoutOrder = 7.6;
			O.ZIndex = 4;
			O.ClipsDescendants = true;
			O.Visible = false;
			O.Parent = Settings;
			corner(O, 14);
			stroke(O, Color3.fromRGB(255, 160, 200), 1.4, .32);
			local c = Instance.new("Frame");
			c.Name = "SelectedSlide";
			c.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			c.BackgroundTransparency = .1;
			c.Size = UDim2.new(.25, -6, 1, -8);
			c.Position = UDim2.new(0, 4, 0, 4);
			c.BorderSizePixel = 0;
			c.ZIndex = 5;
			c.Parent = O;
			corner(c, 13);
			do
				local g = Instance.new("UIStroke");
				g.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				g.Color = Color3.fromRGB(235, 235, 245);
				g.Thickness = 1;
				g.Transparency = .08;
				g.Parent = c;
				local u = Instance.new("UIGradient");
				u.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 165, 250)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 140)) });
				u.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
				u.Parent = c;
				if _G._MasaRegAccent then
					_G._MasaRegAccent(c, u, "slide");
				end;
			end;
			local h = {};
			for g, B in ipairs(g) do
				local a = Instance.new("TextLabel");
				a.Name = "ShapeLbl_" .. B;
				a.BackgroundTransparency = 1;
				a.Text = u[g];
				a.TextColor3 = Color3.fromRGB(255, 255, 255);
				a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				a.TextStrokeTransparency = .2;
				a.TextSize = 10;
				a.Font = Enum.Font.GothamBlack;
				a.TextXAlignment = Enum.TextXAlignment.Center;
				a.Size = UDim2.new(.25, 0, 1, 0);
				a.Position = UDim2.new(((g - 1)) / 4, 0, 0, 0);
				a.ZIndex = 8;
				a.Parent = O;
				local H = Instance.new("TextButton");
				H.Name = "ShapeClick_" .. B;
				H.BackgroundTransparency = 1;
				H.Text = "";
				H.AutoButtonColor = false;
				H.Size = UDim2.new(.25, 0, 1, 0);
				H.Position = UDim2.new(((g - 1)) / 4, 0, 0, 0);
				H.ZIndex = 10;
				H.Parent = O;
				h[g] = { lbl = a, clk = H, sh = B };
			end;
			local function Q(g)
				if g == 1 then
					return UDim2.new(0, 4, 0, 4);
				end;
				if g == 2 then
					return UDim2.new(.25, -1, 0, 4);
				end;
				if g == 3 then
					return UDim2.new(.5, -1, 0, 4);
				end;
				return UDim2.new(.75, -6, 0, 4);
			end;
			local function e(B)
				local a = 1;
				for g, u in ipairs(g) do
					if u == B then
						a = g;
						break;
					end;
				end;
				tween(c, { Position = Q(a) }, .18);
				for g, u in ipairs(h) do
					tween(u.lbl, { TextTransparency = (g == a) and 0 or .5, TextStrokeTransparency = (g == a) and .2 or .38 }, .14);
				end;
				i.Text = u[a];
			end;
			for g, u in ipairs(h) do
				local B = u.sh;
				u.clk.MouseButton1Click:Connect(function()
					_G.MasaButtonShape = B;
					if _G.MasaApplyButtonShape then
						pcall(_G.MasaApplyButtonShape);
					end;
					e(B);
					if _G.MasaRefreshAllShapeRows then
						pcall(_G.MasaRefreshAllShapeRows);
					end;
					saveMasaConfig();
				end);
			end;
			local function P(g)
				B = g;
				if _G._MasaExpand then
					_G._MasaExpand(O, g, 42, R);
				else
					O.Visible = g;
					tween(R, { Rotation = g and 90 or 0 }, .18);
				end;
			end;
			R.Activated:Connect(function()
				P(not B);
			end);
			a.MouseEnter:Connect(function()
				tween(a, { BackgroundColor3 = Color3.fromRGB(255, 192, 203) });
			end);
			a.MouseLeave:Connect(function()
				tween(a, { BackgroundColor3 = Color3.fromRGB(255, 255, 255) });
			end);
			e(_G.MasaButtonShape or "Rectangle");
			if not _G._MasaShapeRowRefreshers then
				_G._MasaShapeRowRefreshers = {};
			end;
			table.insert(_G._MasaShapeRowRefreshers, function()
				e(_G.MasaButtonShape or "Rectangle");
			end);
			_G.MasaRefreshAllShapeRows = function()
					for g, u in ipairs(_G._MasaShapeRowRefreshers) do
						pcall(u);
					end;
				end;
		end;
		stepperRow(Settings, "Mobile Buttons Size", tonumber(_G.MasaMobileButtonScale) or .75, 10, function(g)
			_G.MasaMobileButtonScale = math.clamp(tonumber(g) or .35, .3, 1.35);
			if _G.MasaApplyMobileButtonSize then
				_G.MasaApplyMobileButtonSize();
			end;
			saveMasaConfig();
		end, .3, 1.35);
		do
			local g = baseRow(Settings, "Reset Mobile Buttons", 11);
			local u = Instance.new("Frame");
			u.Name = "ResetMobileButtonsBg";
			u.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			u.BackgroundTransparency = 0;
			u.BorderSizePixel = 0;
			u.Size = UDim2.new(0, 78, 0, 24);
			u.Position = UDim2.new(1, -88, .5, -12);
			u.ZIndex = 7;
			u.Parent = g;
			corner(u, 12);
			stroke(u, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local B = Instance.new("TextButton");
			B.Name = "ResetMobileButtons";
			B.BackgroundTransparency = 1;
			B.BorderSizePixel = 0;
			B.Text = "RESET";
			B.TextColor3 = Color3.fromRGB(255, 255, 255);
			B.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			B.TextStrokeTransparency = .3;
			B.TextSize = 12;
			B.Font = Enum.Font.GothamBlack;
			B.AutoButtonColor = false;
			B.Size = UDim2.new(1, 0, 1, 0);
			B.Position = UDim2.new(0, 0, 0, 0);
			B.ZIndex = 8;
			B.Parent = u;
			local a = Instance.new("UIGradient");
			a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			a.Rotation = 18;
			a.Parent = u;
			_G._MasaRegAccent(u, a, "button");
			B.MouseEnter:Connect(function()
				tween(u, { Size = UDim2.new(0, 82, 0, 26), Position = UDim2.new(1, -90, .5, -13) }, .12);
			end);
			B.MouseLeave:Connect(function()
				tween(u, { Size = UDim2.new(0, 78, 0, 24), Position = UDim2.new(1, -88, .5, -12) }, .12);
			end);
			B.Activated:Connect(function()
				if _G.MasaResetMobileButtons then
					_G.MasaResetMobileButtons();
				else
					_G.MasaMobileButtonScale = .75;
					_G.MasaHideMobileButtons = false;
					if _G.MasaApplyMobileButtonsHidden then
						_G.MasaApplyMobileButtonsHidden();
					end;
					if _G.MasaApplyMobileButtonSize then
						_G.MasaApplyMobileButtonSize();
					end;
					saveMasaConfig();
				end;
			end);
		end;
		section(Settings, "INTRO", 50);
		do
			local g, u = toggleRow(Settings, "Intro", _introEnabled, 51);
			setIntroVisual = u;
			local B = g and g:FindFirstChild("ToggleButton");
			if B then
				B.Activated:Connect(function()
					_introEnabled = not _introEnabled;
					if not _introEnabled then
						stopIntroPlayback();
						stopIntroPreview();
					end;
					if setIntroVisual then
						setIntroVisual(_introEnabled);
					end;
					saveMasaConfig();
				end);
			end;
			if setIntroVisual then
				setIntroVisual(_introEnabled);
			end;
		end;
		do
			local g = Instance.new("Frame");
			g.Name = "Intro Song";
			g.BackgroundColor3 = HF.row;
			g.BackgroundTransparency = .22;
			g.Size = UDim2.new(1, -4, 0, 42);
			g.BorderSizePixel = 0;
			g.LayoutOrder = 52;
			g.ZIndex = 4;
			g.Parent = Settings;
			corner(g, 10);
			stroke(g, HF.strokeSoft, 1.15, .32);
			local u = Instance.new("TextLabel");
			u.Name = "Label";
			u.BackgroundTransparency = 1;
			u.Text = "Intro Song";
			u.TextColor3 = Color3.fromRGB(245, 245, 255);
			u.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			u.TextStrokeTransparency = .25;
			u.TextSize = 11;
			u.Font = Enum.Font.GothamMedium;
			u.TextXAlignment = Enum.TextXAlignment.Left;
			u.Position = UDim2.new(0, 12, 0, 0);
			u.Size = UDim2.new(1, -145, 1, 0);
			u.ZIndex = 5;
			u.Parent = g;
			local B = Instance.new("Frame");
			B.Name = "IntroSongBg";
			B.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			B.BackgroundTransparency = 0;
			B.BorderSizePixel = 0;
			B.Size = UDim2.new(0, 120, 0, 30);
			B.Position = UDim2.new(1, -130, .5, -15);
			B.ClipsDescendants = true;
			B.ZIndex = 6;
			B.Parent = g;
			corner(B, 15);
			stroke(B, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local a = Instance.new("TextButton");
			a.Name = "Intro Song Button";
			a.BackgroundTransparency = 1;
			a.BorderSizePixel = 0;
			a.Text = getIntroSongName();
			a.TextColor3 = Color3.fromRGB(255, 255, 255);
			a.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			a.TextStrokeTransparency = .3;
			a.TextSize = 12;
			a.Font = Enum.Font.GothamBlack;
			a.AutoButtonColor = false;
			a.Size = UDim2.new(1, 0, 1, 0);
			a.Position = UDim2.new(0, 0, 0, 0);
			a.ZIndex = 7;
			a.Parent = B;
			local H = Instance.new("UIGradient");
			H.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			H.Rotation = 18;
			H.Parent = B;
			_G._MasaRegAccent(B, H, "button");
			a.MouseEnter:Connect(function()
				tween(B, { Size = UDim2.new(0, 126, 0, 32), Position = UDim2.new(1, -133, .5, -16) }, .12);
			end);
			a.MouseLeave:Connect(function()
				tween(B, { Size = UDim2.new(0, 120, 0, 30), Position = UDim2.new(1, -130, .5, -15) }, .12);
			end);
			setIntroSongVisual = function()
					if a and a.Parent then
						a.Text = getIntroSongName();
						a.TextColor3 = Color3.fromRGB(255, 255, 255);
					end;
				end;
			a.MouseButton1Click:Connect(function()
				selectedIntroMusic = selectedIntroMusic + 1;
				if selectedIntroMusic > #INTRO_MUSIC_OPTIONS then
					selectedIntroMusic = 1;
				end;
				if setIntroSongVisual then
					setIntroSongVisual();
				end;
				previewIntroMusic(selectedIntroMusic);
				saveMasaConfig();
			end);
		end;
		section(Settings, "MUSIC PLAYER", 53);
		do
			local g = baseRow(Settings, "Music Player", 54);
			g.Size = UDim2.new(1, -4, 0, 42);
			local u = Instance.new("Frame");
			u.Name = "MusicPlayerButtonHolder";
			u.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			u.BackgroundTransparency = .28;
			u.BorderSizePixel = 0;
			u.Size = UDim2.new(0, 66, 0, 30);
			u.Position = UDim2.new(1, -73, .5, -15);
			u.ClipsDescendants = true;
			u.ZIndex = 9;
			u.Parent = g;
			corner(u, 15);
			stroke(u, Color3.fromRGB(255, 170, 210), 1.5, .15);
			local a = Instance.new("UIGradient");
			a.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
			a.Rotation = 18;
			a.Parent = u;
			_G._MasaRegAccent(u, a, "pick");
			local H = Instance.new("TextButton");
			H.Name = "MusicPlayerPickBtn";
			H.BackgroundTransparency = 1;
			H.Text = "PICK";
			H.TextColor3 = HF.white;
			H.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			H.TextStrokeTransparency = .3;
			H.TextSize = 12;
			H.Font = Enum.Font.GothamBlack;
			H.TextXAlignment = Enum.TextXAlignment.Center;
			H.Size = UDim2.new(1, 0, 1, 0);
			H.Position = UDim2.new(0, 0, 0, 0);
			H.BorderSizePixel = 0;
			H.ZIndex = 10;
			H.AutoButtonColor = false;
			H.Parent = u;
			H.MouseEnter:Connect(function()
				tween(u, { Size = UDim2.new(0, 72, 0, 32), Position = UDim2.new(1, -76, .5, -16) }, .12);
			end);
			H.MouseLeave:Connect(function()
				tween(u, { Size = UDim2.new(0, 66, 0, 30), Position = UDim2.new(1, -73, .5, -15) }, .12);
			end);
			local i = nil;
			local function R()
				_G.MasaMusicRefreshUI = nil;
				if i and i.Parent then
					local g = i:FindFirstChild("Frame");
					if g then
						(B:Create(g, TweenInfo.new(.2), { BackgroundTransparency = 1 })):Play();
					end;
					local u = i;
					i = nil;
					task.delay(.25, function()
						pcall(function()
							if u and u.Parent then
								u:Destroy();
							end;
						end);
					end);
				else
					i = nil;
				end;
			end;
			_G.MasaMusicCloseUI = R;
			local function O(g)
				g = math.max(0, math.floor(tonumber(g) or 0));
				return string.format("%d:%02d", math.floor(g / 60), g % 60);
			end;
			local function c(g, u, B, a, H, i)
				local R = Instance.new("TextButton");
				R.Name = u;
				R.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
				R.BackgroundTransparency = .05;
				R.BorderSizePixel = 0;
				R.Text = B;
				R.TextColor3 = Color3.fromRGB(245, 245, 255);
				R.TextSize = i or 13;
				R.Font = Enum.Font.GothamBlack;
				R.TextXAlignment = Enum.TextXAlignment.Center;
				R.TextYAlignment = Enum.TextYAlignment.Center;
				R.AutoButtonColor = false;
				R.Size = a;
				R.Position = H;
				R.ZIndex = 6;
				R.Parent = g;
				corner(R, 10);
				stroke(R, Color3.fromRGB(90, 90, 105), 1, .5);
				R.MouseEnter:Connect(function()
					tween(R, { BackgroundColor3 = Color3.fromRGB(30, 30, 40) }, .1);
				end);
				R.MouseLeave:Connect(function()
					tween(R, { BackgroundColor3 = Color3.fromRGB(8, 8, 14) }, .1);
				end);
				return R;
			end;
			local function h(g, u, B, a, H)
				local i = Instance.new("Frame");
				i.Name = u;
				i.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
				i.BackgroundTransparency = .1;
				i.BorderSizePixel = 0;
				i.Size = UDim2.new(1, -24, 0, 36);
				i.Position = UDim2.new(0, 12, 0, H);
				i.ZIndex = 4;
				i.Parent = g;
				corner(i, 9);
				stroke(i, Color3.fromRGB(90, 90, 105), 1, .45);
				local R = Instance.new("TextLabel");
				R.BackgroundTransparency = 1;
				R.Text = u;
				R.TextColor3 = Color3.fromRGB(245, 245, 255);
				R.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				R.TextStrokeTransparency = .35;
				R.Font = Enum.Font.GothamBold;
				R.TextSize = 12;
				R.TextXAlignment = Enum.TextXAlignment.Left;
				R.Position = UDim2.new(0, 12, 0, 0);
				R.Size = UDim2.new(1, -92, 1, 0);
				R.ZIndex = 5;
				R.Parent = i;
				local O = Instance.new("Frame");
				O.Name = "PillBg";
				O.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
				O.BackgroundTransparency = 0;
				O.BorderSizePixel = 0;
				O.Size = UDim2.new(0, 60, 0, 24);
				O.Position = UDim2.new(1, -72, .5, -12);
				O.ZIndex = 5;
				O.Parent = i;
				corner(O, 12);
				local c = Instance.new("UIStroke");
				c.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
				c.Color = Color3.fromRGB(90, 90, 105);
				c.Thickness = 1;
				c.Transparency = .5;
				c.Parent = O;
				local h = Instance.new("UIGradient");
				h.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
				h.Rotation = 18;
				h.Enabled = false;
				h.Parent = O;
				_G._MasaRegAccent(O, h, "toggle");
				local Q = Instance.new("TextButton");
				Q.Name = "Pill";
				Q.BackgroundTransparency = 1;
				Q.BorderSizePixel = 0;
				Q.Text = "OFF";
				Q.TextColor3 = Color3.fromRGB(180, 180, 180);
				Q.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				Q.TextStrokeTransparency = .35;
				Q.TextSize = 11;
				Q.Font = Enum.Font.GothamBlack;
				Q.AutoButtonColor = false;
				Q.Size = UDim2.new(0, 60, 0, 24);
				Q.Position = UDim2.new(1, -72, .5, -12);
				Q.ZIndex = 7;
				Q.Parent = i;
				corner(Q, 12);
				local function e(g)
					local u = _G._MasaAccentIsGrey and _G._MasaAccentIsGrey() or false;
					local B, a = Color3.fromRGB(255, 105, 180), Color3.fromRGB(255, 170, 210);
					if _G._MasaToggleOnColor then
						local g, u = _G._MasaToggleOnColor();
						if g then
							B = g;
						end;
						if u then
							a = u;
						end;
					end;
					if g then
						Q.Text = "ON";
						Q.TextColor3 = Color3.fromRGB(255, 255, 255);
						O.BackgroundColor3 = B;
						h.Enabled = true;
						c.Color = a;
						c.Transparency = .15;
					else
						Q.Text = "OFF";
						Q.TextColor3 = Color3.fromRGB(180, 180, 180);
						O.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
						h.Enabled = false;
						c.Color = Color3.fromRGB(90, 90, 105);
						c.Transparency = .5;
					end;
				end;
				e(B() == true);
				Q.MouseButton1Click:Connect(function()
					local g = not ((B() == true));
					a(g);
					e(g);
				end);
				Q.MouseEnter:Connect(function()
					tween(O, { Size = UDim2.new(0, 66, 0, 28), Position = UDim2.new(1, -75, .5, -14) }, .12);
					tween(Q, { Size = UDim2.new(0, 66, 0, 28), Position = UDim2.new(1, -75, .5, -14) }, .12);
				end);
				Q.MouseLeave:Connect(function()
					tween(O, { Size = UDim2.new(0, 60, 0, 24), Position = UDim2.new(1, -72, .5, -12) }, .12);
					tween(Q, { Size = UDim2.new(0, 60, 0, 24), Position = UDim2.new(1, -72, .5, -12) }, .12);
				end);
				return i, e;
			end;
			H.MouseButton1Click:Connect(function()
				if i and i.Parent then
					R();
					return;
				end;
				i = Instance.new("ScreenGui");
				i.Name = "MasaHubMusicPlayer";
				i.ResetOnSpawn = false;
				i.IgnoreGuiInset = true;
				i.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
				i.DisplayOrder = 9999;
				i.Parent = m;
				local g = Instance.new("Frame");
				g.Name = "Backdrop";
				g.Size = UDim2.new(1, 0, 1, 0);
				g.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				g.BackgroundTransparency = .5;
				g.BorderSizePixel = 0;
				g.ZIndex = 1;
				g.Parent = i;
				local u, a = 340, 418;
				local H = Instance.new("Frame");
				H.Name = "Frame";
				H.Size = UDim2.new(0, u, 0, a);
				H.Position = UDim2.new(.5, -u / 2, .5, -a / 2);
				H.BackgroundColor3 = Color3.fromRGB(10, 10, 12);
				H.BorderSizePixel = 0;
				H.ZIndex = 2;
				H.Parent = i;
				corner(H, 16);
				stroke(H, Color3.fromRGB(90, 90, 105), 1.2, .3);
				local Q = Instance.new("Frame");
				Q.Name = "TitleBar";
				Q.Size = UDim2.new(1, 0, 0, 48);
				Q.BackgroundColor3 = Color3.fromRGB(14, 14, 17);
				Q.BackgroundTransparency = .1;
				Q.BorderSizePixel = 0;
				Q.ZIndex = 3;
				Q.Parent = H;
				corner(Q, 16);
				local e = Instance.new("TextLabel");
				e.Name = "Title";
				e.Size = UDim2.new(1, -60, 1, 0);
				e.Position = UDim2.new(0, 16, 0, 0);
				e.BackgroundTransparency = 1;
				e.Text = "MUSIC PLAYER";
				e.TextColor3 = Color3.fromRGB(255, 255, 255);
				e.Font = Enum.Font.GothamBlack;
				e.TextSize = 14;
				e.TextXAlignment = Enum.TextXAlignment.Left;
				e.ZIndex = 4;
				e.Parent = Q;
				local P = Instance.new("TextButton");
				P.Name = "CloseBtn";
				P.Size = UDim2.new(0, 32, 0, 32);
				P.Position = UDim2.new(1, -40, 0, 8);
				P.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
				P.BorderSizePixel = 0;
				P.Text = "X";
				P.TextColor3 = Color3.fromRGB(255, 255, 255);
				P.Font = Enum.Font.GothamBlack;
				P.TextSize = 13;
				P.AutoButtonColor = false;
				P.ZIndex = 4;
				P.Parent = Q;
				corner(P, 8);
				stroke(P, Color3.fromRGB(90, 90, 105), 1, .4);
				P.MouseEnter:Connect(function()
					tween(P, { BackgroundColor3 = Color3.fromRGB(180, 50, 50) }, .12);
				end);
				P.MouseLeave:Connect(function()
					tween(P, { BackgroundColor3 = Color3.fromRGB(25, 25, 28) }, .12);
				end);
				P.Activated:Connect(R);
				local Z = Instance.new("TextLabel");
				Z.Name = "SongName";
				Z.BackgroundTransparency = 1;
				Z.Text = getMusicSongName();
				Z.TextColor3 = Color3.fromRGB(255, 255, 255);
				Z.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				Z.TextStrokeTransparency = .35;
				Z.Font = Enum.Font.GothamBlack;
				Z.TextSize = 16;
				Z.TextScaled = false;
				Z.TextTruncate = Enum.TextTruncate.AtEnd;
				Z.TextXAlignment = Enum.TextXAlignment.Center;
				Z.Position = UDim2.new(0, 14, 0, 56);
				Z.Size = UDim2.new(1, -28, 0, 26);
				Z.ZIndex = 4;
				Z.Parent = H;
				local F = Instance.new("TextLabel");
				F.Name = "TrackCounter";
				F.BackgroundTransparency = 1;
				F.Text = "";
				F.TextColor3 = Color3.fromRGB(150, 150, 168);
				F.Font = Enum.Font.GothamBold;
				F.TextSize = 10;
				F.TextXAlignment = Enum.TextXAlignment.Center;
				F.Position = UDim2.new(0, 14, 0, 83);
				F.Size = UDim2.new(1, -28, 0, 14);
				F.ZIndex = 4;
				F.Parent = H;
				local S = Instance.new("Frame");
				S.Name = "ProgressBg";
				S.BackgroundColor3 = Color3.fromRGB(26, 26, 32);
				S.BorderSizePixel = 0;
				S.Size = UDim2.new(1, -28, 0, 6);
				S.Position = UDim2.new(0, 14, 0, 105);
				S.ZIndex = 4;
				S.Parent = H;
				corner(S, 3);
				local r = Instance.new("Frame");
				r.Name = "ProgressFill";
				r.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
				r.BorderSizePixel = 0;
				r.Size = UDim2.new(0, 0, 1, 0);
				r.ZIndex = 5;
				r.Parent = S;
				corner(r, 3);
				local U = Instance.new("UIGradient");
				U.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
				U.Parent = r;
				_G._MasaRegAccent(r, U, "button");
				local I = Instance.new("TextLabel");
				I.BackgroundTransparency = 1;
				I.Text = "0:00";
				I.TextColor3 = Color3.fromRGB(150, 150, 168);
				I.Font = Enum.Font.GothamBold;
				I.TextSize = 10;
				I.TextXAlignment = Enum.TextXAlignment.Left;
				I.Position = UDim2.new(0, 14, 0, 114);
				I.Size = UDim2.new(0, 60, 0, 14);
				I.ZIndex = 4;
				I.Parent = H;
				local X = Instance.new("TextLabel");
				X.BackgroundTransparency = 1;
				X.Text = "0:00";
				X.TextColor3 = Color3.fromRGB(150, 150, 168);
				X.Font = Enum.Font.GothamBold;
				X.TextSize = 10;
				X.TextXAlignment = Enum.TextXAlignment.Right;
				X.Position = UDim2.new(1, -74, 0, 114);
				X.Size = UDim2.new(0, 60, 0, 14);
				X.ZIndex = 4;
				X.Parent = H;
				local w = Instance.new("Frame");
				w.Name = "Controls";
				w.BackgroundTransparency = 1;
				w.BorderSizePixel = 0;
				w.Size = UDim2.new(1, -24, 0, 50);
				w.Position = UDim2.new(0, 12, 0, 136);
				w.ZIndex = 4;
				w.Parent = H;
				local k = c(w, "PrevSong", "<", UDim2.new(0, 42, 0, 38), UDim2.new(0, 0, 0, 6), 15);
				local t = c(w, "Back10", "<< 10", UDim2.new(0, 48, 0, 40), UDim2.new(.5, -84, 0, 5), 11);
				local V = c(w, "Fwd10", "10 >>", UDim2.new(0, 48, 0, 40), UDim2.new(.5, 36, 0, 5), 11);
				local E = c(w, "NextSong", ">", UDim2.new(0, 42, 0, 38), UDim2.new(1, -42, 0, 6), 15);
				local N = Instance.new("Frame");
				N.Name = "PlayHolder";
				N.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
				N.BorderSizePixel = 0;
				N.Size = UDim2.new(0, 58, 0, 46);
				N.Position = UDim2.new(.5, -29, 0, 2);
				N.ClipsDescendants = true;
				N.ZIndex = 6;
				N.Parent = w;
				corner(N, 14);
				stroke(N, Color3.fromRGB(255, 170, 210), 1.5, .15);
				local n = Instance.new("UIGradient");
				n.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
				n.Rotation = 18;
				n.Parent = N;
				_G._MasaRegAccent(N, n, "button");
				local A = Instance.new("TextButton");
				A.Name = "PlayPause";
				A.BackgroundTransparency = 1;
				A.BorderSizePixel = 0;
				A.Text = "PLAY";
				A.TextColor3 = Color3.fromRGB(255, 255, 255);
				A.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				A.TextStrokeTransparency = .3;
				A.TextSize = 11;
				A.Font = Enum.Font.GothamBlack;
				A.AutoButtonColor = false;
				A.Size = UDim2.new(1, 0, 1, 0);
				A.ZIndex = 7;
				A.Parent = N;
				A.MouseEnter:Connect(function()
					tween(N, { Size = UDim2.new(0, 62, 0, 48), Position = UDim2.new(.5, -31, 0, 1) }, .12);
				end);
				A.MouseLeave:Connect(function()
					tween(N, { Size = UDim2.new(0, 58, 0, 46), Position = UDim2.new(.5, -29, 0, 2) }, .12);
				end);
				k.MouseButton1Click:Connect(function()
					musicPrevSong();
				end);
				E.MouseButton1Click:Connect(function()
					musicNextSong();
				end);
				t.MouseButton1Click:Connect(function()
					musicSeek(-10);
				end);
				V.MouseButton1Click:Connect(function()
					musicSeek(10);
				end);
				A.MouseButton1Click:Connect(function()
					toggleMusicPause();
				end);
				local d, C = h(H, "Auto Play Next", function()
						return musicAutoPlayNext;
					end, function(g)
						musicAutoPlayNext = g;
						if saveMasaConfig then
							pcall(saveMasaConfig);
						end;
					end, 194);
				local j, q = h(H, "Shuffle", function()
						return musicShuffleEnabled;
					end, function(g)
						musicShuffleEnabled = g;
						if saveMasaConfig then
							pcall(saveMasaConfig);
						end;
					end, 236);
				local p, L = h(H, "Loop", function()
						return musicLoopEnabled;
					end, function(g)
						musicLoopEnabled = g;
						if saveMasaConfig then
							pcall(saveMasaConfig);
						end;
					end, 278);
				local b = Instance.new("Frame");
				b.Name = "VolumeFooter";
				b.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
				b.BackgroundTransparency = .1;
				b.BorderSizePixel = 0;
				b.Size = UDim2.new(1, -24, 0, 36);
				b.Position = UDim2.new(0, 12, 1, -90);
				b.ZIndex = 4;
				b.Parent = H;
				corner(b, 9);
				stroke(b, Color3.fromRGB(90, 90, 105), 1, .45);
				local T = Instance.new("TextLabel");
				T.BackgroundTransparency = 1;
				T.Text = "Volume";
				T.TextColor3 = Color3.fromRGB(245, 245, 255);
				T.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				T.TextStrokeTransparency = .35;
				T.Font = Enum.Font.GothamBold;
				T.TextSize = 12;
				T.TextXAlignment = Enum.TextXAlignment.Left;
				T.Position = UDim2.new(0, 12, 0, 0);
				T.Size = UDim2.new(1, -140, 1, 0);
				T.ZIndex = 5;
				T.Parent = b;
				local W = c(b, "VolDown", "<", UDim2.new(0, 26, 0, 24), UDim2.new(1, -120, .5, -12), 13);
				local D = Instance.new("TextLabel");
				D.Name = "VolValue";
				D.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
				D.BorderSizePixel = 0;
				D.Text = string.format("%.2f", musicPlayerVolume);
				D.TextColor3 = Color3.fromRGB(255, 255, 255);
				D.Font = Enum.Font.GothamBlack;
				D.TextSize = 12;
				D.TextXAlignment = Enum.TextXAlignment.Center;
				D.Size = UDim2.new(0, 46, 0, 24);
				D.Position = UDim2.new(1, -88, .5, -12);
				D.ZIndex = 6;
				D.Parent = b;
				corner(D, 7);
				stroke(D, Color3.fromRGB(90, 90, 105), 1, .5);
				local K = c(b, "VolUp", ">", UDim2.new(0, 26, 0, 24), UDim2.new(1, -36, .5, -12), 13);
				W.MouseButton1Click:Connect(function()
					setMusicVolume(musicPlayerVolume - .05);
					D.Text = string.format("%.2f", musicPlayerVolume);
				end);
				K.MouseButton1Click:Connect(function()
					setMusicVolume(musicPlayerVolume + .05);
					D.Text = string.format("%.2f", musicPlayerVolume);
				end);
				local o = Instance.new("Frame");
				o.Name = "SpeedFooter";
				o.BackgroundColor3 = Color3.fromRGB(18, 18, 22);
				o.BackgroundTransparency = .1;
				o.BorderSizePixel = 0;
				o.Size = UDim2.new(1, -24, 0, 36);
				o.Position = UDim2.new(0, 12, 1, -48);
				o.ZIndex = 4;
				o.Parent = H;
				corner(o, 9);
				stroke(o, Color3.fromRGB(90, 90, 105), 1, .45);
				local x = Instance.new("TextLabel");
				x.BackgroundTransparency = 1;
				x.Text = "Speed";
				x.TextColor3 = Color3.fromRGB(245, 245, 255);
				x.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
				x.TextStrokeTransparency = .35;
				x.Font = Enum.Font.GothamBold;
				x.TextSize = 12;
				x.TextXAlignment = Enum.TextXAlignment.Left;
				x.Position = UDim2.new(0, 12, 0, 0);
				x.Size = UDim2.new(1, -140, 1, 0);
				x.ZIndex = 5;
				x.Parent = o;
				local l = c(o, "SpdDown", "<", UDim2.new(0, 26, 0, 24), UDim2.new(1, -120, .5, -12), 13);
				local M = Instance.new("TextLabel");
				M.Name = "SpdValue";
				M.BackgroundColor3 = Color3.fromRGB(8, 8, 14);
				M.BorderSizePixel = 0;
				M.Text = string.format("%.1fx", musicPlayerSpeed);
				M.TextColor3 = Color3.fromRGB(255, 255, 255);
				M.Font = Enum.Font.GothamBlack;
				M.TextSize = 12;
				M.TextXAlignment = Enum.TextXAlignment.Center;
				M.Size = UDim2.new(0, 46, 0, 24);
				M.Position = UDim2.new(1, -88, .5, -12);
				M.ZIndex = 6;
				M.Parent = o;
				corner(M, 7);
				stroke(M, Color3.fromRGB(90, 90, 105), 1, .5);
				local z = c(o, "SpdUp", ">", UDim2.new(0, 26, 0, 24), UDim2.new(1, -36, .5, -12), 13);
				l.MouseButton1Click:Connect(function()
					setMusicSpeed(musicPlayerSpeed - .1);
					M.Text = string.format("%.1fx", musicPlayerSpeed);
				end);
				z.MouseButton1Click:Connect(function()
					setMusicSpeed(musicPlayerSpeed + .1);
					M.Text = string.format("%.1fx", musicPlayerSpeed);
				end);
				local function f()
					if not ((i and i.Parent)) then
						return;
					end;
					Z.Text = getMusicSongName();
					F.Text = "TRACK " .. (tostring(selectedMusicSong) .. (" / " .. tostring(#MUSIC_PLAYER_OPTIONS)));
					D.Text = string.format("%.2f", musicPlayerVolume);
					M.Text = string.format("%.1fx", musicPlayerSpeed);
					if C then
						C(musicAutoPlayNext == true);
					end;
					if q then
						q(musicShuffleEnabled == true);
					end;
					if L then
						L(musicLoopEnabled == true);
					end;
					local g = _musicPlayerSound;
					local u = g and g.Parent;
					A.Text = ((u and g.IsPlaying)) and "PAUSE" or "PLAY";
					if u then
						local u = tonumber(musicPlayerSpeed) or 1;
						if u <= 0 then
							u = 1;
						end;
						local B = ((g.TimeLength or 0)) / u;
						local a = ((g.TimePosition or 0)) / u;
						if B > 0 then
							r.Size = UDim2.new(math.clamp(a / B, 0, 1), 0, 1, 0);
							I.Text = O(a);
							X.Text = O(B);
						else
							r.Size = UDim2.new(0, 0, 1, 0);
							I.Text = "0:00";
							X.Text = "--:--";
						end;
					else
						r.Size = UDim2.new(0, 0, 1, 0);
						I.Text = "0:00";
						X.Text = "0:00";
					end;
				end;
				_G.MasaMusicRefreshUI = f;
				f();
				task.spawn(function()
					while i and i.Parent do
						pcall(f);
						task.wait(.2);
					end;
				end);
				g.InputBegan:Connect(function(g)
					if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
						R();
					end;
				end);
				H.Size = UDim2.new(0, 0, 0, 0);
				H.Position = UDim2.new(.5, 0, .5, 0);
				(B:Create(H, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, u, 0, a), Position = UDim2.new(.5, -u / 2, .5, -a / 2) })):Play();
			end);
		end;
		((function()
			local g = "MASA";
			local u = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
			local B = {
					mainPosition = true,
					stealBarPosition = true,
					mobileButtonPositions = true,
					autoPlayJob = true,
					autoPlaySide = true,
					shareCode = true,
				};
			local function a(g)
				g = tostring(g or "");
				local u = false;
				pcall(function()
					if type(setclipboard) == "function" then
						setclipboard(g);
						u = true;
						return;
					end;
					if type(toclipboard) == "function" then
						toclipboard(g);
						u = true;
						return;
					end;
					if syn and type(syn.write_clipboard) == "function" then
						syn.write_clipboard(g);
						u = true;
						return;
					end;
					if Clipboard and type(Clipboard.set) == "function" then
						Clipboard.set(g);
						u = true;
						return;
					end;
					if type(setrbxclipboard) == "function" then
						setrbxclipboard(g);
						u = true;
						return;
					end;
				end);
				return u;
			end;
			local function i(g)
				g = tostring(g or "");
				return (((g:gsub(".", function(g)
					local u, B = "", g:byte();
					for g = 8, 1, -1 do
						u = u .. ((B % 2 ^ g - B % 2 ^ ((g - 1)) > 0 and "1" or "0"));
					end;
					return u;
				end) .. "0000")):gsub("%d%d%d?%d?%d?%d?", function(g)
					if #g < 6 then
						return "";
					end;
					local B = 0;
					for u = 1, 6, 1 do
						B = B + ((g:sub(u, u) == "1" and 2 ^ ((6 - u)) or 0));
					end;
					return u:sub(B + 1, B + 1);
				end) .. (({ "", "==", "=" }))[#g % 3 + 1]);
			end;
			local function R(g)
				g = (tostring(g or "")):gsub("[^%w%+%/%=]", "");
				return ((g:gsub(".", function(g)
					if g == "=" then
						return "";
					end;
					local B, a = "", ((u:find(g, 1, true) or 1)) - 1;
					for g = 6, 1, -1 do
						B = B .. ((a % 2 ^ g - a % 2 ^ ((g - 1)) > 0 and "1" or "0"));
					end;
					return B;
				end)):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(g)
					if #g ~= 8 then
						return "";
					end;
					local u = 0;
					for B = 1, 8, 1 do
						u = u + ((g:sub(B, B) == "1" and 2 ^ ((8 - B)) or 0));
					end;
					return string.char(u);
				end));
			end;
			local function O(g)
				local u;
				pcall(function()
					if crypt and crypt.base64encode then
						u = crypt.base64encode(g);
						return;
					end;
					if crypt and crypt.base64_encode then
						u = crypt.base64_encode(g);
						return;
					end;
					if syn and (syn.crypt and (syn.crypt.base64 and syn.crypt.base64.encode)) then
						u = syn.crypt.base64.encode(g);
						return;
					end;
					if type(base64_encode) == "function" then
						u = base64_encode(g);
						return;
					end;
					if type(base64encode) == "function" then
						u = base64encode(g);
						return;
					end;
				end);
				if type(u) == "string" and #u > 0 then
					return u;
				end;
				return i(g);
			end;
			local function c(g)
				local u;
				pcall(function()
					if crypt and crypt.base64decode then
						u = crypt.base64decode(g);
						return;
					end;
					if crypt and crypt.base64_decode then
						u = crypt.base64_decode(g);
						return;
					end;
					if syn and (syn.crypt and (syn.crypt.base64 and syn.crypt.base64.decode)) then
						u = syn.crypt.base64.decode(g);
						return;
					end;
					if type(base64_decode) == "function" then
						u = base64_decode(g);
						return;
					end;
					if type(base64decode) == "function" then
						u = base64decode(g);
						return;
					end;
				end);
				if type(u) == "string" and #u > 0 then
					return u;
				end;
				return R(g);
			end;
			local function h(g)
				local u = 0;
				g = tostring(g or "");
				for B = 1, #g, 1 do
					u = ((u * 33 + g:byte(B))) % 1000003;
				end;
				return string.format("%05d", u);
			end;
			local function Q(g)
				if type(g) ~= "table" then
					return false;
				end;
				return g.NS ~= nil or g.CS ~= nil or g.selectedAimbotMode ~= nil or g.currentSpeedMode ~= nil or g.espEnabled ~= nil or g.autoStealEnabled ~= nil or g.selectedStealMode ~= nil or g.keybinds ~= nil or g.skyTheme ~= nil;
			end;
			local function e(g)
				local u = {};
				if type(g) ~= "table" then
					return u;
				end;
				for g, a in pairs(g) do
					if not B[g] then
						u[g] = a;
					end;
				end;
				return u;
			end;
			local function P(g)
				local u = H:JSONEncode(g);
				local B = O(u);
				local a = h(u);
				local i = (a:sub(1, 4)):upper();
				local R = 0;
				for g = 1, #B, 1 do
					R = ((R * 31 + B:byte(g))) % 65535;
				end;
				local c = string.format("%04X", R);
				return "MASA-PRESET-" .. (i .. ("-" .. (c .. ("." .. B))));
			end;
			local function m(g)
				return type(g) == "string" and g:match("^MASA%-PRESET%-[%w]+-[%w]+%..+") ~= nil;
			end;
			local function Z()
				if m(_G._MasaShareCode) then
					return _G._MasaShareCode;
				end;
				if canSaveConfig and (_masa_isfile and _masa_readfile) then
					pcall(function()
						if _masa_isfile(CONFIG_FILE) then
							local g = _masa_readfile(CONFIG_FILE);
							local u, B = pcall(function()
									return H:JSONDecode(g);
								end);
							if u and (type(B) == "table" and m(B.shareCode)) then
								_G._MasaShareCode = B.shareCode;
							end;
						end;
					end);
				end;
				if m(_G._MasaShareCode) then
					return _G._MasaShareCode;
				end;
				local g = collectMasaConfig();
				local u = e(g);
				local B = P(u);
				_G._MasaShareCode = B;
				if canSaveConfig and _masa_writefile then
					pcall(function()
						local g = collectMasaConfig();
						g.shareCode = B;
						_masa_writefile(CONFIG_FILE, H:JSONEncode(g));
					end);
				end;
				return B;
			end;
			local function F()
				_G._MasaShareCode = nil;
				local g = collectMasaConfig();
				local u = e(g);
				local B = P(u);
				if not m(B) then
					error("generatePresetCode returned invalid format");
				end;
				_G._MasaShareCode = B;
				if canSaveConfig and _masa_writefile then
					pcall(function()
						local g = collectMasaConfig();
						g.shareCode = B;
						_masa_writefile(CONFIG_FILE, H:JSONEncode(g));
					end);
				end;
				return B;
			end;
			local function S(g)
				g = (tostring(g or "")):gsub("%s+", "");
				if g == "" then
					return nil, "empty";
				end;
				if g:sub(1, 1) == "{" then
					local u, B = pcall(function()
							return H:JSONDecode(g);
						end);
					if u and Q(B) then
						return B;
					end;
					return nil, "bad json";
				end;
				local u = g:match("^MASA%-PRESET%-[%w]+-[%w]+%.(.+)$");
				if not u then
					local B, a, H = g:match("^(BLX4)%.(%d%d%d%d%d)%.(.+)$");
					if B then
						u = H;
					else
						local B, a = g:match("^(BLX4)%.(.+)$");
						if B then
							u = a;
						end;
					end;
				end;
				if not u then
					u = g;
				end;
				u = (u:gsub("%-", "+")):gsub("_", "/");
				local B = #u % 4;
				if B > 0 then
					u = u .. string.rep("=", 4 - B);
				end;
				local a = c(u);
				if type(a) ~= "string" or a == "" then
					return nil, "decode";
				end;
				local i, R = pcall(function()
						return H:JSONDecode(a);
					end);
				if not i or not Q(R) then
					return nil, "bad json";
				end;
				return R;
			end;
			local function r(g)
				if type(g) ~= "table" then
					return;
				end;
				local u = tonumber(g.masaGuiScaleValue);
				if u then
					Ej = math.clamp(u, .5, 1.5);
					if masaMainScale then
						masaMainScale.Scale = Ej;
					end;
				end;
				local B = tonumber(g.masaProgressBarScaleValue);
				if B then
					Nj = math.clamp(B, .5, 1.5);
					if KF then
						pcall(KF);
					end;
				end;
				if g.tabPosition and _G.MasaApplyTabPosition then
					pcall(_G.MasaApplyTabPosition, _G.MasaValidTabPosition(g.tabPosition));
				end;
				if g.customFont and (_G.MasaFonts and _G.MasaFonts.set) then
					pcall(_G.MasaFonts.set, g.customFont, true);
				end;
				if g.titleStyle and _G.MasaApplyTitleStyle then
					pcall(_G.MasaApplyTitleStyle, tonumber(g.titleStyle) or 1);
				end;
				if type(g.buttonShape) == "string" then
					_G.MasaButtonShape = g.buttonShape;
					if _G.MasaApplyButtonShape then
						pcall(_G.MasaApplyButtonShape);
					end;
					if _G.MasaRefreshAllShapeRows then
						pcall(_G.MasaRefreshAllShapeRows);
					end;
				end;
				if type(applyBackground) == "function" and tonumber(g.currentBackground) then
					pcall(applyBackground, tonumber(g.currentBackground));
				end;
				if _G.MasaApplyMobileButtonSize then
					pcall(_G.MasaApplyMobileButtonSize);
				end;
				if _G.MasaApplyMobileButtonsHidden then
					pcall(_G.MasaApplyMobileButtonsHidden);
				end;
				if refreshAllSpeedKeybinds then
					pcall(refreshAllSpeedKeybinds);
				end;
				if refreshTPDownKeybind then
					pcall(refreshTPDownKeybind);
				end;
				if _G.MasaRefreshTitleStyleSelector then
					pcall(_G.MasaRefreshTitleStyleSelector);
				end;
			end;
			local function U(g)
				if not Q(g) then
					return false, "invalid";
				end;
				local u = _G._MasaShareCode;
				local B = H:JSONEncode(g);
				if canSaveConfig and _masa_writefile then
					local a = pcall(function()
							if type(u) == "string" and #u > 10 then
								local g = H:JSONDecode(B);
								g.shareCode = u;
								B = H:JSONEncode(g);
							end;
							_masa_writefile(CONFIG_FILE, B);
						end);
					pcall(function()
						_masa_writefile(KEYBINDS_CONFIG_FILE, H:JSONEncode({ keybinds = g.keybinds, tpDownKeybind = g.tpDownKeybind }));
					end);
					if not a then
						return false, "write";
					end;
				else
					return false, "nosave";
				end;
				pcall(loadMasaConfig);
				pcall(r, g);
				pcall(function()
					if _G.MasaDuelsApplySavedGameplayStates then
						_G.MasaDuelsApplySavedGameplayStates();
					end;
				end);
				pcall(function()
					if _G.MasaDuelsForceSyncLoadedButtons then
						_G.MasaDuelsForceSyncLoadedButtons();
					end;
				end);
				pcall(function()
					if _G.MasaSyncToggleVisuals then
						_G.MasaSyncToggleVisuals();
					end;
				end);
				pcall(function()
					if saveMasaConfig then
						saveMasaConfig();
					end;
				end);
				return true;
			end;
			_G.MasaShareSettings = { encode = Z, decode = S, apply = U };
			local I = baseRow(Settings, "Share Setting", 998);
			local X = Instance.new("TextButton");
			X.Name = "ShareSettingArrow";
			X.BackgroundColor3 = Color3.fromRGB(8, 8, 12);
			X.BackgroundTransparency = .18;
			X.BorderSizePixel = 0;
			X.Size = UDim2.new(0, 28, 0, 24);
			X.Position = UDim2.new(1, -40, .5, -12);
			X.Text = "\226\150\178";
			X.TextColor3 = HF.white;
			X.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			X.TextStrokeTransparency = .3;
			X.TextSize = 15;
			X.Font = Enum.Font.GothamBold;
			X.AutoButtonColor = false;
			X.ZIndex = 8;
			X.Parent = I;
			corner(X, 7);
			stroke(X, HF.strokeSoft, 1, .45);
			local w = 42;
			local k = 200;
			local t = Instance.new("Frame");
			t.Name = "Share Setting Mode";
			t.BackgroundColor3 = HF.row;
			t.BackgroundTransparency = .28;
			t.Size = UDim2.new(1, -4, 0, w);
			t.BorderSizePixel = 0;
			t.LayoutOrder = 998.1;
			t.ZIndex = 4;
			t.ClipsDescendants = true;
			t.Visible = false;
			t.Parent = Settings;
			corner(t, 14);
			stroke(t, Color3.fromRGB(59, 130, 246), 1.4, .32);
			if _G._MasaRegAccent then
				_G._MasaRegAccent(t, nil, "soft");
			end;
			local V = Instance.new("Frame");
			V.Name = "SelectedSlide";
			V.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			V.BackgroundTransparency = .1;
			V.Size = UDim2.new(.5, -3, 0, 34);
			V.Position = UDim2.new(0, 4, 0, 4);
			V.BorderSizePixel = 0;
			V.ZIndex = 5;
			V.Parent = t;
			corner(V, 13);
			local E = Instance.new("UIStroke");
			E.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			E.Color = Color3.fromRGB(255, 170, 210);
			E.Thickness = 1.5;
			E.Transparency = .1;
			E.Parent = V;
			local N = Instance.new("UIGradient");
			N.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 165, 250)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 140)) });
			N.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.5, .02), NumberSequenceKeypoint.new(1, .08) });
			N.Rotation = 22;
			N.Parent = V;
			if _G._MasaRegAccent then
				_G._MasaRegAccent(V, N, "slide");
			end;
			local n = Instance.new("TextLabel");
			n.BackgroundTransparency = 1;
			n.Text = "GENERATE";
			n.TextColor3 = HF.white;
			n.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			n.TextStrokeTransparency = .2;
			n.TextSize = 11;
			n.Font = Enum.Font.GothamBlack;
			n.TextXAlignment = Enum.TextXAlignment.Center;
			n.Size = UDim2.new(.5, 0, 0, 42);
			n.Position = UDim2.new(0, 0, 0, 0);
			n.ZIndex = 8;
			n.Parent = t;
			local A = Instance.new("TextLabel");
			A.BackgroundTransparency = 1;
			A.Text = "REDEEM";
			A.TextColor3 = HF.white;
			A.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			A.TextStrokeTransparency = .2;
			A.TextSize = 11;
			A.Font = Enum.Font.GothamBlack;
			A.TextXAlignment = Enum.TextXAlignment.Center;
			A.Size = UDim2.new(.5, 0, 0, 42);
			A.Position = UDim2.new(.5, 0, 0, 0);
			A.ZIndex = 8;
			A.Parent = t;
			local d = Instance.new("TextButton");
			d.BackgroundTransparency = 1;
			d.Text = "";
			d.AutoButtonColor = false;
			d.Size = UDim2.new(.5, 0, 0, 42);
			d.Position = UDim2.new(0, 0, 0, 0);
			d.ZIndex = 10;
			d.Parent = t;
			local C = Instance.new("TextButton");
			C.BackgroundTransparency = 1;
			C.Text = "";
			C.AutoButtonColor = false;
			C.Size = UDim2.new(.5, 0, 0, 42);
			C.Position = UDim2.new(.5, 0, 0, 0);
			C.ZIndex = 10;
			C.Parent = t;
			local j = Instance.new("Frame");
			j.Name = "ShareCodeBoxBg";
			j.BackgroundColor3 = Color3.fromRGB(6, 18, 40);
			j.BackgroundTransparency = .08;
			j.BorderSizePixel = 0;
			j.Size = UDim2.new(1, -16, 0, 74);
			j.Position = UDim2.new(0, 8, 0, 50);
			j.ZIndex = 6;
			j.Parent = t;
			corner(j, 10);
			stroke(j, Color3.fromRGB(255, 105, 180), 1.2, .28);
			local q = Instance.new("TextBox");
			q.Name = "ShareCodeBox";
			q.BackgroundTransparency = 1;
			q.Size = UDim2.new(1, -12, 1, -10);
			q.Position = UDim2.new(0, 6, 0, 5);
			q.Text = "";
			q.PlaceholderText = "MASA-PRESET-XXXX-XXXX...";
			q.PlaceholderColor3 = Color3.fromRGB(100, 160, 200);
			q.TextColor3 = Color3.fromRGB(255, 192, 203);
			q.TextSize = 10;
			q.Font = Enum.Font.GothamBold;
			q.ClearTextOnFocus = false;
			q.MultiLine = true;
			q.TextWrapped = true;
			q.TextXAlignment = Enum.TextXAlignment.Left;
			q.TextYAlignment = Enum.TextYAlignment.Top;
			q.TextEditable = true;
			q.ZIndex = 7;
			q.Parent = j;
			local p = Instance.new("TextLabel");
			p.Name = "ShareStatus";
			p.BackgroundTransparency = 1;
			p.Size = UDim2.new(1, -16, 0, 14);
			p.Position = UDim2.new(0, 8, 0, 182);
			p.Text = "";
			p.TextColor3 = Color3.fromRGB(255, 170, 210);
			p.Font = Enum.Font.GothamMedium;
			p.TextSize = 10;
			p.TextXAlignment = Enum.TextXAlignment.Left;
			p.TextWrapped = true;
			p.ZIndex = 6;
			p.Parent = t;
			local L = Instance.new("Frame");
			L.Name = "CopyBtnHolder";
			L.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			L.BackgroundTransparency = .1;
			L.BorderSizePixel = 0;
			L.Size = UDim2.new(.5, -12, 0, 34);
			L.Position = UDim2.new(0, 8, 0, 132);
			L.ZIndex = 6;
			L.Visible = true;
			L.Parent = t;
			corner(L, 10);
			stroke(L, Color3.fromRGB(255, 170, 210), 1.3, .15);
			local b = Instance.new("UIGradient");
			b.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 165, 250)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 140)) });
			b.Rotation = 18;
			b.Parent = L;
			if _G._MasaRegAccent then
				_G._MasaRegAccent(L, b, "button");
			end;
			local T = Instance.new("TextButton");
			T.Name = "CopyBtn";
			T.BackgroundTransparency = 1;
			T.Text = "COPY CODE";
			T.TextColor3 = Color3.fromRGB(255, 255, 255);
			T.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			T.TextStrokeTransparency = .35;
			T.TextSize = 12;
			T.Font = Enum.Font.GothamBlack;
			T.AutoButtonColor = false;
			T.Size = UDim2.new(1, 0, 1, 0);
			T.ZIndex = 7;
			T.Parent = L;
			local W = Instance.new("Frame");
			W.Name = "NewCodeBtnHolder";
			W.BackgroundColor3 = Color3.fromRGB(251, 146, 60);
			W.BackgroundTransparency = .1;
			W.BorderSizePixel = 0;
			W.Size = UDim2.new(.5, -12, 0, 34);
			W.Position = UDim2.new(.5, 4, 0, 132);
			W.ZIndex = 6;
			W.Visible = true;
			W.Parent = t;
			corner(W, 10);
			stroke(W, Color3.fromRGB(253, 186, 116), 1.3, .15);
			local D = Instance.new("UIGradient");
			D.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(251, 191, 36)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(251, 146, 60)), ColorSequenceKeypoint.new(1, Color3.fromRGB(234, 88, 12)) });
			D.Rotation = 18;
			D.Parent = W;
			if _G._MasaRegAccent then
				_G._MasaRegAccent(W, D, "button");
			end;
			local K = Instance.new("TextButton");
			K.Name = "NewCodeBtn";
			K.BackgroundTransparency = 1;
			K.Text = "NEW CODE";
			K.TextColor3 = Color3.fromRGB(255, 255, 255);
			K.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			K.TextStrokeTransparency = .35;
			K.TextSize = 12;
			K.Font = Enum.Font.GothamBlack;
			K.AutoButtonColor = false;
			K.Size = UDim2.new(1, 0, 1, 0);
			K.ZIndex = 7;
			K.Parent = W;
			local o = Instance.new("Frame");
			o.Name = "RedeemBtnHolder";
			o.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
			o.BackgroundTransparency = .1;
			o.BorderSizePixel = 0;
			o.Size = UDim2.new(1, -16, 0, 34);
			o.Position = UDim2.new(0, 8, 0, 132);
			o.ZIndex = 6;
			o.Visible = false;
			o.Parent = t;
			corner(o, 10);
			stroke(o, Color3.fromRGB(134, 239, 172), 1.3, .15);
			local x = Instance.new("UIGradient");
			x.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(74, 222, 128)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(34, 197, 94)), ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 163, 74)) });
			x.Rotation = 18;
			x.Parent = o;
			if _G._MasaRegAccent then
				_G._MasaRegAccent(o, x, "button");
			end;
			local l = Instance.new("TextButton");
			l.Name = "RedeemBtn";
			l.BackgroundTransparency = 1;
			l.Text = "REDEEM CODE";
			l.TextColor3 = Color3.fromRGB(255, 255, 255);
			l.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
			l.TextStrokeTransparency = .35;
			l.TextSize = 12;
			l.Font = Enum.Font.GothamBlack;
			l.AutoButtonColor = false;
			l.Size = UDim2.new(1, 0, 1, 0);
			l.ZIndex = 7;
			l.Parent = o;
			local M = "GENERATE";
			local z = false;
			local function f(g, u)
				p.Text = g or "";
				p.TextColor3 = u or Color3.fromRGB(255, 170, 210);
			end;
			local function G(g)
				local u = (g == "REDEEM");
				tween(V, { Position = u and UDim2.new(.5, -1, 0, 4) or UDim2.new(0, 4, 0, 4) }, .18);
				tween(n, { TextTransparency = u and .5 or 0, TextStrokeTransparency = u and .38 or .2 }, .14);
				tween(A, { TextTransparency = u and 0 or .5, TextStrokeTransparency = u and .2 or .38 }, .14);
				L.Visible = not u;
				W.Visible = not u;
				o.Visible = u;
				f("", nil);
				if u then
					q.TextEditable = true;
					q.PlaceholderText = "MASA-PRESET-XXXX-XXXX...";
					q.Text = "";
					T.Text = "COPY CODE";
				else
					q.TextEditable = false;
					q.PlaceholderText = "Generating...";
					q.Text = "";
					T.Text = "COPY CODE";
					task.defer(function()
						local g, u = pcall(Z);
						if g and m(u) then
							q.Text = u;
							f("", nil);
						else
							q.Text = "";
							local B = ((not g and type(u) == "string")) and ("Err: " .. u:sub(1, 40)) or "Failed to generate code.";
							f(B, Color3.fromRGB(255, 105, 105));
						end;
					end);
				end;
			end;
			d.MouseButton1Click:Connect(function()
				if M == "GENERATE" then
					return;
				end;
				M = "GENERATE";
				tween(V, { BackgroundTransparency = .5 }, .07);
				task.delay(.07, function()
					if V and V.Parent then
						tween(V, { BackgroundTransparency = .1 }, .15);
					end;
				end);
				G(M);
			end);
			C.MouseButton1Click:Connect(function()
				if M == "REDEEM" then
					return;
				end;
				M = "REDEEM";
				tween(V, { BackgroundTransparency = .5 }, .07);
				task.delay(.07, function()
					if V and V.Parent then
						tween(V, { BackgroundTransparency = .1 }, .15);
					end;
				end);
				G(M);
			end);
			local function s(g, u)
				if not g or not g.Parent then
					return;
				end;
				local B = g.BackgroundTransparency;
				tween(g, { BackgroundTransparency = .6 }, .08);
				task.delay(.08, function()
					if g and g.Parent then
						tween(g, { BackgroundTransparency = B }, .15);
					end;
				end);
			end;
			T.MouseButton1Click:Connect(function()
				local g = q.Text;
				if g == "" then
					f("No code to copy.", Color3.fromRGB(255, 214, 100));
					s(L);
					return;
				end;
				s(L);
				local u = a(g);
				if u then
					T.Text = "COPIED!";
					f("Copied to clipboard!", Color3.fromRGB(130, 245, 160));
					task.delay(1.5, function()
						if T and T.Parent then
							T.Text = "COPY CODE";
						end;
					end);
				else
					f("Copy failed \226\128\148 select manually.", Color3.fromRGB(255, 214, 100));
				end;
			end);
			K.MouseButton1Click:Connect(function()
				s(W);
				K.Text = "GENERATING...";
				f("", nil);
				q.Text = "";
				task.defer(function()
					local g, u = pcall(F);
					if g and (type(u) == "string" and #u > 0) then
						q.Text = u;
						K.Text = "NEW CODE";
						local g = a(u);
						if g then
							f("New code generated & copied!", Color3.fromRGB(130, 245, 160));
						else
							f("New code generated!", Color3.fromRGB(130, 245, 160));
						end;
					else
						K.Text = "NEW CODE";
						f("Failed to generate new code.", Color3.fromRGB(255, 105, 105));
					end;
				end);
			end);
			l.MouseButton1Click:Connect(function()
				s(o);
				local g, u = S(q.Text);
				if not g then
					local g = (u == "empty" and "Paste a code first") or "Invalid share code";
					f(g, Color3.fromRGB(255, 105, 105));
					local B = o.Position;
					tween(o, { Position = B + UDim2.new(0, 4, 0, 0) }, .05);
					task.delay(.05, function()
						if o and o.Parent then
							tween(o, { Position = B - UDim2.new(0, 4, 0, 0) }, .05);
							task.delay(.05, function()
								if o and o.Parent then
									tween(o, { Position = B }, .05);
								end;
							end);
						end;
					end);
					return;
				end;
				local B, a = U(g);
				if not B then
					local g = (a == "nosave" and "Executor cannot save config") or "Failed to apply settings";
					f(g, Color3.fromRGB(255, 105, 105));
					return;
				end;
				l.Text = "APPLIED! \226\156\147";
				f("Settings applied!", Color3.fromRGB(130, 245, 160));
				tween(o, { BackgroundTransparency = 0 }, .1);
				task.delay(.1, function()
					if o and o.Parent then
						tween(o, { BackgroundTransparency = .1 }, .3);
					end;
				end);
				task.delay(1.5, function()
					if l and l.Parent then
						l.Text = "REDEEM CODE";
					end;
				end);
			end);
			X.Activated:Connect(function()
				z = not z;
				_G._MasaExpand(t, z, k, X);
				if z then
					G(M);
				end;
			end);
			G(M);
		end))();
		section(Settings, "SETTINGS", 999);
		local i = Instance.new("Frame");
		i.Name = "Reset All Settings Holder";
		i.BackgroundTransparency = 1;
		i.BorderSizePixel = 0;
		i.Size = UDim2.new(1, -4, 0, 44);
		i.LayoutOrder = 1000;
		i.ZIndex = 5;
		i.Parent = Settings;
		local R = Instance.new("Frame");
		R.Name = "ResetBg";
		R.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		R.BackgroundTransparency = 0;
		R.BorderSizePixel = 0;
		R.Size = UDim2.new(1, -16, 0, 42);
		R.Position = UDim2.new(0, 8, 0, 1);
		R.ZIndex = 6;
		R.Parent = i;
		corner(R, 21);
		local O = Instance.new("TextButton");
		O.Name = "Reset All Settings";
		O.BackgroundTransparency = 1;
		O.BorderSizePixel = 0;
		O.Text = "Reset All Settings";
		O.TextColor3 = Color3.fromRGB(255, 255, 255);
		O.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		O.TextStrokeTransparency = .3;
		O.TextSize = 13;
		O.Font = Enum.Font.GothamBlack;
		O.AutoButtonColor = false;
		O.Size = UDim2.new(1, 0, 1, 0);
		O.Position = UDim2.new(0, 0, 0, 0);
		O.ZIndex = 7;
		O.Parent = R;
		local c = Instance.new("UIGradient");
		c.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 160, 200)) });
		c.Rotation = 18;
		c.Parent = R;
		local h = Instance.new("UIStroke");
		h.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		h.Color = Color3.fromRGB(255, 170, 210);
		h.Thickness = 1.5;
		h.Transparency = .15;
		h.Parent = R;
		_G._MasaRegAccent(R, c, "button");
		local function Q()
			local g = _G._MasaToggleOnColor();
			return g;
		end;
		local function P()
			local g, u = _G._MasaToggleOnColor();
			return u;
		end;
		local function V()
			local g = _G._MasaToggleOnColor();
			return g:Lerp(Color3.fromRGB(255, 255, 255), .16);
		end;
		local E = Color3.fromRGB(35, 35, 38);
		local z = Color3.fromRGB(28, 40, 30);
		local f = Color3.fromRGB(255, 255, 255);
		local G = Color3.fromRGB(255, 210, 80);
		local Y = Color3.fromRGB(140, 230, 160);
		local J = false;
		local Pl = nil;
		function setResetDefaultTheme()
			J = false;
			O.Text = "RESET ALL SETTINGS";
			O.TextColor3 = f;
			c.Enabled = true;
			tween(R, { BackgroundColor3 = Q() }, .18);
			tween(h, { Color = P(), Transparency = .15, Thickness = 1.5 }, .18);
		end;
		function setResetConfirmTheme()
			O.Text = "CLICK AGAIN TO CONFIRM";
			O.TextColor3 = G;
			c.Enabled = false;
			tween(R, { BackgroundColor3 = E }, .18);
			tween(h, { Color = G, Transparency = .02, Thickness = 1.4 }, .18);
		end;
		function setResetDoneTheme()
			O.Text = "DONE - REJOINING...";
			O.TextColor3 = Y;
			c.Enabled = false;
			tween(R, { BackgroundColor3 = z }, .18);
			tween(h, { Color = Y, Transparency = .02, Thickness = 1.4 }, .18);
		end;
		O.Text = "RESET ALL SETTINGS";
		O.MouseEnter:Connect(function()
			tween(R, { Size = UDim2.new(1, -8, 0, 44), Position = UDim2.new(0, 4, 0, 0) }, .12);
			if not J then
				tween(R, { BackgroundColor3 = V() }, .12);
			end;
		end);
		O.MouseLeave:Connect(function()
			tween(R, { Size = UDim2.new(1, -16, 0, 42), Position = UDim2.new(0, 8, 0, 1) }, .12);
			if not J then
				tween(R, { BackgroundColor3 = Q() }, .12);
			end;
		end);
		O.MouseButton1Click:Connect(function()
			if not J then
				J = true;
				setResetConfirmTheme();
				if Pl then
					task.cancel(Pl);
				end;
				Pl = task.delay(3, function()
						setResetDefaultTheme();
					end);
				return;
			end;
			if Pl then
				task.cancel(Pl);
				Pl = nil;
			end;
			O.Text = "RESETTING...";
			pcall(function()
				local g = {
						CONFIG_FILE,
						KEYBINDS_CONFIG_FILE,
						"MASAG.json",
						"MASAG.json",
						"MASAG.json",
						"MASA_Keybinds.json",
						"MASAG.json",
					};
				for g, u in ipairs(g) do
					pcall(function()
						if u and (isfile and (isfile(u) and delfile)) then
							delfile(u);
						end;
					end);
				end;
			end);
			pcall(function()
				Ej = .75;
				Nj = .9;
				F = 59.5;
				S = 28.8;
				r = 29;
				U = 15;
				I = "Normal";
				autoCarrySpeedEnabled = false;
				_G._MasaAutoCarryMode = "NORMAL";
				_G._MasaAS.locked = false;
				_G._MasaAS.wasLow = false;
				_G._MasaAS.savedMode = nil;
				_G._MasaAS.restoring = false;
				_G._MasaAutoCarrySoft.animals = {};
				_G._MasaAutoCarrySoft.lastScan = 0;
				Al = 20;
				_G._MasaTPDownMethod = "NORMAL";
				if _G.MasaRefreshTPDownMethodSelector then
					pcall(_G.MasaRefreshTPDownMethodSelector);
				end;
				X = false;
				w = "Normal";
				k = "V1";
				t = 62;
				if _G.MasaSetRadiusCircle then
					pcall(_G.MasaSetRadiusCircle, false);
				end;
				if _G.MasaRadiusCircleSetVisual then
					pcall(_G.MasaRadiusCircleSetVisual, false);
				end;
				if _G.MasaSetRadiusCircleColor then
					pcall(_G.MasaSetRadiusCircleColor, Color3.fromRGB(230, 230, 230));
				end;
				if _G.MasaRadiusCircleSetColorPreview then
					pcall(_G.MasaRadiusCircleSetColorPreview, Color3.fromRGB(230, 230, 230));
				end;
				_G._MasaSyncAfterHit.enabled = false;
				Kj();
				_G.MasaStealRadii = {
						Normal = 62,
						Semi = 60,
						SemiV2Radius = 60,
						SemiV2SemiRadius = 8,
					};
				N = "V1";
				n = 58;
				A = 40;
				_G._MasaAimbotChase = { V1 = "NORMAL", V2 = "NORMAL" };
				_G.MasaBatAimbotV2Speed = 58;
				_G.MasaBatAimbotV2LaggerSpeed = 40;
				q = 58;
				d = false;
				C = false;
				j = false;
				if _G.MasaTPBatOn and _G.MasaStopTPBat then
					pcall(_G.MasaStopTPBat);
				end;
				if _G._MasaSetTPBatCameraLock then
					_G._MasaSetTPBatCameraLock(false);
				end;
				if _G.MasaTPBatCameraLockSetVisual then
					_G.MasaTPBatCameraLockSetVisual(false);
				end;
				_G.MasaTPBatVersion = 1;
				if _G._MasaTPBatSetVersionVisual then
					pcall(_G._MasaTPBatSetVersionVisual, 1);
				end;
				_G.MasaNormalAimbotOn = false;
				_G.MasaBatAimbotV2On = false;
				_G.MasaTPBatOn = false;
				gj = false;
				_G._MasaAntiRagdollMode = "V1";
				yl = false;
				Jl = "HOLD";
				nl = false;
				if _G.MasaTPRagdoll then
					pcall(_G.MasaTPRagdoll.set, false);
				end;
				if Z.setTPRagdollVisual then
					pcall(Z.setTPRagdollVisual, false);
				end;
				_G.MasaLookAtEnabled = false;
				_G.MasaLookAtRadius = 20;
				if _G.MasaStopLookAt then
					_G.MasaStopLookAt();
				end;
				p = false;
				L = "V1";
				b = false;
				T = false;
				W = false;
				D = false;
				K = false;
				o = false;
				x = false;
				s = false;
				v = false;
				y = false;
				_G._MasaKickWarn.enabled = false;
				_G._MasaKickWarn.wasLow = false;
				_G.MasaUAKEnabled = false;
				if _G.MasaUltimateAntiKick then
					pcall(_G.MasaUltimateAntiKick.clear);
				end;
				if _G.MasaRefreshUAKVisual then
					pcall(_G.MasaRefreshUAKVisual);
				end;
				if _G.MasaDestroyKickWarning then
					pcall(_G.MasaDestroyKickWarning);
				end;
				_G._MasaHPWNextAllowed = 0;
				gl = false;
				ul = 70;
				Bl = false;
				_G.MasaNoPlayerCollisionEnabled = false;
				if _G.MasaRefreshFovValueBox then
					pcall(_G.MasaRefreshFovValueBox);
				end;
				al = false;
				if Hl then
					pcall(function()
						Hl:Disconnect();
					end);
					Hl = nil;
				end;
				if il and il.Parent then
					il.Size = 0;
					il.Enabled = false;
				end;
				Rl = 0;
				if Z.setMotionBlurVisual then
					Z.setMotionBlurVisual(false);
				end;
				Sl = "Off";
				kj = 1;
				tj = {};
				Vj = nil;
				for g, u in ipairs(_G.MasaCustomAnimSlots) do
					_G.MasaCustomAnimIds[u] = "";
				end;
				if _G.MasaCustomAnimClose then
					pcall(_G.MasaCustomAnimClose);
				end;
				if _G.MasaCustomAnimRefreshRow then
					pcall(_G.MasaCustomAnimRefreshRow);
				end;
				if _G.MasaCustomAnimSetRowVisible then
					pcall(_G.MasaCustomAnimSetRowVisible, false, false);
				end;
				if _G.MasaFonts then
					pcall(_G.MasaFonts.set, "Default", true);
				end;
				if _G.MasaFontPickerClose then
					pcall(_G.MasaFontPickerClose);
				end;
				_G._MasaTabPosition = "Bottom";
				if _G.MasaTabPosClose then
					pcall(_G.MasaTabPosClose);
				end;
				if _G.MasaApplyTabPosition then
					pcall(_G.MasaApplyTabPosition, "Bottom");
				end;
				if _G.MasaApplyTitleStyle then
					pcall(_G.MasaApplyTitleStyle, 1);
				end;
				if _G.MasaRefreshTitleStyleSelector then
					pcall(_G.MasaRefreshTitleStyleSelector);
				end;
				selectedIntroMusic = 1;
				_introEnabled = true;
				l = false;
				M = false;
				if setIntroVisual then
					setIntroVisual(_introEnabled);
				end;
				if setIntroSongVisual then
					setIntroSongVisual();
				end;
				stopIntroPlayback();
				stopIntroPreview();
				selectedMusicSong = 1;
				musicPlayerVolume = 1;
				musicPlayerSpeed = 1;
				musicAutoPlayNext = false;
				musicShuffleEnabled = false;
				musicLoopEnabled = false;
				if stopMusicPlayback then
					pcall(function()
						stopMusicPlayback(false);
					end);
				end;
				if _G.MasaMusicCloseUI then
					pcall(_G.MasaMusicCloseUI);
				end;
				Xl = false;
				wl = false;
				Yl = "TP UP";
				_G.MasaInstantResetVersion = 1;
				if _G.MasaRefreshInstantResetSelector then
					pcall(_G.MasaRefreshInstantResetSelector);
				end;
				if _G.MasaAfterDrop then
					_G.MasaAfterDrop.enabled = false;
					_G.MasaAfterDrop.action = "AIMBOT";
				end;
				if _G.MasaRefreshAfterDropSelector then
					pcall(_G.MasaRefreshAfterDropSelector);
				end;
				if _G.MasaRefreshDropMethodSelector then
					pcall(_G.MasaRefreshDropMethodSelector);
				end;
				_G.MasaGuiLocked = false;
				_G.MasaHideMobileButtons = false;
				_G.MasaMobileButtonScale = .75;
				_G.MasaMobileHideList = {};
				if _G.MasaRefreshMobileHideList then
					pcall(_G.MasaRefreshMobileHideList);
				end;
				if MasaUpdateGuiLockVisual then
					MasaUpdateGuiLockVisual();
				end;
				Ol = false;
				cl = 1;
				Ql = 1;
				el = false;
				hl = false;
				if _G.MasaSetAnimPack then
					pcall(function()
						_G.MasaSetAnimPack(1);
					end);
				end;
				Bj = false;
				_G._MasaAntiDieUserWanted = false;
				_G._MasaAntiDieAutoOn = false;
				stretchCurrentIndex = 1;
				stretchEnabled = false;
				_G.MasaTrackerSavedStretchIndex = nil;
				if _G.MasaSemiSteal then
					_G.MasaSemiSteal.autoGrabStopTime = 1.29;
					_G.MasaSemiSteal.autoGrabStopPercent = 75;
					_G.MasaSemiSteal.autoGrabSetDelayRadius = 8;
				end;
				if _G.MasaStopTimeBox then
					_G.MasaStopTimeBox.Text = "1.29";
				end;
				if _G.MasaStopPctBox then
					_G.MasaStopPctBox.Text = "75";
				end;
				if _G.MasaDelayRadBox then
					_G.MasaDelayRadBox.Text = "8";
				end;
				if _G.MasaSemiV2Steal then
					local g = _G.MasaSemiV2Steal;
					g.radius = 60;
					g.semiRadius = 8;
				end;
				if _G.MasaSemiV2RadBox then
					_G.MasaSemiV2RadBox.Text = "8";
				end;
				if BoxedESPOptions then
					BoxedESPOptions.trackerColor = Color3.fromRGB(230, 230, 230);
				end;
				if _G.MasaColorPreview then
					_G.MasaColorPreview.BackgroundColor3 = Color3.fromRGB(230, 230, 230);
				end;
				if _G.MasaUpdateTrackerColor then
					_G.MasaUpdateTrackerColor(Color3.fromRGB(230, 230, 230));
				end;
				masaMainScale.Scale = Ej;
				KF();
				applyBackground(1);
				updateBackgroundButtons();
				if _G.MasaCustomBgPreviewUpdate then
					pcall(_G.MasaCustomBgPreviewUpdate);
				end;
				applyDefaultMasaKeybinds();
				for g, u in pairs(kl) do
					Vl[g] = u;
				end;
				refreshAllSpeedKeybinds();
				refreshTPDownKeybind();
				if Kl then
					Kl();
				end;
				if cj then
					cj();
				end;
				if Lj then
					Lj();
				end;
				if Uj then
					Uj();
				end;
				if disableVividGraphics then
					pcall(disableVividGraphics);
				end;
				if Z.setVividGraphicsVisual then
					Z.setVividGraphicsVisual(false);
				end;
				if setXRay then
					pcall(setXRay, false);
				end;
				if Z.setXRayVisual then
					Z.setXRayVisual(false);
				end;
				if _G.MasaSetBrainrotXRay then
					pcall(_G.MasaSetBrainrotXRay, false);
				end;
				if Z.setBrainrotXRayVisual then
					pcall(Z.setBrainrotXRayVisual, false);
				end;
				if _G.MasaIdleWake then
					pcall(_G.MasaIdleWake);
				end;
				if Z.setMotionBlurVisual then
					Z.setMotionBlurVisual(false);
				end;
				if Z.setHighPingWarningVisual then
					Z.setHighPingWarningVisual(false);
				end;
				if Z.setKickWarningVisual then
					Z.setKickWarningVisual(false);
				end;
				if disableHeadless then
					pcall(disableHeadless);
				end;
				if Z.setHeadlessVisual then
					Z.setHeadlessVisual(false);
				end;
				if disableKorblox then
					pcall(disableKorblox);
				end;
				if Z.setKorbloxVisual then
					Z.setKorbloxVisual(false);
				end;
				if _G._MasaAvatarChangerReset then
					pcall(_G._MasaAvatarChangerReset);
				end;
				if _G.MasaAntiBat then
					pcall(function()
						_G.MasaAntiBat.setEnabled(false);
					end);
				end;
				if Z.setAntiBatVisual then
					Z.setAntiBatVisual(false);
				end;
				pcall(function()
					if _G.MasaFloatStop then
						_G.MasaFloatStop();
					end;
				end);
				pcall(function()
					if _G.MasaAntiTPBat then
						_G.MasaAntiTPBat.setEnabled(false, true);
						_G.MasaAntiTPBat.setSpam(false, true);
						_G.MasaAntiTPBat.setVersion(1, true);
					else
						_G.MasaAntiTPBatEnabled = false;
						_G.MasaAntiTPBatSpam = false;
						_G.MasaAntiTPBatVersion = 1;
					end;
					if _G._MasaAntiTPBatSetRowVisual then
						_G._MasaAntiTPBatSetRowVisual(false);
					end;
					if _G._MasaAntiTPBatSetSpamVisual then
						_G._MasaAntiTPBatSetSpamVisual(false);
					end;
					if _G._MasaAntiTPBatSetVersionVisual then
						_G._MasaAntiTPBatSetVersionVisual(1);
					end;
				end);
				if _G.MasaAntiVoid then
					pcall(function()
						_G.MasaAntiVoid.setEnabled(false);
					end);
				end;
				if Z.setAntiVoidVisual then
					Z.setAntiVoidVisual(false);
				end;
				if _G.MasaRainbowTools then
					pcall(function()
						_G.MasaRainbowTools.setEnabled(false);
					end);
				end;
				if Z.setRainbowToolsVisual then
					Z.setRainbowToolsVisual(false);
				end;
				if _G.MasaTransparentTools then
					pcall(function()
						_G.MasaTransparentTools.setEnabled(false);
					end);
				end;
				if Z.setTransparentToolsVisual then
					Z.setTransparentToolsVisual(false);
				end;
				if _G.MasaCustomTools then
					pcall(function()
						_G.MasaCustomTools.setEnabled(false);
					end);
				end;
				if Z.setCustomToolsVisual then
					Z.setCustomToolsVisual(false);
				end;
				if _G.MasaSetCustomToolSkin then
					pcall(_G.MasaSetCustomToolSkin, "Bat", "DiamondSword");
					pcall(_G.MasaSetCustomToolSkin, "Medusa", "GoldenDesertEagle");
				end;
				if _G.MasaCustomSounds then
					pcall(function()
						_G.MasaCustomSounds.setEnabled(false);
					end);
				end;
				if Z.setCustomSoundsVisual then
					Z.setCustomSoundsVisual(false);
				end;
				if _G.StretchRez and _G.StretchRez.apply then
					_G.StretchRez.apply(1);
				end;
				if normalSpeedBox then
					normalSpeedBox.Text = tostring(F);
				end;
				if carrySpeedBox then
					carrySpeedBox.Text = tostring(S);
				end;
				if laggerSpeedBox then
					laggerSpeedBox.Text = tostring(r);
				end;
				if laggerCarrySpeedBox then
					laggerCarrySpeedBox.Text = tostring(U);
				end;
				if autoTPHeightBox then
					autoTPHeightBox.Text = tostring(Al);
				end;
				if radiusBox then
					radiusBox.Text = tostring(t);
				end;
				if setAutoStealVisual then
					setAutoStealVisual(false);
				end;
				if _G.MasaSetStealMode then
					_G.MasaSetStealMode("Normal");
				end;
				if _G.MasaSetSemiSubModeVisual then
					_G.MasaSetSemiSubModeVisual("V1");
				end;
				if _G.MasaRefreshAimbotSpeedBoxes then
					_G.MasaRefreshAimbotSpeedBoxes();
				end;
				if type(applyCustomSky) == "function" then
					applyCustomSky("Off");
				end;
				if Il then
					Il.Text = "Off";
				end;
				savedMiniPositionTable = udim2ToTable(QF);
				if hF then
					hF.Position = QF;
				end;
				savedStealBarPositionTable = nil;
				if _G.MasaResetStealBarPosition then
					pcall(_G.MasaResetStealBarPosition);
				end;
				if _G.MasaResetMobileButtons then
					_G.MasaResetMobileButtons();
				end;
				if _G.MasaRefreshStretchSelector then
					_G.MasaRefreshStretchSelector();
				end;
				if _G.MasaDuelsApplySavedGameplayStates then
					_G.MasaDuelsApplySavedGameplayStates();
				end;
				if _G.MasaStopMedCounter then
					_G.MasaStopMedCounter();
				end;
				if _G.MasaRefreshInfJumpModeSelector then
					_G.MasaRefreshInfJumpModeSelector();
				end;
				if _G.MasaRefreshAntiRagdollModeSelector then
					_G.MasaRefreshAntiRagdollModeSelector();
				end;
				if _G.MasaRefreshAutoCarryModeSelector then
					_G.MasaRefreshAutoCarryModeSelector();
				end;
				if _G.MasaRefreshBatCounterModeSelector then
					_G.MasaRefreshBatCounterModeSelector();
				end;
				if Z.setLookAtVisual then
					pcall(function()
						Z.setLookAtVisual(false);
					end);
				end;
				if _G.MasaLookAtRadiusBox then
					_G.MasaLookAtRadiusBox.Text = "20";
				end;
				if _G.MasaSetRainbowJoystick then
					pcall(_G.MasaSetRainbowJoystick, false);
				end;
				_G.MasaRainbowJoystickEnabled = false;
				if _G._MasaSyncAfterHit and _G._MasaSyncAfterHit.setVisual then
					pcall(_G._MasaSyncAfterHit.setVisual, false);
				end;
				for g, u in ipairs({
					"setAntiDieVisual",
					"setAntiLagVisual",
					"setAutoTPVisual",
					"setFOVVisual",
					"setNoCamCollisionVisual",
					"setPlayerESPVisual",
					"setRagdollCountdownVisual",
					"setTrackerESPVisual",
					"setUnwalkVisual",
					"setRainbowJoystickVisual",
				}) do
					local B = Z[u];
					if type(B) == "function" then
						pcall(B, false);
					end;
				end;
				saveMasaConfig();
			end);
			task.wait(.35);
			setResetDoneTheme();
			task.wait(.6);
			pcall(function()
				local u = game:GetService("TeleportService");
				u:Teleport(game.PlaceId, g.LocalPlayer);
			end);
		end);
	end;
task.wait();
__MasaDuelsSetupVisualsUI();
_G.__MasaDuelsSetupSettingsUI();
if MasaUpdateGuiLockVisual then
	MasaUpdateGuiLockVisual();
end;
if _G.MasaApplyMobileButtonsHidden then
	_G.MasaApplyMobileButtonsHidden();
end;
u.InputBegan:Connect(function(g, B)
	local a = (tostring(g.UserInputType)):find("Gamepad") ~= nil;
	local H = g.UserInputType == Enum.UserInputType.MouseButton3;
	local function i(u)
		if not u then
			return false;
		end;
		if u == "MB3" then
			return H;
		end;
		return (not H) and g.KeyCode == u;
	end;
	if B and (g.UserInputType == Enum.UserInputType.Keyboard and (not Nl and not Ll)) then
		return;
	end;
	if u:GetFocusedTextBox() then
		return;
	end;
	if g.UserInputType ~= Enum.UserInputType.Keyboard and (not a and not H) then
		return;
	end;
	if not H and g.KeyCode == Enum.KeyCode.Unknown then
		return;
	end;
	if i(Vl.ToggleUI) then
		if OF.Visible then
			if _G.MasaHubClose then
				_G.MasaHubClose(true);
			else
				OF.Visible = false;
				hF.Visible = true;
			end;
		else
			if _G.MasaHubOpen then
				_G.MasaHubOpen();
			else
				OF.Visible = true;
				hF.Visible = false;
				OF.Size = RF;
			end;
		end;
		saveMasaConfig();
		return;
	end;
	if Nl then
		if tick() - ((bl or 0)) < .18 then
			return;
		end;
		local u = Nl;
		if not H and g.KeyCode == Enum.KeyCode.Escape then
			Nl = nil;
			refreshAllSpeedKeybinds();
			return;
		end;
		if not H and ((g.KeyCode == Enum.KeyCode.Backspace or g.KeyCode == Enum.KeyCode.Delete)) then
			Vl[u] = nil;
		else
			local B = H and "MB3" or g.KeyCode;
			for g, a in pairs(Vl) do
				if g ~= u and a == B then
					Vl[g] = nil;
				end;
			end;
			if ql == B then
				ql = nil;
				refreshTPDownKeybind();
			end;
			Vl[u] = B;
		end;
		Nl = nil;
		refreshAllSpeedKeybinds();
		saveMasaConfig();
		return;
	end;
	if Ll then
		if tick() - ((bl or 0)) < .18 then
			return;
		end;
		if not H and g.KeyCode == Enum.KeyCode.Escape then
			Ll = false;
			refreshTPDownKeybind();
			return;
		end;
		if not H and ((g.KeyCode == Enum.KeyCode.Backspace or g.KeyCode == Enum.KeyCode.Delete)) then
			ql = nil;
		else
			local u = H and "MB3" or g.KeyCode;
			for g, B in pairs(Vl) do
				if B == u then
					Vl[g] = nil;
				end;
			end;
			ql = u;
		end;
		Ll = false;
		refreshAllSpeedKeybinds();
		refreshTPDownKeybind();
		saveMasaConfig();
		return;
	end;
	if i(Vl.SpeedToggle) then
		zj();
		return;
	end;
	if i(Vl.LaggerToggle) then
		fj();
		return;
	end;
	if i(Vl.Aimbot) then
		if _G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked() then
			if _G.MasaSafeModeForceStop then
				_G.MasaSafeModeForceStop("SAFE MODE LOCK");
			end;
			return;
		end;
		if _G.MasaToggleSelectedAimbot then
			_G.MasaToggleSelectedAimbot();
		elseif N == "V2" and (_G.MasaStartBatAimbotV2 and _G.MasaStopBatAimbotV2) then
			if _G.MasaBatAimbotV2On then
				_G.MasaStopBatAimbotV2();
			else
				_G.MasaStartBatAimbotV2();
			end;
		elseif _G.MasaStartNormalAimbot and _G.MasaStopNormalAimbot then
			if _G.MasaNormalAimbotOn then
				_G.MasaStopNormalAimbot();
			else
				_G.MasaStartNormalAimbot();
			end;
		end;
		if _G.MasaRefreshAimbotVisual then
			_G.MasaRefreshAimbotVisual();
		end;
		return;
	end;
	if i(Vl.TPBat) then
		if _G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked() then
			if _G.MasaSafeModeForceStop then
				_G.MasaSafeModeForceStop("SAFE MODE LOCK");
			end;
			return;
		end;
		if _G.MasaToggleTPBatManual then
			_G.MasaToggleTPBatManual();
		elseif _G.MasaToggleTPBat then
			_G.MasaToggleTPBat();
		end;
		return;
	end;
	if i(Vl.DropBrainrot) then
		if Yl == "Stand Still" then
			vl();
		else
			fl();
		end;
		return;
	end;
	if i(Vl.AutoPlay) then
		if _G.MasaAutoPlayToggle then
			_G.MasaAutoPlayToggle();
		end;
		return;
	end;
	if i(Vl.AntiTPBat) then
		if _G.MasaAntiTPBat then
			_G.MasaAntiTPBat.toggle();
		elseif _G.MasaToggleAntiTPBat then
			_G.MasaToggleAntiTPBat();
		end;
		return;
	end;
	if i(Vl.Float) then
		if _G.MasaFloatToggle then
			_G.MasaFloatToggle();
		end;
		return;
	end;
	if i(Vl.InstantReset) then
		if _G.MasaInstantReset then
			_G.MasaInstantReset();
		end;
		return;
	end;
	if i(ql) then
		ol();
		return;
	end;
end);
setTab("MOVEMENT");
_G.__MasaDuelsSetupStealBar = function()
		local g = game:GetService("RunService");
		local a = u;
		local H = B;
		local i = m and m:FindFirstChild("MasaHubStealBarGui");
		if i then
			i:Destroy();
		end;
		i = P:FindFirstChild("MasaHubStealBarGui");
		if i then
			i:Destroy();
		end;
		local R, O = 348, 54;
		local c = 16;
		local h = 10;
		local Q = 14;
		local Z = 10;
		local F = {
				line = Color3.fromRGB(255, 105, 180),
				lineSoft = Color3.fromRGB(255, 170, 210),
				txt = Color3.fromRGB(15, 23, 42),
				txtDim = Color3.fromRGB(71, 85, 105),
				txtOn = Color3.fromRGB(8, 47, 73),
				good = Color3.fromRGB(74, 222, 128),
				warn = Color3.fromRGB(250, 204, 21),
				bad = Color3.fromRGB(248, 113, 113),
				glass = Color3.fromRGB(255, 240, 245),
				track = Color3.fromRGB(226, 232, 240),
			};
		local S = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 160, 200)),
				ColorSequenceKeypoint.new(.4, Color3.fromRGB(255, 105, 180)),
				ColorSequenceKeypoint.new(.75, Color3.fromRGB(220, 60, 140)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(2, 132, 199)),
			});
		local r = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(241, 245, 249)), ColorSequenceKeypoint.new(1, Color3.fromRGB(203, 213, 225)) });
		local U = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(74, 222, 128)), ColorSequenceKeypoint.new(.55, Color3.fromRGB(34, 197, 94)), ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 185, 129)) });
		local I = Instance.new("ScreenGui");
		I.Name = "MasaHubStealBarGui";
		I.ResetOnSpawn = false;
		I.IgnoreGuiInset = true;
		I.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
		I.DisplayOrder = 50;
		I.Parent = m;
		function drag(g)
			local u, B, H = false, nil, nil;
			g.InputBegan:Connect(function(a)
				if _G.MasaGuiLocked == true then
					return;
				end;
				if a.UserInputType == Enum.UserInputType.MouseButton1 or a.UserInputType == Enum.UserInputType.Touch then
					u = true;
					B = a.Position;
					H = g.Position;
					a.Changed:Connect(function()
						if a.UserInputState == Enum.UserInputState.End then
							u = false;
							if g and g.Name == "StealBar" then
								savedStealBarPositionTable = udim2ToTable(g.Position);
								pcall(saveMasaConfig);
							end;
						end;
					end);
				end;
			end);
			a.InputChanged:Connect(function(a)
				if u and ((a.UserInputType == Enum.UserInputType.MouseMovement or a.UserInputType == Enum.UserInputType.Touch)) then
					local u = a.Position - B;
					g.Position = UDim2.new(H.X.Scale, H.X.Offset + u.X, H.Y.Scale, H.Y.Offset + u.Y);
				end;
			end);
		end;
		local X = Instance.new("Frame", I);
		X.Name = "StealBarGlow";
		X.Size = UDim2.new(0, R + 18, 0, O + 18);
		X.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		X.BackgroundTransparency = 1;
		X.BorderSizePixel = 0;
		X.ZIndex = 1;
		(Instance.new("UICorner", X)).CornerRadius = UDim.new(0, c + 8);
		local w = Instance.new("Frame", I);
		w.Name = "StealBar";
		w.Size = UDim2.new(0, R, 0, O);
		_G.MasaStealBarDefaultPosition = UDim2.new(.5, -math.floor(R / 2), 1, -140);
		w.Position = tableToUDim2(savedStealBarPositionTable, _G.MasaStealBarDefaultPosition);
		savedStealBarPositionTable = udim2ToTable(w.Position);
		w.BackgroundColor3 = F.glass;
		w.BackgroundTransparency = .06;
		w.BorderSizePixel = 0;
		w.Active = true;
		w.ClipsDescendants = true;
		w.ZIndex = 2;
		(Instance.new("UICorner", w)).CornerRadius = UDim.new(0, c);
		local k = Instance.new("UIStroke", w);
		k.Color = F.lineSoft;
		k.Thickness = 1.4;
		k.Transparency = .35;
		local function t()
			if X and w then
				X.Position = UDim2.new(w.Position.X.Scale, w.Position.X.Offset - 9, w.Position.Y.Scale, w.Position.Y.Offset - 9);
			end;
		end;
		t();
		(w:GetPropertyChangedSignal("Position")):Connect(function()
			savedStealBarPositionTable = udim2ToTable(w.Position);
			t();
		end);
		drag(w);
		_G.MasaResetStealBarPosition = function()
				if w and w.Parent then
					w.Position = _G.MasaStealBarDefaultPosition or UDim2.new(.5, -174, 1, -140);
					savedStealBarPositionTable = udim2ToTable(w.Position);
					t();
				else
					savedStealBarPositionTable = nil;
				end;
			end;
		_G.MasaApplyStealBarPosition = function()
				if w and w.Parent then
					w.Position = tableToUDim2(savedStealBarPositionTable, _G.MasaStealBarDefaultPosition or UDim2.new(.5, -174, 1, -140));
					savedStealBarPositionTable = udim2ToTable(w.Position);
					t();
				end;
			end;
		local V = Instance.new("UIScale");
		V.Name = "MasaProgressBarScale";
		V.Scale = Nj or 1;
		V.Parent = w;
		task.defer(function()
			if _G.MasaApplyProgressBarScale then
				pcall(_G.MasaApplyProgressBarScale);
			end;
		end);
		w.DescendantAdded:Connect(function(g)
			if g:IsA("TextLabel") or g:IsA("TextButton") or g:IsA("TextBox") then
				task.defer(function()
					if _G.MasaApplyProgressBarScale then
						pcall(_G.MasaApplyProgressBarScale);
					end;
				end);
			end;
		end);
		local E = Instance.new("ImageLabel", w);
		E.Name = "BarBackground";
		E.Size = UDim2.new(1, 0, 1, 0);
		E.BackgroundTransparency = 1;
		E.ImageTransparency = 1;
		E.Image = "";
		E.ScaleType = Enum.ScaleType.Crop;
		E.Visible = false;
		E.ZIndex = 1;
		(Instance.new("UICorner", E)).CornerRadius = UDim.new(0, c);
		local N = Instance.new("Frame", w);
		N.Name = "Scrim";
		N.Size = UDim2.new(1, 0, 1, 0);
		N.BackgroundColor3 = Color3.fromRGB(255, 240, 245);
		N.BackgroundTransparency = .12;
		N.BorderSizePixel = 0;
		N.ZIndex = 2;
		(Instance.new("UICorner", N)).CornerRadius = UDim.new(0, c);
		local function n()
			local g = m:FindFirstChild("MasaHub") or m:FindFirstChild("MasaHub");
			local u = g and g:FindFirstChild("Main");
			return u and u:FindFirstChild("CustomBackground") or nil;
		end;
		local A = nil;
		local function d()
			E.Image = "";
			E.Visible = false;
			return true;
		end;
		_G.MasaStealBarSyncBackground = d;
		task.spawn(function()
			for g = 1, 40, 1 do
				if d() then
					break;
				end;
				task.wait(.25);
			end;
		end);
		local C = Instance.new("Frame", w);
		C.Name = "TopRow";
		C.Size = UDim2.new(1, -24, 0, 22);
		C.Position = UDim2.new(0, 12, 0, 6);
		C.BackgroundTransparency = 1;
		C.ZIndex = 10;
		local j = Instance.new("Frame", C);
		j.Name = "Badge";
		j.Size = UDim2.new(0, 54, 0, 18);
		j.Position = UDim2.new(0, 0, .5, -9);
		j.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		j.BackgroundTransparency = .15;
		j.BorderSizePixel = 0;
		j.ZIndex = 11;
		(Instance.new("UICorner", j)).CornerRadius = UDim.new(1, 0);
		local q = Instance.new("UIStroke", j);
		q.Color = Color3.fromRGB(255, 160, 200);
		q.Thickness = 1;
		q.Transparency = .25;
		local p = Instance.new("TextLabel", j);
		p.Name = "StateLabel";
		p.Size = UDim2.new(1, 0, 1, 0);
		p.BackgroundTransparency = 1;
		p.Text = "STEAL";
		p.TextColor3 = Color3.fromRGB(255, 255, 255);
		p.Font = Enum.Font.GothamBlack;
		p.TextSize = 10;
		p.TextXAlignment = Enum.TextXAlignment.Center;
		p.TextStrokeTransparency = 1;
		p.ZIndex = 12;
		local L = Instance.new("TextLabel", C);
		L.Name = "HubTitle";
		L.Size = UDim2.new(0, 90, 1, 0);
		L.Position = UDim2.new(0, 60, 0, 0);
		L.BackgroundTransparency = 1;
		L.Text = "Masa Hub";
		L.TextColor3 = Color3.fromRGB(255, 105, 180);
		L.Font = Enum.Font.GothamBlack;
		L.TextSize = 12;
		L.TextXAlignment = Enum.TextXAlignment.Left;
		L.TextYAlignment = Enum.TextYAlignment.Center;
		L.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
		L.TextStrokeTransparency = .7;
		L.ZIndex = 11;
		local b = Instance.new("TextLabel", C);
		b.Name = "Percent";
		b.AnchorPoint = Vector2.new(1, .5);
		b.Position = UDim2.new(1, -78, .5, 0);
		b.Size = UDim2.new(0, 56, 1, 0);
		b.BackgroundTransparency = 1;
		b.Text = "0%";
		b.TextColor3 = F.txtDim;
		b.Font = Enum.Font.GothamBlack;
		b.TextSize = 14;
		b.TextXAlignment = Enum.TextXAlignment.Right;
		b.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
		b.TextStrokeTransparency = .75;
		b.ZIndex = 11;
		local T = 72;
		local W = Instance.new("Frame", C);
		W.Name = "Stats";
		W.Visible = true;
		W.AnchorPoint = Vector2.new(1, .5);
		W.Position = UDim2.new(1, 0, .5, 0);
		W.Size = UDim2.new(0, T, 0, 18);
		W.BackgroundTransparency = 1;
		W.ZIndex = 11;
		local D = Instance.new("UIListLayout", W);
		D.FillDirection = Enum.FillDirection.Horizontal;
		D.HorizontalAlignment = Enum.HorizontalAlignment.Right;
		D.VerticalAlignment = Enum.VerticalAlignment.Center;
		D.SortOrder = Enum.SortOrder.LayoutOrder;
		D.Padding = UDim.new(0, 4);
		local function K(g, u, B)
			local a = Instance.new("Frame", W);
			a.Name = u .. "Pill";
			a.LayoutOrder = g;
			a.Size = UDim2.new(0, 34, 0, 16);
			a.BackgroundColor3 = Color3.fromRGB(241, 245, 249);
			a.BackgroundTransparency = .15;
			a.BorderSizePixel = 0;
			a.ZIndex = 12;
			(Instance.new("UICorner", a)).CornerRadius = UDim.new(1, 0);
			local H = Instance.new("TextLabel", a);
			H.Name = "Value";
			H.Size = UDim2.new(1, 0, 1, 0);
			H.BackgroundTransparency = 1;
			H.Text = "--";
			H.TextColor3 = F.txt;
			H.Font = Enum.Font.GothamBlack;
			H.TextSize = 9;
			H.TextXAlignment = Enum.TextXAlignment.Center;
			H.ZIndex = 13;
			return H;
		end;
		local o = K(1, "FPS", "FPS");
		o.Name = "SBFps";
		local x = K(2, "MS", "MS");
		x.Name = "SBPing";
		local l = Instance.new("TextLabel", w);
		l.Size = UDim2.new(0, 0, 0, 0);
		l.Visible = false;
		local M = Instance.new("Frame", w);
		M.Name = "Track";
		M.AnchorPoint = Vector2.new(.5, 1);
		M.Position = UDim2.new(.5, 0, 1, -Z);
		M.Size = UDim2.new(1, -((Q * 2)), 0, h);
		M.BackgroundColor3 = F.track;
		M.BackgroundTransparency = .25;
		M.BorderSizePixel = 0;
		M.ClipsDescendants = true;
		M.ZIndex = 6;
		(Instance.new("UICorner", M)).CornerRadius = UDim.new(1, 0);
		local z = Instance.new("UIStroke", M);
		z.Color = Color3.fromRGB(203, 213, 225);
		z.Thickness = 1;
		z.Transparency = .45;
		local f = Instance.new("Frame", M);
		f.Name = "WashClip";
		f.Size = UDim2.new(0, 0, 1, 0);
		f.BackgroundTransparency = 1;
		f.BorderSizePixel = 0;
		f.ClipsDescendants = true;
		f.ZIndex = 7;
		local G = Instance.new("Frame", f);
		G.Name = "Wash";
		G.Size = UDim2.new(0, R - Q * 2, 1, 0);
		G.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		G.BorderSizePixel = 0;
		G.ZIndex = 7;
		(Instance.new("UICorner", G)).CornerRadius = UDim.new(1, 0);
		local s = Instance.new("UIGradient", G);
		s.Rotation = 0;
		s.Color = S;
		s.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .08), NumberSequenceKeypoint.new(.55, .02), NumberSequenceKeypoint.new(1, 0) });
		local Y = Instance.new("Frame", M);
		Y.Name = "Edge";
		Y.AnchorPoint = Vector2.new(.5, .5);
		Y.Size = UDim2.new(0, 4, 1, 4);
		Y.Position = UDim2.new(0, 0, .5, 0);
		Y.BackgroundColor3 = Color3.fromRGB(255, 220, 235);
		Y.BackgroundTransparency = 1;
		Y.BorderSizePixel = 0;
		Y.ZIndex = 8;
		(Instance.new("UICorner", Y)).CornerRadius = UDim.new(1, 0);
		local v = Instance.new("UIStroke", Y);
		v.Color = Color3.fromRGB(255, 192, 203);
		v.Thickness = 1.5;
		v.Transparency = .2;
		local J = "IDLE";
		local gl, ul = 0, 0;
		function setBarState(g)
			g = (tostring(g or "IDLE")):upper();
			J = g;
			local u = (g ~= "IDLE");
			local B = (g == "DONE" or g == "SUCCESS" or g == "STOLEN");
			local a = "STEAL";
			if g == "STEALING" then
				a = "STEALING";
			elseif B then
				a = "STOLEN";
			elseif g ~= "IDLE" then
				a = g;
			end;
			p.Text = a;
			s.Color = B and U or (u and S or r);
			j.BackgroundColor3 = B and Color3.fromRGB(34, 197, 94) or (u and Color3.fromRGB(220, 60, 140) or Color3.fromRGB(255, 105, 180));
			j.BackgroundTransparency = u and .05 or .2;
			local i = u and F.txtOn or F.txtDim;
			(H:Create(b, TweenInfo.new(.18), { TextColor3 = i })):Play();
			(H:Create(k, TweenInfo.new(.22), { Color = B and Color3.fromRGB(74, 222, 128) or (u and F.line or F.lineSoft), Transparency = u and .08 or .38, Thickness = u and 1.8 or 1.3 })):Play();
			(H:Create(X, TweenInfo.new(.25), { BackgroundTransparency = u and .82 or 1 })):Play();
		end;
		local Bl;
		Bl = g.RenderStepped:Connect(function(g)
				if not w.Parent then
					pcall(function()
						Bl:Disconnect();
					end);
					return;
				end;
				if ul ~= gl then
					local u = 1 - math.exp(-40 * math.min(g, .1));
					ul = ul + ((gl - ul)) * u;
					if math.abs(gl - ul) < .003 then
						ul = gl;
					end;
				end;
				f.Size = UDim2.new(ul, 0, 1, 0);
				local u = math.max(1, M.AbsoluteSize.X);
				G.Size = UDim2.new(0, u, 1, 0);
				b.Text = math.floor(ul * 100 + .5) .. "%";
				if ul > .04 and (ul < .97 and (gl > .04 and (gl < .999 and J ~= "IDLE"))) then
					Y.BackgroundTransparency = .05;
					Y.Position = UDim2.new(ul, 0, .5, 0);
				else
					Y.BackgroundTransparency = 1;
				end;
			end);
		local al = {};
		function al.SetProgress(g)
			g = math.clamp(tonumber(g) or 0, 0, 1);
			gl = g;
			if g >= .999 then
				ul = 1;
				f.Size = UDim2.new(1, 0, 1, 0);
				Y.BackgroundTransparency = 1;
				b.Text = "100%";
			end;
		end;
		function al.Reset()
			gl = 0;
			ul = 0;
			f.Size = UDim2.new(0, 0, 1, 0);
			G.BackgroundTransparency = 0;
			Y.BackgroundTransparency = 1;
			Y.Position = UDim2.new(0, 0, 0, 0);
			b.Text = "0%";
			setBarState("IDLE");
		end;
		function al.SetState(g)
			setBarState(g);
		end;
		setBarState("IDLE");
		task.spawn(function()
			local u = tick();
			local a = 0;
			local H = 0;
			local i = 0;
			local R = tick();
			local O = g.RenderStepped:Connect(function()
					a = a + 1;
					local g = tick();
					local B = g - u;
					if B >= .25 then
						H = math.floor(a / B + .5);
						a = 0;
						u = g;
					end;
				end);
			while w and w.Parent do
				local g = tick();
				if g - R >= .5 then
					R = g;
					pcall(function()
						local g = e:GetNetworkPing();
						if g then
							i = math.floor(g * 1000 + .5);
						end;
					end);
				end;
				o.Text = tostring(H);
				x.Text = tostring(i);
				if H >= 120 then
					o.TextColor3 = F.good;
				elseif H >= 60 then
					o.TextColor3 = F.warn;
				else
					o.TextColor3 = F.bad;
				end;
				if i <= 50 then
					x.TextColor3 = F.good;
				elseif i <= 100 then
					x.TextColor3 = F.warn;
				else
					x.TextColor3 = F.bad;
				end;
				pcall(d);
				local u = (_G._MasaKickWarn and _G._MasaKickWarn.active == true) or (m:FindFirstChild("MasaHubKickWarning") ~= nil);
				if y and (not u and (i > 120 and tick() >= ((_G._MasaHPWNextAllowed or 0)))) then
					local g = m:FindFirstChild("MasaHubPingWarning");
					if not g then
						local g = Instance.new("ScreenGui");
						g.Name = "MasaHubPingWarning";
						g.ResetOnSpawn = false;
						g.IgnoreGuiInset = true;
						g.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
						g.DisplayOrder = 99999;
						g.Parent = m;
						_G._MasaHPWNextAllowed = tick() + 13.5;
						local u = Instance.new("Frame");
						u.Name = "WarningFrame";
						u.Size = UDim2.new(0, 420, 0, 52);
						u.Position = UDim2.new(.5, -210, 0, -60);
						u.BackgroundColor3 = Color3.fromRGB(180, 30, 30);
						u.BackgroundTransparency = .12;
						u.BorderSizePixel = 0;
						u.ZIndex = 1000;
						u.Parent = g;
						(Instance.new("UICorner", u)).CornerRadius = UDim.new(0, 12);
						local a = Instance.new("UIStroke", u);
						a.Color = Color3.fromRGB(255, 80, 80);
						a.Thickness = 2;
						a.Transparency = .15;
						a.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
						local H = Instance.new("TextLabel");
						H.Name = "WarningIcon";
						H.Size = UDim2.new(0, 36, 1, 0);
						H.Position = UDim2.new(0, 12, 0, 0);
						H.BackgroundTransparency = 1;
						H.Text = "\226\154\160\239\184\143";
						H.TextColor3 = Color3.fromRGB(255, 255, 255);
						H.Font = Enum.Font.GothamBlack;
						H.TextSize = 26;
						H.TextXAlignment = Enum.TextXAlignment.Center;
						H.ZIndex = 1001;
						H.Parent = u;
						local i = Instance.new("TextLabel");
						i.Name = "WarningText";
						i.Size = UDim2.new(1, -56, 1, 0);
						i.Position = UDim2.new(0, 48, 0, 0);
						i.BackgroundTransparency = 1;
						i.Text = "MORE THAN 120 PING DONT DUEL";
						i.TextColor3 = Color3.fromRGB(255, 255, 255);
						i.Font = Enum.Font.GothamBlack;
						i.TextSize = 16;
						i.TextXAlignment = Enum.TextXAlignment.Left;
						i.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
						i.TextStrokeTransparency = .25;
						i.ZIndex = 1001;
						i.Parent = u;
						(B:Create(u, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(.5, -210, 0, 18) })):Play();
						task.delay(3, function()
							if g and g.Parent then
								(B:Create(u, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = UDim2.new(.5, -210, 0, -60), BackgroundTransparency = 1 })):Play();
								(B:Create(i, TweenInfo.new(.2), { TextTransparency = 1 })):Play();
								(B:Create(H, TweenInfo.new(.2), { TextTransparency = 1 })):Play();
								task.wait(.35);
								pcall(function()
									g:Destroy();
								end);
								_G._MasaHPWNextAllowed = tick() + 10;
							end;
						end);
					end;
				end;
				task.wait(.5);
			end;
			pcall(function()
				O:Disconnect();
			end);
			pcall(function()
				Bl:Disconnect();
			end);
			pcall(function()
				if A then
					A:Disconnect();
				end;
			end);
		end);
		_G.StealBar = al;
	end;
_G.__MasaDuelsSetupStealBar();
if _G.MasaAutoStealSync then
	task.defer(_G.MasaAutoStealSync);
end;
task.defer(function()
	task.wait(.35);
	if _G.MasaApplyHalloweenTheme then
		pcall(_G.MasaApplyHalloweenTheme);
	end;
end);
_G.__MasaDuelsSetupMinimizeToggle = function()
		_G.__MasaDuelsMinimized = false;
		IF.MouseButton1Click:Connect(function()
			if OF.Visible then
				if _G.MasaHubClose then
					_G.MasaHubClose(true);
				else
					_G.__MasaDuelsMinimized = true;
					OF.Visible = false;
					hF.Visible = true;
				end;
			else
				if _G.MasaHubOpen then
					_G.MasaHubOpen();
				else
					_G.__MasaDuelsMinimized = false;
					OF.Visible = true;
					hF.Visible = false;
					OF.Size = RF;
				end;
			end;
			saveMasaConfig();
		end);
	end;
_G.__MasaDuelsSetupMinimizeToggle();
_G.__MasaDuelsRunIntro = function()
		local g = B;
		local u = iF and iF.Parent or m;
		local H = RF or OF.Size;
		local i = (_G.__MasaDuelsMinimized == true);
		if not _introEnabled then
			stopIntroPlayback();
			stopIntroPreview();
			OF.Size = H;
			if not i then
				OF.Visible = true;
				hF.Visible = false;
			else
				OF.Visible = false;
				hF.Visible = true;
			end;
			return;
		end;
		playIntroMusic();
		OF.Visible = false;
		hF.Visible = false;
		OF.Size = UDim2.new(0, 0, 0, 0);
		task.spawn(function()
			local B = Instance.new("ScreenGui");
			B.Name = "MasaHubIntro";
			B.IgnoreGuiInset = true;
			B.DisplayOrder = 100;
			B.ResetOnSpawn = false;
			B.Parent = u;
			local i = true;
			local R = {
					ice = Color3.fromRGB(255, 192, 203),
					sky = Color3.fromRGB(255, 105, 180),
					mid = Color3.fromRGB(255, 105, 180),
					deep = Color3.fromRGB(255, 160, 200),
					navy = Color3.fromRGB(255, 220, 235),
					ink = Color3.fromRGB(255, 235, 245),
				};
			local function O()
				if not i then
					return;
				end;
				i = false;
				stopIntroPlayback();
				hF.Visible = false;
				OF.Visible = true;
				pcall(function()
					(g:Create(OF, TweenInfo.new(.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = H })):Play();
				end);
				task.delay(.75, function()
					pcall(function()
						B:Destroy();
					end);
				end);
			end;
			local c = Instance.new("Frame", B);
			c.Size = UDim2.new(1, 0, 1, 0);
			c.BackgroundColor3 = Color3.fromRGB(255, 235, 245);
			c.BackgroundTransparency = 1;
			c.BorderSizePixel = 0;
			c.ZIndex = 1;
			local h = Instance.new("UIGradient", c);
			h.Rotation = 90;
			h.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(.45, Color3.fromRGB(255, 220, 235)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 192, 203)) });
			local Q = Instance.new("Frame", B);
			Q.Size = UDim2.new(1, 0, 1, 0);
			Q.BackgroundColor3 = Color3.fromRGB(0, 40, 120);
			Q.BackgroundTransparency = 1;
			Q.BorderSizePixel = 0;
			Q.ZIndex = 2;
			local e = Instance.new("UIGradient", Q);
			e.Rotation = 90;
			e.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .55), NumberSequenceKeypoint.new(.5, 1), NumberSequenceKeypoint.new(1, .45) });
			local P = Instance.new("TextButton", B);
			P.Name = "SkipIntro";
			P.AnchorPoint = Vector2.new(1, 0);
			P.Position = UDim2.new(1, -22, 0, 22);
			P.Size = UDim2.new(0, 108, 0, 34);
			P.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			P.BackgroundTransparency = 0;
			P.BorderSizePixel = 0;
			P.Text = "SKIP";
			P.TextColor3 = Color3.fromRGB(4, 12, 32);
			P.TextSize = 12;
			P.Font = Enum.Font.GothamBlack;
			P.AutoButtonColor = false;
			P.ZIndex = 80;
			(Instance.new("UICorner", P)).CornerRadius = UDim.new(1, 0);
			local m = Instance.new("UIGradient", P);
			m.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.55, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(220, 60, 140)) });
			P.MouseButton1Click:Connect(O);
			local Z = Instance.new("Frame", B);
			Z.AnchorPoint = Vector2.new(.5, .5);
			Z.Position = UDim2.new(.5, 0, .5, 0);
			Z.Size = UDim2.new(0, 720, 0, 420);
			Z.BackgroundTransparency = 1;
			Z.ZIndex = 20;
			local function F(g, u, B, a)
				local H = Instance.new("Frame", Z);
				H.AnchorPoint = Vector2.new(.5, .5);
				H.Position = UDim2.new(.5, 0, .48, 0);
				H.Size = UDim2.new(0, 8, 0, 8);
				H.BackgroundTransparency = 1;
				H.ZIndex = B;
				local i = Instance.new("UIStroke", H);
				i.Thickness = u;
				i.Color = R.sky;
				i.Transparency = 1;
				(Instance.new("UICorner", H)).CornerRadius = UDim.new(1, 0);
				H:SetAttribute("Target", g);
				H:SetAttribute("RotSpeed", a);
				return H, i;
			end;
			local S, r = F(280, 1.6, 21, 22);
			local U, I = F(360, 1.1, 21, -16);
			local X, w = F(440, .8, 21, 11);
			local k = Instance.new("Frame", B);
			k.AnchorPoint = Vector2.new(.5, .5);
			k.Position = UDim2.new(.5, 0, -0.1, 0);
			k.Size = UDim2.new(1, 0, 0, 3);
			k.BackgroundColor3 = R.sky;
			k.BackgroundTransparency = 1;
			k.BorderSizePixel = 0;
			k.ZIndex = 15;
			local t = Instance.new("UIGradient", k);
			t.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(.5, 0), NumberSequenceKeypoint.new(1, 1) });
			local V = Instance.new("Frame", B);
			V.Size = UDim2.new(1, 0, 1, 0);
			V.BackgroundColor3 = Color3.fromRGB(255, 200, 225);
			V.BackgroundTransparency = 1;
			V.BorderSizePixel = 0;
			V.ZIndex = 70;
			local E = Instance.new("Frame", Z);
			E.AnchorPoint = Vector2.new(.5, .5);
			E.Position = UDim2.new(.5, 0, .44, 0);
			E.Size = UDim2.new(0, 620, 0, 96);
			E.BackgroundTransparency = 1;
			E.ZIndex = 40;
			local N = Instance.new("UIListLayout", E);
			N.FillDirection = Enum.FillDirection.Horizontal;
			N.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			N.VerticalAlignment = Enum.VerticalAlignment.Center;
			N.Padding = UDim.new(0, 4);
			N.SortOrder = Enum.SortOrder.LayoutOrder;
			local n = "MASA";
			local A = {};
			for g = 1, #n, 1 do
				local u = string.sub(n, g, g);
				local B = Instance.new("TextLabel", E);
				B.LayoutOrder = g;
				B.Size = UDim2.new(0, 72, 0, 96);
				B.BackgroundTransparency = 1;
				B.Text = u;
				B.TextColor3 = Color3.fromRGB(255, 255, 255);
				B.Font = Enum.Font.GothamBlack;
				B.TextSize = 78;
				B.TextTransparency = 1;
				B.TextStrokeColor3 = R.mid;
				B.TextStrokeTransparency = 1;
				B.ZIndex = 41;
				local a = Instance.new("UIScale");
				a.Name = "Pop";
				a.Scale = .28;
				a.Parent = B;
				local H = Instance.new("UIGradient", B);
				H.Rotation = 90;
				H.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 192, 203)), ColorSequenceKeypoint.new(.45, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
				A[g] = B;
			end;
			local d = Instance.new("Frame", Z);
			d.AnchorPoint = Vector2.new(.5, 0);
			d.Position = UDim2.new(.5, 0, .62, 0);
			d.Size = UDim2.new(0, 0, 0, 36);
			d.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			d.BackgroundTransparency = 1;
			d.BorderSizePixel = 0;
			d.ZIndex = 42;
			(Instance.new("UICorner", d)).CornerRadius = UDim.new(1, 0);
			local C = Instance.new("UIGradient", d);
			C.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
			local j = Instance.new("TextLabel", d);
			j.Size = UDim2.new(1, 0, 1, 0);
			j.BackgroundTransparency = 1;
			j.Text = "H U B";
			j.TextColor3 = Color3.fromRGB(4, 12, 32);
			j.Font = Enum.Font.GothamBlack;
			j.TextSize = 16;
			j.TextTransparency = 1;
			j.ZIndex = 43;
			local q = Instance.new("TextLabel", Z);
			q.AnchorPoint = Vector2.new(.5, 0);
			q.Position = UDim2.new(.5, 0, .74, 0);
			q.Size = UDim2.new(1, 0, 0, 24);
			q.BackgroundTransparency = 1;
			q.Text = "";
			q.TextColor3 = Color3.fromRGB(255, 170, 210);
			q.Font = Enum.Font.GothamMedium;
			q.TextSize = 18;
			q.TextTransparency = 1;
			q.ZIndex = 42;
			local p = {};
			for g = 1, 18, 1 do
				local u = Instance.new("Frame", Z);
				u.AnchorPoint = Vector2.new(.5, .5);
				u.Size = UDim2.new(0, (g % 3 == 0) and 5 or 3, 0, (g % 3 == 0) and 5 or 3);
				u.BackgroundColor3 = (g % 2 == 0) and R.sky or R.ice;
				u.BackgroundTransparency = 1;
				u.BorderSizePixel = 0;
				u.ZIndex = 18;
				(Instance.new("UICorner", u)).CornerRadius = UDim.new(1, 0);
				u:SetAttribute("Angle", (((g / 18)) * math.pi) * 2);
				u:SetAttribute("Rad", 150 + ((g % 5)) * 28);
				p[g] = u;
			end;
			local L;
			L = a.RenderStepped:Connect(function(g)
					if not B.Parent then
						pcall(function()
							L:Disconnect();
						end);
						return;
					end;
					local u = os.clock();
					S.Rotation = u * 22;
					U.Rotation = -u * 16;
					X.Rotation = u * 11;
					for g, B in ipairs(p) do
						local a = B:GetAttribute("Angle") + u * ((.35 + ((g % 4)) * .08));
						local H = B:GetAttribute("Rad");
						B.Position = UDim2.new(.5, math.cos(a) * H, .48, (math.sin(a) * H) * .42);
					end;
				end);
			(g:Create(c, TweenInfo.new(.55), { BackgroundTransparency = 0 })):Play();
			(g:Create(Q, TweenInfo.new(.7), { BackgroundTransparency = .55 })):Play();
			task.wait(.28);
			if not i then
				return;
			end;
			(g:Create(S, TweenInfo.new(.7, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 280, 0, 280) })):Play();
			(g:Create(r, TweenInfo.new(.5), { Transparency = .25 })):Play();
			task.wait(.08);
			(g:Create(U, TweenInfo.new(.75, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 360, 0, 360) })):Play();
			(g:Create(I, TweenInfo.new(.5), { Transparency = .45 })):Play();
			task.wait(.08);
			(g:Create(X, TweenInfo.new(.8, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 440, 0, 440) })):Play();
			(g:Create(w, TweenInfo.new(.5), { Transparency = .62 })):Play();
			k.BackgroundTransparency = .15;
			(g:Create(k, TweenInfo.new(1.15, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), { Position = UDim2.new(.5, 0, 1.1, 0) })):Play();
			for u, B in ipairs(p) do
				(g:Create(B, TweenInfo.new(.45), { BackgroundTransparency = .25 })):Play();
			end;
			task.wait(.22);
			if not i then
				return;
			end;
			for u, B in ipairs(A) do
				if not i then
					break;
				end;
				local a = B:FindFirstChild("Pop");
				if a then
					(g:Create(a, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })):Play();
				end;
				(g:Create(B, TweenInfo.new(.34, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { TextTransparency = 0, TextStrokeTransparency = .35 })):Play();
				task.wait(.055);
			end;
			(g:Create(V, TweenInfo.new(.08), { BackgroundTransparency = .72 })):Play();
			task.delay(.08, function()
				(g:Create(V, TweenInfo.new(.35), { BackgroundTransparency = 1 })):Play();
			end);
			task.wait(.12);
			if not i then
				return;
			end;
			d.BackgroundTransparency = 0;
			(g:Create(d, TweenInfo.new(.42, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 128, 0, 36) })):Play();
			(g:Create(j, TweenInfo.new(.28), { TextTransparency = 0 })):Play();
			task.wait(.22);
			if not i then
				return;
			end;
			(g:Create(q, TweenInfo.new(.4), { TextTransparency = 0 })):Play();
			local b = 0;
			while i and b < 2.35 do
				local g = .5 + .5 * math.sin(os.clock() * 3.2);
				r.Transparency = .18 + g * .18;
				task.wait(.05);
				b = b + .05;
			end;
			if not i then
				return;
			end;
			(g:Create(q, TweenInfo.new(.28), { TextTransparency = 1 })):Play();
			(g:Create(j, TweenInfo.new(.22), { TextTransparency = 1 })):Play();
			(g:Create(d, TweenInfo.new(.32, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 36), BackgroundTransparency = 1 })):Play();
			for u, B in ipairs(A) do
				local a = B:FindFirstChild("Pop");
				if a then
					(g:Create(a, TweenInfo.new(.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Scale = .2 })):Play();
				end;
				(g:Create(B, TweenInfo.new(.28, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { TextTransparency = 1, TextStrokeTransparency = 1 })):Play();
			end;
			(g:Create(S, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) })):Play();
			(g:Create(U, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) })):Play();
			(g:Create(X, TweenInfo.new(.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) })):Play();
			(g:Create(r, TweenInfo.new(.3), { Transparency = 1 })):Play();
			(g:Create(I, TweenInfo.new(.3), { Transparency = 1 })):Play();
			(g:Create(w, TweenInfo.new(.3), { Transparency = 1 })):Play();
			for u, B in ipairs(p) do
				(g:Create(B, TweenInfo.new(.25), { BackgroundTransparency = 1 })):Play();
			end;
			(g:Create(c, TweenInfo.new(.7), { BackgroundTransparency = 1 })):Play();
			(g:Create(Q, TweenInfo.new(.55), { BackgroundTransparency = 1 })):Play();
			OF.Visible = true;
			hF.Visible = false;
			(g:Create(OF, TweenInfo.new(.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = H })):Play();
			task.wait(.85);
			i = false;
			pcall(function()
				if L then
					L:Disconnect();
				end;
			end);
			pcall(function()
				B:Destroy();
			end);
		end);
	end;
_G.__MasaDuelsRunIntro();
_G.MasaDuelsForceSyncLoadedButtons = function()
		pcall(function()
			if Z.setAutoTPVisual then
				Z.setAutoTPVisual(nl);
			end;
			if nl then
				Dl();
			else
				Kl();
			end;
		end);
		pcall(function()
			if setInfJumpVisual then
				setInfJumpVisual(yl);
			end;
			if setInfJumpInternal then
				setInfJumpInternal(yl);
			end;
			if _G.MasaRefreshInfJumpModeSelector then
				_G.MasaRefreshInfJumpModeSelector();
			end;
			if _G.MasaRefreshTPDownMethodSelector then
				_G.MasaRefreshTPDownMethodSelector();
			end;
			if _G.MasaFonts then
				pcall(_G.MasaFonts.applyAll);
				pcall(_G.MasaFonts.hook);
			end;
		end);
		pcall(function()
			if Z.setLookAtVisual then
				Z.setLookAtVisual(_G.MasaLookAtEnabled == true);
			end;
			if _G.MasaLookAtRadiusBox then
				_G.MasaLookAtRadiusBox.Text = tostring(tonumber(_G.MasaLookAtRadius) or 20);
			end;
			if _G.MasaLookAtEnabled then
				if _G.MasaStartLookAt then
					_G.MasaStartLookAt();
				end;
			else
				if _G.MasaStopLookAt then
					_G.MasaStopLookAt();
				end;
			end;
		end);
		pcall(function()
			if setAutoCarrySpeedVisual then
				setAutoCarrySpeedVisual(autoCarrySpeedEnabled == true);
			end;
			if _G.MasaRefreshAutoCarryModeSelector then
				_G.MasaRefreshAutoCarryModeSelector();
			end;
		end);
		pcall(function()
			if setAntiRagdollVisual then
				setAntiRagdollVisual(gj);
			end;
			if Z.setTPRagdollVisual then
				Z.setTPRagdollVisual(_G.MasaTPRagdollEnabled == true);
			end;
			if _G.MasaRefreshAntiRagdollModeSelector then
				_G.MasaRefreshAntiRagdollModeSelector();
			end;
			hj(gj);
		end);
		pcall(function()
			if Z.setAntiDieVisual then
				Z.setAntiDieVisual(_G._MasaAntiDieUserWanted == true);
			end;
			Ij(_G._MasaAntiDieUserWanted == true);
			if _G.MasaAntiDieAutoSync then
				_G.MasaAntiDieAutoSync();
			end;
		end);
		pcall(function()
			if _G.MasaSetAutoLeft then
				_G.MasaSetAutoLeft(Xl, true);
			end;
			if _G.MasaSetAutoRight then
				_G.MasaSetAutoRight(wl, true);
			end;
		end);
		pcall(function()
			if setAutoStealVisual then
				setAutoStealVisual(X);
			end;
			if _G.MasaAutoStealSync then
				_G.MasaAutoStealSync();
			end;
			if _G.MasaSetRadiusCircle then
				_G.MasaSetRadiusCircle(_G.MasaRadiusCircleEnabled == true);
			end;
			if _G.MasaRadiusCircleSetVisual then
				_G.MasaRadiusCircleSetVisual(_G.MasaRadiusCircleEnabled == true);
			end;
			if _G.MasaSetRadiusCircleColor then
				_G.MasaSetRadiusCircleColor(_G.MasaRadiusCircleColor);
			end;
			if _G.MasaRadiusCircleSetColorPreview then
				_G.MasaRadiusCircleSetColorPreview(_G.MasaRadiusCircleColor);
			end;
		end);
		pcall(function()
			if _G.MasaNormalAutoSwingSetVisual then
				_G.MasaNormalAutoSwingSetVisual(d);
			end;
			if _G.MasaMirrorTPDownSetVisual then
				_G.MasaMirrorTPDownSetVisual(C);
			end;
			if _G.MasaTPBatAutoSwingSetVisual then
				_G.MasaTPBatAutoSwingSetVisual(j);
			end;
			if _G.MasaTPBatCameraLockSetVisual then
				_G.MasaTPBatCameraLockSetVisual(_G._MasaGetTPBatCameraLock and _G._MasaGetTPBatCameraLock() or false);
			end;
			_G.MasaTPBatVersion = math.clamp(tonumber(_G.MasaTPBatVersion) or 1, 1, 3);
			if _G._MasaTPBatSetVersionVisual then
				_G._MasaTPBatSetVersionVisual(_G.MasaTPBatVersion);
			end;
			if _G.MasaTPBatSetVisual then
				_G.MasaTPBatSetVisual(_G.MasaTPBatOn == true);
			end;
			if _G.MasaTPBatOn and _G.MasaStartTPBat then
				_G.MasaStartTPBat();
			elseif _G.MasaStopTPBat then
				_G.MasaStopTPBat();
			end;
		end);
		pcall(function()
			if N == "V2" then
				if _G.MasaNormalAimbotStop then
					_G.MasaNormalAimbotStop();
				end;
				if _G.MasaBatAimbotV2On and _G.MasaBatAimbotV2Start then
					_G.MasaBatAimbotV2Start();
				elseif _G.MasaBatAimbotV2Stop then
					_G.MasaBatAimbotV2Stop();
				end;
			else
				if _G.MasaBatAimbotV2Stop then
					_G.MasaBatAimbotV2Stop();
				end;
				if _G.MasaNormalAimbotOn and _G.MasaNormalAimbotStart then
					_G.MasaNormalAimbotStart();
				elseif _G.MasaNormalAimbotStop then
					_G.MasaNormalAimbotStop();
				end;
			end;
			if _G.MasaRefreshAimbotVisual then
				_G.MasaRefreshAimbotVisual();
			end;
		end);
		pcall(function()
			if setBatCounterVisual then
				setBatCounterVisual(p);
			end;
			if _G.MasaRefreshBatCounterModeSelector then
				_G.MasaRefreshBatCounterModeSelector();
			end;
			if setMedCounterVisual then
				setMedCounterVisual(b);
			end;
			if Z.setSafeModeVisual then
				Z.setSafeModeVisual(T);
			end;
			if p then
				if _G.MasaStartBatCounter then
					_G.MasaStartBatCounter();
				end;
			else
				if _G.MasaStopBatCounter then
					_G.MasaStopBatCounter();
				end;
			end;
			if b then
				if _G.MasaStartMedCounter then
					_G.MasaStartMedCounter(e.Character);
				end;
			else
				if _G.MasaStopMedCounter then
					_G.MasaStopMedCounter();
				end;
			end;
			if _G.MasaSetNoPlayerCollisionVisual then
				_G.MasaSetNoPlayerCollisionVisual(_G.MasaNoPlayerCollisionEnabled);
			end;
			if _G.MasaNoPlayerCollisionEnabled then
				if enableNoPlayerCollision then
					enableNoPlayerCollision();
				end;
			else
				if disableNoPlayerCollision then
					disableNoPlayerCollision();
				end;
			end;
		end);
		pcall(function()
			if Z.setPlayerESPVisual then
				Z.setPlayerESPVisual(W);
			end;
			if W then
				if startPlayerESP then
					startPlayerESP();
				end;
				if BoxedESPOptions then
					BoxedESPOptions.box = true;
				end;
			else
				if stopPlayerESP then
					stopPlayerESP();
				end;
				if BoxedESPOptions then
					BoxedESPOptions.box = false;
				end;
			end;
			if Z.setTrackerESPVisual then
				Z.setTrackerESPVisual(D);
			end;
			if BoxedESPOptions then
				BoxedESPOptions.tracker = D;
			end;
			if refreshBoxedESP then
				refreshBoxedESP();
			end;
			if Z.setRagdollCountdownVisual then
				Z.setRagdollCountdownVisual(K);
			end;
			if K then
				stopRagdollCountdown();
				if _G.MasaStopEnemyRagdollCountdown then
					_G.MasaStopEnemyRagdollCountdown();
				end;
				hookRagdollCountdown(e.Character);
				if _G.MasaStartEnemyRagdollCountdown then
					_G.MasaStartEnemyRagdollCountdown();
				end;
			else
				stopRagdollCountdown();
				if _G.MasaStopEnemyRagdollCountdown then
					_G.MasaStopEnemyRagdollCountdown();
				end;
			end;
			if Z.setFPSBoostVisual then
				Z.setFPSBoostVisual(o);
			end;
			if o then
				enableStretchRez();
			else
				disableStretchRez();
			end;
			if Z.setAntiLagVisual then
				Z.setAntiLagVisual(x);
			end;
			if x then
				enableAntiLag();
			else
				disableAntiLag();
			end;
			if Z.setVividGraphicsVisual then
				Z.setVividGraphicsVisual(s);
			end;
			if s then
				enableVividGraphics();
			else
				disableVividGraphics();
			end;
			if Z.setXRayVisual then
				Z.setXRayVisual(v);
			end;
			if setXRay then
				pcall(setXRay, v);
			end;
			if Z.setHighPingWarningVisual then
				Z.setHighPingWarningVisual(y);
			end;
			if Z.setKickWarningVisual then
				Z.setKickWarningVisual(_G._MasaKickWarn.enabled == true);
			end;
			if _G.MasaRefreshUAKVisual then
				_G.MasaRefreshUAKVisual();
			end;
			if Z.setFOVVisual then
				Z.setFOVVisual(gl);
			end;
			if gl then
				enableCustomFov();
			else
				disableCustomFov();
			end;
			if Z.setNoCamCollisionVisual then
				Z.setNoCamCollisionVisual(Bl);
			end;
			if Bl then
				enableNoCamCollision();
			else
				disableNoCamCollision();
			end;
			if type(applyCustomSky) == "function" then
				applyCustomSky(((Sl and Sl ~= "")) and Sl or "Off");
			end;
			if Il then
				Il.Text = Sl or "Off";
			end;
		end);
		pcall(saveMasaConfig);
	end;
task.defer(function()
	task.wait(.35);
	if type(applyCustomSky) == "function" then
		pcall(function()
			applyCustomSky(((Sl and Sl ~= "")) and Sl or "Off");
		end);
	end;
	if Il then
		Il.Text = Sl or "Off";
	end;
end);
task.defer(_G.MasaDuelsForceSyncLoadedButtons);
task.delay(1, function()
	if _G.MasaDuelsForceSyncLoadedButtons then
		_G.MasaDuelsForceSyncLoadedButtons();
	end;
end);
task.defer(function()
	task.wait(.2);
	if _G.MasaSyncToggleVisuals then
		_G.MasaSyncToggleVisuals();
	end;
end);
customFontVisualEnabled = false;
if V then
	V.customFontEnabled = false;
end;
function enableCustomFont()
	customFontVisualEnabled = false;
	if V then
		V.customFontEnabled = false;
	end;
end;
function disableCustomFont()
	customFontVisualEnabled = false;
	if V then
		V.customFontEnabled = false;
	end;
end;
_G.MasaDuelsApplySavedGameplayStates = function()
		pcall(function()
			if Z.setAutoTPVisual then
				Z.setAutoTPVisual(nl == true);
			end;
			if nl then
				Dl();
			else
				Kl();
			end;
		end);
		pcall(function()
			if setInfJumpVisual then
				setInfJumpVisual(yl == true);
			end;
			if setInfJumpInternal then
				setInfJumpInternal(yl == true);
			end;
			if _G.MasaRefreshInfJumpModeSelector then
				_G.MasaRefreshInfJumpModeSelector();
			end;
			if _G.MasaRefreshTPDownMethodSelector then
				_G.MasaRefreshTPDownMethodSelector();
			end;
			if _G.MasaFonts then
				pcall(_G.MasaFonts.applyAll);
				pcall(_G.MasaFonts.hook);
			end;
		end);
		pcall(function()
			if Z.setLookAtVisual then
				Z.setLookAtVisual(_G.MasaLookAtEnabled == true);
			end;
			if _G.MasaLookAtRadiusBox then
				_G.MasaLookAtRadiusBox.Text = tostring(tonumber(_G.MasaLookAtRadius) or 20);
			end;
			if _G.MasaLookAtEnabled then
				if _G.MasaStartLookAt then
					_G.MasaStartLookAt();
				end;
			else
				if _G.MasaStopLookAt then
					_G.MasaStopLookAt();
				end;
			end;
		end);
		pcall(function()
			if setAutoCarrySpeedVisual then
				setAutoCarrySpeedVisual(autoCarrySpeedEnabled == true);
			end;
			if _G.MasaRefreshAutoCarryModeSelector then
				_G.MasaRefreshAutoCarryModeSelector();
			end;
		end);
		pcall(function()
			if setAntiRagdollVisual then
				setAntiRagdollVisual(gj == true);
			end;
			if _G.MasaRefreshAntiRagdollModeSelector then
				_G.MasaRefreshAntiRagdollModeSelector();
			end;
			if hj then
				hj(gj == true);
			end;
		end);
		pcall(function()
			if Z.setAntiDieVisual then
				Z.setAntiDieVisual(_G._MasaAntiDieUserWanted == true);
			end;
			Ij(_G._MasaAntiDieUserWanted == true);
			if _G.MasaAntiDieAutoSync then
				_G.MasaAntiDieAutoSync();
			end;
		end);
		pcall(function()
			if setAutoStealVisual then
				setAutoStealVisual(X == true);
			end;
			if _G.MasaAutoStealSync then
				_G.MasaAutoStealSync();
			end;
		end);
		pcall(function()
			if setBatCounterVisual then
				setBatCounterVisual(p == true);
			end;
			if _G.MasaRefreshBatCounterModeSelector then
				_G.MasaRefreshBatCounterModeSelector();
			end;
			if p and _G.MasaStartBatCounter then
				_G.MasaStartBatCounter();
			elseif _G.MasaStopBatCounter then
				_G.MasaStopBatCounter();
			end;
		end);
		pcall(function()
			if setMedCounterVisual then
				setMedCounterVisual(b == true);
			end;
			if b and _G.MasaStartMedCounter then
				_G.MasaStartMedCounter(e.Character);
			elseif _G.MasaStopMedCounter then
				_G.MasaStopMedCounter();
			end;
		end);
		pcall(function()
			if _G.MasaSetNoPlayerCollisionVisual then
				_G.MasaSetNoPlayerCollisionVisual(_G.MasaNoPlayerCollisionEnabled == true);
			end;
			if _G.MasaNoPlayerCollisionEnabled then
				enableNoPlayerCollision();
			else
				disableNoPlayerCollision();
			end;
		end);
		pcall(function()
			if Z.setUnwalkVisual then
				Z.setUnwalkVisual(Ol == true);
			end;
			if Ol then
				Ol = false;
				Lj();
				pj();
			else
				Ol = true;
				Lj();
			end;
		end);
		pcall(function()
			if Z.setSafeModeVisual then
				Z.setSafeModeVisual(T == true);
			end;
		end);
		pcall(function()
			if Z.setPlayerESPVisual then
				Z.setPlayerESPVisual(W == true);
			end;
			if W then
				if startPlayerESP then
					startPlayerESP();
				end;
			else
				if stopPlayerESP then
					stopPlayerESP();
				end;
			end;
		end);
		pcall(function()
			if Z.setTrackerESPVisual then
				Z.setTrackerESPVisual(D == true);
			end;
			if BoxedESPOptions then
				BoxedESPOptions.tracker = D == true;
			end;
			if refreshBoxedESP then
				refreshBoxedESP();
			end;
			pcall(function()
				local g = m:FindFirstChild("MasaHub") or m:FindFirstChild("MasaHub");
				if g then
					for g, u in ipairs(g:GetDescendants()) do
						if u.Name == "ColorPreview" and (u.Parent and u.Parent.Name == "Tracker Color") then
							u.BackgroundColor3 = (BoxedESPOptions and BoxedESPOptions.trackerColor) or Color3.fromRGB(230, 230, 230);
						end;
					end;
				end;
			end);
		end);
		pcall(function()
			if Z.setRagdollCountdownVisual then
				Z.setRagdollCountdownVisual(K == true);
			end;
			if K then
				stopRagdollCountdown();
				_G.MasaStopEnemyRagdollCountdown();
				hookRagdollCountdown(e.Character);
				_G.MasaStartEnemyRagdollCountdown();
			else
				stopRagdollCountdown();
				_G.MasaStopEnemyRagdollCountdown();
			end;
		end);
		pcall(function()
			if Z.setFPSBoostVisual then
				Z.setFPSBoostVisual(o == true);
			end;
			if o then
				enableStretchRez();
			else
				disableStretchRez();
			end;
		end);
		pcall(function()
			if Z.setAntiLagVisual then
				Z.setAntiLagVisual(x == true);
			end;
			if x then
				enableAntiLag();
			else
				disableAntiLag();
			end;
		end);
		pcall(function()
			if Z.setVividGraphicsVisual then
				Z.setVividGraphicsVisual(s == true);
			end;
			if s then
				enableVividGraphics();
			else
				disableVividGraphics();
			end;
		end);
		pcall(function()
			if Z.setXRayVisual then
				Z.setXRayVisual(v == true);
			end;
			if setXRay then
				setXRay(v);
			end;
			if Z.setBrainrotXRayVisual then
				Z.setBrainrotXRayVisual(_G.MasaBrainrotXRayEnabled == true);
			end;
			if _G.MasaSetBrainrotXRay then
				_G.MasaSetBrainrotXRay(_G.MasaBrainrotXRayEnabled == true);
			end;
		end);
		pcall(function()
			if Z.setFOVVisual then
				Z.setFOVVisual(gl == true);
			end;
			if _G.MasaRefreshFovValueBox then
				_G.MasaRefreshFovValueBox();
			end;
			if gl then
				enableCustomFov();
			else
				disableCustomFov();
			end;
		end);
		pcall(function()
			if Z.setNoCamCollisionVisual then
				Z.setNoCamCollisionVisual(Bl == true);
			end;
			if Bl then
				enableNoCamCollision();
			else
				disableNoCamCollision();
			end;
		end);
		pcall(function()
			if Z.setHeadlessVisual then
				Z.setHeadlessVisual(l == true);
			end;
			if l then
				enableHeadless();
			else
				disableHeadless();
			end;
		end);
		pcall(function()
			if Z.setKorbloxVisual then
				Z.setKorbloxVisual(M == true);
			end;
			if M then
				enableKorblox();
			else
				disableKorblox();
			end;
		end);
		pcall(function()
			if _G.MasaAntiTPBat then
				_G.MasaAntiTPBat.setSpam(_G.MasaAntiTPBatSpam == true, true);
				_G.MasaAntiTPBat.setVersion(_G.MasaAntiTPBatVersion or 1, true);
				_G.MasaAntiTPBat.setEnabled(_G.MasaAntiTPBatEnabled == true, true);
			end;
			if _G._MasaAntiTPBatRefreshUI then
				_G._MasaAntiTPBatRefreshUI();
			end;
		end);
		pcall(function()
			local g = _G.MasaAntiVoidEnabled == true;
			if Z.setAntiVoidVisual then
				Z.setAntiVoidVisual(g);
			end;
			if _G.MasaAntiVoid then
				_G.MasaAntiVoid.setEnabled(g);
			end;
		end);
		pcall(function()
			local g = _G.MasaRainbowToolsEnabled == true;
			if Z.setRainbowToolsVisual then
				Z.setRainbowToolsVisual(g);
			end;
			if _G.MasaRainbowTools then
				_G.MasaRainbowTools.setEnabled(g);
			end;
		end);
		pcall(function()
			local g = _G.MasaTransparentToolsEnabled == true;
			if Z.setTransparentToolsVisual then
				Z.setTransparentToolsVisual(g);
			end;
			if _G.MasaTransparentTools then
				_G.MasaTransparentTools.setEnabled(g);
			end;
		end);
		pcall(function()
			local g = _G.MasaCustomToolsEnabled == true;
			if Z.setCustomToolsVisual then
				Z.setCustomToolsVisual(g);
			end;
			if _G.MasaCustomTools then
				_G.MasaCustomTools.setEnabled(g);
			end;
		end);
		pcall(function()
			local g = _G.MasaCustomSoundsEnabled == true;
			if Z.setCustomSoundsVisual then
				Z.setCustomSoundsVisual(g);
			end;
			if _G.MasaCustomSounds then
				_G.MasaCustomSounds.setEnabled(g);
			end;
		end);
		pcall(function()
			if type(applyCustomSky) == "function" then
				applyCustomSky(((Sl and Sl ~= "")) and Sl or "Off");
			end;
			if Il then
				Il.Text = Sl or "Off";
			end;
		end);
		pcall(function()
			if cl and (cl ~= 1 and _G.MasaSetAnimPack) then
				_G.MasaSetAnimPack(cl);
			end;
			if Fl then
				Fl(cl or 1);
			end;
			if _G.MasaCustomAnimSetRowVisible then
				_G.MasaCustomAnimSetRowVisible(((cl or 1)) == 7, false);
			end;
		end);
	end;
task.defer(function()
	task.wait(.25);
	if _G.MasaDuelsApplySavedGameplayStates then
		_G.MasaDuelsApplySavedGameplayStates();
	end;
end);
task.delay(1.25, function()
	if _G.MasaDuelsApplySavedGameplayStates then
		_G.MasaDuelsApplySavedGameplayStates();
	end;
end);
task.delay(3, function()
	if x and type(applyKTMOptimization) == "function" then
		pcall(applyKTMOptimization);
	end;
end);
_G.MasaAutoTPRestoreWanted = _G.MasaAutoTPRestoreWanted or false;
_G.MasaAutoTPRestoreBlockedUntil = _G.MasaAutoTPRestoreBlockedUntil or 0;
function masaAnyAimbotActive()
	return (_G.MasaNormalAimbotOn == true) or (_G.MasaBatAimbotV2On == true) or (_G.MasaTPBatOn == true);
end;
_G.MasaStopAutoTPForAction = function()
		if nl then
			_G.MasaAutoTPRestoreWanted = true;
			_G.MasaAutoTPRestoreBlockedUntil = tick() + .35;
			Kl();
			if Z.setAutoTPVisual then
				Z.setAutoTPVisual(false);
			end;
		end;
	end;
function masaTryRestoreAutoTP()
	if not _G.MasaAutoTPRestoreWanted then
		return;
	end;
	if tick() < ((_G.MasaAutoTPRestoreBlockedUntil or 0)) then
		return;
	end;
	if masaAnyAimbotActive() then
		return;
	end;
	if ll then
		return;
	end;
	_G.MasaAutoTPRestoreWanted = false;
	Dl();
	if Z.setAutoTPVisual then
		Z.setAutoTPVisual(true);
	end;
	saveMasaConfig();
end;
a.Heartbeat:Connect(masaTryRestoreAutoTP);
_G._oldMasaStopNormalAimbot = _G.MasaStopNormalAimbot;
_G.MasaStopNormalAimbot = function(...)
		local g = { _G._oldMasaStopNormalAimbot(...) };
		_G.MasaAutoTPRestoreBlockedUntil = tick() + .05;
		task.delay(.08, masaTryRestoreAutoTP);
		return unpack(g);
	end;
_G.MasaNormalAimbotStop = _G.MasaStopNormalAimbot;
_G._oldMasaStopBatAimbotV2 = _G.MasaStopBatAimbotV2;
_G.MasaStopBatAimbotV2 = function(...)
		local g = { _G._oldMasaStopBatAimbotV2(...) };
		_G.MasaAutoTPRestoreBlockedUntil = tick() + .05;
		task.delay(.08, masaTryRestoreAutoTP);
		return unpack(g);
	end;
_G.MasaBatAimbotV2Stop = _G.MasaStopBatAimbotV2;
do
	local function g(g)
		local u = _G[g];
		if type(u) ~= "function" then
			return;
		end;
		_G[g] = function(...)
				local g = { u(...) };
				if _G.MasaAntiDieAutoSync then
					pcall(_G.MasaAntiDieAutoSync);
				end;
				return unpack(g);
			end;
	end;
	g("MasaStartTPBat");
	g("MasaStopTPBat");
	g("MasaStartNormalAimbot");
	g("MasaStopNormalAimbot");
	g("MasaStartBatAimbotV2");
	g("MasaStopBatAimbotV2");
	_G.MasaNormalAimbotStart = _G.MasaStartNormalAimbot;
	_G.MasaBatAimbotV2Start = _G.MasaStartBatAimbotV2;
	_G.MasaBatAimbotV2Stop = _G.MasaStopBatAimbotV2;
end;
_G._oldMasaStopTPBat = _G.MasaStopTPBat;
_G.MasaStopTPBat = function(...)
		local g = { _G._oldMasaStopTPBat(...) };
		_G.MasaAutoTPRestoreBlockedUntil = tick() + .05;
		task.delay(.08, masaTryRestoreAutoTP);
		return unpack(g);
	end;
task.spawn(function()
	local g = false;
	while task.wait(.05) do
		if ll then
			g = true;
		elseif g then
			g = false;
			_G.MasaAutoTPRestoreBlockedUntil = tick() + .05;
			task.delay(.08, masaTryRestoreAutoTP);
		end;
	end;
end);
function masaRepairKeybinds()
	for g, u in pairs(kl) do
		if Vl[g] == Enum.KeyCode.Unknown then
			Vl[g] = u;
		end;
	end;
	if ql == Enum.KeyCode.Unknown then
		ql = tl;
	end;
	if refreshAllSpeedKeybinds then
		refreshAllSpeedKeybinds();
	end;
	if refreshTPDownKeybind then
		refreshTPDownKeybind();
	end;
end;
_G._oldSaveMasaConfigStable = saveMasaConfig;
saveMasaConfig = function()
		masaRepairKeybinds();
		return _G._oldSaveMasaConfigStable();
	end;
masaRepairKeybinds();
task.defer(function()
	task.wait(.2);
	masaRepairKeybinds();
	saveMasaConfig();
end);
task.defer(function()
	task.wait(.35);
	local g = game:GetService("TweenService");
	local B = m:FindFirstChild("MasaHubMobileButtons");
	if B then
		B:Destroy();
	end;
	B = P:FindFirstChild("MasaHubMobileButtons");
	if B then
		B:Destroy();
	end;
	local a = Instance.new("ScreenGui");
	a.Name = "MasaHubMobileButtons";
	a.ResetOnSpawn = false;
	a.IgnoreGuiInset = true;
	a.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	a.DisplayOrder = 1000;
	a.Parent = m;
	_G.MasaMobileButtonRefs = {};
	local H = _G.MasaMobileButtonRefs;
	function _G.MasaApplyMobileButtonsHidden()
		local g = m:FindFirstChild("MasaHubMobileButtons");
		if g then
			g.Enabled = true;
		end;
		local u = (_G.MasaHideMobileButtons == true);
		for g, B in pairs(H) do
			local a = B and B.holder;
			if a then
				a.Visible = not ((u and _G.MasaMobileHideIncluded(g)));
			end;
		end;
		if setHideMobileButtonsVisual then
			pcall(setHideMobileButtonsVisual, u);
		end;
	end;
	function _G.MasaApplyMobileButtonSize()
		_G.MasaMobileButtonScale = math.clamp(tonumber(_G.MasaMobileButtonScale) or .75, .3, 1.35);
		for g, u in pairs(H) do
			local B = u and u.holder;
			if B then
				local g = B:FindFirstChild("MobileButtonScale") or Instance.new("UIScale");
				g.Name = "MobileButtonScale";
				g.Scale = _G.MasaMobileButtonScale;
				g.Parent = B;
			end;
		end;
		pcall(function()
			local g = m:FindFirstChild("MasaHub") or m:FindFirstChild("MasaHub");
			local u = g or m;
			for g, u in ipairs(u:GetDescendants()) do
				if u.Name == "Mobile Buttons Size" then
					local g = u:FindFirstChild("Value");
					if g and g:IsA("TextLabel") then
						g.Text = string.format("%.2f", _G.MasaMobileButtonScale);
					end;
				end;
			end;
		end);
	end;
	local function i(u, B)
		if not u then
			return;
		end;
		local a = u:GetAttribute("MasaMobilePressed") == true;
		B = (B == true) or a;
		local H = B and "on" or "off";
		if u:GetAttribute("MasaMobileVisualState") == H then
			return;
		end;
		u:SetAttribute("MasaMobileVisualState", H);
		local i = u.Parent;
		local R = i and i:FindFirstChild("Glow");
		local O = u:FindFirstChildOfClass("UIStroke");
		(g:Create(u, TweenInfo.new(.18), { BackgroundColor3 = B and Color3.fromRGB(56, 189, 248) or Color3.fromRGB(255, 255, 255), TextColor3 = B and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(14, 165, 233), TextTransparency = 0 })):Play();
		if O then
			(g:Create(O, TweenInfo.new(.18), { Color = B and Color3.fromRGB(56, 189, 248) or Color3.fromRGB(186, 230, 253), Thickness = 1, Transparency = B and 0 or .4 })):Play();
		end;
		if R then
			R.Visible = false;
			R.BackgroundTransparency = 1;
			local g = R:FindFirstChildOfClass("UIStroke");
			if g then
				g.Transparency = 1;
			end;
		end;
	end;
	local function R(g)
		if not g then
			return;
		end;
		g:SetAttribute("MasaMobilePressed", true);
		i(g, true);
		task.delay(.18, function()
			if g and g.Parent then
				g:SetAttribute("MasaMobilePressed", false);
				i(g, false);
			end;
		end);
	end;
	local function O(g, B, i, R)
		local O = Instance.new("Frame");
		O.Name = "MBH_" .. g;
		O.Size = UDim2.new(0, 72, 0, 44);
		local c = _G.MasaMobileButtonPositions and _G.MasaMobileButtonPositions[g];
		if c and type(c) == "table" then
			O.Position = tableToUDim2(c, i);
		else
			O.Position = i;
		end;
		O.BackgroundTransparency = 1;
		O.BorderSizePixel = 0;
		O.ZIndex = 1000;
		O.Active = true;
		O.Parent = a;
		local h = Instance.new("TextButton", O);
		h.Name = "MB_" .. g;
		h.Size = UDim2.new(1, 0, 1, 0);
		h.Position = UDim2.new(0, 0, 0, 0);
		h.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		h.BackgroundTransparency = 0;
		h.BorderSizePixel = 0;
		h.BorderColor3 = Color3.fromRGB(0, 0, 0);
		h.BorderMode = Enum.BorderMode.Inset;
		h.Text = B;
		h.TextColor3 = Color3.fromRGB(6, 182, 212);
		h.Font = Enum.Font.GothamBlack;
		h.TextSize = 9;
		h.TextWrapped = true;
		h.AutoButtonColor = false;
		h.ZIndex = 1002;
		h.Active = true;
		local Q = Instance.new("UICorner", h);
		Q.CornerRadius = (_G.MasaButtonShape == "Rectangle") and UDim.new(0, 0) or (_G.MasaButtonShape == "Rounded") and UDim.new(0, 14) or (_G.MasaButtonShape == "Pill") and UDim.new(0, 10) or UDim.new(1, 0);
		h.ClipsDescendants = true;
		local e = Instance.new("UIPadding", h);
		e.PaddingLeft = UDim.new(0, 6);
		e.PaddingRight = UDim.new(0, 6);
		e.PaddingTop = UDim.new(0, 8);
		e.PaddingBottom = UDim.new(0, 8);
		local P = Instance.new("UIGradient", h);
		P.Name = "_MasaShimmerGradient";
		P.Rotation = 0;
		P.Transparency = NumberSequence.new(0);
		P.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
		local m = Instance.new("UIGradient", h);
		m.Name = "BgGradient";
		m.Rotation = 0;
		m.Transparency = NumberSequence.new(0);
		m.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 105, 180)) });
		m.Enabled = false;
		local Z = Instance.new("Frame", O);
		Z.Name = "Glow";
		Z.Size = UDim2.new(1, 4, 1, 4);
		Z.Position = UDim2.new(0, -2, 0, -2);
		Z.BackgroundColor3 = Color3.fromRGB(255, 105, 180);
		Z.BackgroundTransparency = .9;
		Z.BorderSizePixel = 0;
		Z.ZIndex = 1000;
		(Instance.new("UICorner", Z)).CornerRadius = UDim.new(1, 0);
		local function F(g)
			local u = _G._MasaThemePalette and _G._MasaThemePalette();
			local B = _G.MasaHalloweenTheme == true;
			local a = (B and Color3.fromRGB(234, 88, 12)) or Color3.fromRGB(6, 182, 212);
			local H = (B and Color3.fromRGB(251, 146, 60)) or Color3.fromRGB(255, 255, 255);
			local i = (B and Color3.fromRGB(253, 186, 116)) or Color3.fromRGB(255, 105, 180);
			if g then
				h.BackgroundColor3 = a;
				h.BackgroundTransparency = 0;
				h.TextColor3 = Color3.fromRGB(255, 255, 255);
				P.Enabled = false;
				m.Enabled = false;
				Z.BackgroundColor3 = i;
				Z.BackgroundTransparency = .25;
			else
				h.BackgroundColor3 = H;
				h.BackgroundTransparency = 0;
				h.TextColor3 = Color3.fromRGB(6, 182, 212);
				P.Enabled = false;
				m.Enabled = false;
				Z.BackgroundTransparency = 1;
			end;
			pcall(function()
				local g = O:FindFirstChild("HwGhostScallop");
				if g then
					for g, u in ipairs(g:GetChildren()) do
						if u:IsA("Frame") then
							u.BackgroundColor3 = h.BackgroundColor3;
						end;
					end;
				end;
			end);
		end;
		local function S()
			if g == "autoPlay" then
				return _G.MasaAutoPlay and _G.MasaAutoPlay.active() or false;
			elseif g == "aimbot" then
				return (_G.MasaNormalAimbotOn == true) or (_G.MasaBatAimbotV2On == true);
			elseif g == "tpBat" then
				return _G.MasaTPBatMobileActive and _G.MasaTPBatMobileActive() or false;
			elseif g == "antiTPBat" then
				return _G.MasaAntiTPBatEnabled == true;
			elseif g == "carry" then
				return I == "Carry";
			elseif g == "laggerNormal" then
				return I == "Lagger";
			elseif g == "laggerCarry" then
				return I == "Lagger Carry";
			else
				return false;
			end;
		end;
		local r = false;
		local U = false;
		local X = nil;
		local w = nil;
		h.InputBegan:Connect(function(g)
			if g.UserInputType == Enum.UserInputType.MouseButton1 or g.UserInputType == Enum.UserInputType.Touch then
				r = true;
				U = false;
				X = g.Position;
				w = O.Position;
				F(true);
			end;
		end);
		h.InputEnded:Connect(function(u)
			if u.UserInputType == Enum.UserInputType.MouseButton1 or u.UserInputType == Enum.UserInputType.Touch then
				if r and not U then
					pcall(R);
				end;
				if U then
					if _G.MasaMobileButtonPositions then
						_G.MasaMobileButtonPositions[g] = udim2ToTable(O.Position);
					end;
					pcall(saveMasaConfig);
				end;
				r = false;
				U = false;
				task.delay(.02, function()
					if h and h.Parent then
						F(S());
					end;
				end);
			end;
		end);
		u.InputChanged:Connect(function(g)
			if _G.MasaGuiLocked == true or not r then
				return;
			end;
			if g.UserInputType ~= Enum.UserInputType.MouseMovement and g.UserInputType ~= Enum.UserInputType.Touch then
				return;
			end;
			local u = g.Position - X;
			if not U and ((math.abs(u.X) > 6 or math.abs(u.Y) > 6)) then
				U = true;
			end;
			if U then
				O.Position = UDim2.new(w.X.Scale, w.X.Offset + u.X, w.Y.Scale, w.Y.Offset + u.Y);
			end;
		end);
		H[g] = { holder = O, btn = h, setActive = function(g)
					F(g);
				end };
		if not _G.MasaMobileButtonRefs then
			_G.MasaMobileButtonRefs = {};
		end;
		_G.MasaMobileButtonRefs[g] = H[g];
		if _G.MasaMobileHideIncluded then
			O.Visible = not (((_G.MasaHideMobileButtons == true) and _G.MasaMobileHideIncluded(g)));
		end;
		F(S());
		return h;
	end;
	local c, h, Q = -210, -140, -70;
	local e, Z, F, S = -164, -94, -24, 46;
	local r = {
			drop = UDim2.new(1, h, .5, e),
			autoPlay = UDim2.new(1, Q, .5, e),
			tpBat = UDim2.new(1, c, .5, e),
			aimbot = UDim2.new(1, h, .5, Z),
			instantReset = UDim2.new(1, c, .5, Z),
			antiTPBat = UDim2.new(1, c, .5, F),
			float = UDim2.new(1, Q, .5, Z),
			tp = UDim2.new(1, h, .5, F),
			carry = UDim2.new(1, Q, .5, F),
			laggerNormal = UDim2.new(1, h, .5, S),
			laggerCarry = UDim2.new(1, Q, .5, S),
		};
	function _G.MasaResetMobileButtons()
		_G.MasaMobileButtonScale = .75;
		_G.MasaHideMobileButtons = false;
		_G.MasaMobileHideList = {};
		if _G.MasaRefreshMobileHideList then
			pcall(_G.MasaRefreshMobileHideList);
		end;
		for g, u in pairs(r) do
			local B = H[g];
			local a = B and B.holder;
			if a then
				a.Position = u;
				a.Size = UDim2.new(0, 64, 0, 64);
				local g = B.btn;
				if g then
					g.Position = UDim2.new(0, 0, 0, 0);
					g.Size = UDim2.new(1, 0, 1, 0);
					g:SetAttribute("MasaMobilePressed", false);
					g:SetAttribute("MasaMobileVisualState", nil);
				end;
			end;
		end;
		if _G.MasaApplyMobileButtonSize then
			_G.MasaApplyMobileButtonSize();
		end;
		if _G.MasaApplyMobileButtonsHidden then
			_G.MasaApplyMobileButtonsHidden();
		end;
		if showActionNotification then
			pcall(function()
				showActionNotification("MOBILE BUTTONS RESET");
			end);
		end;
		saveMasaConfig();
	end;
	O("drop", "DROP\nBR", r.drop, function(g)
		if Yl == "Stand Still" then
			if vl then
				vl();
			end;
		else
			if fl then
				fl();
			elseif runDrop then
				runDrop();
			end;
		end;
		R(g);
	end);
	O("autoPlay", "AUTO\nPLAY", r.autoPlay, function(g)
		if _G.MasaAutoPlayToggle then
			_G.MasaAutoPlayToggle();
		end;
		task.delay(.03, function()
			i(g, _G.MasaAutoPlay and _G.MasaAutoPlay.active() or false);
		end);
	end);
	O("tpBat", "TP\nBAT", r.tpBat, function(g)
		if _G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked() then
			if _G.MasaSafeModeForceStop then
				_G.MasaSafeModeForceStop("SAFE MODE LOCK");
			end;
			return;
		end;
		if _G.MasaToggleTPBatManual then
			_G.MasaToggleTPBatManual();
		elseif _G.MasaToggleTPBat then
			_G.MasaToggleTPBat();
		end;
		task.delay(.03, function()
			i(g, _G.MasaTPBatMobileActive and _G.MasaTPBatMobileActive() or false);
		end);
	end);
	local function U()
		if N == "V2" then
			return "BAT\nAIMBOT\nV2";
		end;
		return "BAT\nAIMBOT\nV1";
	end;
	O("aimbot", U(), r.aimbot, function(g)
		if _G.MasaSafeModeIsLocked and _G.MasaSafeModeIsLocked() then
			if _G.MasaSafeModeForceStop then
				_G.MasaSafeModeForceStop("SAFE MODE LOCK");
			end;
			return;
		end;
		if _G.MasaToggleSelectedAimbot then
			_G.MasaToggleSelectedAimbot();
		end;
		if _G.MasaRefreshAimbotVisual then
			_G.MasaRefreshAimbotVisual();
		end;
		task.delay(.03, function()
			i(g, (_G.MasaNormalAimbotOn == true) or (_G.MasaBatAimbotV2On == true));
		end);
	end);
	O("instantReset", "INSTANT\nRESET", r.instantReset, function(g)
		if _G.MasaInstantReset then
			_G.MasaInstantReset();
		end;
		R(g);
	end);
	O("antiTPBat", "ANTI\nTP BAT", r.antiTPBat, function(g)
		if _G.MasaAntiTPBat then
			_G.MasaAntiTPBat.toggle();
		elseif _G.MasaToggleAntiTPBat then
			_G.MasaToggleAntiTPBat();
		end;
		task.delay(.03, function()
			i(g, _G.MasaAntiTPBatEnabled == true);
		end);
	end);
	O("float", "FLOAT", r.float, function(g)
		if _G.MasaFloatToggle then
			_G.MasaFloatToggle();
		end;
		task.delay(.03, function()
			i(g, _G.MasaFloatOn == true);
		end);
	end);
	O("tp", "TP\nDOWN", r.tp, function(g)
		if ol then
			ol();
		end;
		R(g);
	end);
	O("carry", "CARRY\nSPEED", r.carry, function(g)
		if Mj then
			Mj(I == "Carry" and "Normal" or "Carry");
		end;
		task.delay(.03, function()
			if H.carry then
				H.carry.setActive(I == "Carry");
			end;
			if H.laggerNormal then
				H.laggerNormal.setActive(I == "Lagger");
			end;
			if H.laggerCarry then
				H.laggerCarry.setActive(I == "Lagger Carry");
			end;
		end);
	end);
	O("laggerNormal", "LAGGER\nNORMAL", r.laggerNormal, function(g)
		if Mj then
			Mj(I == "Lagger" and "Normal" or "Lagger");
		end;
		task.delay(.03, function()
			if H.carry then
				H.carry.setActive(I == "Carry");
			end;
			if H.laggerNormal then
				H.laggerNormal.setActive(I == "Lagger");
			end;
			if H.laggerCarry then
				H.laggerCarry.setActive(I == "Lagger Carry");
			end;
		end);
	end);
	O("laggerCarry", "LAGGER\nCARRY", r.laggerCarry, function(g)
		if Mj then
			Mj(I == "Lagger Carry" and "Normal" or "Lagger Carry");
		end;
		task.delay(.03, function()
			if H.carry then
				H.carry.setActive(I == "Carry");
			end;
			if H.laggerNormal then
				H.laggerNormal.setActive(I == "Lagger");
			end;
			if H.laggerCarry then
				H.laggerCarry.setActive(I == "Lagger Carry");
			end;
		end);
	end);
	pcall(function()
		if H.laggerNormal and H.laggerNormal.holder then
			H.laggerNormal.holder.Visible = false;
		end;
		if H.laggerCarry and H.laggerCarry.holder then
			H.laggerCarry.holder.Visible = false;
		end;
	end);
	_G.MasaApplyMobileButtonSize();
	_G.MasaApplyMobileButtonsHidden();
	if _G.MasaApplyButtonShape then
		pcall(_G.MasaApplyButtonShape);
	end;
	function _G.MasaRefreshMobileButtonStates()
		if H.autoPlay then
			H.autoPlay.setActive(_G.MasaAutoPlay and _G.MasaAutoPlay.active() or false);
		end;
		if H.aimbot then
			H.aimbot.setActive((_G.MasaNormalAimbotOn == true) or (_G.MasaBatAimbotV2On == true));
			local g = H.aimbot.btn;
			if g then
				g.Text = (N == "V2") and "BAT\nAIMBOT\nV2" or "BAT\nAIMBOT\nV1";
			end;
			if _G._AmbHideOptLabel_aimbot then
				pcall(_G._AmbHideOptLabel_aimbot);
			end;
		end;
		if H.float then
			H.float.setActive(_G.MasaFloatOn == true);
		end;
		if H.tpBat then
			H.tpBat.setActive(_G.MasaTPBatMobileActive and _G.MasaTPBatMobileActive() or false);
		end;
		if H.antiTPBat then
			H.antiTPBat.setActive(_G.MasaAntiTPBatEnabled == true);
		end;
		if H.carry then
			H.carry.setActive(I == "Carry");
		end;
		if H.laggerNormal then
			H.laggerNormal.setActive(I == "Lagger");
		end;
		if H.laggerCarry then
			H.laggerCarry.setActive(I == "Lagger Carry");
		end;
	end;
end);
local oF = loadMasaConfig;
loadMasaConfig = function()
		oF();
		if _G.StretchRez and _G.StretchRez.apply then
			local g = stretchCurrentIndex or 1;
			_G.StretchRez.apply(g);
		end;
	end;