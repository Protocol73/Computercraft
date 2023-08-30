ntfyheaders = { ["Tags"] = "heavy_check_mark , +1, computer, rotating_light" ,["Title"] = "Testing Phase 3", ["At"] = "2m"}


print(ntfyheaders)

nftytext = "Testing Delay"


http.post("https://ntfy.sh/MC_Lua1", nftytext, ntfyheaders)  
