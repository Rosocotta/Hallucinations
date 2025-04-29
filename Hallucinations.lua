if not mhallu then
  mhallu = {}
end

local mod_dir = "" .. SMODS.current_mod.path
mhallu.config = SMODS.current_mod.config

--load system files
local s_files = NFS.getDirectoryItems(mod_dir .. "system")
for _, file in ipairs(s_files) do
  local i, ex = SMODS.load_file("system/" .. file)
  if ex then
    error(ex)
  else
    i()
  end
end

--function to register content
local function registercontent(reg)
  local inst = reg()
  if inst.init then
    inst:init()
  end
  if inst.items then
    for _, item in ipairs(inst.items) do
      if item.init then
        item:init()
      end
      if G.PROFILES[G.SETTINGS.profile].all_unlocked then
        item.alerted = true
        item.unlocked = true
        item.discovered = true
      end
      SMODS[item.object_type](item)
    end
  end
end

--load content files
local c_files = NFS.getDirectoryItems(mod_dir .. "content")
for _, file in ipairs(c_files) do
  local i, ex = SMODS.load_file("content/" .. file)
  if ex then
    error(ex)
  else
    registercontent(i)
  end
end

--mod icon
SMODS.Atlas({
  key = "modicon",
  path = "icon.png",
  px = 34,
  py = 34
})
