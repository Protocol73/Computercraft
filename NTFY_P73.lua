--Written by Protocol73 for ComputerCraft in [2023]
--ComputerCraft API Wrapper for NTFY in Lua
--For complete NTFY usage: Read the docs @ [https://docs.ntfy.sh/] 
--This is a simple API Wrapper that uses http.post()

--To import: os.loadAPI("/dir/path/NTFY_P73.lua")

local expect = dofile("rom/modules/main/cc/expect.lua").expect

function Notice(_url, _notice, _ntfyheaders)
	expect(1, _url, "string") --require that a URL is given
    expect(2, _notice, "string") --require that a message to send is given
    expect(3, _ntfyheaders, "table", "nil") --Allow custom headers or default

    if _ntfyheaders == nil then --if header was not given:
    	NTFY_Notice_From = os.getComputerLabel() --Use ID_Label in Header

    	if os.getComputerLabel() == nil then --if No ID_label is set fallback to ID
    		NTFY_Notice_From = os.getComputerID()
    	end
        
        DefaultNTFYHeader = "Notice from PC: " .. NTFY_Notice_From --Set default message
    	_ntfyheaders = { ["Tags"] = "warning" ,["Title"] = DefaultNTFYHeader} --add tags & use
    end

http.post(_url, _notice, _ntfyheaders)

end