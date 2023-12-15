local frame=CreateFrame("Frame");
frame:RegisterEvent("VARIABLES_LOADED");
frame:SetScript("OnEvent",function(self,event,...)
	if (IsAddOnLoaded("pfQuest")) then
		local mail_icon = "Interface\\AddOns\\" .. "RepairFlightMail".."\\img\\icon_mailbox"
		local repair_icon = "Interface\\AddOns\\" .. "RepairFlightMail".."\\img\\icon_repair"
		local meta_mail = { ["addon"] = "RFM",["texture"] = mail_icon}
		local meta_repair = { ["addon"] = "RFM",["texture"] = repair_icon}
		local alliance_repairs = {"William MacGregor","Defias Profiteer","Jennabink Powerseam","Naela Trance","Murndan Derth","Brak Durnad","Wenna Silkbeard","Leonard Porter","Harggan","Gregory Ardus","Theresa Moulaine","Agustus Moulaine","Seoman Griffith","Bryan Cross","Mayda Thane","Gerik Koen","Heinrich Stone","Osric Strang","Wilhelm Strang","Officer Areyn","Lisbeth Schneider","Kaita Deepforge","Thulman Flintcrag","Kathrum Axehand","Duncan Cullen","Wynne Larson","Evan Larson","Ardwyn Cailen","Allan Hafgan","Gunther Weller","Marda Weller","Aldric Moore","Lara Moore","Carla Granger","Lina Stover","Frederick Stover","Pyrewood Armorer","Graw Cornerstone","Bromiir Ormsen","Mangorn Flinthammer","Raena Flinthammer","Dolman Steelfury","Grenil Steelfury","Hjoldir Stoneblade","Thurgrum Deepforge","Dolkin Craghelm","Lissyphus Finespindle","Olthran Craghelm","Brenwyn Wintersteel","Hegnar Swiftaxe","Kelomir Ironhand","Thalgus Thunderfist","Bretta Goldfury","Skolmin Goldfury","Bingus","Harick Boulderdrum","Maeva Snowbraid","Ingrys Stonebrow","Gothor Brumn","Nillen Andemar","Morhan Coppertongue","Vrok Blunderblast","Aldren Cordon","Cliff Hadin","Irene Sureshot","Kat Sampson","Henry Chapal","Kimberly Hiett","Dorin Songblade","Kara Adams","Bernard Brubaker","Robert Aebischer","Durnan Furcutter","Grundel Harkin","Rybrad Coldbank","Hegnar Rumbleshot","Boran Ironclink","Gamili Frosthide","Grawn Thromwyn","Thrawn Boltar","Turuk Amberstill","Frast Dokner","Avette Fellwood","Gavin Gnarltree","Morg Gnarltree","Dermot Johns","Godric Rothgar","Janos Hammerknuckle","Andrew Krighton","Corina Steele","Kurran Steele","Quartermaster Hicks","Quartermaster Hudson","Veldan Lightfoot","Morley Eberlein","Rallic Finn","Strumner Flintheel","Felder Stover","Jannos Ironwill","Samuel Hawke","Thanthaldis Snowgleam","Andiss","Freja Nightwing","Janna Brightmoon","Keina","Khardan Proudblade","Brannol Eaglemoon","Jeena Featherbow","Shalomon","Sinda","Illyanie","Dulciea Frostmoon","Pratt McGrubben","Rendow","Mylini Frostmoon","Hans Weston","Marie Holdston","Jensen Farran","Piter Verance","Torq Ironblast","Maxton Strang","Elisa Steelhand","Harlon Thornguard","Mavralyn","Naram Longclaw","Shaldyn","Ariyell Skyshadow","Cylania","Glorandiir","Mythidan","Merelyssa","Kieran","Landria","Turian","Vinasia","Ealyshia Dewwhisper","Melea","Caynrus","Cyridan","Anadyia","Andrus","Brinna Valanaar","Aeolynn","Xai'ander","Tandaan Lightmane","Bhaldaran Ravenshade","Illiyana Moonblaze"}
		local horde_repairs = {"Burkrum","Gruul Darkblade","Muuran","Hae'Wilani","Huklah","Rarc","Kzan Thornslash","Trayexir","Cutac","Ghrawt","Uhgar","Wuark","Krak","Zulrg","Zanara","Altsoba Ragetotem","Cawind Trueaim","Worb Strongstitch","Katis","Muragus","Kareth","Tor'phan","Handor","Kiro","Jin'sora","Zendo'jian","Shoma","Galthuk","Koru","Sumi","Tumi","Ukra'nor","Sana","Morgum","Ollanus","Kaja","Urtharo","Sergeant Ba'sha","Borand","Kelm Hargunth","Vrang Wildgore","Halija Whitestrider","Hraq","Jahan Hawkwing","Nargal Deatheye","Uthrok","Kiknikle","Pizznukle","Sanuye Runetotem","Starn","Hewa","Ahanu","Elki","Jyn Stonehoof","Taur Stonehoof","Kuna Thunderhorn","Tagain","Fela","Grod","Sunn Ragetotem","Hogor Thunderhoof","Delgo Ragetotem","Etu Ragetotem","Kard Ragetotem","Ohanko","Sura Wildmane","Jekyll Flandring","Mu'uta","Rutherford Twing","Sranda","Jazzrik","Ott","Kris Legace","Master Smith Burninate","Alexandre Lefevre","Andrea Boynton","Nadia Vernon","Sebastian Meloche","Wallace the Blind","Hragran","Krakk","Vharr","Gharash","Grimnal","Hartash","Thralosh","Smith Slagtree","Archibald Kava","Blacksmith Rand","Harold Raims","Constance Brisboise","Abe Winters","Oliver Dwor","Eliza Callen","Gordon Wendham","Louis Warren","Timothy Weldon","Walter Ellingson","Lauren Newcomb","Sydney Upton","Zane Bradford","Lucille Castleton","Sheldon Von Croy","Charles Seaton","Nathaniel Steenwick","Gillian Moore","Abigail Sawyer","Benijah Fenner","Francis Eliot","Geoffrey Hartwell","Samuel Van Brunt","Mirelle Tremayne","Nicholas Atwood"}
		local neutral_repairs = {"Geenia Sunshadow","Kharedon","Meliri","Narianna","Nizzik","Veenix","Blizrik Buckshot","Krinkle Goodsteel","Wrinkle Goodsteel","Lizzarik","Grazlix","Ironzar","Vexspindle","Synge","Gibbert","Blixxrak","Nixxrak","Wixxrak","Yuka Screwspigot","Zixil","Jaquilina Dramet","Haren Kanmae","Kizz Bluntstrike","Zarena Cromwind","Fargon Mortalak","Hurklor","Jansen Underwood","Qixdi Goodstitch","Jutak","Argent Quartermaster Hasana","Argent Quartermaster Lightspark","Magnus Frostwake"}
		
		-- If player isnt horder then show alliance stuff
		if (UnitFactionGroup("Player") ~= "Horde") then 
			pfDatabase:SearchMetaRelation({ "flight", "alliance" }, { ["addon"] = "RFM" })
			pfDatabase:SearchObject("Alliance Mailbox", meta_mail, "LOWER")
			for _,val in pairs(alliance_repairs) do
				pfDatabase:SearchMob(val, meta_repair, "LOWER")
			end
		end
		
		-- If player isnt alliance then show horde stuff
		if (UnitFactionGroup("Player") ~= "Alliance") then 
			pfDatabase:SearchMetaRelation({ "flight", "horde" }, { ["addon"] = "RFM" })
			pfDatabase:SearchObject("Horde Mailbox", meta_mail, "LOWER")
			for _,val in pairs(horde_repairs) do
				pfDatabase:SearchMob(val, meta_repair, "LOWER")
			end
		end 
		-- above iff statments mean that if smth goes wrong and UnitFactionGroup("Player") returns a nil then we will just show both alliance and horde stuff
		


		for _,val in pairs(neutral_repairs) do
			pfDatabase:SearchMob(val, meta_repair, "LOWER")
		end
	end
end);
